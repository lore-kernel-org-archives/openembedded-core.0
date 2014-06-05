Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 072FA6FAEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 05:28:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s555St01009231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jun 2014 22:28:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 4 Jun 2014 22:28:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jun 2014 13:29:48 +0800
Message-ID: <fcaa668ccafbb476843a728902ba2b6adf6e1492.1401945914.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1401945914.git.Qi.Chen@windriver.com>
References: <cover.1401945914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] grep: upgrade 2.18 to 2.19
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
X-List-Received-Date: Thu, 05 Jun 2014 05:28:56 -0000
Content-Type: text/plain

Upgrade grep from 2.18 to 2.19.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../grep/{grep_2.18.bb => grep_2.19.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.18.bb => grep_2.19.bb} (86%)

diff --git a/meta/recipes-extended/grep/grep_2.18.bb b/meta/recipes-extended/grep/grep_2.19.bb
similarity index 86%
rename from meta/recipes-extended/grep/grep_2.18.bb
rename to meta/recipes-extended/grep/grep_2.19.bb
index 99337f7..f38a9a6 100644
--- a/meta/recipes-extended/grep/grep_2.18.bb
+++ b/meta/recipes-extended/grep/grep_2.19.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "7439f8266f50844b56cc3e2721606541"
-SRC_URI[sha256sum] = "e6436e5077fa1497feccc8feaabd3f507b172369bf120fbc9e4874bba81be720"
+SRC_URI[md5sum] = "ac732142227d9fe9567d71301e127979"
+SRC_URI[sha256sum] = "6388295be48cfcaf7665d9cd3914e6625ea000e9414132bfefd45cf1d8eec34d"
 
 inherit autotools gettext texinfo
 
-- 
1.7.9.5


