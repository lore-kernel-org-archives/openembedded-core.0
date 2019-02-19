Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2104C7C8E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:44:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1J1i4PI011307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:44:15 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 17:43:54 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 09:53:11 +0800
Message-ID: <351ea36f447ec3e2735bf94144aed8923c327de9.1550541019.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550541019.git.Qi.Chen@windriver.com>
References: <cover.1550541019.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] dbus: upgrade to 1.12.12
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
X-List-Received-Date: Tue, 19 Feb 2019 01:44:24 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.12.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.12.12.bb} (97%)

diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.12.12.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus_1.12.10.bb
rename to meta/recipes-core/dbus/dbus_1.12.12.bb
index d330127..6e9be79 100644
--- a/meta/recipes-core/dbus/dbus_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.12.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
-SRC_URI[sha256sum] = "4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7"
+SRC_URI[md5sum] = "ea11069521beeee4e47f0086596a43c8"
+SRC_URI[sha256sum] = "9546f226011a1e5d9d77245fe5549ef25af4694053189d624d0d6ac127ecf5f8"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
1.9.1


