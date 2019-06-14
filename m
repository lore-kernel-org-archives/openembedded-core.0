Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA107E7AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 02:58:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E2wRGU003852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 19:58:27 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 13 Jun 2019 19:58:26 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2019 19:58:25 -0700
Message-ID: <20190614025826.32202-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] dbus: Upgrade to 1.12.16
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
X-List-Received-Date: Fri, 14 Jun 2019 02:58:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Security fixes:
  CVE-2019-12749

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/dbus/{dbus_1.12.14.bb => dbus_1.12.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.12.14.bb => dbus_1.12.16.bb} (97%)

diff --git a/meta/recipes-core/dbus/dbus_1.12.14.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus_1.12.14.bb
rename to meta/recipes-core/dbus/dbus_1.12.16.bb
index 4e7f6148977..05716608b0a 100644
--- a/meta/recipes-core/dbus/dbus_1.12.14.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "9e748b8c50dae17ae639f1c55ae6417d"
-SRC_URI[sha256sum] = "44f9c290ae8f6cadeb2c329316c03716f171ce10daddd85c0bffd0f7df514c8d"
+SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
+SRC_URI[sha256sum] = "54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
2.21.0


