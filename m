Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8A3605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:12:18 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id r184so21376634qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ctFrO2NN4WKNNvFZkXF2UU6NXKifLKZrzM8UyaHdHkM=;
	b=BlBPu4m1RYZxG0dUByvpL57mnDFe0C7TOHlEk+WAe7L2LEvk4zF0YncxTP9MjTT7ZI
	fDpgAZnxOGP/M9pw7cKiRJCnwFqiysdYM5Pg9YDTGRRTaKFTIOdQd6EnKWka9ZWSqIRJ
	/nT3KeKlbHsNerhO01NJgX4NzaioTKobtwB6iEoxVSDvVfqR+I6B2A788f/5zcleZYAM
	LjuLOrzMf7A1qvm2jZQ4fXiN7t3LsHt2zoVj9QuMpJp5ISet9IlbfX7GmAkYg4/6zs+f
	PC0GJFrjEPzz1s+aLw+VSQ4BcNo9ply9NhLTljG4B8gj3x/uz0qGXK8xyhDE9h6Kk5lb
	oh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=ctFrO2NN4WKNNvFZkXF2UU6NXKifLKZrzM8UyaHdHkM=;
	b=dqKWUspydUgnP8DliqWqfdmWACp03YTkCFeYGgtJJ6cjEEble0KvPe0a72RRdHSFZ9
	1+goHy1oOzfelMwlPflO7r9UW3cTolOzUU/EBfdpgomWqy8NwwnpXFkA2QcR6u625jJm
	86pGkVPzqNY8DCeOVqyu/XEYutCwQqutdaeYSg6r6ddQHNgOp5oqjP1inw88oStQILEN
	p7DTckYk89UZwJIUywA+5GcduU91os4SFVcWEp9hlEY8xLejfvHkdV0zhS5H6DLjCH5g
	p0craOu0bgnSBUAMaUwOH+in1C/WPh/SXvU5MNpAOs/SDUsn6/gMUIBJtki1qXDRQm7g
	71fg==
X-Gm-Message-State: AOPr4FUtxZKUYVAtLoz4BnGVu3pvi/uol8y1LBMI2ZXavHSNCBzgRS6Zn86nI+v1g7LKuA==
X-Received: by 10.55.201.216 with SMTP id m85mr12313694qkl.42.1460563939497;
	Wed, 13 Apr 2016 09:12:19 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[99.224.124.24]) by smtp.gmail.com with ESMTPSA id
	y123sm16264104qka.0.2016.04.13.09.12.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 09:12:19 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 13 Apr 2016 12:12:12 -0400
Message-Id: <2d1a55316bcd38401dab1fc2777c8eb292c27c32.1460563722.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto: tiny and pin ctrl config updates
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
X-List-Received-Date: Wed, 13 Apr 2016 16:12:19 -0000

Merging the following two commits:

 ab0d998117cc ktypes/tiny/tiny.cfg: support /proc/sys
 349e9ce59f7b features: enable pinctrl driver for Broxton

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 521eff41246a..a1389572766b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "28d8cfdbcb18a6eef202099cca66430fd3b6eae0"
-SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
+SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index eb830ef4c49b..cb245eeb913a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "328830680bc35257c83fc400d9d8e2ae94d86f77"
-SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
+SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 62cf57d49536..28c72132ae8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
-SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
+SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 00bdcf74d33d..2821f448e7f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
+SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index d8e864394f57..aecb517ed7bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
 SRCREV_machine_qemux86-64 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
 SRCREV_machine_qemumips64 ?= "b71e4cd7d45f03048ad31e2a36dfe5a43f021b51"
 SRCREV_machine ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
-SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
+SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 76d45f7e9ac5..5509dd697bfb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
 SRCREV_machine_qemux86-64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
 SRCREV_machine_qemumips64 ?= "88fb42ec863d20ccde57dd35da06d6221cfb4c03"
 SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
+SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


