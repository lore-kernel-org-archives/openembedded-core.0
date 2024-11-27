Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973DDD609AA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 07:34:58 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web10.66794.1732692896184581737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 23:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=BvbeugdB;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=054070342=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1732692896; x=1764228896;
  h=from:to:subject:date:message-id:mime-version;
  bh=2cRB/r3bwJJBex/VZm16Uc0BhzM1VG0vd1U9X27H7O8=;
  b=BvbeugdBXp+zGWL13j213/wjL7k9nSw1s/D4MjfcwDKNQ3PGFu0Ta4zK
   +ZePhLYPx8QsO9kRjXJmvah1TJ4yAgxj1IBArD9P7GXixQ4cB5pk7uwim
   GYNk4jJRbdxz0xBZbUKrNkGnmAt8qR4l/6G4I7a2U3+OSnKxxSzvVK/OB
   6b/oQAB4VsBXOvq2U2/k6Te6nyEGg89woscWjIKc205ZHek91YrzJXTNN
   sjD6kbJH8QwzMAWGZYlN2C1AamjDfr8AeN7Pn0Pj07kmJ42Gorw3FesjD
   h5XKocFOyiCAPGTotaDwUDrO61OqhlWgQDcWIyuQzfYYCFKwG7GUgs8VA
   g==;
X-CSE-ConnectionGUID: F3d6wxYGSMODudSiLtIkMg==
X-CSE-MsgGUID: ST+vSOt2RGarvcU6voLi0A==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:aAHrY6MDB0agNYbvrR2bl8FynXyQoLVcMsEvi/8bNHDolHp+jmZWi
 jtAB3bOJ7/RMSHyZpovP9PnsQ9E7KZh/KYgFVsx+Dd1EGkiRaHtWY/Idh/7MXvMJJzPQRw3t
 sxGNdKZcJFtQiSN/hr8O+Ht9iMjjq+FTbT3BeOfYi4uTwI/F3lxhR47w7A3jtc33bBVbyuEo
 cv2osbWJF6i3XlsMWkPtOeYqRxptejvoj5wUnkWPJin63eFxiFFZH5mGYmxM2fgEM4THeOrX
 KDPzby5+iXS+BJqAcmh1ar4N009RPjZJwzW4ka6IJNO8SWu3ARqlP5TCdIcdVtP2XLOnN1g0
 5NBtJGwTUEiOaiLk/4ZFAVbViFJO+tN4ruffDv+6aSvIzb9nwjRL49GVAduVbAw+vprGTMJs
 uMHN3YBbx2Dg6S9x7f8UuptwZxLECWQB29sh50a5WmfVZ4bfK3+r4X2Cf5whGk52ZoWEKaPa
 cdENDQ1NErOaRZEa1lOUco3xLv0jyKjKm0Jo1+r/qdmuGK7IC6dclTOGIePJobaFZ09cmKw/
 D+uE7HRW0lCXDCn4WPbtCrq3qmXwHuTtLs6TNWQ7uRtjECY2lsdARgXUUrTifSigyZSYfoGQ
 6Av0nRo9PJaGHCDFIGnA0Th+iDc5XbwZvILewEEwFDUokbry1bBboQ0ZmYpQMArssYwWQsr2
 jeh9/v1BSZiuaGiUnmU8LGZt1uaYUD5+kdbOEfo5SNcizXSiNlbYiDnF76PI4bs5jHBIgwc9
 hjRxMQIaxf/uuZQv0mz1QivbztBPfElRCZtjuncdjrNAg+U+OdJzmFngLTWxa8oEWqXcrWOl
 FZfl5aB/NEhNrSquDGBe+QpAJCqwvnQZVUwgXY3d3Ug3zio6XWsYtgKpjp5Pl8vPscJeTuva
 0jW0e9TzMYLeivwK/YnJdvqUazGzoC5fTjhfvzZaNtVJJ9qaAKd+ChoaWac3m3tlA4nlqRX1
 ZKzIJf8XCZHUP4PIDyefNtez4QM2noE6mrJW5vGkQqg9bvGTSvAIVsCGB7UBgwj14ucrRnY6
 ZBcNcaOzxhFS/HzbjX/+J4SNhYBKn1TLZfupspac+SOLgZrFCQqDOXc6bcgYJB+2aNNm+HF+
 3uwVkNVxBz4n3KvFOmRQik7LuO1G88v6ytgZ0TAIGqV5pTqWq73hI93Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:Bh95z6l4veFYVc1L9ix0Y3fXgn3pDfKl3DAbv31ZSRFFG/Fw9/
 rBoB17726HtN91YhpQ/exoV5PwP080maQFnrX5Xo3SIDUO2lHYXb2KhLGKq0yDakjDG/Zmuc
 hdmsNFea3N5DZB/LXHyTj9OewNhPOA96elj/rfyXBCcSFGApsL0y5JTiygPglTXgdpOboVfa
 Dw2uN34xWnYmoedcm2Cz0oWOLZt8TXmJ+OW29hOzcXrCeLyR2ngYSKayRwHS1uKg+nA41Sll
 QtXzaJnJlLtcvLqSM0MFWz03xp8uGA9jKLPr32+7UoFgk=
