Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvjoM-0006YB-I0
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 08:23:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0H77Vr6018702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 23:07:31 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 16 Jan 2013 23:07:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 15:07:22 +0800
Message-ID: <0392b32826d8e307a1e2d2af187979f453279001.1358406049.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358406049.git.hongxu.jia@windriver.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gtk-immodules-cache.bbclass:fix support postrm at image creation time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 07:23:19 -0000
Content-Type: text/plain

Let gtk_immodule_cache_postrm exit with ok at image creation time

[YOCTO #3633]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/gtk-immodules-cache.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 9ffb03b..6e1f5ef 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -31,7 +31,7 @@ fi
 
 gtk_immodule_cache_postrm() {
 if [ "x$D" != "x" ]; then
-    exit 1
+    exit 0
 fi
 if [ ! -z `which gtk-query-immodules-2.0` ]; then
     gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-- 
1.7.10.4



