Return-Path: <rruslich@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id AD08F6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=887; q=dns/txt; s=iport;
	t=1513605641; x=1514815241;
	h=from:to:cc:subject:date:message-id;
	bh=kV5NygdeQxHTf0mrhrF+spKZ0UgpwvzHsOvfxpRB2G4=;
	b=jvp7tPKfN4BDWou44+9ievkmwGgK1NPQfZiAkLgCvYABprlFctAkunEJ
	I8IhKhU8gg2uUKfQBoPt18KdOfaXisxZM+AZa92LG+tPuYhjQbg6qquWa
	uVw0avPrA1sf/156uVwPjmsgDSDxsfEZNiRVexf+ChcdkBZ4CUqbOOzAf 8=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="45605245"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:51:15 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBQw009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:13 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:46 +0200
Message-Id: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH 1/7] acpid.inc: set CVE_PRODUCT to acpid2
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
X-List-Received-Date: Mon, 18 Dec 2017 14:00:39 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

It is used in NVD database for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2011-4578

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 966052df79df0f68565ebc40887170322d3f85b8)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-bsp/acpid/acpid.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 12ec19b..766ed4f 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
            file://acpid.service \
           "
 
+CVE_PRODUCT = "acpid2"
+
 inherit autotools update-rc.d systemd
 
 INITSCRIPT_NAME = "acpid"
-- 
1.9.1


