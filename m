Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF188E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 07:13:58 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web10.43196.1737011628917266644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 23:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=We/muu3K;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=104ee42bf=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1737011629; x=1768547629;
  h=from:to:subject:date:message-id:mime-version;
  bh=IbBGWfX5oq1YJVdiPhrGaHq4E21BU5quqdWDE2no170=;
  b=We/muu3Kv7u/wd0mzAIP8rU4QLV7aJI3Vw7Y0e1hsibpDmiDAXH397BB
   qfE7aCidY7OhS6fxYUMaX6ymqYdq0SatXVct5kjd35PpI+f7OgjEPgjyC
   T8c77Aj+xOejMKcYS4s3NGgHGG6LjGCM1X5cZ1iTWvMArYbvHN1RC90iW
   TDfYeP9dntlb7m0UN+xOuTm2xrzHzxUaqTB2zPFczep/srSL7Mi73iz0K
   doDfmESlCzVI6aejgY6Q7E50sf2hmZWwzu39AWHj2xjKeDNkXsnUsphYl
   CUr4C8U93P4FmBDZriaWme8erluD1D5NDmFdwjjQUd9dYi+azs0CtLN2k
   g==;
X-CSE-ConnectionGUID: n/6ET6vLQaOACtsYjisOSw==
X-CSE-MsgGUID: 3ShbW2d8QUqV/6tIDz5sbg==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+bH6i6iBlE8jRRas8hWQ46ADX161ehAKZh0ujC45NGQN5FlGYwR3n
 yJfBTDVa7vTPTzqM8Q2M9718ldF4MGLn5ImCldcGRtFVHdLrMeDHYuCRqubFy+bd8OdFhM+t
 cxPO9ScIppsQCCD/kv3bbW/8ykgjKjVHLP1VrCdZnp6GVc9E3ks1h8yl79pi4dmiNHnDl3ds
 4iaT6H3MUe93z9/O34V7KTEsBBkp6u3ozIXuFUieOpG1LP7vyB94MU3fvDpfxMUO7V8HvKmX
 7SEi7K073if8xYgCtfjmbH+NUYQRvnOPk2OvXwQULKm2nB+SlcJPtUG2IA0MQEP4wihn8xt0
 IcK8p+9WBxvMqzBmOBbWB5dVCpkOepa+/rHFn75utaXlxCFMiOE/xkVN61FAGFi0r4xWQlz3
 fwENChfKVecmP3wzLO2Su0qjcMma9HoPcRH0k2Mtgo1fsvKO7ibBf2i2OJl4dsQuixvNa6ON
 pYUZTY/NEvMakNCYg5KU8tjkur5iHCgKzEJ9Q3O+fNnsmPe8ld8gePnWDb3ln5mZu0IxBrC9
 jKel4jdKktHXDBK4WPdqhpAvseWw2WjHtpUTODgnhJTqAX77nQJDxELXkeMr/C8i0qvM/pSM
 EV8FhAG9MDez2T1CICmN/GEiCTc5ENEAoMOS7RSBDylkcI43S7IXwDocRYRMLTKhOduLRQ22
 1mAmc/eBDAHmNW9VXKH+76Imii5MC4TIHVqTXdsodwtuoSLTCkb13ojf/47eEKHpoSd9QLYm
 lhmmBMDa4A71qbn4UkZEWfv2FpArrCRJuI8C56+smiNtmuVb6b9D2CkBMSyAV+t4+91Q3HY1
 EXolfRy48gISs+gqHKTZNwEO5iC++20MjzHpmVwSsxJGzSFoxZPfKhc5SN1K1gxaIAPfiXxJ
 kPStANVopRUORNGb4cuO8ThUYJzne65To6NuvP8N7KiZrB9eQmG52dpflKdxWTklkQEnaAyO
 ZPdesGpZZofIf0/l2vvHLdGitfHwAhl/mPZesr3ny2ayITZOmK0ZaVYK1GBO7VRAKSs5V+9H
 8xkH8ySxhNSVefzbiXa/csYKkoHBXw6Hozt7ctPe+iOJwBrFG0sB7nW27xJRmB+t/0N0LeSu
 CjtHBYDkjITmEH6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:gnCn+6i80V0kkE+3NJ+Mirl/8HBQXvYji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhsdcL+7V5VoLUmzyXZaibNhRYtKdjOWw1dAVbsSi7cKmgeQYhEWlNQttp
 uIApIObeEYZGIS5arHCW+DcurIqOPtzEnCv5a9854Cd2FXgu5bnn1E41agf3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AnGropGusi8R7VbQSbSoKfX9x6IsjNSPw8CnOB3a?=
 =?us-ascii?q?xLk9CVKakS16L35h7xp8=3D?=
