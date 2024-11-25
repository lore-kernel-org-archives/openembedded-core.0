Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463F2D5806C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:56:43 +0000 (UTC)
Received: from enterprise01.smtp.diehl.com (enterprise01.smtp.diehl.com [193.201.238.219])
 by mx.groups.io with SMTP id smtpd.web11.17119.1732535801933737590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=LkyqVzww;
 spf=pass (domain: diehl.com, ip: 193.201.238.219, mailfrom: prvs=052d57505=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1732535802; x=1764071802;
  h=from:to:subject:date:message-id:mime-version;
  bh=qBJReiSGRXKFlfVwO88k5ZaULGiVDywTbZ9GWrXyNAk=;
  b=LkyqVzwwGE33oVLxa10xiRa+egK7mbOcZkqkzZ4H8kGvrWoyxGI8mVm+
   gg4dzIRqEKZsRgL2Z+lOTc10kXqpTVMc311wh2Z9khMOzNUlkis8z9T4I
   upBMm0WrPJIDOVn3iNHGfFsI6yYZJP3DJ4kJHhXiFghudz7tK3EV/3qF8
   fGO7KsJMmjtY2YsqpFZyEtGFTIG3J9u72RPB/xAO3GbIl+IxUm4Bzw9ia
   WG17OXV/Wf5V/VQetR5Pq0SQC85cX6tBvezafE456YuHMxqQfaotXdeZx
   XrcH3G+eWaigcauOtYctdBWlGTcIn9bRLYtuh56+5Cd6C7td+wgH2xEio
   g==;
X-CSE-ConnectionGUID: S1tfQiCGT9OtlVeWDDeJUA==
X-CSE-MsgGUID: 88QnoyhGQ7OQGwnTpKIyiw==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:X/51I6pPFSJ447/gWxkuH73malheBmICZRIvgKrLsJaIsI4StFGz/
 xJOGSnaY6zbJjuqJcY+dc3tpgkBpNWMmYgyDEcu+BmBJVpRrMvACJKBcVyY00i6I8aSEE49t
 5QVOtOdcJpuEi6C/Eugb7Pt8SFwjvvSH+GkBOPJait8GAQ1Qnlwhxg/kbAziINj0Ie3CVLR5
 o34+KUzVHeswyZwM2kd96OErlR3v//p53YDv1M4bOxWplK2e1w9VfrzconqfiOoKmUtIsa6W
 /rbnvb+/W7I5FEhC96llvDwdUhNSaTWehSNz3phXe6pmBwazhDeqZ3XR8fwE28PzW3hovhx1
 MlV59v3Sgo4JevAmekdV19TFCQ5NrdCv6PEZHiIt4qY1UmeLjitm51S4DoN0f4lFpxfWScWn
 cEwKCwRdkLEwP2p3/S3S+RsgoIoK8ysJIAe/SkI8d2iNhpVfHy5a/2Mvbdl4QoNauBy8df2N
 sBBNmQ+NE2aMxYRYFoZV8k3zLeljSLxKWRT+APErvVrujiCxwFPi7W8a9C9lv5m5yl2thvC+
 jiWrzyR7jUyboH3Je+tqyr07gP3tXqlHtpUTPvgq6YCbGS7ngQ7EAcRWUawvc63g0u/X8M3A
 0EP80LCl4BrnKCQZoe7BkfQTEKs5EZGB4MJSbFismlh94KPi+qnLjldJtJ+QIx+3CMGbWRC/
 kOEmdrvGQtuvNW9IVqB9q2ZpC+FIiMcK2kPf0csFWPpNPG6/enfJjqWJjpSOPbdYu/dQFkc8
 BjTxMQKvIj/uOZQv0mNEfIrtBr3znTBZlZdCgw6xQtJ5CshDGKuT9TABVQ2cZ+shWtWJ7WMl
 CFspiSQ0AwBJarUiCK0Qc4iIOCO+/K7PQLwrVNNIrB0olxB+1b7FWxRyD17NkxmLZ5ePzTue
 leVtQJc5JsVN3yvBUN1S9vpTZRwi/GwU42+DJg4bfIXCnR1XAOK+iB1I0mLw233lEEqnYkzO
 JqbdYCnCnNy5aFPlWLrGLtCgeN0rsw47TODfJb83hSI6OW5XVGKT4sdE3qfb/9suctopy2Qq
 b6zLfCizA1SVuD7aCTb/YMfaFsNN3UTAZHtt9cRcfaOJAdjEmwtB/Ldh7Q7dORYc799z7+Or
 iv7Ax8ekQGl7ZHaFTi3hrlYQOuHdf5CQbgTZ0TA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:z6P2xaNFD1kz28BcTq6jsMiBIKoaSvp037BL7SBMoHNuGPBw+/
 rCoB15737JYVQqN03I8OroUMK9qBjnm6Kdj7N8AYuf
X-Talos-CUID: 9a23:SVBNY20ieLZvX8f1+Z5RTLxfIZk5fETc51jscmikDVhkd5G5RH2t0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3APleFHg6li7mBvvgZVy2jM1Scxow4s52oD1ENvqx?=
 =?us-ascii?q?ZnPCrKipMIxS8nTWoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.12,182,1728943200"; 
   d="p7s'346?scan'346,208,346";a="105747847"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] spdx: add support for WITH operator
