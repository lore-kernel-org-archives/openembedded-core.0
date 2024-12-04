Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51C9E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 08:38:52 +0000 (UTC)
Received: from enterprise01.smtp.diehl.com (enterprise01.smtp.diehl.com [193.201.238.219])
 by mx.groups.io with SMTP id smtpd.web10.9436.1733301523152616710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 00:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=nZAKM9ry;
 spf=pass (domain: diehl.com, ip: 193.201.238.219, mailfrom: prvs=0613ae4ec=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1733301523; x=1764837523;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=LzWkZ2BHkB7YOPaDidOgXR5ctZtsTY2+1tMlGobe/fA=;
  b=nZAKM9ry+4LE4Qi3Wo7QnAq8cBF6NrXHt1WobaqYhGsuXMckhhIle7T8
   wbdgL9OWw+o4E7+W+XJNpNWAtqPlayfg8SMekTgkYSuSNY6//65DvwMcd
   J8JenNdDb9Y2vdo1rdqTK5STdRfiyeDivJIAXC6oxYaHRlnOpPHNtDoqO
   2eI8pDNZdGOW24jAKaKivjiJUqU66nnYRyVGoC8yGk++DMB9JFmCF0DCN
   CUb2Lzzb5LrcGGUqWxHSzD1OPCkhL82DdBiTgb/izVpp543zycNv3CDbf
   NvLZ3lEOOQFd2eH63YMOu2yFfnwT3ztSaJJa+LZDkwzstKrfYlCdbDNkg
   Q==;
X-CSE-ConnectionGUID: 7f4W+zurRJKrHFpEh4YOYw==
X-CSE-MsgGUID: HIuinIGfSWKq0JsogjrdGA==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:BWOO4a3c/Hj8XgAya/bD5Qdxkn2cJEfYwER7XKvMYbSIpGtil2len
 TNbADbYJbeXIjmmON5rK9ThqxtC/NSA/mJROEEx9HRgCWoVsqIpbvzBJxytZiqbdpfJEkk6t
 JwQOofKcp1uEXKArUfxbeW9/SghiPvQHeqlU7/JNy0qT1ZqFy18gEJpluc1i9Y2j9Pha+/hk
 drqu8neM1a52jlydXoX4Lnc7Qhus/L7pC4CszTSQNgS1LOJvyJEVMJ3ydiNB3vkXpEGWam5S
 vfYir2482PduRwqD5SuiLK8bk5PQonUewOUjiI+Z0TZufQxm8BI+v59bJIhQUdLly3b2Jdyx
 cRW85CxRActeKbLnaMWSR0fDyI7PZpAvrTdJSDi8o3Lp3EqCEAAsMiCdmlue9Vwx853HX1Wp
 7tfNy8SKByCiuKyhrm8T650hcVkdKHX0PgkVgJdIUvxVbB+Ka3+fpgmxeO0/R9u28pFR/iHa
 5BJMWszNR2ebUZDNAhNUcNukrj1jSj1KGEB+AOeqJRs7jmIxmSd8lRP3Pn9J4bWH5UFxi50g
 kqcogwV1zlDbIT3JQKtqyzq3qmX23umAOr+LZXgntZymlqf22cPPxMfUFq/sJGRh1W3Mz5lA
 xV8FhEG8+5rriRHcvGnB0fk+STc4kZFMzZtO7ZSBD+lm/O8DzmxVjBsog5pMLQOqMIwTDo24
 V6F9/uBLSBvqrCcVUWG/b6Sqz6oUQBNRYPVTXZZJeety4CLTLAb1nojfP46eEKGpoSd9QXL/
 ty/hHNWa4P/LyI8//7TEVjv21pAr3VSJ+I/zl2/smmNtmuVaGM5DmABBJeyAftode6kole9U
 HcsxMbC06McEIu3tg+XYMsVMbH11tG0L2iJ6bJvN8FJGzWF93uxdo9PuGs4L0BzKoAIeDLpZ
 AnYvgY5CJ17ZSPsPfUxOtL3Up9wpUTjPY2NuvT8YtdIY4M3cxSb8TtqbEic92zsnUgo16o4P
 P93dO71VShFUfg3l2Teq+E18Z42xyYf6m3oerPilza81rWcfnK6YOJQWLeJRqVjhE+emy3P9
 M1EccGX0QlYVsX3eCyR+okWRXgSIGQ2H9b1qcFTcuOZORZrFH0JAu/Q2vUqfIkNt6NNm+HF+
 3uwVkNVxB/0gmfKAQGLcWx4LrT3UJByqHg2MSAhMRCvwXdLXGq0xP5HMcttO+B3srU4l5aYU
 sU4RilJOdwXIhyvxtjXRcOVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:AHtaSK0l0nPKJnjVMrM5KgqjBGEkLtp133Aq2lEZdPUzSL3/qy
 nOpoV96faQslwssR4b+OxoVJPhfZq+z+8Q3WByB8bBYOCOggLBR+wPguXfKlbbakjDH4BmpM
 RdWpk7Mcb3C1dii8b8/U2XL/YMqeP3iZyAtKPm1HFqQhhta6Z8qyFDKijePHFXaWB9dOIE/L
 z13Ls8m9NlQwVtUviG
X-Talos-CUID: =?us-ascii?q?9a23=3AJw54HGoM+0xz93LuelpGPWHmUZ8rLkKe3mrKGW2?=
 =?us-ascii?q?bE0ZHUJCVFW63ybwxxg=3D=3D?=
X-Talos-MUID: 9a23:FGt+0gqPmESBltZ6UyEezxFDKcZuwougM38uiM0koM6LNzZ8FB7I2Q==
X-IronPort-AV: E=Sophos;i="6.12,207,1728943200"; 
   d="p7s'346?scan'346,208,346";a="106704836"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
Date: Wed, 4 Dec 2024 09:38:41 +0100 (CET)
Message-ID: <bf17c683e26440e9ac09612da6dfac91@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----0A43396D9925E493216FF5E40FB67A27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 08:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208271

This is an S/MIME signed message

------0A43396D9925E493216FF5E40FB67A27
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I totally argree.

Regards, Denis

-----Original Message-----
From: Ross Burton <Ross.Burton@arm.com> 
Sent: Tuesday, December 3, 2024 3:42 PM
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@lists.openembedded.org
Subject: [EXT] Re: [OE-core] [PATCH 2/3] spdx: add support for WITH operator

[EXTERNAL EMAIL]
 

On 27 Nov 2024, at 07:34, Denis OSTERLAND-HEIM via lists.openembedded.org <denis.osterland=diehl.com@lists.openembedded.org> wrote:
> Right.
> Apache-2.0-with-LLVM-exception and GPL-2.0-with-OpenSSL-exception are not listed on spdx.org/licenses
> and the others are listed with the "insert <license> here".
> The clean way would be to implement the WITH operator.
> To avoid the effort and improve the situation, maybe it would be an idea to copy
> GPL-2.0-only together with GPL-2.0-with-GCC-exception into GPL-2.0-only-with-GCC-exception.

I agree with Peter - in the short term add a GPL-with-syscall-exception license because the fallout for just adding + to the LICENSE
parser is greater than just mapping it to WITH in the SPDX code, there's all the license handling logic and missing test cases that
need to extended too.  We don't want to merge just the remapping without test cases to verify that nothing else breaks, at least.

Of course if we extend the license logic further to support + properly, at that point we're basically reimplementing SPDX license
semantics but with a new syntax so I'd personally be in favour of moving our LICENSE field to just being a SPDX license string
(potentially with backward compatible parsing for a cycle or so).  This means we can reuse existing code, and the semantics of the
field is well defined.

Ross

------0A43396D9925E493216FF5E40FB67A27
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
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTIwNDA4
Mzg0MVowLwYJKoZIhvcNAQkEMSIEIAp2K9l5E8caG8UUes2kB2aA4NougBqifyFY
/niiExYxMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAHN5WoVLdFzV+ECrA6KWqGt1XfsolWB6HZT279rqBCLPWC01JaspW9MmP0Wj
aVjZ1+RDUgKnpjBC0pSgR02FHsNC2TKTadQkKWJ9XYxAEHMkgafHdy0VpGVmpKbM
P1uiZmhT+XeIWolwnX9CnOsIZQjPawF02JmTlPkBDHtboRe9dhDWQFFNOamUlnYj
cpFcWb/ptN5LioVw1Zull+kATJ735T/7mO2SLoHyO97wNCeb7SOl2CyRG2vHxDPp
NM1+RfcMok+1mh1SGsbbZPUQ37O9W8oVPKhe2D8WCvv4FUGT58u2WCux5A8IpBVC
/jE2fb5LCBgUsvYefs1xvBAoAJM=

------0A43396D9925E493216FF5E40FB67A27--


