Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72511C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456805"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456805"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617157"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/36] oeqa/manual: Fix no longer valid URLs
Date: Wed, 27 Oct 2021 23:16:24 +0800
Message-Id: 
 <c9bb3319d2db83d63bb1cacd10d6f74e39ded17a.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157532

From: Jon Mason <jdmason@kudzu.us>

autobuilder.yoctoproject.org URLS no longer work.  Update them to a
working location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56f7bac1f0d1ced41e6908706be27149aa7b87e2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/manual/eclipse-plugin.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index d77d0e673b..6c110d0656 100644
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -44,7 +44,7 @@
                     "expected_results": ""
                 },
                 "2": {
-                    "action": "wget  autobuilder.yoctoproject.org/pub/releases//machines/qemu/qemux86/qemu (ex:core-image-sato-sdk-qemux86-date-rootfs-tar-bz2) \nsource /opt/poky/version/environment-setup-i585-poky-linux  \n\nExtract qemu with runqemu-extract-sdk /home/user/file(ex.core-image-sato-sdk-qemux86.bz2) \n/home/user/qemux86-sato-sdk  \n\n",
+                    "action": "wget  https://downloads.yoctoproject.org/releases/yocto/yocto-$VERSION/machines/qemu/qemux86/ (ex:core-image-sato-sdk-qemux86-date-rootfs-tar-bz2) \nsource /opt/poky/version/environment-setup-i585-poky-linux  \n\nExtract qemu with runqemu-extract-sdk /home/user/file(ex.core-image-sato-sdk-qemux86.bz2) \n/home/user/qemux86-sato-sdk  \n\n",
                     "expected_results": " Qemu can be lauched normally."
                 },
                 "3": {
@@ -60,7 +60,7 @@
                     "expected_results": ""
                 },
                 "6": {
-                    "action": "(d) QEMU: \nSelect this option if you will be using the QEMU emulator. Specify the Kernel matching the QEMU architecture you are using. \n      wget  autobuilder.yoctoproject.org/pub/releases//machines/qemu/qemux86/bzImage-qemux86.bin \n      e.g: /home/$USER/yocto/adt-installer/download_image/bzImage-qemux86.bin  \n\n",
+                    "action": "(d) QEMU: \nSelect this option if you will be using the QEMU emulator. Specify the Kernel matching the QEMU architecture you are using. \n      wget  https://downloads.yoctoproject.org/releases/yocto/yocto-$VERSION/machines/qemu/qemux86/bzImage-qemux86.bin \n      e.g: /home/$USER/yocto/adt-installer/download_image/bzImage-qemux86.bin  \n\n",
                     "expected_results": ""
                 },	
                 "7": {
@@ -247,7 +247,7 @@
             "execution": {
                 "1": {
                     "action": "Clone eclipse-poky source.   \n    \n    - git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
-                    "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   http://autobuilder.yoctoproject.org/pub/releases/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
+                    "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
                 },
                 "2": {
                     "action": "Checkout correct tag.  \n\n    - git checkout <eclipse-version>/<yocto-version> \n\n",
-- 
2.31.1


