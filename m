Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8276378339
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:07:05 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id d29so87601956uai.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3RoDGgOdz/owMAr1fAjaEvqQzxvLv/tZbjeXSu6d+GM=;
	b=gv0xwbYvKx5mNROBOmanBjObLvWaDfz3YT0ovI/iaGFsfR2lZur+P9z05KKkHcECHo
	DYNeWuAgb8nPQyxOUoPeFjpwcMRB8o4fo78P1lTU3wZtoqyDNX8sLnELb1vQjpJ4EhqJ
	cXuVKXCx2rj6c2NKwbQpCXLm9ExeE5N5aPLD6FCHO9Z3RmUS03Y6HNA+p7BWv4ItjXCy
	jTEEUURdyiNMhGWDV/0G5YyiLZhUcsPt6FpPDUK/gmTWSF5cyw/lFTR3GPkMeZF3V0MP
	gAVOeFqT0xIfYaRaCrcEXs+SPgvDL/bWdCX3nH71KTIr6v+Wlsg+wltRk+GGTU8X02LM
	ivDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3RoDGgOdz/owMAr1fAjaEvqQzxvLv/tZbjeXSu6d+GM=;
	b=HhoM0MSGPvVzy9rcFP2AcSWMMU93kJzECjydWbrqK9gPN2pJvJTOk9pmwEtCw5Bv26
	JD55bPra34gfsO43dX0Cvaxdu7/xTh8okyjhbbDfx9RPlJPTJQH9UFbdJ6SZemYA/9i0
	E275rcVixUG3eV7yyfAfCuEKrnPmyh1aTC0D6mKO8uFf1sNXNBh4GfwFDfppqvv+vAS0
	7879tpfGWXBCpVjONUn/3Fj1av0UJ98lMoAAgp2ihfAxF6l4Wdgb0y2IHb4jJRFbGUnl
	8K7orF4Qnu/AmiangSx5K4EL1NkLwZs+xDsfsIPyREHjlQnpBAIfYXOp3x1ea5znaTrm
	rZVQ==
X-Gm-Message-State: AIVw111H7kKKiQIm349dWXQ38glYAdnWmEB//opqLEqc/jyZGJUZ+Dxi
	xNIfTMdLp+Ur4r5eoBySAnPDvVV0/g==
X-Received: by 10.31.3.146 with SMTP id f18mr11001157vki.184.1500970027218;
	Tue, 25 Jul 2017 01:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Tue, 25 Jul 2017 01:07:06 -0700 (PDT)
In-Reply-To: <CAMKF1soLq6tFwDKBhs_5DxHrNeWr_Hv8kYSvABYsTW_BvgfpKQ@mail.gmail.com>
References: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LaGMPJj-=c7FarWJAULoCJfSjouPKNSweMAaf-g38toJg@mail.gmail.com>
	<CAMKF1soLq6tFwDKBhs_5DxHrNeWr_Hv8kYSvABYsTW_BvgfpKQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 25 Jul 2017 10:07:06 +0200
Message-ID: <CALatG=5yu+0gVSg0dEOY-Yt1SftLWY9iweuzzVMj3D29U0XvaA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] tclibc-musl.inc: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Tue, 25 Jul 2017 08:07:06 -0000
Content-Type: multipart/alternative; boundary="001a114290044a7ace05551fd1d5"

--001a114290044a7ace05551fd1d5
Content-Type: text/plain; charset="UTF-8"

Hi, Burton:

I also agree with you, your suggestion is better.

Hi, Khem:

But is this a bug of binutils? Or musl libc? Since I had only observed this
error with musl libc only, it did not occur with glibc.

//Ming Liu