X-Talos-MUID: 9a23:W9bUrwZZeF8Yz+BT7ATsjg44OJdR3r2QTx4RsLkU5tKOOnkl
X-IronPort-AV: E=Sophos;i="6.13,208,1732575600"; 
   d="p7s'346?scan'346,208,346";a="103913833"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: [PATCH] create-spdx: support line numbers
Date: Thu, 16 Jan 2025 08:13:45 +0100 (CET)
Message-ID: <b50eb75f524c4bc8bf3dd1763dbfd24d@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----5336BEACC003BC721641A8379E60D1FB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209935

This is an S/MIME signed message

------5336BEACC003BC721641A8379E60D1FB
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

LIC_FILES_CHKSUM supports begin-/endline for licenses included in
for instance header files. This patch adds support for line numbers
to NO_GENERIC_LICENSE, too.

Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
---
 meta/classes/create-spdx-2.2.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 27242ecf70..494bde117f 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -75,11 +75,17 @@ def convert_license_to_spdx(lic, license_data, document, d, existing={}):
                     pass
             if extracted_info.extractedText is None:
                 # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
-                filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
+                entry = d.getVarFlag('NO_GENERIC_LICENSE', name).split(';')
+                filename = entry[0]
+                params = {i.split('=')[0]: i.split('=')[1] for i in entry[1:] if '=' in i}
+                beginline = int(params.get('beginline', 1))
+                endline = params.get('endline', None)
+                if endline:
+                    endline = int(endline)
                 if filename:
                     filename = d.expand("${S}/" + filename)
                     with open(filename, errors="replace") as f:
-                        extracted_info.extractedText = f.read()
+                        extracted_info.extractedText = "".join(line for idx, line in enumerate(f, 1) if beginline <= idx and idx <=
(endline or idx))
                 else:
                     bb.fatal("Cannot find any text for license %s" % name)
 
-- 
2.45.2

------5336BEACC003BC721641A8379E60D1FB
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
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDExNjA3
MTM0NVowLwYJKoZIhvcNAQkEMSIEILTn0f14I3Q6hpLC/QjQMgBun9oV8kBJ3BVO
snhwr5ygMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBADm+T/0FIBsFFmwUKV8R+TRRX32JdKym5jl7Jw0cFs8mI8aGH5Umzavv2l5/
CWoHmWJiRqSRqS50Wp1o4SBkRSd6u16Fgaew1FJj0yJ05edLSCINvAdcjMId8onJ
uK+cVNqUP/ks4g9j4y+GS4H+bsqNjTg+civNp2JSk7/ZMN5dWagOcqmRSFAvF2Ne
J4FWM/mkTkADDrUMCRi3bkUX71g7s8BU8nmtPVSj8gBne2E7dkjs8QDsWBHaM/F1
CwiRTDnYsZhDOujFQW3EMT0GKZTT1S1eWrlopy8qoZpX++Gal6LW17EJsaCwF/jS
Us1HcIqcDCEDPVN1RRgBF9lL0Rc=

------5336BEACC003BC721641A8379E60D1FB--


