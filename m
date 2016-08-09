Return-Path: <avery.brian@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 363C8771D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 00:19:18 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u186so28605ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fnr9mrWk4HgJ/zHKA+McWAidABtQsTqr8aU0eT5byVA=;
	b=tf3GYMzUA+fdClppC2/iLTFEwbI9ba8vRYP4ZDLAFUC8Yw6oW/YnrlUvqOQJXSGn2S
	UtYSTdsqpASJovZHzL1dqnyisMP0rPx0rkZCpLF0Ms6Nh6may/awRbzQMODwu1wKuxIj
	8Scr3flcNQuEZkrbsUKJpM4IlbHNCETAEg+TxqPyrtd89KAz757p5W2AiIMboEwxcqjf
	BpKi2reUJP466A4bPS0JS8dlRloYYDKn0RJq8Pq4g4+BJ2Rikk8MdPPSAi4xhM/A1nzj
	HhoS53JqqoIuNxbA21fmmlnwrHORnnY3UiuV9dlFQFjaBlXTJXlVSaGGRHI8DHCE25vj
	uYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fnr9mrWk4HgJ/zHKA+McWAidABtQsTqr8aU0eT5byVA=;
	b=Fbi9rVLyD7UE9dTmMcgRiFT7uqEU3pukBpdAsXJ84/DvZXHtX00v99ccPstkVlTTwQ
	JU/H+YhU9O906YRFyBn8Xn3DL05Havh2AACCrqGyPCjeMaVXhcnRSQUbaC3nT+IR+BKZ
	kO3/zRjzu1BxlRW8WXMlQU0JcYm4da/1gdUS8YVTsHaZhrFw+nj2YvbEIqTreKPtc8zD
	kJEEGM502TynZOeNEK/+4PfaQYVimg6sYQt9rY02g4I3ecT7C1eVt5BxLVfWrA5e9zKU
	7W3MgU9TSRVb7PWb5TlUJJLByJ2QAeafdW3J/lW7LWtqbbjzYhKOe7RzXLBzBui5A7wR
	wloA==
X-Gm-Message-State: AEkooutEsqeM8XPtISilddRsO5uvUrwoq0wF3pTX7oBdhmycQWbjN2pes4dQgWjGi+0sRZdjaDjwTaNcKVYcsQ==
X-Received: by 10.36.192.9 with SMTP id u9mr21426294itf.86.1470701959544; Mon,
	08 Aug 2016 17:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.35 with HTTP; Mon, 8 Aug 2016 17:19:18 -0700 (PDT)
In-Reply-To: <5102DD35-71D6-4D0A-BEEB-D1012DDF7982@gmail.com>
References: <cover.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
	<1470643460.8166.35.camel@linuxfoundation.org>
	<4180524.BjivrXu0U0@peggleto-mobl.ger.corp.intel.com>
	<5102DD35-71D6-4D0A-BEEB-D1012DDF7982@gmail.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Mon, 8 Aug 2016 17:19:18 -0700
Message-ID: <CAKV_0ehQZe_-Hnit+ohkQWsEsyx2ONQN=Gf-1BLaF67QoiLRGw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Tue, 09 Aug 2016 00:19:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c05aa2adeb1a90539987b3e

--94eb2c05aa2adeb1a90539987b3e
Content-Type: text/plain; charset=UTF-8

Hi,

I spent some time today and could not replicate the issues I had with
dropbear+openssh-sftp-server under Eclipse. Since I ran into these issues
while tracking down the busybox/resize issue it could easily have been a
red herring.

So, I'm resending with the openssh-server patch removed.
-brian
an Intel employee


On Mon, Aug 8, 2016 at 2:38 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Aug 8, 2016, at 1:45 PM, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> >
> > On Mon, 08 Aug 2016 09:04:20 Richard Purdie wrote:
> >> On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:
> >>> On 08/08/2016 05:43 AM, bavery wrote:
> >>>> The openssh-sftp-server was already part of the pakagegroup. Adding
> >>>> the openssh-server
> >>>> lets the sftp server start up correctly.
> >>>
> >>> If openssh-sftp-server cannot run without openssh, shouldn't it
> >>> RDEPEND
> >>> on it instead ?
> >>
> >> I suspect you are right and that it needs an RDEPENDS if it doesn't
> >> work without it. It also needs a comment explaining the dependency so
> >> someone doesn't remove it.
> >
> > Using openssh-sftp-server with dropbear used to work, so it would be
> > interesting to know when it broke and if it's possible to fix it.
>
> yes, in angstrom that is the default combination as well. I think it still
> is functional.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c05aa2adeb1a90539987b3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>I spent some time today and c=
ould not replicate the issues I had with dropbear+<span style=3D"color:rgb(=
80,0,80);font-size:12.8px">openssh-sftp-server under Eclipse. Since I ran i=
nto these issues while tracking down the busybox/resize issue it could easi=
ly have been a red herring.</span></div><div><span style=3D"color:rgb(80,0,=
80);font-size:12.8px"><br></span></div><div><span style=3D"color:rgb(80,0,8=
0);font-size:12.8px">So, I&#39;m resending with the openssh-server patch re=
moved. =C2=A0</span></div><div><span style=3D"color:rgb(80,0,80);font-size:=
12.8px">-brian</span></div><div><span style=3D"color:rgb(80,0,80);font-size=
:12.8px">an Intel employee</span></div><div><span style=3D"color:rgb(80,0,8=
0);font-size:12.8px"><br></span></div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Mon, Aug 8, 2016 at 2:38 PM, Khem Raj <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D""><br>
&gt; On Aug 8, 2016, at 1:45 PM, Paul Eggleton &lt;<a href=3D"mailto:paul.e=
ggleton@linux.intel.com">paul.eggleton@linux.intel.com</a><wbr>&gt; wrote:<=
br>
&gt;<br>
&gt; On Mon, 08 Aug 2016 09:04:20 Richard Purdie wrote:<br>
&gt;&gt; On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:<br>
&gt;&gt;&gt; On 08/08/2016 05:43 AM, bavery wrote:<br>
&gt;&gt;&gt;&gt; The openssh-sftp-server was already part of the pakagegrou=
p. Adding<br>
&gt;&gt;&gt;&gt; the openssh-server<br>
&gt;&gt;&gt;&gt; lets the sftp server start up correctly.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If openssh-sftp-server cannot run without openssh, shouldn&#39=
;t it<br>
&gt;&gt;&gt; RDEPEND<br>
&gt;&gt;&gt; on it instead ?<br>
&gt;&gt;<br>
&gt;&gt; I suspect you are right and that it needs an RDEPENDS if it doesn&=
#39;t<br>
&gt;&gt; work without it. It also needs a comment explaining the dependency=
 so<br>
&gt;&gt; someone doesn&#39;t remove it.<br>
&gt;<br>
&gt; Using openssh-sftp-server with dropbear used to work, so it would be<b=
r>
&gt; interesting to know when it broke and if it&#39;s possible to fix it.<=
br>
<br>
</span>yes, in angstrom that is the default combination as well. I think it=
 still<br>
is functional.<br>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--94eb2c05aa2adeb1a90539987b3e--
