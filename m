Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D28066FA48
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:21:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s568LYNX024376
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:21:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 01:21:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 16:22:27 +0800
Message-ID: <bba9726e2de539e613a4636d12d73fb5b9a9402b.1402042902.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402042902.git.Qi.Chen@windriver.com>
References: <cover.1402042902.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] file: upgrade from 5.17 to 5.18
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
X-List-Received-Date: Fri, 06 Jun 2014 08:21:35 -0000
Content-Type: text/plain

Upgrade file from 5.17 to 5.18.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../file/{file_5.17.bb => file_5.18.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/file/{file_5.17.bb => file_5.18.bb} (86%)

diff --git a/meta/recipes-devtools/file/file_5.17.bb b/meta/recipes-devtools/file/file_5.18.bb
similarity index 86%
rename from meta/recipes-devtools/file/file_5.17.bb
rename to meta/recipes-devtools/file/file_5.18.bb
index 4ed0820..a7db410 100644
--- a/meta/recipes-devtools/file/file_5.17.bb
+++ b/meta/recipes-devtools/file/file_5.18.bb
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "e19c47e069ced7b01ccb4db402cc01d3"
-SRC_URI[sha256sum] = "3feb97141b387b64da30aee485852925312c0e74219380a5ed451f14a90c83ca"
+SRC_URI[md5sum] = "d420d8f2990cd344673acfbf8d76ff5a"
+SRC_URI[sha256sum] = "6519fb706d583231c2419592ebecdbb21d33c62eaf7a1a0b24ddfcb80c08bf07"
 
 inherit autotools
 
-- 
1.7.9.5


