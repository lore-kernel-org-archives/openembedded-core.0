Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477B5D5806C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:58:13 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web10.17015.1732535879918154693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=dbYrsWjq;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=052d57505=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1732535880; x=1764071880;
  h=from:to:subject:date:message-id:mime-version;
  bh=XxgQMwAROYyJhNg9gsKzHNzUL3MmpgykcJ6GcYop5Bc=;
  b=dbYrsWjqDAUpJkCqLJY++RMtEtBulkP6x3rljpN/Yj8WTj3yYWszrVqo
   VVl7mfwflriK5a28ADUhT1Go1ZvD+dzrgFEd6UoOG9l8ybwPPCD/GJdIf
   VLtBd0yz2SkZQVfVoMW7B4i2b52JyoYuFp5whv4gi/FtdQc0ZL5MfPk7e
   4dQTvE2mYj8s/feXhy5ccrPEVPNSJqEYUIyzMGdtIqFfpCZChLRpBn5NO
   Fs0r3Yndxye8bYmonz+HcQPAWr1KV3MONo/VxXfwZ6Mynb+wOef5E5YkS
   GTT6HmdXKpky907r4tK+BuZgJpAnSu3omSVNQ+O/Ij2BsrnIODZIl/prf
   g==;
X-CSE-ConnectionGUID: 6V1d/BLKTJ2g2HU/zxvVkQ==
X-CSE-MsgGUID: M9xF+SLhSGmUO47COuBWgw==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:OYp3Pa9FIdlcow/Bae6SDrUDm36TJUtcMsCJ2f8bNWPdYAtShnVHk
 jtMCC3fZaGVKn+1IIo1b5D1rB1Y6NKQjINT/DAc7nRsSn8MsZXebTjyBkuvYinCdMaSEEls4
 c5CMIidfM06Qy7Q/R3xPuPt9yUi2frWGrehU7fKNn54GF45Fit41Rg5wb9i2dY13NHpCQjlV
 b/aqtXHPF6u0iJ1NWRT86GIs0wqp/X9vjoEo0YzDRxulAa2ey49V8NHdcldVkfQQpVIBrz9A
 OXO3ar/8mLU/xNrAdSg1b3hdgoWQfvSCg7IgWBSA8CebmN5Sl8PPtwTbLxEAXp/iymVh4I2j
 9ZApIf2RQYkPqmKk+MYFBJCF2ZiPuhGz7mBKmK76ZHQjhWuT5eX+BkdMa1MFdVeoo5KKWFS6
 eRKb3cScQ/Fi+O7wLb9Qe5pwdwgLY6zVL/zwUqMvgw1d95+B8irfpj32DN44NsRrskSF6eFb
 ZYXMzMxNEzNaUITMFtHV5k0kOz22CKhf21S9AvF9KE63TPenVd7uFTP3Hg5WfTXH5kPzhbAz
 o7i1z6kav3PHIXHkVJpylr12KmX23u9AN9KfFGB3qYCqEWJwWAOAwEhW1K+oP2o4mazQNs3x
 3Y8o0LCloBsshXxJjXBd0fg+iLd50RAA4A4/9ASs2lh9IKFum51OUBUFlatWPR+3OcqSDoj0
 EO+nt+BLVRHrL2PRHuBwayfpDW0NDJ9BTdqifgsFFZtD3HL+enfvzqXJjpROPfdYu7dQFkc9
 wu3QB0W3N3/uyKpO5KTpjgrixr0znTAo5VcCg//BgpJ5SshDGKpihDBBfE2Ip+sIa7AJmRts
 kTolODA0rkCSruptxCvGupXPIzu9eabDj7l1AsH85kJr1xB+laveJJb7y4mfgFiNdwcPzPob
 U/X/whW4fe/PlPzNeknOcToW4JzlvKI+dfND5g4avJCb55wb0mA5z1jf0qZ2WzFnEkhkaV5M
 pCeGSqpJSdLV/Q9nWfnLwsb+Zp61g59/kfTfr/+8jP7jpG5eVSqRqhQZTNiach8tstouj799
 M5SMcaPwRhTXODyJyLQ64M7KVERMWN9Aoj7rcFSfOOPLgdqXmY7BJfsLagJItQjz/4Tz7eOp
 yrnMqNF9GfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:IFhboKDpIUxuVp3lHemV55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5xvyMc5wxhPU3I5urwXpVoLUmwyXcN2+cs1O6ZPTUO21HYTr2Kj7GSoAEIQBefygc178
 4JT0EUMrLN5DZB4foS6TPIauod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AlKRFGmlhlwDnm6lkzNgmc+/hBvbXOSPjlXuXCWu?=
 =?us-ascii?q?bNUQzR+e1dBiC6L1akPM7zg=3D=3D?=
