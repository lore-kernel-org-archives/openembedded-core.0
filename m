Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id E16657FA2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 19:55:12 +0000 (UTC)
IronPort-SDR: mvjYDaSNciSrsxueN0/y61DmlZTQsIBYbFep8odlxJdPyodNI6esjL+U435JWwzdDPsoIDsPJH
	7rBmQfK4iKAMscfbEtDrtXzrdfGxbGCtK0j67Y0ac8KSiDdC7u6KfGs8CWBAoi3v6rkS8HiI5s
	L9mq+gWKkCUpXo/bVsxB5Orjq8J3lyG1q+SL7NFwN/3wfQJDwjQzjbKlBN0fIp8n3mtjLGml/Y
	wuzTX4eseXLzC0tvv0ci86Qstf03PT2g37z+DLqtZoh8GIN6HCifo1SXkLa36SlgnEONWRP5Rj
	S94=
X-IronPort-AV: E=Sophos;i="5.69,285,1571695200"; 
   d="scan'208";a="3245803"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 20:55:03 +0100
Message-Id: <20191206195504.19361-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206195504.19361-1-pkj@axis.com>
References: <20191206195504.19361-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [zeus][PATCH 3/4] opkg: Trim the text part used for the license file checksum
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
X-List-Received-Date: Fri, 06 Dec 2019 19:55:13 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids including irrelevant information when calculating the
license checksum.

License-Update: Trim the text part used for the license file checksum
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 1cd7dcadb3..f6f0922b6a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://code.google.com/p/opkg/"
 BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/opkg.c;beginline=2;endline=21;md5=90435a519c6ea69ef22e4a88bcc52fa0"
+                    file://src/opkg.c;beginline=4;endline=18;md5=9f5a1ad5395378a807d6d591e2f92d25"
 
 DEPENDS = "libarchive"
 
-- 
2.21.0


