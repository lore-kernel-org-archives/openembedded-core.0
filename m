Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 282AC7806E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 11:34:28 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 72so6475810itk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UoxDO2xSkz/DUaizW4cfBU4nP5DCwZ5P0rVOf7Ku6JQ=;
	b=dTFCmPhq5TGo1wSOOUg/2kZkvBUpBta7cePPMFUMclD1bTqNKoghZVw0YXF/xkFGGf
	1wnEBxLP/aRfmvUb0CVz56ZPngVLHPafeY/QniriOaiEp0XIEN2lM0ALh5BOOFvsY/qx
	M8Ihv1uO/ZDJhAi2eeO8HLuPO7j3612y+ZEJwqph8t1h43ivsF+6Bf9Di5nqQw5sx1VY
	0+fE2t9cKZRwgZP0cSD72KrjRvcywzmc9ArvrakpAYtOsl9MGS51+eLB8b3NzflA0LUV
	eaOy5dH310Y+wMQnGfV1E5ShQc2PccW5R6anG+4WrJ2m2Zp0fpJfZIBXInH/NVx7in25
	eUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UoxDO2xSkz/DUaizW4cfBU4nP5DCwZ5P0rVOf7Ku6JQ=;
	b=XvULeq37M0IJZwA+NkKWaaUm4iOz/vdP/wzmAJpxNBFcq2XXXnUuF/sg7z4eBItM1g
	p0BiEr7LiGecDV0B8OxkrqZ+pP5tYTTWoSF7lBJnO/+8YRBAjZWIaI+lj70IMkkKjSM3
	R2bxZTfgNtsU+VjvJKNy8I7BCXmf3jazOcCj3gclGnlZLiUjraIC15f44IBqT4eZY2cy
	zzwdq5Q2fVRBKqx3qMLaJmL9Lx9kJkZjVf+KzNp144L76bMgwEN9efEJX30zosXLlkeF
	LQ0zst7MgBKkNC+izhq+FNq6a+ZJoM3Jj8UlWlnN/9B9kG7qJKdem+rZHqmieogqGn1T
	mY9A==
X-Gm-Message-State: AMCzsaVnUZzO0P1wfzfwUV9gf2tLdrFwlKbUqQA7352+IJbHjvUnUZSk
	5MgorKLVVgsaCt5PGQBzrlAwatLMPs1TsJGEGoQTgQ==
X-Google-Smtp-Source: AOwi7QDCHGHnVYJNe9K+ASkgUSLZ6/MDalW3YnIJNLIVXVc0i+Eq7DOXFGqSYsiU3l7rS/r4hfvEdf0IO5iRZp8E+Q8=
X-Received: by 10.36.150.4 with SMTP id z4mr2947170itd.48.1507808070264; Thu,
	12 Oct 2017 04:34:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Thu, 12 Oct 2017 04:34:09 -0700 (PDT)
In-Reply-To: <CAMKF1sqqx-7PgL7833JVTn87Tdc57+h-Ob7VLfBD4khmpKN+HA@mail.gmail.com>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171012015609.GA3832@jama>
	<CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
	<50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqqx-7PgL7833JVTn87Tdc57+h-Ob7VLfBD4khmpKN+HA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Oct 2017 12:34:09 +0100
Message-ID: <CAJTo0LZMRAP4t4XcjyNw-uhnqLLU=sQW38=EMKn=RKo3=c-bEw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 12 Oct 2017 11:34:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea986aff73055b57ec1e"

--94eb2c07ea986aff73055b57ec1e
Content-Type: text/plain; charset="UTF-8"

On 12 October 2017 at 06:01, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Oct 11, 2017 at 9:32 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:
> >> On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> > On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org
> wrote:
> >> >> --- a/meta/conf/bitbake.conf
> >> >> +++ b/meta/conf/bitbake.conf
> >> >> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
> >> >>  "
> >> >>
> >> >>  # Tools needed to run testimage runtime image testing
> >> >> -HOSTTOOLS += "ip ping ps scp ssh stty"
> >> >> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh
> stty'][bb.data.inherits_class('testimage', d)]}"
> >> >
> >> > Shouldn't we include at least ssh by default?
> >>
> >> I would say no, since nothing in OE-Core depends on it. more we
> >> abstract from host system better it is.
> >
> > I'm with Martin on this one, let's not make it painful for people to use
> > the SSH protocol in git URLs in their recipes. I don't see much potential
> > for host contamination.
>
> Standard distro do not install ssh, if we want to add it here, probably we
> should at the same time let user know that he should install ssh
>

That's what HOSTTOOLS_NONFATAL is for.  Who is going to claim the glory and
post a patch?

Ross

--94eb2c07ea986aff73055b57ec1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 October 2017 at 06:01, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Oct 11, 2017 =
at 9:32 PM, Paul Eggleton<br>
&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.in=
tel.com</a><wbr>&gt; wrote:<br>
&gt; On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:<br>
&gt;&gt; On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On Mon, Oct 09, 2017 at 09:09:31AM +0000, <a href=3D"mailto:g=
it@git.openembedded.org">git@git.openembedded.org</a> wrote:<br>
&gt;&gt; &gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; &gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; &gt;&gt; @@ -484,7 +484,7 @@ HOSTTOOLS +=3D &quot; \<br>
&gt;&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 # Tools needed to run testimage runtime image testi=
ng<br>
&gt;&gt; &gt;&gt; -HOSTTOOLS +=3D &quot;ip ping ps scp ssh stty&quot;<br>
&gt;&gt; &gt;&gt; +HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp=
 ssh stty&#39;][bb.data.inherits_class(<wbr>&#39;testimage&#39;, d)]}&quot;=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Shouldn&#39;t we include at least ssh by default?<br>
&gt;&gt;<br>
&gt;&gt; I would say no, since nothing in OE-Core depends on it. more we<br=
>
&gt;&gt; abstract from host system better it is.<br>
&gt;<br>
&gt; I&#39;m with Martin on this one, let&#39;s not make it painful for peo=
ple to use<br>
&gt; the SSH protocol in git URLs in their recipes. I don&#39;t see much po=
tential<br>
&gt; for host contamination.<br>
<br>
</span>Standard distro do not install ssh, if we want to add it here, proba=
bly we<br>
should at the same time let user know that he should install ssh<br></block=
quote><div><br></div><div>That&#39;s what HOSTTOOLS_NONFATAL is for.=C2=A0 =
Who is going to claim the glory and post a patch?</div><div><br></div><div>=
Ross=C2=A0</div></div></div></div>

--94eb2c07ea986aff73055b57ec1e--
