Subject: #include[yocto] [meta-mingw] Build win sdk with qt compilation errors.
To: openembedded-core@lists.openembedded.org
From: "shuai cao" <blithe201588@gmail.com>
X-Originating-Location: Hefei, Anhui, CN (223.244.82.16)
X-Originating-Platform: Windows Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Dec 2020 02:04:30 -0800
Message-ID: <vpti.1606817070741575977.Dz11@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8tHwV5ElG7N8GIMnG7OS"

--8tHwV5ElG7N8GIMnG7OS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi , Everyone
I'm generating win sdk with yocto and I get nativesdk-qtbase compilation e=
rrors.

tmp-glibc-glibc/work/x86_64- nativesdk-mingw32-niic_sdk- mingw32/nativesdk=
-qtbase/5.11. 3+gitAUTOINC+08de243eaa-r0/ git/qmake/library/ioutils.cpp: 20=
8:19: error: cannot convert 'LPWSTR' {aka 'wchar_t*'} to 'LPSTR' {aka 'char=
*'}
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(LP=
WSTR)&string,
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~=
~~~~~~~~~~~~
Makefile:211: recipe for target 'ioutils.o' failed

I need to generate a sdk with a qt environment.
Can you tell me how to handle this problem?

Thanks.

--8tHwV5ElG7N8GIMnG7OS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Hi ,</span><span style=3D"color: #222222; font-family: Ar=
ial, Helvetica, sans-serif; font-size: small;">Everyone</span><span style=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;"><br />I'm generating win sdk with yocto and I get nativesdk-qtbase =
compilation errors.</span><br />
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">tmp-glibc-glibc/work/x86_64-<wbr />nativesdk-mingw32-niic=
_sdk-<wbr />mingw32/nativesdk-qtbase/5.11.<wbr />3+gitAUTOINC+08de243eaa-r0=
/<wbr />git/qmake/library/ioutils.cpp:<wbr />208:19: error: cannot convert =
'LPWSTR' {aka 'wchar_t*'} to 'LPSTR' {aka 'char*'}<br />| &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(LPWSTR)&amp;string,<br=
 />| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^=
~~~~~~~~~~~~~~</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Makefile:211: recipe for target 'ioutils.o' failed</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">I need to generate a sdk with a qt environment.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Can you tell me how to handle this problem?&nbsp;&nbsp;</=
div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; Thanks.</div>

--8tHwV5ElG7N8GIMnG7OS--
