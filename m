Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DED8260125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 08:19:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Oct 2015 01:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,648,1437462000"; d="scan'208";a="805396604"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2015 01:19:38 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D3C6B6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 01:18:40 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 06:33:00 +0300
Message-Id: <1444188780-12319-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] cronie: clean up bugtracker info
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
X-List-Received-Date: Wed, 07 Oct 2015 08:19:39 -0000

Update bugtracker web address

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/cronie/cronie_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb b/meta/recipes-extended/cronie/cronie_1.5.0.bb
index 38bd593..697501a 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.0.bb
@@ -4,7 +4,7 @@ specified programs at scheduled times and related tools. It is based on the \
 original cron and has security and configuration enhancements like the \
 ability to use pam and SELinux."
 HOMEPAGE = "https://fedorahosted.org/cronie/"
-BUGTRACKER = "mmaslano@redhat.com"
+BUGTRACKER = "https://bugzilla.redhat.com"
 
 # Internet Systems Consortium License
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPLv2+"
-- 
2.4.0


