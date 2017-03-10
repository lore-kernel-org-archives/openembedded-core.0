Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9076F77649
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:11:43 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 0d18_ae72_3bb70ac3_e1eb_46ac_a8df_87563bf22b98;
	Fri, 10 Mar 2017 19:11:38 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id C187CAC00F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 19:11:37 +0900 (JST)
Received: from G01JPEXCHYT18.g01.fujitsu.local
	(G01JPEXCHYT18.g01.fujitsu.local [10.128.194.57])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	AE5906D6979 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 19:11:36 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT18.g01.fujitsu.local (10.128.194.57) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 10 Mar 2017 19:11:36 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 19:11:59 +0900
Message-ID: <1489140719-5849-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] grep: upgrade to 3.0
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
X-List-Received-Date: Fri, 10 Mar 2017 10:11:44 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/grep/{grep_2.27.bb => grep_3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.27.bb => grep_3.0.bb} (88%)

diff --git a/meta/recipes-extended/grep/grep_2.27.bb b/meta/recipes-extended/grep/grep_3.0.bb
similarity index 88%
rename from meta/recipes-extended/grep/grep_2.27.bb
rename to meta/recipes-extended/grep/grep_3.0.bb
index a4d7a45..6146ef0 100644
--- a/meta/recipes-extended/grep/grep_2.27.bb
+++ b/meta/recipes-extended/grep/grep_3.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "6138dd227c39d4a25f81eea76a44d4cb"
-SRC_URI[sha256sum] = "ad4cc44d23074a1c3a8baae8fbafff2a8c60f38a9a6108f985eef6fbee6dcaeb"
+SRC_URI[md5sum] = "fa07c1616adeb9c3262be5177d10ad4a"
+SRC_URI[sha256sum] = "e2c81db5056e3e8c5995f0bb5d0d0e1cad1f6f45c3b2fc77b6e81435aed48ab5"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
1.9.1


