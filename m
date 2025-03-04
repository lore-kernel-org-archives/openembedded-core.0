Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BC3C282D6
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18107.1741079374756247925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QG8yE/qq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079375; x=1772615375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RipJ5L/4S7LP4OJXbLmW3cHYnz/M5/YrV9aMOjzsTfk=;
  b=QG8yE/qqe3ebZpQ66Gi4Bo/pSOr+xTMn12GnoQ3AtvrkSRne9THrOlwF
   Kvrmc5AAqh+UZaP4Y+vrFWy7tLmwUPglMBeCONoFzWB7KQLHlETq+qmw3
   c7SBsIKYyp8TCGp8Db04lAV/FCxjhal1emVPTaHZa2f/pfPJeautHj5Bz
   WknySzS3MLxcaADUG0CR9mxbAhIc4uW//hsIZeS+vl8GTMpdAZxnYdNA3
   V6wyciH9q5cfRzc7EweqZAstb4nnV67C7DwZNyAnzrVUluf4fDKD7WY9E
   bxb7+BsHru4GMHFeQUmjVmb55lo4bCPe6TEHD5FoF4PSbcnFhltz3NL9E
   Q==;
X-CSE-ConnectionGUID: mVXYqpYcReKjfL4iTOPR5w==
X-CSE-MsgGUID: Z8/MQi1qR7OmEv2RbzkygQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191934014"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191934014"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C4CCD4807
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31F56D8B84
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E72F91A0071;
	Tue,  4 Mar 2025 17:09:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/31] shadow: update 4.17.2 -> 4.17.3
Date: Tue,  4 Mar 2025 17:09:13 +0800
Message-Id: <1741079356-13445-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212255

From: Wang Mingyu <wangmy@fujitsu.com>

shadow-update-pam-conf.patch
refreshed for 4.17.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shadow/files/shadow-update-pam-conf.patch    | 16 ++++------------
 .../{shadow_4.17.2.bb => shadow_4.17.3.bb}       |  2 +-
 2 files changed, 5 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.17.2.bb => shadow_4.17.3.bb} (99%)

diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index cb3baf450c..318e2665c2 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -15,7 +15,6 @@ Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 ---
- etc/pam.d/chage     | 2 +-
  etc/pam.d/chgpasswd | 2 +-
  etc/pam.d/groupadd  | 2 +-
  etc/pam.d/groupdel  | 2 +-
@@ -24,18 +23,8 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
  etc/pam.d/useradd   | 2 +-
  etc/pam.d/userdel   | 2 +-
  etc/pam.d/usermod   | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
+ 8 files changed, 8 insertions(+), 8 deletions(-)
 
-diff --git a/etc/pam.d/chage b/etc/pam.d/chage
-index 8f49f5c..b1f365d 100644
---- a/etc/pam.d/chage
-+++ b/etc/pam.d/chage
-@@ -1,4 +1,4 @@
- #%PAM-1.0
- auth		sufficient	pam_rootok.so
- account		required	pam_permit.so
--password	include		system-auth
-+password	include		common-password
 diff --git a/etc/pam.d/chgpasswd b/etc/pam.d/chgpasswd
 index 8f49f5c..b1f365d 100644
 --- a/etc/pam.d/chgpasswd
@@ -116,3 +105,6 @@ index 8f49f5c..b1f365d 100644
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/shadow/shadow_4.17.2.bb b/meta/recipes-extended/shadow/shadow_4.17.3.bb
similarity index 99%
rename from meta/recipes-extended/shadow/shadow_4.17.2.bb
rename to meta/recipes-extended/shadow/shadow_4.17.3.bb
index 19512f2594..3d07aec3d6 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.3.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "064a7c048e613ef5b5f3613e137d79d35d062ab434e89020f743e90844ec5c4f"
+SRC_URI[sha256sum] = "2a029091d2c2f116f51b3a817ec16e7da22310a6c8116394457483c668c84b36"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.43.0


