Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8C171AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 14:47:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 07:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="97069108"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.140.209])
	by orsmga005.jf.intel.com with ESMTP; 08 May 2017 07:47:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  8 May 2017 22:47:24 +0800
Message-Id: <1494254846-9382-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
References: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
Cc: Chin Huat Ang <chin.huat.ang@intel.com>
Subject: [PATCH 2/4] nspr: upgrade recipe to version 4.14
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
X-List-Received-Date: Mon, 08 May 2017 14:47:34 -0000

From: Chin Huat Ang <chin.huat.ang@intel.com>

Upgrade to 4.14, also sanity tested to make sure rpm which depends on
nspr is working.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.13.1.bb => nspr_4.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.13.1.bb => nspr_4.14.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.13.1.bb b/meta/recipes-support/nspr/nspr_4.14.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.13.1.bb
rename to meta/recipes-support/nspr/nspr_4.14.bb
index 9c15a8b..f5ce91c 100644
--- a/meta/recipes-support/nspr/nspr_4.13.1.bb
+++ b/meta/recipes-support/nspr/nspr_4.14.bb
@@ -21,8 +21,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "9c44298a6fc478b3c0a4e98f4f9981ed"
-SRC_URI[sha256sum] = "5e4c1751339a76e7c772c0c04747488d7f8c98980b434dc846977e43117833ab"
+SRC_URI[md5sum] = "743f6b7888a614da9927400874054d8c"
+SRC_URI[sha256sum] = "64fc18826257403a9132240aa3c45193d577a84b08e96f7e7770a97c074d17d5"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
-- 
2.7.4


