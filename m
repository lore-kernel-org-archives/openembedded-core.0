Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 70B1579551
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:53 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id l5so8471474edw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=krCnXbtfvMUmHa0RyOBWw6kWw1x2sXKIeUpn99oPlEc=;
	b=mxml3B2yG7rUSL52C4sNdGL+M4uiu/92eCj2iNMDfeHtr4FMVaqBmsQAQ1we8m9cQm
	tP3DB15WF4GVCrPE+TtbdFA5zkQNaglUwLaE/783onaA6bPR+19XtxFd/Mg8c9H9oXBr
	LazMxpQ4oGL4I4hGifyXhGNA9j5k9Uj5wProYxFss62GxUORzYXDfOsBXpm6e3YVrZAe
	BMujx/BS7KvIcMW/eIoyXW11vepqZAeujxsnCb0m5sZEdFYDOuQOOSLc19NZ9Saa1ehu
	uqmmuSu5Z2v2O67Gq8BiG/3z/y5oczJqNMLiL+BzQFF5PE3pafdT5Jz3QDBaihfHFbN+
	TU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=krCnXbtfvMUmHa0RyOBWw6kWw1x2sXKIeUpn99oPlEc=;
	b=tsgUce2UZhvX8tnIOF+tr04EwKmdHWzb1Yt3B9QbxYDPEUp4QjTsdpLsUc1FElg5DB
	W6En6xPxjwZsqosTKeAUOpuRb7vbktqnrXeUI55w0VOssOO3E7KgCwJhP4iU2ekP8qn4
	Zrd6gArMAdOhnjNXF7bKG07D8I9Ux+yf05CF62XBSlD1F3LKxmGwu7jtSFc/fj6UO/tJ
	stwEd5XvP7EOmt9PCtvmYI06bFiC+D+q3PuM3s+0bXbRa2MMYWxIowmUsW4KpsIJlm2y
	T3mCW2PD2PXXm8MkF3d6xS55AhkR8hMs5lqqDa7o67MwGDYRMyy2/Iccb46CdrB/8rEb
	JTpA==
X-Gm-Message-State: APzg51AfsoSzyxn6LyKXokpd7JshV+nSZ37VpTAl+iHCjTNI23JVqh66
	QX129wMhBzl0tX8RJygnGDEkd/UUuBA=
X-Google-Smtp-Source: ANB0VdY+fyM2naGWzLmvDztt/yiP21kE9cX4L9d/uWzsSyTsG8qTsASkj9OWcCJe/pNwtJPeZBbxXw==
X-Received: by 2002:a50:acc6:: with SMTP id
	x64-v6mr2847629edc.152.1536229794083; 
	Thu, 06 Sep 2018 03:29:54 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:24 +0200
Message-Id: <1536229770-29600-15-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 15/21] gptfdisk: update to 1.0.4
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:53 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb | 26 --------------------------
 meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
deleted file mode 100644
index 4d617e3..0000000
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Utility for modifying GPT disk partitioning"
-DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. The related FixParts utility fixes some common problems on Master Boot Record (MBR) disks."
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "util-linux popt ncurses"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "07b625a583b66c8c5840be5923f3e3fe"
-SRC_URI[sha256sum] = "89fd5aec35c409d610a36cb49c65b442058565ed84042f767bba614b8fc91b5c"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
-UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}'"
-
-do_install() {
-    install -d ${D}${sbindir}
-    install -m 0755 cgdisk ${D}${sbindir}
-    install -m 0755 gdisk ${D}${sbindir}
-    install -m 0755 sgdisk ${D}${sbindir}
-    install -m 0755 fixparts ${D}${sbindir}
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
new file mode 100644
index 0000000..4426a79
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Utility for modifying GPT disk partitioning"
+DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. The related FixParts utility fixes some common problems on Master Boot Record (MBR) disks."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "util-linux popt ncurses"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "5ecc3c44913bb6b53d3708d1ac7ac295"
+SRC_URI[sha256sum] = "b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c7ba78d"
+
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
+UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}'"
+
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 0755 cgdisk ${D}${sbindir}
+    install -m 0755 gdisk ${D}${sbindir}
+    install -m 0755 sgdisk ${D}${sbindir}
+    install -m 0755 fixparts ${D}${sbindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


