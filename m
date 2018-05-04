Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2D63D72EA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 08:19:31 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a67so2692908wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lw3urk6xw0ezjNdUesymK9Cn1I5rPgkWZ110nyjMsL8=;
	b=RMRI7bW7IRc61lOc/VqMhUD0SCJTUtjQx9cYRhhn+sEq0vblK4PyM2bu1a6Nxd9Psn
	2EZDlQgcBoLkHBU8NN4HVlTRRaEloLdqy+Nw88G9JM/uEb17U6a/KZ8PMlRJaL9UEpN7
	GW575hwo4rpOGWnT3p8A9JM3jJLZdlcS1HRwW7x0LZ++NLi2DXzSKNZ/9v9hhJu1/3Ss
	HpB47dMjBljJfVKVkzFPKGz95BfqPhMCqG8Ap3pc2yV0SXVtTceVfrcshs9dnOTfZKXc
	SO1ty1U8OWR1fE1Tpax849wKdDqaBZlMnEZlLo5EHy+64Ce2gO7Iby7qoGxyfyEm/82e
	Puog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lw3urk6xw0ezjNdUesymK9Cn1I5rPgkWZ110nyjMsL8=;
	b=fTI1y3cTtD+M+2NQ9jwMc0C/kJ2Vr/FXBic+NLx0f+Bq1C3eGdd29qaUfz0dDPBmnY
	s+Zaaery71NA0aCf0L2I1ekecoLTvF/HljoDRu+ygumZ/CiawMTGJj2Vj9LLlELFsCcW
	uXTsr5YBhLMtYLMyo0ePzLHqMVUbdU0+P99H7TM7dHBJhZ4my+gGyeKbkf32i9eKwTz4
	BIhPQsMcpltXjrutnP8yYZ3HWZNEf1TsYKO4ig63FRloCXNTzSH7uE/P1LYjOy27lofm
	RWEhxX1+tiSdJru2Gp2jB0Yvv6xKc30BH1nhwcC6Zm5Oq160pR6dPN0h1CtKKG5H+ywX
	DGJw==
X-Gm-Message-State: ALQs6tDbB8P+/MQ6wgRVJxg+z1Ak5D8swUyOkCJx1JXs6I9g/61EKm8r
	zfKVQDmVEyvqVHAlyD76MschNQVkQpjh1ScWaZI=
X-Google-Smtp-Source: AB8JxZrP+YFmepzwonJ6R/tMhUeRYtJzts6TICT00pZok0pHJcJfsDl5BU6h4PhoOcKzjCMvld9PlYRVPMdezsfcaSY=
X-Received: by 2002:a50:b4e1:: with SMTP id
	x30-v6mr34858790edd.155.1525421972169; 
	Fri, 04 May 2018 01:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQ58sjQvtnCH1h20y8D6H3NVSbnCTqLe=pSLj6X8=xTL6KWbQ@mail.gmail.com>
	<CY4PR02MB3334657A081A9A23510452D1AC860@CY4PR02MB3334.namprd02.prod.outlook.com>
In-Reply-To: <CY4PR02MB3334657A081A9A23510452D1AC860@CY4PR02MB3334.namprd02.prod.outlook.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Fri, 04 May 2018 08:19:21 +0000
Message-ID: <CAEQ58sj_699mSB4zaZ2e6APP7aKR2siZ7+j3qyxfCanPNZSgDw@mail.gmail.com>
To: alejandr@xilinx.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python recipes with extensions fail to find/link with proper libraries
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
X-List-Received-Date: Fri, 04 May 2018 08:19:32 -0000
Content-Type: multipart/alternative; boundary="000000000000c8a669056b5cfa38"

--000000000000c8a669056b5cfa38
Content-Type: text/plain; charset="UTF-8"

Hi Alejandro,

Thank you for your response.
I know that openblas recipe is a pain, given that its Makefile is not
correctly written with respect to cross-compilation. However, the library
has been built locally on the target (sigh!) and then it is being deployed
with a recipe which unpacks the built binary and copy them into the sys
root.

So, from the openblas side, everything is OK.

