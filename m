Return-Path: <helio.castro@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3C66E680
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:54:01 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:47146
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Helio.Castro@bmw-carit.de>)
	id 1aePO2-0003P4-3C; Fri, 11 Mar 2016 16:53:59 +0100
Received: from ULM-DC01.bmw-carit.intra ([fe80::d6c:bfcc:5f:52a5]) by
	ULM-DC01.bmw-carit.intra ([fe80::d6c:bfcc:5f:52a5%13]) with mapi id
	14.03.0123.003; Fri, 11 Mar 2016 16:53:58 +0100
X-CTCH-RefID: str=0001.0A0C0203.56E2EA17.005B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Helio Chissini De Castro <Helio.Castro@bmw-carit.de>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] gcc: Fix the license on GNU OpenMP
Thread-Index: AQHRe6HQFhaaYbwdx0S851F6NE1r8J9UUEUAgAAUfzw=
Date: Fri, 11 Mar 2016 15:53:57 +0000
Message-ID: <95245B46D926B348AEB132E99037C59B36A9FE3A@ULM-DC01.bmw-carit.intra>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>,
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.20.205]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 15:54:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_95245B46D926B348AEB132E99037C59B36A9FE3AULMDC01bmwcarit_"

--_000_95245B46D926B348AEB132E99037C59B36A9FE3AULMDC01bmwcarit_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Ross

The previous lines existed just because the unique statement on thelibgomp =
that was GPLv3 alone

Since all the packages now share exactly the same license, there's no reaso=
n anymore to specify each one of then, unless wanted to keep the names to k=
now which packages are related to this recipe.

[]'s

--
BMW Car IT GmbH
Helio Chissini de Castro
Systems Integrator Engineer
Lise-Meitner-Str.14
89081 Ulm
Mobil: +49 176 25435150
Mail: helio.castro@bmw-carit.de
Web: http://www.bmw-carit.de

--
BMW Car IT GmbH
Helio Chissini de Castro
Systems Integrator Engineer
Lise-Meitner-Str.14
89081 Ulm
Mobil: +49 176 25435150
Mail: helio.castro@bmw-carit.de
Web: http://www.bmw-carit.de
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Friday, March 11, 2016 4:39 PM
To: Helio Chissini De Castro
Cc: OE-core
Subject: Re: [OE-core] [PATCH] gcc: Fix the license on GNU OpenMP


On 11 March 2016 at 14:24, <helio.castro@bmw-carit.de<mailto:helio.castro@b=
mw-carit.de>> wrote:
-# Most libraries are licensed with the exception, but
-# one library is really GPLv3.
-#
-LICENSE_${PN}-dbg =3D "GPL-3.0-with-GCC-exception & GPLv3"
-LICENSE_libstdc++ =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libstdc++-precompile-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libstdc++-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libstdc++-staticdev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libg2c =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libg2c-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libssp =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libssp-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libssp-staticdev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libgfortran =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libgfortran-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libgfortran-staticdev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libmudflap =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libmudflap-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libmudflap-staticdev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libquadmath =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libquadmath-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libquadmath-staticdev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libatomic =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libatomic-dev =3D "GPL-3.0-with-GCC-exception"
-LICENSE_libatomic-staticdev =3D "GPL-3.0-with-GCC-exception"
-
-LICENSE_libgomp =3D "GPLv3"
-LICENSE_libgomp-dev =3D "GPLv3"
-LICENSE_libgomp-staticdev =3D "GPLv3"
+LICENSE_${PN}-dbg =3D "GPL-3.0-with-GCC-exception"
+LICENSE_${PN} =3D "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-dev =3D "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-staticdev =3D "GPL-3.0-with-GCC-exception"

This patch doesn't look right...

Ross

