Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id BDC1E6BE81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:04 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so347884eak.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=E3K4c33edThyACbrTPKKKFNY8CkNTF9Ebd3FNj1WaLs=;
	b=ZLB6gVS/Dk2yz6+um3yLCSbWFFlycOTShr5i8cb+o6mw3sUM+R4Lny6UNUg0BDme29
	JPv8wytGdf5HVUGW07SUBG6RkO489FyUpoMYtyCelpyw3tbXXxRvuUgOJawdd6ndmMaH
	s9XdIpzMxjOMCb7lxWUk35Dev4cDoWRveGXnfR93eX6Ly7qn9Q5uDAPsNsbdU9cVXyAi
	qiAhBn3eC1Cnv75LaWW0IQPbmZ1fUaqoQpfWDNmPlX3td+AuySn8tmch0OcZf34s+zgi
	ujeJSXijUCt8Ffi2Lm+Zbs/oetfBvlfOnRKOIO2A+q9kMXBwTy79U6o7KQgijzYvgqeN
	vpGw==
X-Received: by 10.14.4.1 with SMTP id 1mr5503591eei.21.1377792125211;
	Thu, 29 Aug 2013 09:02:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm47247495eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:55 +0200
Message-Id: <ec8f1bdec56b09ad884f0c19fb5e4eea256e846e.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 08/20] telepathy-mission-control: Add PACKAGECONFIG for upower and connectivity
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../telepathy/telepathy-mission-control_5.15.0.bb                 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
index b2736ca..ba80cc1 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
@@ -12,6 +12,14 @@ SRC_URI[sha256sum] = "88800d1b5f385e94b34721319ff4fe65c493632954d7229b36e57af5b4
 
 inherit autotools pkgconfig pythonnative
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
+
+# to select connman or nm you need to use "connectivity" and "connman" or "nm", default is to disable both
+PACKAGECONFIG[connectvity] = ",--with-connectivity=no"
+PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
+PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
+
 PACKAGES =+ " \
 	libmissioncontrol \
 	libmissioncontrol-config \
-- 
1.8.3.2


