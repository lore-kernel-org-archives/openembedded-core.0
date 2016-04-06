Return-Path: <markus.schuetterle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 548267017C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 12:47:45 +0000 (UTC)
MIME-Version: 1.0
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 06 Apr 2016 05:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; 
	d="p7s'?scan'208,217,223";a="952881709"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
	by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2016 05:47:44 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
	irsmsx105.ger.corp.intel.com (163.33.3.28) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 6 Apr 2016 13:47:43 +0100
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.137]) by
	irsmsx111.ger.corp.intel.com ([169.254.2.127]) with mapi id
	14.03.0248.002; Wed, 6 Apr 2016 13:47:43 +0100
From: "Schuetterle, Markus" <markus.schuetterle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-yocto.bbclass: Fix SRCARCH path for x86 using
	DEFCONFIG
Thread-Index: AdGQAoAa5UTdMOwiQOiNDaDmMxeMew==
Date: Wed, 6 Apr 2016 12:47:42 +0000
Message-ID: <7D75864EFEE0E541A47E43940B77BA6950AF323D@IRSMSX107.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: [PATCH] kernel-yocto.bbclass: Fix SRCARCH path for x86 using DEFCONFIG
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
X-List-Received-Date: Wed, 06 Apr 2016 12:47:47 -0000
X-Groupsio-MsgNum: 80557
Content-Type: multipart/mixed; boundary="===============2900544995459843928=="

--===============2900544995459843928==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_00B1_01D19013.45A95A40"

------=_NextPart_000_00B1_01D19013.45A95A40
Content-Type: multipart/mixed;
	boundary="----=_NextPart_001_00B2_01D19013.45A95A40"

------=_NextPart_001_00B2_01D19013.45A95A40
Content-Type: multipart/alternative;
	boundary="----=_NextPart_002_00B3_01D19013.45A95A40"

------=_NextPart_002_00B3_01D19013.45A95A40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

Intel Deutschland GmbH
Registered Address: Am Campeon 10-12, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de
Managing Directors: Christin Eisenschmid, Christian Lamprechter
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

------=_NextPart_002_00B3_01D19013.45A95A40
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_002_00B3_01D19013.45A95A40--

------=_NextPart_001_00B2_01D19013.45A95A40
Content-Type: application/octet-stream;
	name="0001-kernel-yocto.bbclass-Fix-SRCARCH-path-for-x86-using-.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-kernel-yocto.bbclass-Fix-SRCARCH-path-for-x86-using-.patch"

From 155e192495663cd9e8e7bc57dbefc4bd1bfed130 Mon Sep 17 00:00:00 2001
From: Markus Schuetterle <markus.schuetterle@intel.com>
Date: Tue, 5 Apr 2016 15:03:50 +0200
Subject: [openembedded-core][PATCH] kernel-yocto.bbclass: Fix SRCARCH path =
for
 x86 using DEFCONFIG

For architecture x86 (i386 or x86_64)
the kernel source folder is always:	arch/x86/...
Therfore a variable $(SRCARCH) is introduced instead of
using $(ARCH).

But there is another issue:
Comparing the "defconfig" from WORKDIR with the "<arch>_defconfig"
from the source tree, will always fail.
Yocto specify the "defconfig" as a copy of ".config",
where a Linux Kernel *_defconfig it's not.

Signed-off-by: Markus Schuetterle <markus.schuetterle@intel.com>
---
 meta/classes/kernel-yocto.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass
