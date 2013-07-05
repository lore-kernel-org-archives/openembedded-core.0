Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEA086B02D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 10:18:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r65AITtN008584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Jul 2013 03:18:29 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 5 Jul 2013 03:18:28 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2013 18:18:11 +0800
Message-ID: <9b146e2993f1b390f0158066292838169893d97e.1373019324.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373019324.git.kai.kang@windriver.com>
References: <cover.1373019324.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: wenzhong.fan@windriver.com
Subject: [PATCH 2/2] packagegroup-core-lsb: set COMPATIBLE_HOST to mips64
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
X-List-Received-Date: Fri, 05 Jul 2013 10:18:28 -0000
Content-Type: text/plain

qt4 related packages which are included in packagegroup-core-lsb can NOT
built for mips64 with 64 bits userspace, so block packagegroup-core-lsb
from build for such platform.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index ed854b8..d50e512 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -7,6 +7,8 @@ DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specif
 PR = "r10"
 LICENSE = "MIT"
 
+COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+
 inherit packagegroup
 
 PACKAGES = "\
-- 
1.7.9.5