X-Talos-CUID: =?us-ascii?q?9a23=3AdUFz12i7tb6atP4uDsuMf4hLBTJuXCbRkmjAEmC?=
 =?us-ascii?q?DLEFFVbGuSHuM2aBBnJ87?=
X-Talos-MUID: 9a23:/PjIKQbEEwypT+BTjAOvmgpFKJ1SzK20Fkswz4sBn8jcHHkl
X-IronPort-AV: E=Sophos;i="6.12,188,1728943200"; 
   d="p7s'346?scan'346,208,346";a="99898512"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
Date: Wed, 27 Nov 2024 08:34:52 +0100 (CET)
Message-ID: <9d9eb049a3bf4709bedd274ed0d97fff@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----AF5C2A56BADD0B8BEC8E345E5D1302D0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 07:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207915

This is an S/MIME signed message

------AF5C2A56BADD0B8BEC8E345E5D1302D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

> -----Original Message-----
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com> 
> Sent: Tuesday, November 26, 2024 6:40 PM
> To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>; openembedded-core@lists.openembedded.org
> Subject: RE: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
>
> I have some concerns about this change:
> * The above change does not really implement support for WITH. It 
>   only supports converting a LICENSE expression containing a 
>   WITH clause (expressed using the "+" operator) from bitbake 
>   format into SPDX format. All the actual handling of WITH clauses 
>   is missing.
Right, it is just a first step.

> * There are a lot of complexities related to the incompatible 
>   license handling (which is the main reason for the license 
>   handling in meta/lib/oe/license.py). There will be problems if 
>   someone  specifies a LICENSE as "Foo + Exception | Bar". E.g., 
>   consider what should happen if "Foo" is in INCOMPATIBLE_LICENSE.
Good point. Would definetly require more logic.

> * We also used to use "+" to indicate "or later". This can be seen 
>   in obsolete_license_list(). Weird things will probably happen if 
>   an old LICENSE like "GPL2+ & LGPLv2+" is encountered.
Right, as specified by SPDX. [^1]
This is really a blocking point for '+'.

>
> It would probably be easier to just add a GPL-2.0-with-syscall-exception 
> (as was initially suggested), but containing the full GPL-2.0 license as 
> well as the exception (compare to, e.g., Apache-2.0-with-LLVM-exception.
I agree.

>
> I also note that out of the six licenses used in OE-Core/OpenEmbedded 
> that use exceptions:
>
> Apache-2.0-with-LLVM-exception
> GPL-2.0-with-GCC-exception [^2]
> GPL-2.0-with-OpenSSL-exception
> GPL-3-with-bison-exception [^3]
> GPL-3.0-with-GCC-exception [^4]
> GPL-3.0-with-autoconf-exception [^5]
>
> only Apache-2.0-with-LLVM-exception and GPL-2.0-with-OpenSSL-exception 
> contain the actual license text. The other use an "insert <license> here" 
> reference. gcc has covered it by using "GPL-3.0-with-GCC-exception & 
> GPL-3.0-only", but that is not the case for most other recipes.
Right.
Apache-2.0-with-LLVM-exception and GPL-2.0-with-OpenSSL-exception are not listed on spdx.org/licenses
and the others are listed with the "insert <license> here".
The clean way would be to implement the WITH operator.
To avoid the effort and improve the situation, maybe it would be an idea to copy
GPL-2.0-only together with GPL-2.0-with-GCC-exception into GPL-2.0-only-with-GCC-exception.

Regards, Denis

>
> //Peter

[^1]: https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/
[^2]: https://spdx.org/licenses/GPL-2.0-with-GCC-exception.html
[^3]: https://spdx.org/licenses/GPL-2.0-with-bison-exception.html
[^4]: https://spdx.org/licenses/GPL-3.0-with-GCC-exception.html
[^5]: https://spdx.org/licenses/GPL-3.0-with-autoconf-exception.html

------AF5C2A56BADD0B8BEC8E345E5D1302D0
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
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTEyNzA3
MzQ1MlowLwYJKoZIhvcNAQkEMSIEIOdQqTac4aKEHfhysc+K+X3mTCY2LBNAG0xI
XRo/Cd/FMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBALOJ8qCVeJJrWwXEZF4Kz0IuV4CuZl0Jp22P6Un+/5kluiHoDkkSaGQTEJrW
VGXnn30+gEUk9s8soPgwRmVNV9hD/DEVJriC3NSrd/lh+1N9xezBlgHh2jjE75uQ
Z0ssHP56/S9VEH7bpyWmCsgnczKtTPcdQLcC/wCNFi0P6T8a5N0npWmmNiEuelm1
avOpPgYg7u536skoGXaTM0F3hPHFFkFOFYnExobVQe6qTPB+qf/RiexzpGKIqhzk
PviQJf2YBsbPDHOL8+rXF28EOolmymoKnPeTXIF623L8UqLj7dgXTU8YHxhz9pLu
cmPcw+gvo4tf6/+7op2alBrDbkw=

------AF5C2A56BADD0B8BEC8E345E5D1302D0--


