Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7108560621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ89Eoo024066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:13 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:30 +0800
Message-ID: <d7bff6bbf1726e49acc3aee4ab537f7cf7020978.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] dbus/dbus-test: upgrade to 1.10.14
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:13 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} | 4 ++--
 meta/recipes-core/dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb}           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.10.bb b/meta/recipes-core/dbus/dbus-test_1.10.14.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.10.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.14.bb
index 650b7ab..5394814 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.14.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "495676d240eb982921b3ad1343526849"
-SRC_URI[sha256sum] = "9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43"
+SRC_URI[md5sum] = "3f7b013ce8f641cd4c897acda0ef3467"
+SRC_URI[sha256sum] = "23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus_1.10.10.bb b/meta/recipes-core/dbus/dbus_1.10.14.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.10.10.bb
rename to meta/recipes-core/dbus/dbus_1.10.14.bb
index 4db0b9b..2ffd8b0 100644
--- a/meta/recipes-core/dbus/dbus_1.10.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.14.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://0001-configure.ac-explicitely-check-stdint.h.patch \
 "
 
-SRC_URI[md5sum] = "495676d240eb982921b3ad1343526849"
-SRC_URI[sha256sum] = "9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43"
+SRC_URI[md5sum] = "3f7b013ce8f641cd4c897acda0ef3467"
+SRC_URI[sha256sum] = "23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
1.9.1


