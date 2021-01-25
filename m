Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.4129.1611615492777691331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 14:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=UJmVireu;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.216.68, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-pj1-f68.google.com with SMTP id gx1so590788pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 14:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2+PXy9sn1wH0qQspXyNzXwpFCsQb7xv5eB0hHhta1Vg=;
        b=UJmVireu6mjBUKqdHlhKk0PDmL2yQMaLnXqQG4NE/W/qdZBuo5oRyv86518BYzmsWa
         iwKiXJvRORqT2qO08D31aVtLreCTYDY3B6syHnBHYx/qT+BgaKnnK4W7T0FNDDE0Dy9l
         YiXCcy4AQ8VC1q/D0qW+pe+1QCd4DZi++euTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2+PXy9sn1wH0qQspXyNzXwpFCsQb7xv5eB0hHhta1Vg=;
        b=tDz8gIyr51WbsqkxybbFeprG1SPbmSsjRP4zn87OmTdxIkMKZDZGYLVC0KHnR0CFxE
         MEiKPiiIs/jS7EEMWtEH4hRr2zdJY6u9n+gEK3YcIVlWeHwMZK/c8n57H66z6zK1w8DF
         CPtgIiWokoueJLPQStDsaO5s6ro9xlxhNnk7Pbbd3noUgKQXbg5SEDHL+jzDz3gSnth8
         Wq/fOvWro5knqwEwYvwCddBCRkyAaPdqV0Aw2EZ/hUwlPw9N8kSWPXWvlUPTmv6RNMFM
         /6xMS4ItGWqg1HZZYs/zAnJpjEVVgPtjxKWCodU4KWIEgxyJ9ZQ+KWR34GqFaJFiLI2P
         +MWQ==
X-Gm-Message-State: AOAM533u6f4m9yZovGWmMX8rLpKfKtaL4S6s8GTUquQc+2OmcTx48sTh
	BWtaMtIZPESBzd98YzhtCcCwtJxfdl01cM0BY8/m7hl1SiTkTlYGx3suxdXQpKqPjuQFFMonF9T
	uwKeBfrcXWsL5TGkJAdbe9tamr58tuPfJ9Boz5o4suw5yDZrerb7NI0yRVBV3Sfi8umFTdoOc/l
	7J7xAdy4KNJwtbbCeM4lx1ai5sD0zG4f9DjPI=
X-Google-Smtp-Source: ABdhPJyWl5Zt6hqoFNoavFu1sEiblgUD1aHN+v+N6Sg2XdEHwu1SoR+TBDexB6ZidYwEUD/qOIRR9g==
X-Received: by 2002:a17:90a:b78a:: with SMTP id m10mr2535006pjr.164.1611615491708;
        Mon, 25 Jan 2021 14:58:11 -0800 (PST)
Return-Path: <jonathan.richardson@broadcom.com>
Received: from lbrmn-lnx108.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id ge16sm370288pjb.41.2021.01.25.14.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:58:11 -0800 (PST)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [OE-core][PATCH 1/1] core-image-tiny-initramfs: Add compatiblity for aarch64
Date: Mon, 25 Jan 2021 14:58:04 -0800
Message-Id: <20210125225804.36963-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
X-Groupsio-MsgNum: 147226
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f0c6d805b9c178a0"

--000000000000f0c6d805b9c178a0

Update the host compatibility to include aarch64.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 5849900742..47470849ed 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -27,7 +27,7 @@ IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
 # Use the same restriction as initramfs-live-install
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64).*-linux"
 
 python tinyinitrd () {
   # Modify our init file so the user knows we drop to shell prompt on purpose
-- 
2.17.1


--000000000000f0c6d805b9c178a0
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
hkiG9w0BCQQxIgQg/Cuf75UM9pcOxsUXdf1wr1mohgeehfXiX0XQKLqc5pkwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwMTI1MjI1ODEyWjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAI0X
CcVQIA+BLGh4+7BDQJG+s6XEme3Aq/9ZR8L/5RW2KEPVonjuixRn17mCe0nZCRX7pLY21MEAtzsa
mO9H1vEe1ZT3rjXwMyNWBXKHS5gXdoda5kY9bKGwi3Cz9NHrUrDa6VbY9WlPiQ2NVgznTIrxefdD
Q/RP7FTZefrSf0/7lucman/C6wK5B9RKoRm9qU4g8gsGIe7ZykyfE3W8oooVrzK1piDvxnR6Sz0+
ystj+uwHGIazPPE9lfauLR9KeYC/l7IjPITQyGVKUmdendQd98Hrwscya9SuQyQz3m4MoxdHQF/u
kzP1fCbprVE4wiAC5gf68IXkaOl+ekvNqB8=

--000000000000f0c6d805b9c178a0--
