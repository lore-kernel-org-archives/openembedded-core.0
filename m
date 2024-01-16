Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35B3C3DA79
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 02:07:11 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.1915.1705370820987002887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 18:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="125623980"
X-IronPort-AV: E=Sophos;i="6.04,197,1695654000"; 
   d="scan'208";a="125623980"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 11:06:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55718D4F6F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:06:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 910ADD3F0E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:06:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B05C2007911C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:06:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80AC21A015E;
	Tue, 16 Jan 2024 10:06:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Jiang Kai <jiangkai@fujitsu.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.5.3 -> 6.6.3
Date: Tue, 16 Jan 2024 10:06:36 +0800
Message-Id: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.004
X-TMASE-Result: 10--14.647500-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yaoXHZz/dXlxnJdsOLB4zv4H4DTIEE89jIPz
	90d6wOer3ZZqXKldRGpIgilQXFMP3hJ9iHh+ACxVEVuC0eNRYvKvMPxisLn2/PlXhf/rkPBva0J
	IfS3uZNfmJG75UR/dPO/7OzGFceIV/ayzaxBypN7wgrvJFY9E0U3yuY9BGW8r4b5mHdaFMyB1Bf
	2N9jgTILC5SiuoLTMqbCkj46gswJKlZLnvzbKlsjyjd/AizytBEITY2UGMiNwH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJoswrDggcQ6d1uLHENGl+3A/5UnqVnIHSz6G5P8xDq4BXIY6e
	+Xi1ah8X0jceDJtHITKHYLsR4q0LHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwiHymq0PcmIFbiSG
	d240kSaCuGD1iWQEp2LM+7QZA3w/KWUZuNZxEHw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193809

From: Jiang Kai <jiangkai@fujitsu.com>

0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
refreshed for 6.6.3

Changelog:
==========
* subvol create: accept multiple arguments
* subvol delete: print the subvolume id in the output
* subvol sync: check if the filesystems is still writeable so it does not
  wait indefinitely
* device delete: add a timeout and warning when deleting multiple devices
* scrub status: report limit if set in sysfs/../scrub_speed_max
* scrub limit: new command to show or set the per-device scrub limits
* scrub start: report the limit if set
* build:
   * fix CPU feature detection on aarch64
   * support Botan and OpenSSL (3.2+) as crypto backends
* other:
   * documentation updates, RTD config update
   * new and updated tests
   * CI updates

Signed-off-by: Jiang Kai <jiangkai@fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-a-possibility-to-specify-where-python-modules-ar.patch | 7 ++++---
 .../{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb}         | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 5846f04d1a..ed2c64eb4c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From d3adfc21c9cc264bd191722f102963cbc4794259 Mon Sep 17 00:00:00 2001
+From ddfdc0102c22e8dc782c34b8a03777fb73dfddf6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -6,15 +6,16 @@ Subject: [PATCH] Add a possibility to specify where python modules are
 
 Upstream-Status: Inappropriate [oe-core specific to solve multilib use case]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 1697794c..8ab38818 100644
+index 374f59b9..ed083f6b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -651,7 +651,7 @@ endif
+@@ -959,7 +959,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
index 873d5e7a14..ef40f553fb 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
+SRCREV = "92e18dbce521789e02057d406769b073d474fa72"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


