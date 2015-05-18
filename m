Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 255376E647
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 23:28:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,455,1427785200"; d="scan'208";a="712140370"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 18 May 2015 16:28:39 -0700
Message-Id: <1431991720-19892-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
References: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/5] msmtp: Upgrade to 1.6.2
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
X-List-Received-Date: Mon, 18 May 2015 23:28:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.6.1.bb => msmtp_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.1.bb => msmtp_1.6.2.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb b/meta/recipes-extended/msmtp/msmtp_1.6.2.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.6.1.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.2.bb
index d6f3a15..f9bf563 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "6ebba4809bbc665b8a665a018d1a5ee1"
-SRC_URI[sha256sum] = "c45d47f2dc77484e3f74c0f66aef0d5d95de6c47ed71d9f926d86d546f8346f3"
+SRC_URI[md5sum] = "3baca93c7e5f1aa9d36a2e5b38739ab9"
+SRC_URI[sha256sum] = "2f6ecd7cbfadf548fd55205bd24cb63b84bcbb1185efed917dd7800595a48789"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.1.0