index f86b3ef..8ba9e7d 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -79,6 +79,14 @@ do_kernel_metadata() {
 		machine_srcrev=3D"${SRCREV}"
 	fi
=20
+	# When ARCH is set to i386 or x86_64, we need to map ARCH to the real nam=
e of src
+	# dir (x86) under arch/ of kenrel tree, so that we can find correct sourc=
e to copy.
+	if [ "${ARCH}" =3D "i386" ] || [ "${ARCH}" =3D "x86_64" ]; then
+		KERNEL_SRCARCH=3Dx86
+	else
+		KERNEL_SRCARCH=3D${ARCH}
+	fi
+
 	# In a similar manner to the kernel itself:
 	#
 	#   defconfig: $(obj)/conf
@@ -98,16 +106,16 @@ do_kernel_metadata() {
 	# precendence.
 	#
 	if [ -n "${KBUILD_DEFCONFIG}" ]; then
-		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
+		if [ -f "${S}/arch/${KERNEL_SRCARCH}/configs/${KBUILD_DEFCONFIG}" ]; the=
n
 			if [ -f "${WORKDIR}/defconfig" ]; then
 				# If the two defconfig's are different, warn that we didn't overwrite =
the
 				# one already placed in WORKDIR by the fetcher.
-				cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONF=
IG}"
+				cmp "${WORKDIR}/defconfig" "${S}/arch/${KERNEL_SRCARCH}/configs/${KBUI=
LD_DEFCONFIG}"
 				if [ $? -ne 0 ]; then
 					bbwarn "defconfig detected in WORKDIR. ${KBUILD_DEFCONFIG} skipped"
 				fi
 			else
-				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconf=
ig
+				cp -f ${S}/arch/${KERNEL_SRCARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDI=
R}/defconfig
 				sccs=3D"${WORKDIR}/defconfig"
 			fi
 		else
--=20
1.8.3.1


------=_NextPart_001_00B2_01D19013.45A95A40--

