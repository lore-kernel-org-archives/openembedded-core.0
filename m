Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D2B557F276
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 22:51:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v4so366031pff.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yr/9KkI587BcxP0I5hzvDTkodP0+LBUbRBbD7BinzrU=;
	b=dG0n9fIlA+41PCQlfBPCccUO0w3CqRRf2F0tO4xGp4+Qp7b/Xz+4JKQoCq+Y9BPFWG
	x0qo0ZL8D/AKqKSneuh/a204LVFSNma8yB01IumUuAbLub+Fh96p3MiaC6k2lodbNYJM
	5Mno/x0ZvBxXAk3XaG1FbnnSyyD2eiW4WXs4qmIZb8ak5K6WZN+t5uaM1llnRt2quvNm
	bkMWuJfUY4+EQMJ+IDXvfG8gw5OI0RYx5iWaWxI6nUJTQjlS8thNQgwgfIOCXHLjGyMN
	GtpKHNZoEzGhV6tmnqT+yexyKF5i5tpybxwqd+d/sPopLsKZnQoAdCDPI4i4iY7inOoY
	Sqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yr/9KkI587BcxP0I5hzvDTkodP0+LBUbRBbD7BinzrU=;
	b=E4jp0QxekF4nydUDEXTT4O5HIB2JSnpwFLhahMSzA5zsvjI5l3dBZU/dC2bMjYfQ10
	MDyIyCdIdK9mvSFcIw5KUwk9359FwLxQ5CNema8EM98lJ2DDBF7644raGSVZ1PADHdOm
	TagC+y+dL3CGbOMdASwuMucP64f17O97X7TtrIgB1BXwGhGpI+H2vSs7ZjQdssMa/Y37
	gvR4mel3/hGC3T/D2Xcwnq8coOJp3QLeCDHgGePaLM2yW8xFNRG+WaFrPC0CAHRf+xOE
	1HfqZ4N+6fvUld2UJkHEix1Y0GB2Lgl71S+XvsLWejpVhXDp/DB4xV7zPrk5YnJX4Til
	TzKg==
X-Gm-Message-State: APjAAAXWvyqBFBPWTivLu4CQbZw2n4CmA1BKsu4mqZL1Z1IiZR7A6ezU
	E5+KEWuQLlMEMBThsOj2RcG/YROYM48=
X-Google-Smtp-Source: APXvYqwcPGp78TCN9YcBC13oLAg0GxohVVrOYgHOZvK8YJ4Gg1RqeFq0/PHVr3jjSeEKTiPJC8HetA==
X-Received: by 2002:a17:90a:183:: with SMTP id 3mr6212431pjc.63.1569538280238; 
	Thu, 26 Sep 2019 15:51:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	132sm3197725pgg.52.2019.09.26.15.51.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 15:51:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 15:51:10 -0700
Message-Id: <20190926225110.2985258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] packagegroups: All groups are not allarch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Sep 2019 22:51:19 -0000
Content-Transfer-Encoding: 8bit

Some of the packagegroups violate the allarch policy therefore the ones
which do so, should be marked as TUNE specific

Fixes QA errors
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-graphics went backwards which would break package feeds from (0:1.0-r13.12 to 0:1.0-r13.9) [version-going-backwards]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb    | 2 ++
 .../recipes-core/packagegroups/packagegroup-core-tools-debug.bb | 2 ++
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb     | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index f5b2d69cef..2a54f1ca3e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,6 +1,8 @@
 SUMMARY = "Target packages for the standalone SDK"
 PR = "r8"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup
 
 RDEPENDS_${PN} = "\
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 9fc2b0ef4d..81fbdf4608 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -4,6 +4,8 @@
 
 SUMMARY = "Debugging tools"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup
 
 PR = "r3"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 9b0ae0d1c2..ee9d0636f2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -6,6 +6,8 @@ SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
 PR = "r13"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup  distro_features_check
 # rdepends on libx11-dev
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.23.0


