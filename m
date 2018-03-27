Return-Path: <mans.zigher@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 05A116FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 08:25:04 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id z8-v6so27400oix.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 01:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wKDXhlLNq71aBiqMCWF/6o289UCDIsyoeXK4f2Hkbg0=;
	b=oafyKJ4+svsNKt3Ygr8fiof28UBvVpT+JU+jfv7DD8unhTEK225bJg31tU8XHNJGYa
	b+3SB5ehWaw2dbyGzAMxQvK77N/lJdSuxx9uYFemfRRdpXMJF9UJ5ivP1XqawnJkJ0wL
	oU1/pAv466mH+UYJpe+7Q7M+wOllBx6L1pAkGQ5EkHJW2CT+NmrkpFHkc+ZTrjcJKDPZ
	Nfl6dLW0tuUT0ssnoYzhzeBR+Yqx6sACiF8bPVlt84+lo5KoJHhS3yWXWji8tsajSDxa
	uyraqPONmluxaOhyIsGcgMVM7FZnAorKYX9sIUmq7x531MmV2j6K8YoLLMw/CBkoyRKH
	Q23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wKDXhlLNq71aBiqMCWF/6o289UCDIsyoeXK4f2Hkbg0=;
	b=V6DU3qnOBNIgoSEBgMJZvkVz4O9yB2m0twnlfjA8zBG2YaVPlQG9gECNHk5SyN9/3l
	OrH3PKYUZtd0Qd6+HU9rSFv8R+hgnwVU1hpBFJ6mvq6U5OJYPYxY810h2IYsiEuU+2vN
	H0iESxJUNaXdZmPumt8lTQoCxHfP2vKvd4ufERDU4Tei+y8WHWlEyI7mZVEfdCrvftr/
	QtET6KqSGoZY2/CdKUWzE+gpsQO9YfijWaVGDtPAvevR55S2AYUwo0tCaFvNdjH7h/7K
	gEs2v73rWbsyT7A+Vqld+h4mH6Uye+vf8VkAeNrhUtBUXqbCCOkokib2S+8y7LfmoegX
	6sUg==
X-Gm-Message-State: AElRT7FFGYQuvRfNS0fD4URx08jdZAI3VJIsl+QF7+5ELc3Q86P6t1Kn
	zQcnpkZ7HMUfgIdIHR0r54PUsePGL9mJ+OWdc1Xgvg==
X-Google-Smtp-Source: AIpwx49T8COw5e3TK09cTTjqZjMFLyVNt+1pqmTHPHMaG2ic9pgsfYR6PiXWOYNOcktv0bS92Bb2rEGBV3AWTZG2Tw4=
X-Received: by 10.202.212.85 with SMTP id l82mr6587269oig.102.1522139106014;
	Tue, 27 Mar 2018 01:25:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.77.209 with HTTP; Tue, 27 Mar 2018 01:25:05 -0700 (PDT)
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Tue, 27 Mar 2018 10:25:05 +0200
Message-ID: <CAEhQi8kBYvjB05pny3QWkbdd6c1=OAQhrTwCP15-nNsmhZOxyw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Question about how to get package included in SDK
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
X-List-Received-Date: Tue, 27 Mar 2018 08:25:05 -0000
Content-Type: multipart/alternative; boundary="001a113d2472b67ba8056860a00f"

--001a113d2472b67ba8056860a00f
Content-Type: text/plain; charset="UTF-8"

Hi,

I have package that require protobuf and the compiler protoc. I have
included the following

DEPENDS += " protobuf protobuf-native"

and

RDEPENDS_${PN} += " protobuf"

The build works as intended the problem now is that the protoc is not
included in the SDK. In the Yocto ref manual I found the following
description for TOOLCHAIN_HOST_TASK

"This variable lists packages the OpenEmbedded build system uses when
building an SDK, which contains a cross-development environment. The
packages specified by this variable are part of the toolchain set that runs
on the SDKMACHINE
<https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-SDKMACHINE>,
and each package should usually have the prefix nativesdk-."

