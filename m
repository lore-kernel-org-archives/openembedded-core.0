Return-Path: <rruslich@cisco.com>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Dec 2017 14:01:07 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id F34ED7803F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=951; q=dns/txt; s=iport;
	t=1513605669; x=1514815269;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=LHp8AIdH0fkG+nxOR74HiKPnKBGFBZxQ3kKWvygSmjc=;
	b=lv3koUmTXPLqg4WqtfWAbaSazlWfeW2ERHnhDve04E/erS4uqtyEnVwe
	9rcnC8aT7pwLf/z2lLy5Q1Pav7OTb2BRjHLZoQ87gcpkuzgeHPqC6ou2f
	ywCBbd5+l7doTFzITSNigjPOuwXQaKkoVvvi2zsO0CUFga2pWqn7iE33t E=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="333746426"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:51:41 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBR2009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:39 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:50 +0200
Message-Id: <1513605052-9357-5-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: [morty][PATCH 5/7] sqlite3.inc: set CVE_PRODUCT to sqlite
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
X-List-Received-Date: Mon, 18 Dec 2017 14:01:08 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

It is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-6153

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit cec6f26f4d2f16c9a58fac5a6344e3d43b36ed09)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 5bff33b..b875fae 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -17,6 +17,8 @@ S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
+CVE_PRODUCT = "sqlite"
+
 inherit autotools pkgconfig
 
 PACKAGECONFIG ?= ""
-- 
1.9.1


