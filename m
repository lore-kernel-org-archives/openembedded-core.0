Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B19096C0E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 09:10:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8C9ACEi004123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 02:10:12 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 12 Sep 2019 02:10:12 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2019 05:08:21 -0400
Message-ID: <20190912090821.157081-2-liwei.song@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190912090821.157081-1-liwei.song@windriver.com>
References: <20190912090821.157081-1-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsoup:enable libsoup build as native package
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
X-List-Received-Date: Thu, 12 Sep 2019 09:10:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Jiang Lu <lu.jiang@windriver.com>

Enable libsoup build as a native package, for it may invoked by
other native package, such as ostree.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index c4715a04125c..357f2fd3db9d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -36,3 +36,5 @@ DEBIAN_NOAUTONAME_${PN} = "1"
 
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
+
+BBCLASSEXTEND = "native"
-- 
2.22.0


