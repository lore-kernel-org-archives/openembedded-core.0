Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE837E97C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 09:10:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8C9A02M021409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 02:10:11 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 12 Sep 2019 02:09:49 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2019 05:08:20 -0400
Message-ID: <20190912090821.157081-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] glib-networking:enable glib-networking build as native package
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
X-List-Received-Date: Thu, 12 Sep 2019 09:10:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Jiang Lu <lu.jiang@windriver.com>

Enable glib-networking build as a native package, for it is depended
by libsoup.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.60.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
index d893b7a3a102..0278ab2fb689 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
@@ -30,3 +30,5 @@ FILES_${PN} += "\
                 "
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
+
+BBCLASSEXTEND = "native"
-- 
2.22.0


