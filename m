Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2924.1600900277860838693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 15:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=Ft5KlEJn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.210.169, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-pf1-f169.google.com with SMTP id d9so565061pfd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=aZDaZRA5GAtm+fcqgrcLYVy4eCyPjEuAg5EYYeXxxRs=;
        b=Ft5KlEJn5BgGXSqGN+LDLLxB9ZZoJRSh55WZvzkANGlSV7ID6QsBZM70ERJy2e1/H/
         EIRR9rTld7VSVoa/BTenOjDfy/WvPlo7H/eFPESs3RPl0EXtkxT5Pz/zdeOt1gVRlP97
         dNbeOfZDfy2KqOqI0XWuSVB8ryEEZ26uR8XiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=aZDaZRA5GAtm+fcqgrcLYVy4eCyPjEuAg5EYYeXxxRs=;
        b=du7J9wBQfMHkcHV2vNn9X18pJnBkhMNDs9KNVbmh9VG2u0cLUQbbwjkuXor5Oj5+jX
         DuS+663mR03p8nuZRSew17LHl5H+lXM0TjOjd00FPjpB/cyFGff+kaIBbONa7ZzsPAjq
         8HZEm31i48xhRorTUmjPBQfh2sYiMP7RL5hDtuuc0jgauEGBKOlcOVPlowQFUjXii6PY
         uic9cRpa6GEGz8jGhzhWI8xhrUZQJxcxxoDsE9xbuq1oI4IpghsEnWgmZPqPyHO1YgPS
         bO/aI0nxzWjajc2fww6Xo46wfUySwKHZ/qJlSqzzzEC/bP7IraKFtPSkSDA+YrL9kMiI
         G4FA==
X-Gm-Message-State: AOAM530TVhKG23aVcEEJA9+kT/iYAulqOIiVAmUGhwt2qeYzwa9RWfiR
	5MlBOf/rYdEHzGoHsh5u1H0eVM5hun50WnPg9fNUJTAeqcmXv+1NTt2xkAT2bRHpz1LKDySWSRW
	qWXl/fLEI1o+8HPaZIggmqrArYbKG2kT5r3BEkrOF6mYz8rGioXFRYrdzdw/51mAnCmS/Cq8sef
	cy6eOxnt4LdDb/+nbHjV3JujuWXQ1NDVo4Bsg=
X-Google-Smtp-Source: ABdhPJxZTIwdZ9igAnmPes/DhBxyk/0SH68wohfVR2NNGhaSAtzKnkvcg5kQE7Ea94p0DdwFdU+jzg==
X-Received: by 2002:a05:6a00:792:b029:13c:1611:652d with SMTP id g18-20020a056a000792b029013c1611652dmr1697892pfu.13.1600900276846;
        Wed, 23 Sep 2020 15:31:16 -0700 (PDT)
Return-Path: <jonathan.richardson@broadcom.com>
Received: from lbrmn-lnxub108.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id a1sm614934pfr.12.2020.09.23.15.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 15:31:16 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [OE-core][PATCH 1/1] cortex-m0.inc: Add tuning for cortex-m0
Date: Wed, 23 Sep 2020 15:31:09 -0700
Message-Id: <20200923223109.39388-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Groupsio-MsgNum: 142745
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005a11c305b002a4f6"

--0000000000005a11c305b002a4f6
Content-Transfer-Encoding: 8bit

Add tuning or ARM cortex-m0.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta/conf/machine/include/tune-cortex-m0.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortex-m0.inc

diff --git a/meta/conf/machine/include/tune-cortex-m0.inc b/meta/conf/machine/include/tune-cortex-m0.inc
new file mode 100644
index 0000000000..a59c8af941
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortex-m0.inc
@@ -0,0 +1,11 @@
+DEFAULTTUNE ?= "cortexm0"
+require conf/machine/include/arm/arch-armv6m.inc
+
+TUNEVALID[cortexm0] = "Enable Cortex-M0 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex-m0', '', d)}"
+AVAILTUNES += "cortexm0"
+
+ARMPKGARCH_tune-cortexm0 = "cortexm0"
+TUNE_FEATURES_tune-cortexm0 = "${TUNE_FEATURES_tune-armv6m} cortexm0"
+
+PACKAGE_EXTRA_ARCHS_tune-cortexm0 = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0"
-- 
2.20.1


--0000000000005a11c305b002a4f6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
vHaK84VoWnHQcLUkaMiN0X7XM5C6vIo8yhBhA6BaVus/5I1NTLPbKuo/kWuFjk2Fpoe66YLtTn3h
RoVB1OA8ItIQN/sCAwEAAaOCAdcwggHTMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEw
gY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVy
c29uYWxzaWduMnNoYTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFs
c2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNV
HRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJz
b25hbHNpZ24yc2hhMmczLmNybDArBgNVHREEJDAigSBqb25hdGhhbi5yaWNoYXJkc29uQGJyb2Fk
Y29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJ
nXsLYTAdBgNVHQ4EFgQUa5kon5XwHZRSZkX5IOJpNb4vbw8wDQYJKoZIhvcNAQELBQADggEBAAaL
wxrc2inAZlHxB3cfK6JxuQI5tZBg5stkNrv4jQ//mOyUsTYCAOip2b/YYrczxaRRBGrSAh7mNVfS
pKyxl2zd/0jj5nwLv9xy78GL89xD/mVvd1gXADqQDTFjHNH3Hqg1lu3vtWq1tOFxdyrDsX8cYkUv
8MIM4iHV5TYM99qNGxKbj/ZNdcHYBO45IIFNG/nqe7nPkQ7ikilr/Y1+DGpVwesuxm9x2ZiRPlBN
MtXVWdVK2QyHMXHbJoENTaUb8qPrzI4gwF9C9nrQBYIJx45s9AMLn/xozqDMyJXqFluyQjJdwv2+
BdZUGnCAtzSgrEru5ffGcSvpzK+qArTc7UYxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2ln
biAyIENBIC0gU0hBMjU2IC0gRzMCDH8hIsPI4q59Cxj1yjANBglghkgBZQMEAgEFAKCB1DAvBgkq
hkiG9w0BCQQxIgQgBqevV9vLTs9DTcKaugYJB0w+7uKiNBqaqGEPmVhL61EwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwOTIzMjIzMTE3WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFUs
R6SgO88fezHjyKskSZqpYct063janfvFPC2YX8VKdLwQkt+FdGJVuRDyRRoAS6bW8T3czfMy+73a
c0IZAM+m/1oGLAgC8Qq9SlzCabCJffSkdJe7OuQDeK0TY4XWeerTGU+iAyB0VrTfGBymP0zuBNg3
oQ5Xh3bTaLZYhOtEcr8bGyLYQVHfDEszCgDt0AqPgkbps1PZB98u9SIlvcjzRU92dOZhs3ep2Ya5
dQb73BQ92PSzbUQxZlMeydeUBg3ov4geqTmPWbf9gRodKEeTVSkhsGEkOdC/1IvYfEETJTNVpZ3v
wWMlBtOfCFv+80RMN/knKKDgs+1IKOsoNgA=

--0000000000005a11c305b002a4f6--
