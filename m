Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E934C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 07:19:08 +0000 (UTC)
Received: from enterprise01.smtp.diehl.com (enterprise01.smtp.diehl.com [193.201.238.219])
 by mx.groups.io with SMTP id smtpd.web10.17842.1709795945053080605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 23:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=ETa8wOtE;
 spf=pass (domain: diehl.com, ip: 193.201.238.219, mailfrom: prvs=7890cf053=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1709795945; x=1741331945;
  h=from:to:cc:subject:message-id:mime-version:date;
  bh=4onwl1Z9TYP2gOtqxJreG6KfuB+Q02+qxxUYaD+GcC8=;
  b=ETa8wOtEL/PxQhA+P4Z2x0Yd9E6wIgZFo2bzdXSTqgDaurmjJoF9WypD
   dfPTtJHA0FMnyTkfsKt2bPCw0NeydDcQm3pDpYupQvMEZ90SSKxzXJ1Wc
   nmtgRPfzPSyXton9l12hioePEDfKGwjUotHWvIhTLnnv37bsx+zxZNSEg
   jwbpnIF+uUBeypv+ehLAX+lbMlGcasFpzxaSuHcXagmnTngYt3mMfsXqP
   wWk9eb8gkNYZYE8xjECwqikVi+z5q2LXeC45fN1uvrQx76HpP5jlqV2oO
   ZRdcqizvg5o3yAAzzZsW5PyrOQaYDXbzruydJ+UJ3iUXES//+fSETJcJr
   A==;
X-CSE-ConnectionGUID: Zh3xpbV9QZShDNHFpJQVvg==
X-CSE-MsgGUID: a+xD6twQRJmeLX08ZZ3Vkg==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:oBV1Ja5uAm9Z2tpaiYVbowxRtOfHchMFZxGqfqrLsTDasI4Tp2RHj
 j5GCjjCY6DUfSroO4IlK4qrthNR58eRi5Q2eLZe3WpoTndH79KaHrx1RW+tNC7Nf8CTQhlts
 ZpDZoHLc8poR3WH9k78Oea89HNw2/iBS+PyBLOeZ3kqTFA9ECl42Eg4xLdg3dY42Ye0Wl/d0
 T+eT6MzHXf8s9IjGjlFs/LrRGpTlPTupCtK+Rs9aOFQ+lPfmnkRSpkYIOa6NX+/XooRHtm8A
 e3ZyOnRwo+ixPteNz/fuu29KiU3ar7OIRDczT1VVrm5xBRDqyw2lK08Mb0Xc0MQlzbMn+d3j
 t5XscTtCkZxVpEg49/xICS0aQkle/UuxZfHPWSn44vU0FLZNXftzvVqSkoxOMoA+ecwWQlyG
 YcjxEMwgmqr3KTuqI+Gd9SApvjPDeG7Yo4S6ns8wWrSAPp3EZrPHK+UvY5UjTpujMkSTafQb
 JZAOWtkYSqbbkwUMD/7Kn6ccMSA2yOjKW0I8Dp5gYJtvgA/GSQoiOCF3OL9I4HMHYMN2B/A+
 goqxkyhajkCLtuT1DGZxXylg+7LjEvTVZkbfFGC3qcCbGa7mCpLVnX6aXPh+aPl0hXmBIoEQ
 6Ap0nFGQZYapRXDoubVD0XQTE6s5nY0R9dWGusm3wCBooK8D9GxXzVsopZpMbTKheduLdAY/
 gbhc+DBXFSDhIaopUe1rd94m98Q1R89dgfubQdcJecMDkKKTIsb1nojRf47eEK5Y0Gc9ZgdD
 FlmoQBn74j/g/Ln2I2J/QvXmziS96H7dQ4ZwCX5RkCc0B12MdvNi4yAsTA37N5MKZSSQUbZ5
 j4PnNKGquwPAJGJ0ieKRY3hHpnwv7DVanuF0Rg2RMNJGzeFohZPeahc7Td/PwFuKdoJYzvgZ
 kP7tQJc5JsVN3yvBUNyS9LoV5t2lPe7fTjjfvmXfvYQfodITi2C8QVePR6i7TvTk0d5xMnTP
 r/eK65AF00yDrxqyjezTeoR3bIngys53277QZHg0w/h1qKTYnOQQ7oJPFaCKOcj48usqUPb+
 spYKs6i0xhZX/DieC7R8J5VIV1iBXM7H5Htt81ecKifKwdqE2IsTvjK2ps+do1pmrlYkuPF5
 De2XUow4FH/n3zcNQSDbDZ/Yb7jVpVyhW02PCApIFus33U5J42o6c8im4Afcbw1/+N8laQyQ
 /gIe8HGCfNVUlwr5gggUHU0l6Q6HDzDuO5EF3PNjOQXF3K4ezH0xw==
IronPort-HdrOrdr: A9a23:V5pLq6Em7bLDkSx5pLqEMMeALOsnbusQ8zAXPiFKOHlom6mj/a
 2TdZsguSMc5Ax/ZJhYo6HnBEDYewK6yXcX2/hyAV7BZmnbUQKTRelfBO3ZrQEIcBeOldK1u5
 0AT0FIMqyVMbErt63HCdGDYqsdKQO8gduVbDrlvg5QpN1RGttdBtlCe3qm+iIffng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AV6w54WrQe4TLM9YmwXpXDP7mUfIlKW3FxkmBGn2?=
 =?us-ascii?q?DCUpPaJONa2au5qwxxg=3D=3D?=
X-Talos-MUID: 9a23:bI+Iegu/i+8M1iVGFM2njXJyGJl0/J2UKkUAtaVe6/u2bhJzNGLI
X-IronPort-AV: E=Sophos;i="6.06,210,1705359600"; 
   d="p7s'?scan'208";a="81474173"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: 
	"christian.taedcke-oss@weidmueller.com" <christian.taedcke-oss@weidmueller.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: "a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>, 
	Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: RE: [EXT] [OE-core][PATCH v2] kernel-fitImage: only include valid
 compatible line
Message-ID: <0375cd0c8ba2408a8c1493c92577f4bb@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----96623B4389FD0E980C860A0FF7F5990A"
Date: Thu,  7 Mar 2024 08:19:02 +0100 (CET)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 07:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196775

This is an S/MIME signed message

------96623B4389FD0E980C860A0FF7F5990A
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

-----Original Message-----
> From: christian.taedcke-oss@weidmueller.com
<christian.taedcke-oss@weidmueller.com>=20
> Sent: Wednesday, March 6, 2024 5:42 PM
> To: openembedded-core@lists.openembedded.org
> Cc: a.fatoum@pengutronix.de; Denis OSTERLAND-HEIM
<denis.osterland@diehl.com>; Christian Taedcke
<christian.taedcke@weidmueller.com>
> Subject: [EXT] [OE-core][PATCH v2] kernel-fitImage: only include valid
compatible line
>=20
> [EXTERNAL EMAIL]
> =20
>=20
> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>=20
> Without this commit the configuration node includes the compatible =
line
'compatible =3D [00];' if EXTERNAL_KERNEL_DEVICETREE is not defined, =
i.e. if
PREFERRED_PROVIDER_virtual/dtb is not used.
Right.
This should definetly should check for kernel path, too.
This patch adds the savety net.
To get it working in all cases (external, internal,
KERNEL_DTBVENDORED=3DTrue/False),
I guess the compatible string have to be extracted in =
fitimage_assemble()
and passed to fitimage_emit_section_config().
But that=B4s a story for a nother patch ;-)

