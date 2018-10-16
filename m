Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D891579946
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 03:22:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 20:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,387,1534834800"; d="scan'208";a="95542493"
Received: from wlee9-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.174.201])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2018 20:22:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2018 16:22:03 +1300
Message-Id: <20181016032203.6767-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH] openssl: correct license comment
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
X-List-Received-Date: Tue, 16 Oct 2018 03:22:16 -0000

The comment here stated that openssl is dual-licensed, but that would
mean that either of the two licenses could be used which is *not* the
case [1]. However LICENSE = "openssl" *is* correct because in OE that
maps to a generic license file which includes both licenses, which
makes sense because there isn't really any such thing as OpenSSL that
would be covered by the "OpenSSL license" and not the "SSLeay license".
Correct the comment to avoid any confusion.

[1] https://www.openssl.org/source/license.html

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 03518586877..0d80aba64d7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.openssl.org/"
 BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
 SECTION = "libs/network"
 
-# "openssl | SSLeay" dual license
+# "openssl" here actually means both OpenSSL and SSLeay licenses apply
+# (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
-- 
2.17.2


