Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2F1D71E4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ89Iap024069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:33 +0800
Message-ID: <17098d04a80c541a67cd71e2c9278c88ec76c654.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] grep: upgrade to 2.27
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:17 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/grep/{grep_2.26.bb => grep_2.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.26.bb => grep_2.27.bb} (88%)

diff --git a/meta/recipes-extended/grep/grep_2.26.bb b/meta/recipes-extended/grep/grep_2.27.bb
similarity index 88%
rename from meta/recipes-extended/grep/grep_2.26.bb
rename to meta/recipes-extended/grep/grep_2.27.bb
index 9e6f05e..7d0a73b 100644
--- a/meta/recipes-extended/grep/grep_2.26.bb
+++ b/meta/recipes-extended/grep/grep_2.27.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "afdd61c7221434722671baf002ac9267"
-SRC_URI[sha256sum] = "246a8fb37e82aa33d495b07c22fdab994c039ab0f818538eac81b01e78636870"
+SRC_URI[md5sum] = "6138dd227c39d4a25f81eea76a44d4cb"
+SRC_URI[sha256sum] = "ad4cc44d23074a1c3a8baae8fbafff2a8c60f38a9a6108f985eef6fbee6dcaeb"
 
 inherit autotools gettext texinfo
 
-- 
1.9.1


