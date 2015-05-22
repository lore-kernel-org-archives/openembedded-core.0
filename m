Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D6B797324E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 17:02:00 +0000 (UTC)
Received: by wgez8 with SMTP id z8so23543864wge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=WNgnLB/3al4A40I3PTtmkv4ZGRwSzDitqhEiFmmacko=;
	b=Sbc01CWHyW3Av644kx5E45Huq28u9bLfqfc7dKuJOIKhnECKlyUM2wf+dRL+xkCpfF
	WSPYfbSTPt21TpD446JsCvK6v1mBiSPgLaV9/w8Q5tjkw4UXcy6PliK4Fdb4t4k1Xvzx
	AMGj2oA4j2P1Xk73/Oj7RA6rc13sbsioKYmr5ogiYMKwhd7/z895bAbWEHkBOhr0tQ4w
	I+xdyeMm+xosrl0g7J2+JKJdWP/KKbNP4Ql3Dk6axBWNnPUvjxGP2Kud5Qf5Z/j3sOPO
	jwb9346ru3fIiNoY4Q8AoOp8AJdDJ5BTU5AL1y1ZCDpvsrks3U3V6o3Q5sqhQQ5l4VuR
	qv4A==
MIME-Version: 1.0
X-Received: by 10.194.173.40 with SMTP id bh8mr16011062wjc.99.1432314121299;
	Fri, 22 May 2015 10:02:01 -0700 (PDT)
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Fri, 22 May 2015 10:02:01 -0700 (PDT)
Received: by 10.28.9.73 with HTTP; Fri, 22 May 2015 10:02:01 -0700 (PDT)
In-Reply-To: <CAGXeWgnekY_9WYPkFoiAgmFtvsTj7FOct9FQErFSbT6xEj3tcQ@mail.gmail.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<4841436.ZzPOYoFhDl@peggleto-mobl.ger.corp.intel.com>
	<CAGXeWgn1jDsCLAA-F8zvPCZ+qyGyfQtmbwe-AvF5kAuir6Z-8w@mail.gmail.com>
	<8187173.h5mEVg1DiL@peggleto-mobl.ger.corp.intel.com>
	<CAGXeWgnekY_9WYPkFoiAgmFtvsTj7FOct9FQErFSbT6xEj3tcQ@mail.gmail.com>
Date: Fri, 22 May 2015 19:02:01 +0200
X-Google-Sender-Auth: lE59s3_pxwsHPkjZ8fCLbMFy8l0
Message-ID: <CAGXeWgku=wmgW3U5kk0Kthw=oC7_nAV3LstRsDgRToL_iQ_8_A@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 17:02:01 -0000
Content-Type: multipart/alternative; boundary=089e013c6582682cd40516ae9e88

--089e013c6582682cd40516ae9e88
Content-Type: text/plain; charset=UTF-8

So it was a hardware issue, the USB to serial converter is dead. :-#
On May 22, 2015 5:20 PM, "Thomas PERROT" <thomas.perrot@tupi.fr> wrote:

> Ok, thank you for your help, so I should be a problem elsewhere.
>
> I thought that it was the problem because, I just replaced sysvinit by
> systemd on this build and serial console still terribly empty. I have
> checked if the serial device was well mounted and kernel cmdline was
> well formated. So I thought at an incompatibility between systemd and
> rpi recipes.
>
> On Fri, May 22, 2015 at 4:32 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 22 May 2015 16:27:05 Thomas PERROT wrote:
> >> On Fri, May 22, 2015 at 4:06 PM, Paul Eggleton <
> >> paul.eggleton@linux.intel.com> wrote:
> >> > On Friday 22 May 2015 15:58:58 Thomas PERROT wrote:
> >> > > Sorry, I meant systemd-serialgetty.bb from meta instead of
> meta-systemd.
> >> > > So replace "?=" by "??=" should be a better solution.
> >> >
> >> > You still haven't described the actual problem, because what you did
> >> > describe (the machine config being overridden by this) shouldn't be
> >> > possible. Again, did  you check bitbake -e systemd-serialgetty | less
> ?
> >>
> >> Attached the result of the command bitbake -e systemd-serialgetty
> >
> > So from what you've just sent, the final value is "115200 ttyAMA0" which
> is the
> > value set by the machine config - so it seems like it's working as it
> should.
> > How are you determining that there is a problem?
> >
> > Cheers,
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel Open Source Technology Centre
>

--089e013c6582682cd40516ae9e88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">So it was a hardware issue, the USB to serial converter is d=
ead. :-#</p>
<div class=3D"gmail_quote">On May 22, 2015 5:20 PM, &quot;Thomas PERROT&quo=
t; &lt;<a href=3D"mailto:thomas.perrot@tupi.fr">thomas.perrot@tupi.fr</a>&g=
t; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ok, than=
k you for your help, so I should be a problem elsewhere.<br>
<br>
I thought that it was the problem because, I just replaced sysvinit by<br>
systemd on this build and serial console still terribly empty. I have<br>
checked if the serial device was well mounted and kernel cmdline was<br>
well formated. So I thought at an incompatibility between systemd and<br>
rpi recipes.<br>
<br>
On Fri, May 22, 2015 at 4:32 PM, Paul Eggleton<br>
&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.in=
tel.com</a>&gt; wrote:<br>
&gt; On Friday 22 May 2015 16:27:05 Thomas PERROT wrote:<br>
&gt;&gt; On Fri, May 22, 2015 at 4:06 PM, Paul Eggleton &lt;<br>
&gt;&gt; <a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@lin=
ux.intel.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On Friday 22 May 2015 15:58:58 Thomas PERROT wrote:<br>
&gt;&gt; &gt; &gt; Sorry, I meant <a href=3D"http://systemd-serialgetty.bb"=
 target=3D"_blank">systemd-serialgetty.bb</a> from meta instead of meta-sys=
temd.<br>
&gt;&gt; &gt; &gt; So replace &quot;?=3D&quot; by &quot;??=3D&quot; should =
be a better solution.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; You still haven&#39;t described the actual problem, because w=
hat you did<br>
&gt;&gt; &gt; describe (the machine config being overridden by this) should=
n&#39;t be<br>
&gt;&gt; &gt; possible. Again, did=C2=A0 you check bitbake -e systemd-seria=
lgetty | less ?<br>
&gt;&gt;<br>
&gt;&gt; Attached the result of the command bitbake -e systemd-serialgetty<=
br>
&gt;<br>
&gt; So from what you&#39;ve just sent, the final value is &quot;115200 tty=
AMA0&quot; which is the<br>
&gt; value set by the machine config - so it seems like it&#39;s working as=
 it should.<br>
&gt; How are you determining that there is a problem?<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Paul Eggleton<br>
&gt; Intel Open Source Technology Centre<br>
</blockquote></div>

--089e013c6582682cd40516ae9e88--
