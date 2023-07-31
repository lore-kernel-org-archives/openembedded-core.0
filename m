Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F83FC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 14:31:47 +0000 (UTC)
Received: from enterprise01.smtp.diehl.com (enterprise01.smtp.diehl.com [193.201.238.219])
 by mx.groups.io with SMTP id smtpd.web10.8892.1690813899600687337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 07:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=WRzKZkdi;
 spf=pass (domain: diehl.com, ip: 193.201.238.219, mailfrom: prvs=569f2fe77=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1690813899; x=1722349899;
  h=from:to:subject:message-id:mime-version:date;
  bh=dCUjE7Eembjvbfl7cibrC8pCP6E1tTPHuPgxyavwHcA=;
  b=WRzKZkdi9bUhj7kwj8hYLsPGflhth137SBSdjyQ3OsFVziABsYoIwtcx
   FqNMMRNNS6lQGVJ5Be96tuyepMgFoKf6c64JSEXdH3mo/+yoN1eaf+gVI
   ON6u+o8Mc3U9IcGIJ6UjiXsvy6gK1Mh7qk74vaaqlGJKBIYYeeWA3gHRb
   dMn/e55qKnBNqc7l67v9GGIurVqq/JHjncYVvEsm8NtgYOYMN50HWP4cE
   x9Y43lClteBaCw17fSAp4snoYtR/TYl6uwoCG10LO4yT8b7Fjk3QynQLC
   ipmYP0QtwejbeHZqbniYMQ3kMgo00SD1pVINI3Atz/YlDcCX22vg4zyu2
   g==;
IronPort-Data: A9a23:17wyk6mOyyvRWKXdbmySIlHo5gz3JkRdPkR7XQ2eYbSJt16W5kVWj
 iJDADrXfqbVPH29ZpktO86x6Alf7siEipMhHTLYn1l2SnNPpIzdWs/xwizYb3uedsHKF0w2t
 ppPYdLMcJs4Ey6G+0b9aLLq93cg36/XGbOmBraZM3p9GQE+RSkq0UJqw74w2t852oa1WwnQ5
 bsezyGx1HqNglaYZUpPuvrTwP8WgNzypC8A7Bt5Zv1apxnSlnQVCNQUIqT2JGH8BZVXW+6NQ
 aDI1rXhll81hCzBee5J6J6gNBVif5bSIRSW2D0RWKWzmV5OpyEy1uAwM/9bYl1TzCmK2tBGz
 pNGr5joFERoZsXwdJ8mv2pl/1tWZusekILvIWSjqZ7UiFLZbD3gwvhuCAc9Oohf4uV2Rjkmy
 RBjE9x+U/z5r7nwmNqGd9RRauQfwOjDYNpH6no7xziBAal/Ec6ZSfWauoZU1TlvjZwQEfqOa
 sZFMGo+Zxn+OBAeYV1/5LDSPguLriSlL2cI+Ar9SY4fuTW7INlZieC1WDbtUoXWA58Txy50n
 0qel0zhGBYWKdeD/jSM93Ool4fnkDjyMG4oPOTQGsVC3hvLnwT/NDVMDQHg+abi0xbnMz5iA
 xd8FhQG/PFaGHODHoGVsy2Q+BasohMaUtxMJOw2gCnlJn38ulvx6sAsF1atWfR+3CMEbWVCO
 myhxrsFMQdSXIi9EhpxwFs2QQSaYkD5JUdaDcMNoJBsD9PL+OnfhTqXJjpv/TLcYnQY1lgcz
 hjTxBXSiYn/guYsjbSA12j4iQuLgbKUbB5r/SvIb1yMu1YRiI6NP+RE6HDX6ORLI5nBFB+Ku
 2Ic3cSf4eAKS5qKkURhQs1URPf5vbDcYHuF2gQH85oJrlxB/1avcIZR+3d5P1tkKMINfzPBb
 E7euQcX75hWVJevRfEsOdLtVpV0pUTmPf7bCfPQZNFLWZxWbkyJ9hBleGSJ40m4xSDAlol6Y
 /93a/2ECm4XD6lixje6S+oRlLQs3C0WwWLIWYu9yAyq17ebbnOZRboJdlyUYYgEALisrADH+
 NlAb5HMxxRSUOm4aS7N6eb/MGw3EJTyPriuw+Q/SwJJCloO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:Tb3sC6qlNO3GGP5/qZqy/aYaV5pEeYIsimQD101hICG9E/b4qy
 nAppQmPHPP4gr5O0tPpTnjAsa9qBrnnPYf3WB7B9uftWfd1VeVEA==
X-Talos-CUID: 9a23:WpLRRW1yu8WtDch8fLjcUbxfPZo0SVfl833pBGiSVER5Fqa7Vm6u0fYx
X-Talos-MUID: 9a23:E/3QiAuP92TmU9bzxs2nrg89N8Ni6KGVDGcX0psMisKZHzVMEmLI
X-IronPort-AV: E=Sophos;i="6.01,244,1684792800"; 
   d="p7s'?scan'208";a="63284596"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel-fitImage: add machine compatible to config section
Message-ID: <c06fd1f96f8f4730b7e737f4174dadf9@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----4D2842DBA1AB19880BFC5E4AF2846DA9"
Date: Mon, 31 Jul 2023 16:31:36 +0200 (CEST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 14:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185145

This is an S/MIME signed message

------4D2842DBA1AB19880BFC5E4AF2846DA9
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

to allow bootloaders to select best machting configuration based
on compatible string.

Signed-off-by: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
b/meta/classes-recipe/kernel-fitimage.bbclass
index f1c46a453c..13e8947f09 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -427,6 +427,9 @@ fitimage_emit_section_config() {
 		dtb_image_sect=$dtb_image
 	fi
 
+	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
+	compatible_line="compatible = \"$(fdtget "$dtb_path" / compatible |
sed 's/ /", "/g')\";"
+
 	dtb_image=$(echo $dtb_image | tr '/' '_')
 	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')
 
@@ -487,6 +490,7 @@ fitimage_emit_section_config() {
                 $default_line
                 $conf_node {
                         description = "$default_flag $conf_desc";
+                        $compatible_line
                         $kernel_line
                         $fdt_line
                         $ramdisk_line
-- 
2.39.3

------4D2842DBA1AB19880BFC5E4AF2846DA9
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
czCCBf0wggPloAMCAQICAgb0MA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJE
RTEPMA0GA1UECAwGQmF5ZXJuMRQwEgYDVQQKDAtEaWVobCBHcm91cDEbMBkGA1UE
CwwSRGllaGwgTWV0ZXJpbmcgVEtIMR8wHQYDVQQDDBZEaWVobCBNZXRlcmluZyBN
YWlsIENBMSAwHgYJKoZIhvcNAQkBFhF4NTA5LWNhQGRpZWhsLmNvbTAeFw0yMjAx
MTYwODIyMjNaFw0yNDAxMTcwODIyMjNaMIG8MSIwIAYDVQQDDBlkZW5pcy5vc3Rl
cmxhbmRAZGllaGwuY29tMSgwJgYJKoZIhvcNAQkBFhlkZW5pcy5vc3RlcmxhbmRA
ZGllaGwuY29tMQswCQYDVQQGEwJERTEPMA0GA1UECAwGQmF5ZXJuMRwwGgYDVQQK
DBNEaWVobCBNZXRlcmluZyBUSy1IMRwwGgYDVQQLDBNEaWVobCBNZXRlcmluZyBU
Sy1IMRIwEAYDVQQHDAlOdWVybmJlcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQCtiK2ROwKpXoaZxHvDoCkAqTh/L+Ymvg8sEV1mk//iOLWtENFkQfFp
3e1scofcCyYWMoJ9QEjKvKAdcFSvjqeczDmKnD8li4vqEukqGJmrNe5p2cQFJxpD
Gy/Pb9CoPtuE7GNMiBgQfX12qHj9sdopLv9nijEtSfCtXiIc+ees3kd9DBPhiiAv
S9t89DUy307W0izYMsUaqcfOWEFT2nLRhXweoPTE0VrSg485uYMdgdTj8OvEs/oB
1cM95QdiqjrWhuhc/JRJk/iyztrXA8gjdsGrk2SlCB2Pcv0tNAbplKw95z00rNRi
pwV+WFkpNRyruO2gkFKYvSy9J1gdXsarAgMBAAGjggEtMIIBKTAfBgNVHSMEGDAW
gBSfy3o0Y/NawX6hlhfGZ+eng6TusjAJBgNVHRIEAjAAMCQGA1UdEQQdMBuBGWRl
bmlzLm9zdGVybGFuZEBkaWVobC5jb20wNQYDVR0fBC4wLDAqoCigJoYkaHR0cDov
L2tleXMuZGllaGwuY29tL2NybC90ay1oX24uY3JsMDUGCCsGAQUFBwEBBCkwJzAl
BggrBgEFBQcwAoYZaHR0cDovL3d3dy5kaWVobC5jb20vcGtpLzAJBgNVHRMEAjAA
MB0GA1UdDgQWBBSjWBEDN4lSGcPnP9UrMtXUFmejNTALBgNVHQ8EBAMCBaAwHQYD
VR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGCWCGSAGG+EIBAQQEAwIFoDAN
BgkqhkiG9w0BAQsFAAOCAgEAgsI+DkMhcC9r5Eit3DLpMRVZzZAYMYpMvwsGPeWF
TF1fTt7DW5QoBhntXHet27YcU10qERLHO9cgXD0QhK5FroUTML3jT1r+Q+YZu0gb
ujpDlKWPJyXkrexgjUOHg+odKJDa50Vr6xwLzE+rgT4wpsUatKay3hwcTGuRQrD8
zJoxfLJ7bhznM8YrUD0fFpoz/8QcvoP2S3Y9wHn/r+gmKF3+6Nbgz7CYUlndENG7
Ul1tUrGMOWvPr+dXYEsqYPRk5eApuuYn/P8ax+GW+RlYm6wHDN3PRUDN/NoGzpuJ
FHTZVLNMPSrFTHdW+H2OPwyQTW6cZ2q+u69jm2Vc6ARXrEjzN5SRmjHodWpt7fUu
B3i6l0b36PFEAS42AO32U+FGsdi2T84KqZJOoohtJQKrTqKYn7aUQn7e3rQbQyLt
BxBO/rbPVjYwi7mUamOcggvIRx0oru3uIpsV59IFM/40lCv5s7mS5RmUudGtVZul
fnHj8b/R4j8S1IQEAzplBjmXX9tSPLy+8TKtT8NBnLWN/LGEoW+/O9NCdGuuRT4h
cgHEWf/AQSZ580/3AUcd/oC35b0E7qnfAZobqqipLqQkO4bYlgzSpazmXddoGcqm
YtVcPwt5SXQ3upyseicvLMLz11WqUmlUI9PKY8Ki+9oFc7SaiplvopQGwIxSQTLl
bQMxggKuMIICqgIBATCBmzCBlDELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJheWVy
bjEUMBIGA1UECgwLRGllaGwgR3JvdXAxGzAZBgNVBAsMEkRpZWhsIE1ldGVyaW5n
IFRLSDEfMB0GA1UEAwwWRGllaGwgTWV0ZXJpbmcgTWFpbCBDQTEgMB4GCSqGSIb3
DQEJARYReDUwOS1jYUBkaWVobC5jb20CAgb0MA0GCWCGSAFlAwQCAQUAoIHkMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDczMTE0
MzEzNlowLwYJKoZIhvcNAQkEMSIEIGaAyZEgVFglM0OLjp8aWt4j558TiqiE2Waj
n4EVDfGfMHkGCSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqG
SIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BIIBAJOjv5dHFQlO5AYEhR0LpWPpmzPSeqA90YKja8haHC0XSfm3aQdkH2TSlC8d
WoDPMcaqSefyXrk9qE5RI2REEoDMlTqEEakStcRx8i8IBpxix3qxgO52ldUgBGCx
J1tRJx2pOJ+27Kgh6RaITomI0rFFFTgGWUEk/pycCjZGcxNqjQiDOTnXug0aZVgz
qIa4R3ShLQDhWwNEr0+tKIFRKRcdx0agpCoq/6RDpt0zn5Y9ZZgQfYUBXvwLF/qu
HuE48VwKEGY41agjbxSgo9P6++DBHdQCGXd5SjfNAicOYPTQTTfW4KscDCyALdVl
6Xpsqso5+HWAiEC5bKb8LnzhVp4=

------4D2842DBA1AB19880BFC5E4AF2846DA9--


