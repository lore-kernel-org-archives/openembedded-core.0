Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACAB7237A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:50:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 14:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440187488"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.162])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2015 14:38:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 14:50:44 -0800
Message-Id: <b0d6b20aaab3f4973f93ba0ab6a07ab075a37ab4.1421189008.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1421189008.git.sgw@linux.intel.com>
References: <cover.1421189008.git.sgw@linux.intel.com>
In-Reply-To: <cover.1421189008.git.sgw@linux.intel.com>
References: <cover.1421189008.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] msmtp: Upgrade to 1.6.1
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
X-List-Received-Date: Tue, 13 Jan 2015 22:50:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.4.32.bb => msmtp_1.6.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.4.32.bb => msmtp_1.6.1.bb} (80%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.32.bb b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
similarity index 80%
rename from meta/recipes-extended/msmtp/msmtp_1.4.32.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.1.bb
index 4b7024b..6ce94fe 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.32.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
@@ -9,11 +9,11 @@ DEPENDS = "zlib gnutls"
 #COPYING or Licence
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "aa60e22211118f222470439cea60f795"
-SRC_URI[sha256sum] = "2bf0c5c7e78f9905f48de235a75111a1a88238793043bbeae00360b22f1a5f88"
+SRC_URI[md5sum] = "6ebba4809bbc665b8a665a018d1a5ee1"
+SRC_URI[sha256sum] = "c45d47f2dc77484e3f74c0f66aef0d5d95de6c47ed71d9f926d86d546f8346f3"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.1.0


