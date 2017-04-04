Return-Path: <yin.thong.choong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 785B277CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491298177; x=1522834177;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=wkDNug3vXDgKwSRc0qqUMGu26DJuJhDkKCgUq+2ZLj4=;
	b=rkF064UvJjqjG6m2YLZheo8+xCVMN1G70AaTFlRvirw1czWiUqeTvfvp
	ucJ5d+RY67bHRQ6avcZOTchYC72mNw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 02:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1115160798"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 02:29:35 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 02:29:14 -0700
Message-Id: <1491298154-68270-9-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH v2 8/8] cronie: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Tue, 04 Apr 2017 09:29:35 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to github.com. This github link
is distributions to fedoreproject.org and the contact
Mailing list: cronie-devel AT lists.fedorahosted DOT org

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-extended/cronie/cronie_1.5.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.1.bb b/meta/recipes-extended/cronie/cronie_1.5.1.bb
index ad616d5..cfb8c21 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Cronie contains the standard UNIX daemon crond that runs \
 specified programs at scheduled times and related tools. It is based on the \
 original cron and has security and configuration enhancements like the \
 ability to use pam and SELinux."
-HOMEPAGE = "https://fedorahosted.org/cronie/"
+HOMEPAGE = "https://github.com/cronie-crond/cronie/"
 BUGTRACKER = "https://bugzilla.redhat.com"
 
 # Internet Systems Consortium License
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
 
 SECTION = "utils"
 
-SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
+UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
+
+SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
-- 
2.7.4