--_000_95245B46D926B348AEB132E99037C59B36A9FE3AULMDC01bmwcarit_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hello Ross<br>
<br>
The previous lines existed just because the unique statement on thelibgomp =
that was GPLv3 alone<br>
<br>
Since all the packages now share exactly the same license, there's no reaso=
n anymore to specify each one of then, unless wanted to keep the names to k=
now which packages are related to this recipe.<br>
<div><br>
[]'s<br>
<br>
<div style=3D"font-family:Tahoma; font-size:13px"><font size=3D"2"><span st=
yle=3D"font-size:10pt">--
<br>
BMW Car IT GmbH<br>
Helio Chissini de Castro<br>
Systems Integrator Engineer<br>
Lise-Meitner-Str.14<br>
89081 Ulm<br>
Mobil: &#43;49 176 25435150<br>
Mail: helio.castro@bmw-carit.de<br>
Web: <a href=3D"http://www.bmw-carit.de" target=3D"_blank">http://www.bmw-c=
arit.de</a></span></font></div>
</div>
<div><br>
<div style=3D"font-family:Tahoma; font-size:13px"><font size=3D"2"><span st=
yle=3D"font-size:10pt">--
<br>
BMW Car IT GmbH<br>
Helio Chissini de Castro<br>
Systems Integrator Engineer<br>
Lise-Meitner-Str.14<br>
89081 Ulm<br>
Mobil: &#43;49 176 25435150<br>
Mail: helio.castro@bmw-carit.de<br>
Web: <a href=3D"http://www.bmw-carit.de" target=3D"_blank">http://www.bmw-c=
arit.de</a></span></font></div>
</div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF720287"><font face=3D"Tahoma" co=
lor=3D"#000000" size=3D"2"><b>From:</b> Burton, Ross [ross.burton@intel.com=
]<br>
<b>Sent:</b> Friday, March 11, 2016 4:39 PM<br>
<b>To:</b> Helio Chissini De Castro<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] gcc: Fix the license on GNU OpenMP<br=
>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 11 March 2016 at 14:24, <span dir=3D"ltr">&lt=
;<a href=3D"mailto:helio.castro@bmw-carit.de" target=3D"_blank">helio.castr=
o@bmw-carit.de</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div id=3D":aon" class=3D"a3s" style=3D"overflow:hidden">-# Most libraries =
are licensed with the exception, but<br>
-# one library is really GPLv3.<br>
-#<br>
-LICENSE_${PN}-dbg =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption &amp; GPLv3&quot;<br>
-LICENSE_libstdc&#43;&#43; =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</s=
pan>-exception&quot;<br>
-LICENSE_libstdc&#43;&#43;-precompile-dev =3D &quot;GPL-3.0-with-<span clas=
s=3D"il">GCC</span>-exception&quot;<br>
-LICENSE_libstdc&#43;&#43;-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GC=
C</span>-exception&quot;<br>
-LICENSE_libstdc&#43;&#43;-staticdev =3D &quot;GPL-3.0-with-<span class=3D"=
il">GCC</span>-exception&quot;<br>
-LICENSE_libg2c =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-except=
ion&quot;<br>
-LICENSE_libg2c-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-ex=
ception&quot;<br>
-LICENSE_libssp =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-except=
ion&quot;<br>
-LICENSE_libssp-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-ex=
ception&quot;<br>
-LICENSE_libssp-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</sp=
an>-exception&quot;<br>
-LICENSE_libgfortran =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-e=
xception&quot;<br>
-LICENSE_libgfortran-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</spa=
n>-exception&quot;<br>
-LICENSE_libgfortran-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GC=
C</span>-exception&quot;<br>
-LICENSE_libmudflap =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-ex=
ception&quot;<br>
-LICENSE_libmudflap-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span=
>-exception&quot;<br>
-LICENSE_libmudflap-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC=
</span>-exception&quot;<br>
-LICENSE_libquadmath =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-e=
xception&quot;<br>
-LICENSE_libquadmath-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</spa=
n>-exception&quot;<br>
-LICENSE_libquadmath-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GC=
C</span>-exception&quot;<br>
-LICENSE_libatomic =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption&quot;<br>
-LICENSE_libatomic-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>=
-exception&quot;<br>
-LICENSE_libatomic-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC<=
/span>-exception&quot;<br>
-<br>
-LICENSE_libgomp =3D &quot;GPLv3&quot;<br>
-LICENSE_libgomp-dev =3D &quot;GPLv3&quot;<br>
-LICENSE_libgomp-staticdev =3D &quot;GPLv3&quot;<br>
&#43;LICENSE_${PN}-dbg =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>=
-exception&quot;<br>
&#43;LICENSE_${PN} =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption&quot;<br>
&#43;LICENSE_${PN}-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>=
-exception&quot;<br>
&#43;LICENSE_${PN}-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC<=
/span>-exception&quot;<br>
</div>
</blockquote>
</div>
<br>
This patch doesn't look right...</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_95245B46D926B348AEB132E99037C59B36A9FE3AULMDC01bmwcarit_--
