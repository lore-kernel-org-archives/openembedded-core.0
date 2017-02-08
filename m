Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB52771A23
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 03:17:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v183HE5r009046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Feb 2017 19:17:14 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 19:17:13 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 22:16:58 -0500
Message-ID: <18605572ad06bcf785457419d026e94d19875c96.1486523726.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] socat: 1.7.3.1 -> 1.7.3.2
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
X-List-Received-Date: Wed, 08 Feb 2017 03:17:14 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-connectivity/socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb} (89%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
similarity index 89%
rename from meta/recipes-connectivity/socat/socat_1.7.3.1.bb
rename to meta/recipes-connectivity/socat/socat_1.7.3.2.bb
index a579f1e..4dcb7b4 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch \
 "
 
-SRC_URI[md5sum] = "334e46924f2b386299c9db2ac22bcd36"
-SRC_URI[sha256sum] = "d2da659540c38139f388e9437bfaae16bb458d174d056cb3228432a8f489fbaa"
+SRC_URI[md5sum] = "607a24c15bd2cb54e9328bfbbd3a1ae9"
+SRC_URI[sha256sum] = "e3561f808739383eb10fada1e5d4f26883f0311b34fd0af7837d0c95ef379251"
 
 inherit autotools
 
-- 
2.8.1