2017-07-24 15:39 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Mon, Jul 24, 2017 at 6:18 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > If we're going to silently change the linker to bfd under musl if
> ld-is-gold
> > is selected, wouldn't it be better just to throw an exception if both
> musl
> > and ld-is-gold are selected?  Better to tell the user so they can not do
> > that than silently ignore what they asked.
>
> yes, that would be better but I am skeptical of disabling it
> completely, we should
> create testcase and report it to binutils bugzilla
>
>
> >
> > Ross
> >
> > On 22 July 2017 at 14:30, <liu.ming50@gmail.com> wrote:
> >>
> >> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >>
> >> Quite a few such compiling issues were found when I was building with
> >> following configs:
> >> ...
> >> MACHINE = "beaglebone"
> >> TCLIBC = "musl"
> >> DISTRO_FEATURES_append = " ld-is-gold"
> >> ...
> >>
> >> fixed by adding bfd binding now ldflags.
> >>
> >> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> >> ---
> >>  meta/conf/distro/include/tclibc-musl.inc | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/conf/distro/include/tclibc-musl.inc
> >> b/meta/conf/distro/include/tclibc-musl.inc
> >> index 3d3f6ac..99d52a1 100644
> >> --- a/meta/conf/distro/include/tclibc-musl.inc
> >> +++ b/meta/conf/distro/include/tclibc-musl.inc
> >> @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=
> >> "nativesdk-glibc"
> >>
> >>  CXXFLAGS += "-fvisibility-inlines-hidden"
> >>
> >> +# Workaround for musl libc does not support bfd lazy binding well
> >> +# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
> >> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> >> '-Wl,-z,relro,-z,now -fuse-ld=bfd', '', d)}"
> >> +
> >>  IMAGE_LINGUAS = ""
> >>
> >>  LIBC_DEPENDENCIES = "\
> >> --
> >> 2.7.4
> >>
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a114290044a7ace05551fd1d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Burton:<div><br></div><div>I also agree with you, your=
 suggestion is better.</div><div><br></div><div>Hi, Khem:</div><div><br></d=
iv><div>But is this a bug of binutils? Or musl libc? Since I had only obser=
ved this error with musl libc only, it did not occur with glibc.</div><div>=
<br></div><div>//Ming Liu</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">2017-07-24 15:39 GMT+02:00 Khem Raj <span dir=3D"ltr">&=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mo=
n, Jul 24, 2017 at 6:18 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; If we&#39;re going to silently change the linker to bfd under musl if =
ld-is-gold<br>
&gt; is selected, wouldn&#39;t it be better just to throw an exception if b=
oth musl<br>
&gt; and ld-is-gold are selected?=C2=A0 Better to tell the user so they can=
 not do<br>
&gt; that than silently ignore what they asked.<br>
<br>
</span>yes, that would be better but I am skeptical of disabling it<br>
completely, we should<br>
create testcase and report it to binutils bugzilla<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On 22 July 2017 at 14:30, &lt;<a href=3D"mailto:liu.ming50@gmail.com">=
liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Quite a few such compiling issues were found when I was building w=
ith<br>
&gt;&gt; following configs:<br>
&gt;&gt; ...<br>
&gt;&gt; MACHINE =3D &quot;beaglebone&quot;<br>
&gt;&gt; TCLIBC =3D &quot;musl&quot;<br>
&gt;&gt; DISTRO_FEATURES_append =3D &quot; ld-is-gold&quot;<br>
&gt;&gt; ...<br>
&gt;&gt;<br>
&gt;&gt; fixed by adding bfd binding now ldflags.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external=
.atlascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/conf/distro/include/<wbr>tclibc-musl.inc | 4 ++++<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; b/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; index 3d3f6ac..99d52a1 100644<br>
&gt;&gt; --- a/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; +++ b/meta/conf/distro/include/<wbr>tclibc-musl.inc<br>
&gt;&gt; @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/<wbr>nativesdk-libic=
onv ?=3D<br>
&gt;&gt; &quot;nativesdk-glibc&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 CXXFLAGS +=3D &quot;-fvisibility-inlines-hidden&quot;<br>
&gt;&gt;<br>
&gt;&gt; +# Workaround for musl libc does not support bfd lazy binding well=
<br>
&gt;&gt; +# Refer to: <a href=3D"https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D11679" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoct=
oproject.<wbr>org/show_bug.cgi?id=3D11679</a><br>
&gt;&gt; +LDFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES=
&#39;, &#39;ld-is-gold&#39;,<br>
&gt;&gt; &#39;-Wl,-z,relro,-z,now -fuse-ld=3Dbfd&#39;, &#39;&#39;, d)}&quot=
;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 LIBC_DEPENDENCIES =3D &quot;\<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a114290044a7ace05551fd1d5--