------=_NextPart_000_00B1_01D19013.45A95A40
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
BAQDAgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwNgYDVR0lBC8wLQYIKwYBBQUHAwQGCisGAQQBgjcK
AwQGCisGAQQBgjcKAwwGCSsGAQQBgjcVBTAXBgNVHSAEEDAOMAwGCiqGSIb4TQEFAWkwSQYDVR0f
BEIwQDA+oDygOoY4aHR0cDovL2NybC50cnVzdC1wcm92aWRlci5jb20vQWRkVHJ1c3RFeHRlcm5h
bENBUm9vdC5jcmwwOgYIKwYBBQUHAQEELjAsMCoGCCsGAQUFBzABhh5odHRwOi8vb2NzcC50cnVz
dC1wcm92aWRlci5jb20wNQYDVR0eBC4wLKAqMAuBCWludGVsLmNvbTAboBkGCisGAQQBgjcUAgOg
CwwJaW50ZWwuY29tMA0GCSqGSIb3DQEBBQUAA4IBAQApws2j/ZKjUmeiLwbtblDoVI+rV+bIpbex
IN/Vqa/IeSMSB3bmfswpEcYSZHHGjOI8qlyZt9dhT4nSDnrScKjmA8XvxZ3tmbNyYJybVQUV8jF/
DpADX1tGlMLxswxpJISXzLf0+DBr4cQ2ag9mwzrcN1nrOIOc+pxJtx9izyp3+bl3baulerkgZVS1
fotftH+FJLD/ex8BOcEuCIm2KVXJjs4YaZgoIBLYjTiK29JLVa15xdO305kPI1uXsu05sGuAwuFm
Sklb6k5H1/eHlUbZLm4qQDtOH00L0ShJx3BAIAjD5RYptJDQiyPZQUvt8cq+apYpVMv3yxHO8jex
40LgMIIFjjCCBHagAwIBAgITMwAAcS4ysQTDFLSnbgAAAABxLjANBgkqhkiG9w0BAQUFADB5MQsw
CQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFDASBgNVBAcTC1NhbnRhIENsYXJhMRowGAYDVQQKExFJ
bnRlbCBDb3Jwb3JhdGlvbjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBD
QSA0QTAeFw0xNTA2MzAwNTU2MjRaFw0xODA2MTQwNTU2MjRaMEsxHDAaBgNVBAMTE1NjaHVldHRl
cmxlLCBNYXJrdXMxKzApBgkqhkiG9w0BCQEWHG1hcmt1cy5zY2h1ZXR0ZXJsZUBpbnRlbC5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQChDkURUNwkSOQmkAga8R8m1DfDCqEFukqn
J4cmLuxQ9A8fcLj84hRymAiWDsTZEjDzJGOvIr3BAVGOOLppTRUQbMYmXOEORds/MdIfbr+Zi+Ri
fvtzKaw7f1c7/i/OjcouER3kaGEyh7gHzTy4aVgWKYxXzhT56xVfK6SKqrfjIsot4uDE8fFO8Ivu
vuQIdYEUZQ46WOoHLBSjvolHuXZ9Squ2VKIxPmk6m9Lrfxvy/UK5zWGbKMX/chBZiGkJ14tQGK9n
Yggg0hwb4B16dKCuXG9M+B1RR+FGOedGWw7de1TEKgtPFyQ6o1yXWJxZameHUx+3/oFXR8hxN3L9
v4FhAgMBAAGjggI7MIICNzALBgNVHQ8EBAMCB4AwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUI
hsOMdYSZ5VGD/YEohY6fU4KRwAlngd69OZXwQwIBZAIBCDAdBgNVHQ4EFgQUYww3D1We7MtYxx0t
UThXWJE7lYUwHwYDVR0jBBgwFoAUHmkqtNwo/kcYTiELP7ysES/wmPUwZQYDVR0fBF4wXDBaoFig
VoZUaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5hbCUy
MEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3JsMIGfBggrBgEFBQcBAQSBkjCBjzBpBggrBgEF
BQcwAoZdaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwl
MjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3J0MCIGCCsGAQUFBzABhhZo
dHRwOi8vb2NzcC5pbnRlbC5jb20vMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkG
CSsGAQQBgjcVCgQcMBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBVBgNVHREETjBMoCwGCisG
AQQBgjcUAgOgHgwcbWFya3VzLnNjaHVldHRlcmxlQGludGVsLmNvbYEcbWFya3VzLnNjaHVldHRl
cmxlQGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAdy+Vl8U4UGjFhAQjalpRzBPh1TmVOLBF
FRCsGKMztmjqdhM25pfJDiw50GKKJy+gLT8i1x7sbMrVOmo28AsQVEQ7345kE9boPSe0nbXumDYt
vwHfmQM58apMr8V0k9EX0vUq7oCge02vX7gx0poLg9BSAfMhejcvrciPELFcar39Rhfm8w/S8xHY
JrsOCg7KoHHfia7faMu/YZdbDeB/E874oV/Pw48OHcW6okIt3ADSXQ0O4eMqZISYH4pxmgk4fxCm
daN/3j1vibnQR6B290LwmcV/G3g66dyOsTxKPujwlBrs0wBaT2r4OAAokdpNaQjIekyqGnSFP/sj
Z5hWVzCCBdUwggS9oAMCAQICEzMAAHEvPlSduuIqAgEAAAAAcS8wDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEEwHhcNMTUwNjMwMDYwMTEyWhcNMTgwNjE0MDYwMTEyWjBLMRwwGgYDVQQDExNTY2h1ZXR0
ZXJsZSwgTWFya3VzMSswKQYJKoZIhvcNAQkBFhxtYXJrdXMuc2NodWV0dGVybGVAaW50ZWwuY29t
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2arlHJTYuJ5DP8/3V+0Xjx1oIlAdLYu4
WqIUlsDuqrH6Z1uuuUjk6IV/YTPGwF5+lgEkjFE1nVnAthc4ddAERylhH6bORN1mUdeIc3wNWmdn
JX8SjbUmP7ZMod4fNAMPvTYNWc1ZV9HCWecuRa3EkR0jnJ4VndaCZoJGWvzBCovjhZDwJyEnriZc
KDd/DD2PiRjbLuLpE5kA52gMGV8LyIQOhLth1ojhh3Iky+vGjH0yfO4YPPat1NPoxwVVL+tte4yx
bBmA403QRO2iJ2AGOIaUkhdPL3o1C3E+ytsFGOrNIn9XAJBr5Jrw+yS/H6mBVu+tyUzxKf3FHi8T
GSGiTwIDAQABo4ICgjCCAn4wCwYDVR0PBAQDAgQwMD0GCSsGAQQBgjcVBwQwMC4GJisGAQQBgjcV
CIbDjHWEmeVRg/2BKIWOn1OCkcAJZ4S52UGHhP9OAgFkAgENMEQGCSqGSIb3DQEJDwQ3MDUwDgYI
KoZIhvcNAwICAgCAMA4GCCqGSIb3DQMEAgIAgDAHBgUrDgMCBzAKBggqhkiG9w0DBzAdBgNVHQ4E
FgQUuVpCbDbNEaMAJMD1gy2ETdQF++kwHwYDVR0jBBgwFoAUHmkqtNwo/kcYTiELP7ysES/wmPUw
ZQYDVR0fBF4wXDBaoFigVoZUaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50
ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3JsMIGfBggrBgEFBQcB
AQSBkjCBjzBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0
aWZpY2F0ZXMvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3J0
MCIGCCsGAQUFBzABhhZodHRwOi8vb2NzcC5pbnRlbC5jb20vMB8GA1UdJQQYMBYGCCsGAQUFBwME
BgorBgEEAYI3CgMEMCkGCSsGAQQBgjcVCgQcMBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDBDBV
BgNVHREETjBMoCwGCisGAQQBgjcUAgOgHgwcbWFya3VzLnNjaHVldHRlcmxlQGludGVsLmNvbYEc
bWFya3VzLnNjaHVldHRlcmxlQGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEALI/nFM5n6sSV
h7sdBUggOec/bj5GAsCQTSvP4tidmc3H+mxXfj56Af3JLwBqQa2AKDBzGUlfgOenXoKcXi1GyoQ9
Yw8HRrXmPf6uH7w0Bz8BleTdRw9Rgcg6stPIaeoxx2KvAG2X4XAt6PFfMAHX7PM37jCap54px3Ba
mBr0yT09kFrasPMmXWjQW7BqHx1D8wGwmDb6LWK6ZFrtAz3/WpSuBmzHkaVLRJgg4tGz8ygzb17i
MlX1kSeaKsQp6/YWlb3wodwvgu/0lPtID0kemrAhXT82mM1sI8VtrKH1aPLsxLE3xCWi/vSMP7mM
TRG4sue1MV6M5p/vhBZr+bBXeDGCA/kwggP1AgEBMIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQI
EwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSsw
KQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBAhMzAABxLjKxBMMUtKdu
AAAAAHEuMAkGBSsOAwIaBQCgggI9MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTE2MDQwNjEyNDc0MVowIwYJKoZIhvcNAQkEMRYEFP/BbcAva1U6K0KEDQQHyVm/8dFp
MIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0D
BzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMAsG
CWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIGhBgkrBgEEAYI3EAQxgZMwgZAw
eTELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UE
ChMRSW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vp
bmcgQ0EgNEECEzMAAHEvPlSduuIqAgEAAAAAcS8wgaMGCyqGSIb3DQEJEAILMYGToIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAABxLz5UnbriKgIBAAAAAHEvMA0GCSqGSIb3DQEBAQUABIIBAFxPI7VGuO+4CGUiNHgZ
hlFmnJEH6NjGJv9UZOnf/+P9MTXYxGX9EyrLMFWoPPj1nM9wqDVqMl9RFo8mDf2AFSnRduG4BL46
9FFrKabhQCzpPda1MvJfUPScJ10tSp3McnoZen0gdNTbrvES0BLd5KYVES1vX0793j8GelkB6Ugd
QCDqYdmRBtEplndy7OOTNa/b/aLp5U14bHmsPEAJW86o5T4NsbDfYqO+PLi1l2MVs4k02FXaPaKO
0BmITZyshxiEAEPq+SyRuM2j/xEGhsVq/HDXHu11JcRgtSQaVB6EYV/Ynxd2NthVdewDlgUI/xDE
EBC4TjztOpgr/rPpC2kAAAAAAAA=

------=_NextPart_000_00B1_01D19013.45A95A40--

--===============2900544995459843928==--