Date: Mon, 25 Nov 2024 12:56:40 +0100 (CET)
Message-ID: <b4f524ba554e48738c2307d44b8304ae@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----406447E7A0F2AE2519306665374AC305"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207745

This is an S/MIME signed message

------406447E7A0F2AE2519306665374AC305
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adds the + operator for use in LICENSE field.
It is replaced by SPDX WITH operator.

Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
---
 meta/lib/oe/license.py      | 4 ++--
 meta/lib/oe/spdx30_tasks.py | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 3c15db782f..223f98acd5 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -47,9 +47,9 @@ class InvalidLicense(LicenseError):
     def __str__(self):
         return "invalid characters in license '%s'" % self.license

-license_operator_chars = '&|() '
+license_operator_chars = '&|()+ '
 license_operator = re.compile(r'([' + license_operator_chars + '])')
-license_pattern = re.compile(r'[a-zA-Z0-9.+_\-]+$')
+license_pattern = re.compile(r'[a-zA-Z0-9._\-]+$')

 class LicenseVisitor(ast.NodeVisitor):
     """Get elements based on OpenEmbedded license strings"""
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5aeed5cd6f..17a1ce44e7 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -97,6 +97,9 @@ def add_license_expression(d, objset, license_expression,
license_data):
         if l == "|":
             return "OR"

+        if l == "+":
+            return "WITH"
+
         if l == "CLOSED":
             return "NONE"
@@ -115,6 +118,7 @@ def add_license_expression(d, objset,
license_expression, license_data):
         .replace(")", " ) ")
         .replace("|", " | ")
         .replace("&", " & ")
+        .replace("+", " + ")
         .split()
     )
     spdx_license_expression = " ".join(convert(l) for l in lic_split)
--
2.45.2

------406447E7A0F2AE2519306665374AC305
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
NTY0MFowLwYJKoZIhvcNAQkEMSIEIBKB7/BpI/8gC30ZLPrTXILh5HjKYuntox4w
QBwApd+6MHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAFHkAlaz8naVv7iCGAReimMJAJyY2QWFjZ6GGaPxBnFp1ScNO2x0KFN0Y0Bn
2njAltTsZr6aD/ixqaIfZllaNKA1TjQJ6uCa8HrmC2boQyRLzs4uf+JxOTeOWLA3
Uq40jVBHx4q1c376mkhk6xxEVhp66VFXQSnpb42/GjLyvG3JqhynI4BEkLDovtQq
vkoMcKqIQN0BNKUsp4ezpCNQwMQ/Ju/QUlF6ALCeis+OgikmiSR7g6HnIIOFV2W0
6beqZl9XdsryoFrlJuz9xaUR1RMiHodizxiwZv5ilQE8b7zmbKFQa3l3C11xEs3d
6SxG2o6rHosBXHFxWndONOBcQdM=

------406447E7A0F2AE2519306665374AC305--


