Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.22853.1627645516317263694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jsuIMUpN;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id b13so81741wrs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f3ZbCdAyzEjGmbObYzHkgERdEq7GvDMHC6Gru2+KKOg=;
        b=jsuIMUpN9mPnFZcN86k8DU6UX9iYCv2hkm434Gdnet41a2dZivoONhI68RexvxF+AR
         f39RzytdXbCDsrBIJH3IWBVEMeHmaF3T3wQ2cTAryml92lsMil5RlQ5Yijc/t0Pf+jI8
         /QdyEkyB6v7kCeTnFRRMxgUAMfYvu9dlG2yj4NZRxKNs4eaBk5tYoo0QYxbMOSKBvkAw
         zyW0mVql/V43uUq7OqBBjgND5jKQwrxFKa7EKEK1s+KT+9WTnlohf94F00bm/gP+9+Zu
         J3d1oglPqPOaMXyHR4T69qcRB5lQo8ArSjsslVi1qi8/DS5HJ81a7FKQIi/I82R0k+vn
         lOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f3ZbCdAyzEjGmbObYzHkgERdEq7GvDMHC6Gru2+KKOg=;
        b=D9NwRoWJDlGaH/krSkvRovxFaVSiaoaoIsokoshkF4z8CEaZ/l8e44OayypCCamtgU
         gnoBRvQWzJ7BKtrhGtVI4/UW6lNEuM9Z8pKDTS32WwI/kiPOuN+DNoxjPzHIYVYTbTYk
         GpD//8IMJZATFuTqBp8dwNrSNLIPbGpqoH0RXcl2m9DYzMcoG9QBLL7UPpzctsSFuqKd
         KxPDbc0LVXFm46TQASJ02fAlECv6M/Zr/iThtuGgM153dQ2h73XtfSlue4QV7z+JTp9m
         Xzuw1Y52mAfX1MSbdcLD5hQPQKq7RS6DMPJfUWSX4S9tBDsjvlVWqd+pTxVrmgyX8HgU
         7hlQ==
X-Gm-Message-State: AOAM531b+qQXegeb4NVs8W0K8uDDN6Xv8oBB93H5hYmjE3bFiiHT4if4
	70fUGAmnDEzXjHtvKLiYCTyIL0pyiyg=
X-Google-Smtp-Source: ABdhPJy8ayrn3KZUx/SZ28uJQHg/nhXVmlBFavwjQ+bhytowB3kIrsl6VbCmR7U3Mgt4cuUXkY2WIw==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr2564475wrj.143.1627645514925;
        Fri, 30 Jul 2021 04:45:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/9] iputils: update 20210202 -> 20210722
Date: Fri, 30 Jul 2021 13:45:02 +0200
Message-Id: <20210730114507.732448-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop rdisc part from 0001-rarpd-rdisc-Drop-PrivateUsers.patch
as it's been fixed upstream; rarpd still isn't.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 31 ++++---------------
 ...putils_20210202.bb => iputils_20210722.bb} |  2 +-
 2 files changed, 7 insertions(+), 26 deletions(-)
 rename meta/recipes-extended/iputils/{iputils_20210202.bb => iputils_20210722.bb} (98%)

diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
index d7367caf78..c61e39dc80 100644
--- a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
+++ b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
@@ -1,20 +1,20 @@
-From 6e51d529988cfc0bb357751fd767e9f1478e2b81 Mon Sep 17 00:00:00 2001
+From dfeeb3f1328d09f516edeb6349bd63e3c87f9397 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Thu, 13 Feb 2020 06:08:45 +0000
-Subject: [PATCH] rarpd: rdisc: Drop PrivateUsers
+Subject: [PATCH] rarpd:Drop PrivateUsers
 
-Neither rarpd nor rdisc can gain the necessary capabilities with
+rarpd cannot gain the necessary capabilities with
 PrivateUsers enabled.
 
 Upstream-Status: Pending
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
 ---
  systemd/rarpd.service.in | 1 -
- systemd/rdisc.service.in | 3 ++-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 1 deletion(-)
 
 diff --git a/systemd/rarpd.service.in b/systemd/rarpd.service.in
-index e600c10c93e6..f5d7621a7ce8 100644
+index e600c10..f5d7621 100644
 --- a/systemd/rarpd.service.in
 +++ b/systemd/rarpd.service.in
 @@ -12,7 +12,6 @@ AmbientCapabilities=CAP_NET_RAW
@@ -25,22 +25,3 @@ index e600c10c93e6..f5d7621a7ce8 100644
  ProtectSystem=strict
  ProtectHome=yes
  ProtectControlGroups=yes
-diff --git a/systemd/rdisc.service.in b/systemd/rdisc.service.in
-index 4e2a1ec9d0e5..a71b87d36b37 100644
---- a/systemd/rdisc.service.in
-+++ b/systemd/rdisc.service.in
-@@ -8,9 +8,10 @@ After=network.target
- EnvironmentFile=-/etc/sysconfig/rdisc
- ExecStart=@sbindir@/rdisc -f -t $OPTIONS $SEND_ADDRESS $RECEIVE_ADDRESS
- 
-+CapabilityBoundingSet=CAP_NET_RAW
- AmbientCapabilities=CAP_NET_RAW
- PrivateTmp=yes
--PrivateUsers=yes
-+DynamicUser=yes
- ProtectSystem=strict
- ProtectHome=yes
- ProtectControlGroups=yes
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/iputils/iputils_20210202.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
similarity index 98%
rename from meta/recipes-extended/iputils/iputils_20210202.bb
rename to meta/recipes-extended/iputils/iputils_20210722.bb
index 02a303782e..b5a774073e 100644
--- a/meta/recipes-extended/iputils/iputils_20210202.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -13,7 +13,7 @@ DEPENDS = "gnutls"
 SRC_URI = "git://github.com/iputils/iputils \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            "
-SRCREV = "cc16da6b574ce6637f3e6e9ab3c1a728663006ff"
+SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