So I have also in by image bb-file included the following

TOOLCHAIN_HOST_TASK += " nativesdk-protobuf"

The build passed without any errors but the protoc is still not included in
the native sdk. It  is form some reason included in the target part. I
would really appreciate if you could en-light me on this topic on how to
include a package in the sdk.

BR
Mans Zigher

--001a113d2472b67ba8056860a00f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">Hi,</span><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><br></div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial">I have pac=
kage that require protobuf and the compiler protoc. I have included the fol=
lowing</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><br></div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial">DEPENDS +=3D &quot; protobuf protobuf-native&quot;</d=
iv><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial">and</div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><br></div><div style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial">RDEPENDS_${PN} +=3D &quot; protobuf&quot;</=
div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial">The build works as intended the problem now is that the proto=
c is not included in the SDK. In the Yocto ref manual I found the following=
 description for TOOLCHAIN_HOST_TASK</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(51,51,51=
);font-family:Verdana,Sans,sans-serif;font-size:medium"><br></span></div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(51,51,51);font-family:Verdana,Sans,sans-serif">&quot=
;This variable lists packages the OpenEmbedded build system uses when build=
ing an SDK, which contains a cross-development environment. The packages sp=
ecified by this variable are part of the toolchain set that runs on the</sp=
an><span style=3D"color:rgb(51,51,51);font-family:Verdana,Sans,sans-serif">=
=C2=A0</span><a class=3D"gmail-m_-3995637613995310058gmail-link" href=3D"ht=
tps://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-SDKM=
ACHINE" title=3D"SDKMACHINE" target=3D"_blank" style=3D"color:rgb(68,68,68)=
;background:transparent;font-family:Verdana,Sans,sans-serif"><code class=3D=
"gmail-m_-3995637613995310058gmail-filename" style=3D"font-family:Courier,m=
onospace">SDKMACHINE</code></a><span style=3D"color:rgb(51,51,51);font-fami=
ly:Verdana,Sans,sans-serif">, and each package should usually have the pref=
ix</span><span style=3D"color:rgb(51,51,51);font-family:Verdana,Sans,sans-s=
erif">=C2=A0</span><code class=3D"gmail-m_-3995637613995310058gmail-filenam=
e" style=3D"color:rgb(51,51,51);font-family:Courier,monospace">nativesdk-</=
code><span style=3D"color:rgb(51,51,51);font-family:Verdana,Sans,sans-serif=
">.&quot;</span></div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(51,51,51);font-family:Verdan=
a,Sans,sans-serif"><br></span></div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(51,51,51);font=
-family:Verdana,Sans,sans-serif">So I have also in by image bb-file include=
d the following</span></div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(51,51,51);font-family:=
Verdana,Sans,sans-serif"><br></span></div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(51,51,51=
);font-family:Verdana,Sans,sans-serif">TOOLCHAIN_HOST_TASK +=3D &quot; nati=
vesdk-protobuf&quot;</span></div><div style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(51,51,51);font-fa=
mily:Verdana,Sans,sans-serif"><br></span></div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><font color=3D"#333333" face=
=3D"Verdana, Sans, sans-serif">The build passed without any errors but the =
protoc is still not included in the native sdk. It=C2=A0 is form some reaso=
n included in the target part. I would really appreciate if you could en-li=
ght=C2=A0me on this topic=C2=A0on how to include a package in the sdk.</fon=
t></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><font color=3D"#333333" face=3D"Verdana, Sans, sans-serif"><br></fo=
nt></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><font color=3D"#333333" face=3D"Verdana, Sans, sans-serif">BR</fon=
t></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><font color=3D"#333333" face=3D"Verdana, Sans, sans-serif">Mans Zig=
her</font></div><div class=3D"gmail-yj6qo" style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"></div><br class=3D"gmail-Apple-interc=
hange-newline"><br></div>

--001a113d2472b67ba8056860a00f--
