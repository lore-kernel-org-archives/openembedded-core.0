Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C198D58069
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:54:03 +0000 (UTC)
Received: from enterprise01.smtp.diehl.com (enterprise01.smtp.diehl.com [193.201.238.219])
 by mx.groups.io with SMTP id smtpd.web11.17082.1732535632517881500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=ENd/Fa9m;
 spf=pass (domain: diehl.com, ip: 193.201.238.219, mailfrom: prvs=052d57505=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1732535632; x=1764071632;
  h=from:to:subject:date:message-id:mime-version;
  bh=MYV8NIcip1LuKdH3pffC7zk51pWBY+9ckMRYlwpUFDE=;
  b=ENd/Fa9mtqPglyPBehHd72mbV6FKaCLMMqYqiZaamzM+rBsClQPtgoh6
   9KLpFcEWbkTrk+1cZG4/mv/nZ2DWRty5Fa4Jahd7mpYuQ/VqecnTwPe4I
   GHjGKs9u7Zaib7hF/lj17vAI9mKKse5ps6xRqdsapKNqGl/+xu8SLhRGO
   Ly4/VKVHV3GuWqteZB/XZ8pq+gDFXJY2IuWhhNrNisLgp7wwvwKhjgxaN
   Kh151E8u1IXKiYE8HY+AGQCJmbtezDYBcCUM4yvF2/ZAuNU4Y2KNhWf0J
   xNHz/fbtJFBxEuRG2bXnm88eNdXoFGABLYm1b5CUeEt/2AwR+xW6o0n8F
   A==;
X-CSE-ConnectionGUID: LQyuFERpQK6xg/gz2GRKFw==
X-CSE-MsgGUID: 0hUE0U2NRz2pxpvOlwssXw==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZKFOO6/v4iOk5RHroNgHDrUDmn6TJUtcMsCJ2f8bNWPdYAtShnVHk
 jtMCC3fZaGVKn+1IIo1b5D1rB1Y6NKQjINT/DAc7nRsSn8MsZXebTjyBhavZynJdcCZRhk+t
 ZhDMoWaJ5FoQC7VrEfwPrG4oSki2PGFTOf2WOeaYHEhGFRpEH182UlvweIy2NRh2ojmCVLlV
 b/aqtXHPF6u0iJ1NWRT86GIs0wqp/X9vjoEo0YzDRxulAa2ey49V8NHdcldVkfQQpVIBrz9A
 OXO3ar/8mLU/xNrAdSg1b3hdgoWQfvSCg7IgWBSA8CebmN5Sl8PPtwTbLxEAXp/iymVh4I2j
 9ZApIf2RQYkPqmKk+MYFBJCF2ZiPuhGz7mBKmK76ZHQjhWuT5eX+BkdMa1MFdVeoo5KKWFS6
 eRKb3cScQ/Fi+O7wLb9Qe5pwdwgLY6zVL/zwUqMvgw1d95+B8irfpj32DN44NsRrskRTPrTP
 sFHYzQ1PUTLaE1CZl0eVM0yxO2m1iGgLWcG9AvF9KE63TPenVd7uFTP3Hg5WfTXH5kPzhbAz
 o7i1z6kav3PHIXHkVJpylr12KmX23u9AN9KfFGB3qYCqEWJwWAOAwEhW1K+oP2o4mazQNs3x
 3Y8o0LCloBsshXxJjXBd0fg+iLd50RAA4A4/9ASs2lh9IKFum51OUBUFlatWPR+3OcqSDoj0
 EO+nt+BLVRHrL2PRHuBwayfpDW0NDJ9BTdqifgsFFZtD3HL+enfvzqXJjpROPfdYu7dQFkc9
 wu3QB0W3N3/uyKpO5KTpjgrixr0znTAo5VcCg//BgpJ5SshDGKpihDBBfE2Ip+sIa7AJmRts
 kTolOC61fETI7y3jBWuHvUCW767vdm/ExPD1AsH85kJr1xB+laveJJb7y4mfgFiNdwcPzPob
 U/X/whW4fe/PlPzNeknOcToW4JzlvKI+dfND5g4avJCb55wb0mA5z1jf0qZ2WzFnEkhkaV5M
 pCeGSqpJS9CVPs7k2fqGY/x15dzxh0TnV6JY6rplQy3yaS5YGGOUocaZQ7mgucRqfnsTB/u2
 9FHOs2Hzh9SXOHzbmzc9pQeBVQLNmQgQ5fupspac+SOLgZrFCcmEfC5/F86U9U92fQP0L6Yu
 CjmACe01WbCuJEOEi3SAlgLVV8ldcwXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:vCzj/ataITdAQh5wSsmJBdhU7skDUNV00zEX/kB9WHVpm62j5r
 iTdZEgviMc5wx+ZJhNo7290dC7MBfhHMdOkO4s1NSZPTUO2lHYVb2KhLGKq1fd8kbFmdK1u5
 0NT4FOTPD9CFhkgd3riTPIcOrJp7G8gcaVbErlvhVQpEVRGsRdxhY8DgqACEV5SCtLFfMCdK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3Acpz8nmhaqYwrD+GVHpFKuzqdkDJuVkTM0Vn9GVe?=
 =?us-ascii?q?BKjh5R/qaWwW/woBKjJ87?=
X-Talos-MUID: 9a23:GVRwgwptkp3nnpp6eokez2liCeow3v6IMlJXiYUepe6AKjdrCyjI2Q==
X-IronPort-AV: E=Sophos;i="6.12,182,1728943200"; 
   d="p7s'346?scan'346,208,346";a="105747546"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] add basic SPDX WITH operator support