What is actually wrong is the configuration step for python3-numpy and
python3-scipy: in the setup.py they are instructed to search for some
libraries (namely, openblas amongst them) but they fail to search for them
given that the path they are searching for is the sysroot-native, rather
than sysroot. (you can see it clearly from the logs attached in the first
message).

Installing the packages using pip3 install scipy numpy on the target
results on a correct execution (and libraries are properly found and
linked).

Thank you,
Francesco Giancane




Il giorno ven 4 mag 2018 alle ore 03:01 Alejandro Enedino Hernandez
Samaniego <alejandr@xilinx.com> ha scritto:

> Hello Francesco,
>
>
>
> It would be helpful if you could provide more information about this, e.g.
> access to your layer or your recipes, to make sure they are actually being
> built correctly, also I would start by manually linking it against the
> built library to see if the error is just not having them on the correct
> path, but I seem to remember a lot of issues when trying to cross compile
> openblas, specially for an arm MACHINE.
>
>
>
> Alejandro
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *Francesco
> Giancane
> *Sent:* Wednesday, May 2, 2018 2:33 PM
> *To:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* [OE-core] python recipes with extensions fail to find/link
> with proper libraries
>
>
>
> Hi Everyone,
>
> I found a problem working with python(3) and C extensions.
>
>
>
> The use-case is the recipe for python(3)-numpy, which can be linked
> against a BLAS/LAPACK library to use accelerated matricial and vectorial
> operations.
>
>
>
> As it is currently shipped, the recipe fails to find any proper library
> and then does not use extensions.
>
>
>
> I wrote a custom recipe for openblas which is correctly built & deploy
> using standard commands.
>
> openblas is also added as a DEPENDS in a bbappend file for numpy.
>
>
>
> However, the do_compile phase cannot find the aforementioned library.
>
>
>
> Log attached:
>
>
>
> DEBUG: Executing shell function do_compile
>
> blas_opt_info:
>
> blas_mkl_info:
>
> customize UnixCCompiler
>
>   libraries mkl_rt not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> blis_info:
>
> customize UnixCCompiler
>
>   libraries blis not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> openblas_info:
>
> customize UnixCCompiler
>
> customize UnixCCompiler
>
>   libraries openblas not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> atlas_3_10_blas_threads_info:
>
> Setting PTATLAS=ATLAS
>
> customize UnixCCompiler
>
>   libraries tatlas not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> atlas_3_10_blas_info:
>
> customize UnixCCompiler
>
>   libraries satlas not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> atlas_blas_threads_info:
>
> Setting PTATLAS=ATLAS
>
> customize UnixCCompiler
>
>   libraries ptf77blas,ptcblas,atlas not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> atlas_blas_info:
>
> customize UnixCCompiler
>
>   libraries f77blas,cblas,atlas not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> blas_info:
>
> customize UnixCCompiler
>
>   libraries blas not found in
> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>   NOT AVAILABLE
>
>
>
> blas_src_info:
>
>   NOT AVAILABLE
>
>
>
>   NOT AVAILABLE
>
>
>
> ...And it is correct for it to fail as it is searching for openblas in the
> wrong path (sysroot-native vs sysroot).
>
>
>
> I would assume that this is a setuptools.bbclass issue, does anyone know
> what to do? Is it trivial to fix?
>
>
>
> I noticed that all the shipped python extensions were built as if we were
> building for x86, even though the MACHINE is an arm target.
>
>
>
> Thank you for your attention,
>
>
> Francesco Giancane
>
>
>

--000000000000c8a669056b5cfa38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alejandro,<div><br></div><div>Thank you for your respon=
se.</div><div>I know that openblas recipe is a pain, given that its Makefil=
e is not correctly written with respect to cross-compilation. However, the =
library has been built locally on the target (sigh!) and then it is being d=
eployed with a recipe which unpacks the built binary and copy them into the=
 sys root.</div><div><br></div><div>So, from the openblas side, everything =
is OK.</div><div><br></div><div>What is actually wrong is the configuration=
 step for python3-numpy and python3-scipy: in the setup.py they are instruc=
