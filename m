Return-Path: <mmovchan@cisco.com>
X-Greylist: delayed 587 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Feb 2018 19:27:18 UTC
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 59DE178858
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=743; q=dns/txt; s=iport;
	t=1517599640; x=1518809240;
	h=from:to:cc:subject:date:message-id;
	bh=/Yhxd8nLhuQLpQ6fl1mST0eHgjrrI+C3h3rJ0MXSaaU=;
	b=Jq8ebFqf8ZHw35fLKQLiXZpMU29LhFpBLOnszuocGyhTK9pUKwNcgFN3
	qc8BzQ8px9VYMaO3LtGKAE4pgjb9n0ENwhaCApGb7o9SyW5m0tKAMQPae
	bryU8qrHDeFuv7rBuwvLEJNU51gY2QkifNeYofTVFmWOYSSyxXDH8kfrC E=;
X-IronPort-AV: E=Sophos;i="5.46,450,1511827200"; 
   d="scan'208";a="1768031"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2018 19:17:31 +0000
Received: from KBP1-LHP-F55617.cisco.com ([10.61.216.150])
	by aer-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w12JHVfs005195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Fri, 2 Feb 2018 19:17:31 GMT
From: Mariia Movchan <mmovchan@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Feb 2018 21:19:20 +0200
Message-Id: <20180202191920.25076-1-mmovchan@cisco.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] packagegroup-core-tools-profile: disable valgrind on armeb
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
X-List-Received-Date: Fri, 02 Feb 2018 19:27:18 -0000

Valgrind supports only little endian ARM.

Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 51335e232d..a8e47da40c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -58,6 +58,7 @@ VALGRIND_nios2 = ""
 VALGRIND_armv4 = ""
 VALGRIND_armv5 = ""
 VALGRIND_armv6 = ""
+VALGRIND_armeb = ""
 VALGRIND_aarch64 = ""
 VALGRIND_linux-gnux32 = ""
 
-- 
2.15.1