Date: Mon, 25 Nov 2024 12:53:50 +0100 (CET)
Message-ID: <960ad56c5ce145deb1fe2e30efaca670@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----076F295ACE5902BD56C36FB856B411D9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207743

This is an S/MIME signed message

------076F295ACE5902BD56C36FB856B411D9
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adds '+' to the list of operators, which is replaced by SPDX WITH operator.
Copy Linux LICESES/exceptions/Linux-syscall-note to common-licenses.

Denis Osterland-Heim (3):
  lib/license: add missing oe include
  spdx: add support for WITH operator
  linux-yocto: add WITH Linux-syscall-note to LICENSE

 meta/files/common-licenses/Linux-syscall-note | 25 +++++++++++++++++++
 meta/lib/oe/license.py                        |  5 ++--
 meta/lib/oe/spdx30_tasks.py                   |  4 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/files/common-licenses/Linux-syscall-note

--
2.45.2

------076F295ACE5902BD56C36FB856B411D9
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
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTEyNTEx
NTM1MFowLwYJKoZIhvcNAQkEMSIEINe8k1nSudFtuVq+/YYDhgFi78zFu/1UVl3i
hEwCBef7MHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAEtVQF+6AE1JmTXV9AoU5rYyl5jx9iFQkKRZ2p2Ae58250NeQmqrop00KD9Q
tozu05iTEVanBw/k1qutw81gic2my+/AIKht/yhs1SrYVWGrtsIcs+wQiUAODAik
9iUXKWtuQPe84Faow4k1QpZ2ehtcQ0gfICnx44WQ3KSjeFI8+/neQ3KxyXxueiYy
lvC2Cm9hZBI7qQHQ5aziIXo90QmUykPY78WM0C9H6sLX1EkZqvWNEFqZsAWWVQ68
O8I/EDOxAjq2AY7+WkSQ+hxLHzA+6BjydfbldnZUsrSNJfL/cEFQLrr+g4OWU6S8
ALnGq6fh6DtGPZ11aHdPJuigrSY=

------076F295ACE5902BD56C36FB856B411D9--