ted to search for some libraries (namely, openblas amongst them) but they f=
ail to search for them given that the path they are searching for is the sy=
sroot-native, rather than sysroot. (you can see it clearly from the logs at=
tached in the first message).</div><div><br></div><div>Installing the packa=
ges using pip3 install scipy numpy on the target results on a correct execu=
tion (and libraries are properly found and linked).</div><div><br></div><di=
v>Thank you,</div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div><div =
dir=3D"ltr">Francesco Giancane</div><div dir=3D"ltr"><br></div></div><div><=
dd style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-famil=
y:inherit;vertical-align:top;line-height:inherit;display:inline-block"><spa=
n style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-family=
:inherit;vertical-align:baseline;line-height:inherit;direction:ltr"><br></s=
pan></dd></div></div></div></div></div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">Il giorno ven 4 mag 2018 alle ore 03:01 Alejand=
ro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:alejandr@xilinx.com">a=
lejandr@xilinx.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-8611667753301666364WordSection1">
<p class=3D"MsoNormal">Hello Francesco,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">It would be helpful if you could provide more inform=
ation about this, e.g. access to your layer or your recipes, to make sure t=
hey are actually being built correctly, also I would start by manually link=
ing it against the built library to
 see if the error is just not having them on the correct path, but I seem t=
o remember a lot of issues when trying to cross compile openblas, specially=
 for an arm MACHINE.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Alejandro<u></u><u></u></p>
<p class=3D"MsoNormal"><a name=3D"m_-8611667753301666364__MailEndCompose"><=
u></u>=C2=A0<u></u></a></p>
<span></span>
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:openembedded-core-bou=
nces@lists.openembedded.org" target=3D"_blank">openembedded-core-bounces@li=
sts.openembedded.org</a> [mailto:<a href=3D"mailto:openembedded-core-bounce=
s@lists.openembedded.org" target=3D"_blank">openembedded-core-bounces@lists=
.openembedded.org</a>]
<b>On Behalf Of </b>Francesco Giancane<br>
<b>Sent:</b> Wednesday, May 2, 2018 2:33 PM<br>
<b>To:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<=
br>
<b>Subject:</b> [OE-core] python recipes with extensions fail to find/link =
with proper libraries<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi Everyone,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">I found a problem working with python(3) and C exten=
sions.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The use-case is the recipe for python(3)-numpy, whic=
h can be linked against a BLAS/LAPACK library to use accelerated matricial =
and vectorial operations.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">As it is currently shipped, the recipe fails to find=
 any proper library and then does not use extensions.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I wrote a custom recipe for openblas which is correc=
tly built &amp; deploy using standard commands.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">openblas is also added as a DEPENDS in a bbappend fi=
le for numpy.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">However, the do_compile phase cannot find the aforem=
entioned library.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Log attached:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">DEBUG: Executing shell function do_compile<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">blas_opt_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">blas_mkl_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries mkl_rt not found in [&#39;/home/fgp=
/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-num=
py/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">blis_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries blis not found in [&#39;/home/fgp/p=
oky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy=
/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">openblas_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries openblas not found in [&#39;/home/f=
gp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-n=
umpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">atlas_3_10_blas_threads_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Setting PTATLAS=3DATLAS<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries tatlas not found in [&#39;/home/fgp=
/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-num=
py/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">atlas_3_10_blas_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries satlas not found in [&#39;/home/fgp=
/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-num=
py/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">atlas_blas_threads_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Setting PTATLAS=3DATLAS<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries ptf77blas,ptcblas,atlas not found i=
n [&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gn=
ueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">atlas_blas_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries f77blas,cblas,atlas not found in [&=
#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueab=
i/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">blas_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">customize UnixCCompiler<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 libraries blas not found in [&#39;/home/fgp/p=
oky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy=
/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">blas_src_info:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">...And it is correct for it to fail as it is searchi=
ng for openblas in the wrong path (sysroot-native vs sysroot).<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I would assume that this is a setuptools.bbclass iss=
ue, does anyone know what to do? Is it trivial to fix?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I noticed that all the shipped python extensions wer=
e built as if we were building for x86, even though the MACHINE is an arm t=
arget.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thank you for your attention,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Francesco Giancane<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;vertical-align:top"><span =
style=3D"font-family:&quot;inherit&quot;,serif"><u></u>=C2=A0<u></u></span>=
</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000c8a669056b5cfa38--
