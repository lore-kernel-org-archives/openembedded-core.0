Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF537783CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:47:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O9lGne027003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:47:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Jul 2017 02:47:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 17:51:13 +0800
Message-ID: <e81c5831ece0dac46f48687d0bdfc2e7d0036388.1500889785.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500889785.git.Qi.Chen@windriver.com>
References: <cover.1500889785.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] dbus/dbus-test: upgrade to 1.10.20
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
X-List-Received-Date: Mon, 24 Jul 2017 09:47:15 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.10.18.bb => dbus-test_1.10.20.bb} | 4 ++--
 meta/recipes-core/dbus/{dbus_1.10.18.bb => dbus_1.10.20.bb}           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.18.bb => dbus-test_1.10.20.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.18.bb => dbus_1.10.20.bb} (97%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.18.bb b/meta/recipes-core/dbus/dbus-test_1.10.20.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.20.bb
index 141baf2..eeadb7d 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.20.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "1209c455598165a0c5263d4201894179"
-SRC_URI[sha256sum] = "6049ddd5f3f3e2618f615f1faeda0a115104423a7996b7aa73e2f36e38cc514a"
+SRC_URI[md5sum] = "94c991e763d4f9f13690416b2dcd9411"
+SRC_URI[sha256sum] = "e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus_1.10.18.bb b/meta/recipes-core/dbus/dbus_1.10.20.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus_1.10.18.bb
rename to meta/recipes-core/dbus/dbus_1.10.20.bb
index c0b63d1..9ddedc1 100644
--- a/meta/recipes-core/dbus/dbus_1.10.18.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.20.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://0001-configure.ac-explicitely-check-stdint.h.patch \
 "
 
-SRC_URI[md5sum] = "1209c455598165a0c5263d4201894179"
-SRC_URI[sha256sum] = "6049ddd5f3f3e2618f615f1faeda0a115104423a7996b7aa73e2f36e38cc514a"
+SRC_URI[md5sum] = "94c991e763d4f9f13690416b2dcd9411"
+SRC_URI[sha256sum] = "e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
1.9.1


