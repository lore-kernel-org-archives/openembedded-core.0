Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 565 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Aug 2017 01:01:20 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 92FCA60268
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 01:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1045; q=dns/txt; s=iport;
	t=1501808482; x=1503018082;
	h=from:to:cc:subject:date:message-id;
	bh=C1epLANct8oVYGXDfobNvdGixa1QYCS0gjWbFyeGFT8=;
	b=HgYZBUQE8/WD91Je8+YQSceYkNxqwQE1ZcQ4zTWHjgRG8mnuKXFGPb9D
	wqyzuGejyuJf0mZvT6X/QIBVlzulW8RqlDlfwKlGYt2v9ZlsYhEKy+/5T
	uL95fI6fb4KQIknW18rF81vz9VaU2xAfP5QZwJDllqaLcgxumuxT+2QdC I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AJBwB/xINZ/4UNJK1dGwEBAQMBAQEJA?=
	=?us-ascii?q?QEBg1pkbSeeF5oVJIUjhEFCFQECAQEBAQEBAWsohhiBUYovsACLQAEBCCgTgxW?=
	=?us-ascii?q?CAoFMiUiBAYUoBZF9jgCHU4NNBYkIApJEApYBNSKBCjIhCBwViAMgNoZsgkEBA?=
	=?us-ascii?q?QE?=
X-IronPort-AV: E=Sophos;i="5.41,318,1498521600"; d="scan'208";a="278451994"
Received: from alln-core-11.cisco.com ([173.36.13.133])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	04 Aug 2017 00:51:56 +0000
Received: from localhost ([10.41.50.199])
	by alln-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id v740ptJJ023728; 
	Fri, 4 Aug 2017 00:51:55 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Aug 2017 17:51:54 -0700
Message-Id: <1501807914-5394-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [PATCH] recipes-kernel: linux-dummy: provide dummy vmlinux package
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
X-List-Received-Date: Fri, 04 Aug 2017 01:01:20 -0000

oprofile package depends on kernel-vmlinux package
through RRECOMMENDS dependency. Thus provide it
here to satisfy dependencies.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 994ac74..e1c7f76 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -13,10 +13,14 @@ PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
 PACKAGES_DYNAMIC += "^kernel-firmware-.*"
 
-PACKAGES += "kernel-modules"
+PACKAGES += "kernel-modules kernel-vmlinux"
 FILES_kernel-modules = ""
 ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
+FILES_kernel-vmlinux = ""
+ALLOW_EMPTY_kernel-vmlinux = "1"
+DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
+
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.9.1


