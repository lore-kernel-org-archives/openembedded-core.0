Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72C9A7E909
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 02:58:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5E2wcFX009739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 19:58:48 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 13 Jun 2019 19:58:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2019 19:58:26 -0700
Message-ID: <20190614025826.32202-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614025826.32202-1-mingli.yu@windriver.com>
References: <20190614025826.32202-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dbus-test: Upgrade 1.12.16
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
X-List-Received-Date: Fri, 14 Jun 2019 02:58:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../dbus/{dbus-test_1.12.14.bb => dbus-test_1.12.16.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.14.bb => dbus-test_1.12.16.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.14.bb b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.14.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.16.bb
index 10447c6f08b..bea0e74ed07 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.14.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "9e748b8c50dae17ae639f1c55ae6417d"
-SRC_URI[sha256sum] = "44f9c290ae8f6cadeb2c329316c03716f171ce10daddd85c0bffd0f7df514c8d"
+SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
+SRC_URI[sha256sum] = "54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.21.0


