Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A76F2719C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 16:19:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2017 09:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,315,1491289200"; d="scan'208";a="1166769424"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2017 09:19:09 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id CCC476A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:18:54 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 19:19:22 +0300
Message-Id: <1494346762-7270-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494346762-7270-1-git-send-email-maxin.john@intel.com>
References: <1494346762-7270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] GNU_MIRROR: switch from ftp to https
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
X-List-Received-Date: Tue, 09 May 2017 16:19:07 -0000

Based on the same reason behind DEBIAN's switch from ftp:
https://www.debian.org/News/2017/20170425

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/mirrors.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 9c83463..b7c20b6 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -19,7 +19,7 @@ ${DEBIAN_MIRROR}	http://ftp.si.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	http://ftp.es.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	http://ftp.se.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	http://ftp.tr.debian.org/debian/pool \n \
-${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu \n \
+${GNU_MIRROR}	https://mirrors.kernel.org/gnu \n \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
 ${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \n \
 ${GNUPG_MIRROR}	ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt \n \
-- 
2.4.0


