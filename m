Return-Path: <rruslich@cisco.com>
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id E61B6781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=915; q=dns/txt; s=iport;
	t=1513605658; x=1514815258;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=MDt/30RBOcuEj+OPlkfh5SA2uBewmAalCxhzc19Z5rg=;
	b=T6z67f2vGq+iJnEEZSWKQl1GqfAITXvZCBq1GByIR4X7VyVTV/0ygII3
	0DGbgBou1e5E1/AAb5l2nssEGvB1g+Wi2xJFjMfyd8CTSmOu8Kl/a3zhX
	f0wXELwNdGeMBO51yPCAeT3KUD0HKZsqpSIIlNJzUgybGvj1FlAcdZesz k=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="46136724"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:51:28 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBR0009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:27 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:48 +0200
Message-Id: <1513605052-9357-3-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: [morty][PATCH 3/7] icu.inc: set CVE_PRODUCT to international_components_for_unicode
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
X-List-Received-Date: Mon, 18 Dec 2017 14:00:57 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

NVD uses it for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2014-8146

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit eaac39100cadc81c89e6eb5ab389cd684699aa90)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-support/icu/icu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index cc6f222..e5da292 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -9,6 +9,8 @@ LICENSE = "ICU"
 DEPENDS = "icu-native"
 DEPENDS_class-native = ""
 
+CVE_PRODUCT = "international_components_for_unicode"
+
 S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
-- 
1.9.1