X-Talos-MUID: 9a23:I+dAsgYmmHc9JeBTkm78qnJZEMdTzKGTLxxSurIbkfaLKnkl
X-IronPort-AV: E=Sophos;i="6.12,182,1728943200"; 
   d="p7s'346?scan'346,208,346";a="99682959"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] linux-yocto: add WITH Linux-syscall-note to LICENSE
Date: Mon, 25 Nov 2024 12:57:58 +0100 (CET)
Message-ID: <2719f782df504dd4bfd191575ee52d01@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----E4528EBBD940E981574FA1EE488EDA83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207746

This is an S/MIME signed message

------E4528EBBD940E981574FA1EE488EDA83
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

According to Linux COPYING file this exception is made to GPL v2.

Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
---
 meta/files/common-licenses/Linux-syscall-note | 25 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/Linux-syscall-note

diff --git a/meta/files/common-licenses/Linux-syscall-note
b/meta/files/common-licenses/Linux-syscall-note
new file mode 100644
index 0000000000..9abdad71fa
--- /dev/null
+++ b/meta/files/common-licenses/Linux-syscall-note
@@ -0,0 +1,25 @@
+SPDX-Exception-Identifier: Linux-syscall-note
+SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
+SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, LGPL-2.1,
LGPL-2.1+, GPL-2.0-only, GPL-2.0-or-later
+Usage-Guide:
+  This exception is used together with one of the above SPDX-Licenses
+  to mark user space API (uapi) header files so they can be included
+  into non GPL compliant user space application code.
+  To use this exception add it with the keyword WITH to one of the
+  identifiers in the SPDX-Licenses tag:
+    SPDX-License-Identifier: <SPDX-License> WITH Linux-syscall-note
+License-Text:
+
+   NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+                       Linus Torvalds
+
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
b/meta/recipes-kernel/linux/linux-yocto.inc
index 0132fcffb3..3de8318c39 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Linux kernel"
 SECTION = "kernel"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-only + Linux-syscall-note"
 HOMEPAGE = "https://www.yoctoproject.org/"

 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
--
2.45.2

------E4528EBBD940E981574FA1EE488EDA83
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
NTc1OFowLwYJKoZIhvcNAQkEMSIEIDlBVWMV9FQu9nd209ww04612AsUvr/H1iat
M5C+TCMMMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAEtgqnboxmx7bgs70czJynGrX4Geo8G4V991AMhlmweBcaAMpO99GDZIHjFQ
2X0ZgSJXsXM3lRksB1r0ZwcvPdBVDiJNuzoCs9bIlckik2WhBxOs1AlZtFgPjr7m
CBz28nqq2t5Vva+VTMJU0ncoUwvaafIOUsnAH+Cbsm8KhJ0xN2vBVphEs3Rpq0cC
ctgPY8GeFKV1qfqvGDqc6elbk5fptEWsMMKCxbks234EgAHlmP06JyaLB4joEKm3
x1ER4MgnwSU0oYzyxWGOzAgMNLnHySVolNrpbO4DRQlPPu6iFAmV/6KFQvCkJCq1
opA0BqIYvTFq3VZf1fxG6Jk9uuk=

------E4528EBBD940E981574FA1EE488EDA83--


