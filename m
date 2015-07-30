Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 78EB176534
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:57:05 +0000 (UTC)
Received: by igk11 with SMTP id 11so19386626igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tklHIsqOJDpc01Pxz5XWSw5rnhm3S+tfwnQUCI3lgkk=;
	b=VFESPoMEJ0phxiVpZmsZL3l7JAevm93O0pAy4W07UEJhELn97ISKBE3wJzDtZJNnOc
	eqT5/2rtzxhJpaOkhpj59sDJVXD0euC19UqKZ15urVtwWdOHWwaAvDoPNnCzZ2yWHI3Z
	plVuhjHmC0E5+eCo5T51vhglulz1Z5jyZ4NCLBcg8L203bazc18cno2381+ET8vAHbTV
	1R5bweWRLlVr7gwcuPRSHkOJE51sZYFnf+7jxYH/BAbkOpJFCYMGCMmbKioltJuynCNo
	ypnPbsSeDhSoPl2PrCqEnAsIwQCgup5oaEQFfJjHQMA6U1073HyxxgpRB5qU2gDO61z1
	zwsQ==
X-Received: by 10.50.138.231 with SMTP id qt7mr31502igb.96.1438289825448;
	Thu, 30 Jul 2015 13:57:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a6sm1530978ioj.1.2015.07.30.13.57.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:57:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:56:28 -0700
Message-Id: <1438289788-23120-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
References: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/7] busybox: enable support for sha1sum and sha256sum applets
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
X-List-Received-Date: Thu, 30 Jul 2015 20:57:05 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/sha1sum.cfg   | 1 +
 meta/recipes-core/busybox/busybox/sha256sum.cfg | 1 +
 meta/recipes-core/busybox/busybox_1.23.2.bb     | 2 ++
 meta/recipes-core/busybox/busybox_git.bb        | 2 ++
 4 files changed, 6 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
 create mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg

diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-core/busybox/busybox/sha1sum.cfg
new file mode 100644
index 0000000..20e72d9
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -0,0 +1 @@
+CONFIG_SHA1SUM=y
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes-core/busybox/busybox/sha256sum.cfg
new file mode 100644
index 0000000..ce652ae
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -0,0 +1 @@
+CONFIG_SHA256SUM=y
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index b84f499..8a4bae6 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -33,6 +33,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
            file://0001-chown-fix-help-text.patch \
            file://mount-via-label.cfg \
+           file://sha1sum.cfg \
+           file://sha256sum.cfg \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 71e6c13..ade72f4 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -39,6 +39,8 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
            file://0001-chown-fix-help-text.patch \
            file://mount-via-label.cfg \
+           file://sha1sum.cfg \
+           file://sha256sum.cfg \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.9.1


