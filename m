Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2358C7C039
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:20:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x097KXoJ005530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:20:34 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:20:33 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:37 +0800
Message-ID: <1547018383-19134-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 3/9] file: upgrade 5.34 -> 5.35
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
X-List-Received-Date: Wed, 09 Jan 2019 07:20:33 -0000
Content-Type: text/plain

License-Update: remove trailing whitespace from COPYING

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/file/{file_5.34.bb => file_5.35.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/file/{file_5.34.bb => file_5.35.bb} (91%)

diff --git a/meta/recipes-devtools/file/file_5.34.bb b/meta/recipes-devtools/file/file_5.35.bb
similarity index 91%
rename from meta/recipes-devtools/file/file_5.34.bb
rename to meta/recipes-devtools/file/file_5.35.bb
index 5d92913..2f0589d 100644
--- a/meta/recipes-devtools/file/file_5.34.bb
+++ b/meta/recipes-devtools/file/file_5.35.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 
 # two clause BSD
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdda1b"
 
 DEPENDS = "zlib file-replacement-native"
 DEPENDS_class-native = "zlib-native"
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
         "
 
-SRCREV = "315cef2f699da3c31a54bd3c6c6070680fbaf1f5"
+SRCREV = "d1ff3af7a2c6b38bdbdde7af26b59e3c50a48fff"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.7.4


