Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA4E6A36E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 07:48:58 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n9so8571923oag.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 00:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6AjfuLbz5tpgIHGXP9aL+h0YDoQkf7ExkFRzIKYqotg=;
	b=Ec1pbDROsf1rJui1PZ7c2bAAiHjgIeIS+ls/V0TQ7pQmp5LRMxbDAtsVCn0n0crIQv
	kbVarWK4DD9uE7H354TeE5fTqRtJOjeiu3o4WxG95o0iVx0/F21Q/DpsO9AvdXWCWIJd
	rHz9KqjkTJT83pt3CY+z00ZIbD4UI9Y+GnQEUxz4NbhjQKlfkNl2fDle7W6oUdv0i4jk
	2ErO+0uw3DSOja+FfWlmvpEgT3Nm8PpnymKlj2OoZSO+JBHu6/DBaffZoI1htR+ynflB
	6ggf04FXT5hQf1uqb/TUnYfvKhRQ+xMjt1Hc3fPcq1vlrnGgUw14SI1oqafnC0VTZShX
	pItA==
X-Received: by 10.182.125.4 with SMTP id mm4mr17457121obb.63.1369640939296;
	Mon, 27 May 2013 00:48:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.225.230 with HTTP; Mon, 27 May 2013 00:48:39 -0700 (PDT)
In-Reply-To: <1368343938.21569.1.camel@ted>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130510102041.GA12329@jama.dyndns-home.com>
	<1368181932.11129.11.camel@ted>
	<1368182760.24706.3.camel@phil-desktop.brightsign>
	<1368183027.24706.6.camel@phil-desktop.brightsign>
	<CAJTo0LYgAzXW4PEt_KucpDG7Uk5rpXJEDzWPGTgA7X3jZkU-yQ@mail.gmail.com>
	<1368343938.21569.1.camel@ted>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Mon, 27 May 2013 10:48:39 +0300
Message-ID: <CAMZjud3-UWnZTjn+sQ6hsRxRWL+btKVoJ1J7D=+TAG+daco5_g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkFEBj0nhwEzt1vDtgN7tVDHzT2CcsakKDIRZhqnvVDQype7smw+++piRRXC1LWYB9hK6/F
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Phil Blundell <philb@brightsign.biz>
Subject: Re: [PATCH] flex: updated to 2.5.37
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 May 2013 07:48:59 -0000
Content-Type: multipart/alternative; boundary=089e0118413ea83bbe04ddae610a

--089e0118413ea83bbe04ddae610a
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 12, 2013 at 10:32 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2013-05-10 at 12:00 +0100, Burton, Ross wrote:
> > On 10 May 2013 11:50, Phil Blundell <philb@brightsign.biz> wrote:
> > > Or you could replace the shell wrapper that create_wrapper() currently
> > > generates with either a compiled binary or a Python script.  That would
> > > allow you to execl("/path/foo.real", "foo", ...), which I don't think
> > > you can do in shell but which would avoid this whole class of problem.
> >
> > Bash can do that, but it's not POSIX. :/
>
> I'm quite happy to have the wrapper as bash shell script. We only need
> dash compatibility in things that get run under /bin/sh (i.e. bitbake
> shell tasks).
>

So is there a conclusion regarding this issue? Should the wrapper be kepy
as a bash shell script?

Thanks,
Bogdan


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--089e0118413ea83bbe04ddae610a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sun, May 12, 2013 at 10:32 AM, Richard Purdie <span dir=
=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><di=
v class=3D"gmail_extra">

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im"=
>On Fri, 2013-05-10 at 12:00 +0100, Burton, Ross wrote:<br>
&gt; On 10 May 2013 11:50, Phil Blundell &lt;<a href=3D"mailto:philb@bright=
sign.biz">philb@brightsign.biz</a>&gt; wrote:<br>
&gt; &gt; Or you could replace the shell wrapper that create_wrapper() curr=
ently<br>
&gt; &gt; generates with either a compiled binary or a Python script. =A0Th=
at would<br>
&gt; &gt; allow you to execl(&quot;/path/foo.real&quot;, &quot;foo&quot;, .=
..), which I don&#39;t think<br>
&gt; &gt; you can do in shell but which would avoid this whole class of pro=
blem.<br>
&gt;<br>
&gt; Bash can do that, but it&#39;s not POSIX. :/<br>
<br>
</div>I&#39;m quite happy to have the wrapper as bash shell script. We only=
 need<br>
dash compatibility in things that get run under /bin/sh (i.e. bitbake<br>
shell tasks).<br></blockquote><div><br></div><div style>So is there a concl=
usion regarding this issue? Should the wrapper be kepy as a bash shell scri=
pt?</div><div style><br></div><div style>Thanks,</div><div style>Bogdan</di=
v>

<div style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--089e0118413ea83bbe04ddae610a--