> This prevents u-boot from using this configuration and it prints the
message "Could not find configuration node".
>=20
> An additional check also ensures that the written compatible line =
never
contains an empty compatible.
Ack

>=20
> The functionality to add the compatible line was added in commit
> f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
section").
Fixes: f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
section")

>=20
> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
Reviewed-by: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>

Regards, Denis
> ---
>  meta/classes-recipe/kernel-fitimage.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
b/meta/classes-recipe/kernel-fitimage.bbclass
> index 7e30a5d47e..4b74ddc201 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -421,6 +421,7 @@ fitimage_emit_section_config() {
>  	bootscr_line=3D""
>  	setup_line=3D""
>  	default_line=3D""
> +	compatible_line=3D""
> =20
>  	dtb_image_sect=3D$(symlink_points_below $dtb_image
"${EXTERNAL_KERNEL_DEVICETREE}")
>  	if [ -z "$dtb_image_sect" ]; then
> @@ -428,7 +429,12 @@ fitimage_emit_section_config() {
>  	fi
> =20
>  	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
> -	compatible_line=3D"compatible =3D \"$(fdtget "$dtb_path" / =
compatible |
sed 's/ /", "/g')\";"
> +	if [ -e "$dtb_path" ]; then
> +		compat=3D$(fdtget -t s "$dtb_path" / compatible | sed 's/ /",
"/g')
> +		if [ -n "$compat" ]; then
> +			compatible_line=3D"compatible =3D \"$compat\";"
> +		fi
> +	fi
> =20
>  	dtb_image=3D$(echo $dtb_image | tr '/' '_')
>  	dtb_image_sect=3D$(echo "${dtb_image_sect}" | tr '/' '_')
> --
> 2.34.1
>=20
>

------96623B4389FD0E980C860A0FF7F5990A
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIPQAYJKoZIhvcNAQcCoIIPMTCCDy0CAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggxWMIIGUTCCBDmgAwIBAgICMAAwDQYJKoZIhvcNAQELBQAwgaMx
ITAfBgNVBAMMGERpZWhsIEdyb3VwIE1haWwgUm9vdCBDQTELMAkGA1UEBhMCREUx
EjAQBgNVBAcMCU51ZXJuYmVyZzEUMBIGA1UECgwLRGllaGwgR3JvdXAxFDASBgNV
BAsMC0RpZWhsIEdyb3VwMQ8wDQYDVQQIDAZCYXllcm4xIDAeBgkqhkiG9w0BCQEW
EXg1MDktY2FAZGllaGwuY29tMB4XDTE4MDUyOTEyMzIzNVoXDTI4MDUyNjEyMzIz
NVowgZQxCzAJBgNVBAYTAkRFMQ8wDQYDVQQIDAZCYXllcm4xFDASBgNVBAoMC0Rp
ZWhsIEdyb3VwMRswGQYDVQQLDBJEaWVobCBNZXRlcmluZyBUS0gxHzAdBgNVBAMM
FkRpZWhsIE1ldGVyaW5nIE1haWwgQ0ExIDAeBgkqhkiG9w0BCQEWEXg1MDktY2FA
ZGllaGwuY29tMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtISPrKPL
Zjjh//2n9b+GXgrhijJV2knQVC0+/FS3zGl4p2fboB+Vr4YHz1uilEvhsS1oG4FV
f1u0dqdmLVxDHBPMO2K1NKKOJN/6LDDfyiZGNqDOJke6FzrmDyPXXTDtgzWZfdnD
esx63XSxprre30oJ3BxDFS+/8UpuI628SPc1N4125rHeUXG4scKFSjqRPcIOAQ2X
veGXU2dYHzq7B02NA8tssmtJNwXjyvMjOw6HGZ8SB87TrFQm6drEtM7QhI/mfpGe
nTZ4nc84n0yKuMveav8IOspYbkOXzi4JapiOUpmccNLZdIiMg5WJQ0Xt9NSp5yD5
CYKideGrWgX2wNEBpalgjZoPPQDImcWEJx88/yYZ4FwtRD3VueFqpBr4z/bxwVDr
N2a/sEqnocY9Tm2EQyHFHDCJ9JyYEXB8W0LTFcUAx+uHijwPk/oIB5EeH8UygXlX
qUqII+BUZ+q5m5sIc4eXQ10UpUEjG/ptIyO1Ee/E0kPOWzHp07pPgXCZohZb3y41
Ha2pO6rXOsOmPBK2r2++fLWz3NFyfEJCmn6FcBNi003HUEVCup1D9/9yaPHPSieN
27sjQcQ96GbOitC99p3xMnSlg4N11lGeuTXCZjIGXdZL5/dThQaxneVA+hr2X+i1
KmqnesMaSBEuBEBDmbDbakEgJFVWtVeXuk8CAwEAAaOBmzCBmDASBgNVHRMBAf8E
CDAGAQH/AgEAMAsGA1UdDwQEAwIBBjAdBgNVHQ4EFgQUn8t6NGPzWsF+oZYXxmfn
p4Ok7rIwHwYDVR0jBBgwFoAUZrrYQMMD50v/OCDMgDN7y/GT2P8wNQYDVR0fBC4w
LDAqoCigJoYkaHR0cDovL2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMA0G
CSqGSIb3DQEBCwUAA4ICAQAl6hO6b6+GseZi3EAU+zPVhxNZP5Y+YsBnjf13jCGw
nUVvPz6giwXiCd9KIC4eCqqrJLTHwZe8c/9hSk5CCd6A5XAd3YudrPDvmIwms5Ex
OREMQkygZO6/qxfXO6IhfUO4HvYQtQexzHOLuxG/KdycVwWapA4acFzBurxFQ3aG
jvPRgvWxe2Mt3K9wLrEhvGrDmS8yg4bYNyBZGgax6LRhfW4/ShInVUa0koG2Sj+H
hKpppvqDK4FNgR2dKeCPoo28P9a+K9N3wkLKx4zxaxHegij0DsJOBAVbhk+vDWDO
gedjtT09c9bsykaXFzykyQeQz7cwrTQ1gDacdcDgywMDQzZKim9O3JpyzvXnD7mb
CvclM3xp9w6jIJbeaQE7HDlA9YIL/bSRIQq8mJcXArUevLK2MX/Mb+5m3UMU+zXc
ZqmaneeZeR4bOWrmmhK6bMuce6H+i2YB1vG3BAcSfKQUzZ1m6aKSW1FvjI3SZXQD
FzRzBwC5ql7i2ugtfOLNYjOO/fvAxNppIZb3IyWN1KBAI7YgS4nx0us/NIlWpTMW
91WeUtNBCp2sgi3VTi/TUel3RZ9x3tggMUhrksGkFXz2NUL85AdPV6BqJXXXHggd
121rnduE9ocMt0MFLuDPkMaHqKNzBAcKTcmFM8KYMJ5Z7NBqGtTAgHNVmEnU8gu3
czCCBf0wggPloAMCAQICAgtcMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJE
RTEPMA0GA1UECAwGQmF5ZXJuMRQwEgYDVQQKDAtEaWVobCBHcm91cDEbMBkGA1UE
CwwSRGllaGwgTWV0ZXJpbmcgVEtIMR8wHQYDVQQDDBZEaWVobCBNZXRlcmluZyBN
YWlsIENBMSAwHgYJKoZIhvcNAQkBFhF4NTA5LWNhQGRpZWhsLmNvbTAeFw0yNDAx
MDIwOTE5MzlaFw0yNjAxMDIwOTE5MzlaMIG8MSIwIAYDVQQDDBlkZW5pcy5vc3Rl
cmxhbmRAZGllaGwuY29tMSgwJgYJKoZIhvcNAQkBFhlkZW5pcy5vc3RlcmxhbmRA
ZGllaGwuY29tMQswCQYDVQQGEwJERTEPMA0GA1UECAwGQmF5ZXJuMRwwGgYDVQQK
DBNEaWVobCBNZXRlcmluZyBUSy1IMRwwGgYDVQQLDBNEaWVobCBNZXRlcmluZyBU
Sy1IMRIwEAYDVQQHDAlOdWVybmJlcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDC4CfZJns8lrNXSkis30SmXgEPwIED4unjF8EoHzBRk5cQphMwuxVY
uFrZmkB8+FJ7kNnazQ5ddAH+7uh/w7vxEbch92iEpJxYRT6z9U7Mgw0sqGjzWQjd
sVzCSrWJrOdrHXc65BnAPOpjNDNe1dR8J9Z4a7OZU5NnQqJMT314j2gfGawGDakJ
Vph7S6v4AVmty1Fi4iRbaIamu8KJFrHQb5E1UVD5drrxW6TS0z/3YkrMQ6qA1fBB
Y271mRVq/1ByvJMgPJu7LtIyuGwGJw44RxF0JPLlqRWpsIa+z2cI48dkvwb8k0T1
rNSIj9urOmUEJGF5O8LioUy0vwmxeWF7AgMBAAGjggEtMIIBKTAfBgNVHSMEGDAW
gBSfy3o0Y/NawX6hlhfGZ+eng6TusjAJBgNVHRIEAjAAMCQGA1UdEQQdMBuBGWRl
bmlzLm9zdGVybGFuZEBkaWVobC5jb20wNQYDVR0fBC4wLDAqoCigJoYkaHR0cDov
L2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMDUGCCsGAQUFBwEBBCkwJzAl
BggrBgEFBQcwAoYZaHR0cDovL3d3dy5kaWVobC5jb20vcGtpLzAJBgNVHRMEAjAA
MB0GA1UdDgQWBBQK9y4jVYoCDsL7lhhJKjEP5wv1nTALBgNVHQ8EBAMCBaAwHQYD
VR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGCWCGSAGG+EIBAQQEAwIFoDAN
BgkqhkiG9w0BAQsFAAOCAgEAB27J8TZvm6g0rtQpv4kqYwzkXOkCt27WHHWzl/JZ
knFwWH4mvlRSrQtKkx8cPb5xqqx7k4qXC7TAef4W5YmnpWDtw7YHQAygAsCV1+i8
uBhdnBVRYkLi0Brsqb/KaDVCFDAYn82kr8OlDaVl5GazIF5rTTUFVT7QEUewf5e7
Ej4tkepIMP8DW0mM9VRdiSd+DFQQQsQR91nJZS+Gd0jT2tW6SVtZEGnsdgKi9VOw
+/u7TPynQA3m70zel9t0RySfc5bfZGqEBK/nqU2g5n/qaHKT9cMM8vTAJOmzMv4W
p7j6RF851h+6c4kH0UsUR9LdbXsKS0KsKTmjPbmbuMAWSEafskq5lJdhIybBnGcp
FwOkXw6yLHhvmBQ27hVolbrAgLprlLBm8qLq0G3dPHlLwgnNlD6RAcjaVLOcqH3Q
HWHbKlVg310S75cll1rM+GAudWdsHWxOUbK7R0lwJf/E+FAXciAsExWzCQarpSFI
AYJjvnsYTiSWas6b5L/rKtyeWIz5wJ3ovxFaMglCtGNGh3sqKwVgb0PeGJ/hfXkV
Z3i06A/GFOMDvvZ4kI2OL2wwUftkvi8ID5g2nbX/WQh9y6zhlXtiOlA1IplU+PU3
OHrFL4SBW0X7j1l+9Jl9kGy/ukAr+9nWZ55nUoV/L9C1GLrAO5KF/fDpO2b7lidQ
mWUxggKuMIICqgIBATCBmzCBlDELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJheWVy
bjEUMBIGA1UECgwLRGllaGwgR3JvdXAxGzAZBgNVBAsMEkRpZWhsIE1ldGVyaW5n
IFRLSDEfMB0GA1UEAwwWRGllaGwgTWV0ZXJpbmcgTWFpbCBDQTEgMB4GCSqGSIb3
DQEJARYReDUwOS1jYUBkaWVobC5jb20CAgtcMA0GCWCGSAFlAwQCAQUAoIHkMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDMwNzA3
MTkwMlowLwYJKoZIhvcNAQkEMSIEIHCYN00K35WEur3gfseutNln7zdOuildi2jm
Czo3E4iNMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBALPHDDqczwucTAJgNPIaUb1sVpkGCybiIHHXmzEnbpSuBY9a9v3ZSne+7LWJ
Vut3b9T7couiyzdjS6RXukaMcN8WMxwib85Nn143LTKcwk+geuWK2JMLdt1dX53V
25SXcldfTO5qiJZvQ6j2i3a6kLMWQm6y4JDcF/dzVa9YaItKdE9M/2m4w2opY89E
fRlD0XrJlNPnT+5Gaa0oklQ0H5v5Zt4rVNvqUq49Lui1P2gmGJtajPSfXBvhiH4K
kvrkZt+iyJnElJ/ZilAPdqqNso2TQPoT2ppqFfnj9kVlG1LrtMRKj+SZlWFFm0kX
GfWiHj1lU8gzZGrEfl8oLhVSkuQ=

------96623B4389FD0E980C860A0FF7F5990A--


