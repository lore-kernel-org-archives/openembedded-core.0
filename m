Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id A7BE878335
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:50:37 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id j32so8503104iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b2TZDbfLCGk1qMC/9uu3oYnnQVDcCs5FfpxJp/tRqAs=;
	b=JJlugODMUt1qKu2ttr02W+3pt7ZPOY2GUtXO+xtDKDJu5KNlutAfF++c8xCJcDDExD
	c2U15b4joSSVmUP/2M4BI4Stgtu4jxFiw8L8hozHPKMDt7UxB5bCPnqTFrCd+8VX5HM9
	wABa/KtQ4psSyVvNLM5za4aMBhsfF26WpSjPieUJzsJ6AWEng5NIAYBklvNYalSBNCE1
	9XXuCVwjTeG4QvK2Fvu8tJIJTjEGKfBwco3CJo2a+qb+2526fq0yWZbWOTDMEC6Yc/Dj
	EIkInSNfR/qf3IdMCjeAqENRhnSUmXniDOSNjenJSONuxnI8qJa371+T1OwhHvXQ2HwB
	a4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b2TZDbfLCGk1qMC/9uu3oYnnQVDcCs5FfpxJp/tRqAs=;
	b=HtVlLwCzp2VMSVhaVtKsbkMn6Oyd3s8BW4IOyrl044soK2qSwxDl9gKi9InKXvc8zJ
	Qz6nO285eFVe7EKSfuw5TYU2DWioB+WemnUOK+xahgzwWbjdKF9VyUmTmvhfDz6kluhH
	5BbQh9KPpeE8e8ehMmanBab4KzPAwaH9zmnTI9zRKxMC4Xk9+8DTchX1lYrxjbMfXyOo
	YSI2fRy0cjzMuyyFPZ6dH2mrugwEVWZQ4YzM45MEfg3Rbjclq2rKb1nw1gbMppFiREJP
	Rho11sJznN3pjaZVfQaKoUwRee0ImkabG9/y0fL9d/xSJ8u9N3nlrJNjOnPrDq9P5uvH
	BXMw==
X-Gm-Message-State: AIVw11178Abfezc5f4mte4z6SdVG+Efm75I5ltU/MWdQMbZZ2xT8ijsx
	GTrY9MfFE5TVDWIRmfR6HzEVcJ+TPUbL
X-Received: by 10.107.132.33 with SMTP id g33mr21614550iod.300.1501595437765; 
	Tue, 01 Aug 2017 06:50:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 1 Aug 2017 06:50:17 -0700 (PDT)
In-Reply-To: <CAP9ODKrs_qij8v+q9ViZtW_rT0c9W02YcqQ+gAV1Y8DmWaz4sg@mail.gmail.com>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
	<CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
	<CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
	<adac39d9-b395-9f8d-5af0-8882e2136140@gmail.com>
	<CAP9ODKrs_qij8v+q9ViZtW_rT0c9W02YcqQ+gAV1Y8DmWaz4sg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Aug 2017 14:50:17 +0100
Message-ID: <CAJTo0LYQdCtUHo6Af_UkcBOQnuevUwcMS+445oBm=DPGwPRBmg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Tue, 01 Aug 2017 13:50:37 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e8aa34690555b16e69"

--001a113ed2e8aa34690555b16e69
Content-Type: text/plain; charset="UTF-8"

Verifying this here.

Building for qemuarm puts the binary in /usr/bin/dep.  Building for
intel-corei7-64 puts the binary in /usr/lib/x86_64-poky-linux/go/bin/dep.

Ross

On 31 July 2017 at 20:52, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> On Mon, Jul 31, 2017 at 4:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> > On 7/31/17 12:12 PM, Otavio Salvador wrote:
> >> Hello Ross,
> >> Hello Khem,
> >>
> >> On Sat, Jul 29, 2017 at 3:28 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >>> Failed in the no-x11 builder at least so far:
> >>>
> >>> ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories
> were
> >>> installed but not shipped in any package:
> >>>   /usr/lib/x86_64-poky-linux/go/bin/dep
> >>> Please set FILES such that these items are packaged. Alternatively if
> they
> >>> are unneeded, avoid installing them or delete them within do_install.
> >>>
> >>> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/
> builds/537
> >>
> >> I did reproduce this; I could only reproduce it if I built it with a
> >> machine which matches the architecture of host, in my case x86-64.
> >> When building for other arch (e.g: ARM) it works as expected.
> >>
> >> The problem seems to be a generic problem and I am not experienced
> >> enough on the Golang toolchain to look at this. Khem could you take a
> >> look and see if you find the root cause?
> >
> > Delete this file, its building it on x86_64 because it can. We only need
> > cross version.
>
> I am not sure I follow you here.
>
> Using qemux86-64 as target it does NOT install on ${bindir} and
> surprisingly the installation path does also not match GOBIN_FINAL
> value.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--001a113ed2e8aa34690555b16e69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Verifying this here.<div><br></div><div>Building for qemua=
rm puts the binary in /usr/bin/dep.=C2=A0 Building for intel-corei7-64 puts=
 the binary in=C2=A0/usr/lib/x86_64-poky-linux/go/bin/dep.</div><div><br></=
div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 31 July 2017 at 20:52, Otavio Salvador <span dir=3D"ltr">&lt;<a =
href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.s=
alvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon, Jul 31, 2017 at 4:20 =
PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 7/31/17 12:12 PM, Otavio Salvador wrote:<br>
&gt;&gt; Hello Ross,<br>
&gt;&gt; Hello Khem,<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Jul 29, 2017 at 3:28 PM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Failed in the no-x11 builder at least so far:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/dir=
ectories were<br>
&gt;&gt;&gt; installed but not shipped in any package:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0/usr/lib/x86_64-poky-linux/go/<wbr>bin/dep<br>
&gt;&gt;&gt; Please set FILES such that these items are packaged. Alternati=
vely if they<br>
&gt;&gt;&gt; are unneeded, avoid installing them or delete them within do_i=
nstall.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/main/builders/=
nightly-no-x11/builds/537" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.<wbr>yoctoproject.org/main/<wbr>builders/nightly-no-x11/<wbr>build=
s/537</a><br>
&gt;&gt;<br>
&gt;&gt; I did reproduce this; I could only reproduce it if I built it with=
 a<br>
&gt;&gt; machine which matches the architecture of host, in my case x86-64.=
<br>
&gt;&gt; When building for other arch (e.g: ARM) it works as expected.<br>
&gt;&gt;<br>
&gt;&gt; The problem seems to be a generic problem and I am not experienced=
<br>
&gt;&gt; enough on the Golang toolchain to look at this. Khem could you tak=
e a<br>
&gt;&gt; look and see if you find the root cause?<br>
&gt;<br>
&gt; Delete this file, its building it on x86_64 because it can. We only ne=
ed<br>
&gt; cross version.<br>
<br>
</div></div>I am not sure I follow you here.<br>
<br>
Using qemux86-64 as target it does NOT install on ${bindir} and<br>
surprisingly the installation path does also not match GOBIN_FINAL<br>
value.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</div></div></blockquote></div><br></div>

--001a113ed2e8aa34690555b16e69--
