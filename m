Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E982B615BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 08:38:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s038ctQ2022922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 00:38:56 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 3 Jan 2014 00:38:55 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2014 16:38:03 +0800
Message-ID: <425dedfed1942ae24725b2e5f355236a048095b3.1388738221.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388738221.git.Chong.Lu@windriver.com>
References: <cover.1388738221.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpcre: upgrade to 8.34
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
X-List-Received-Date: Fri, 03 Jan 2014 08:38:56 -0000
Content-Type: text/plain

Upgrade libpcre to 8.34.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/libpcre/{libpcre_8.33.bb => libpcre_8.34.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.33.bb => libpcre_8.34.bb} (93%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.33.bb b/meta/recipes-support/libpcre/libpcre_8.34.bb
similarity index 93%
rename from meta/recipes-support/libpcre/libpcre_8.33.bb
rename to meta/recipes-support/libpcre/libpcre_8.34.bb
index e0b707f..0c2b082 100644
--- a/meta/recipes-support/libpcre/libpcre_8.33.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.34.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "21514018448ac10062ece7a668fca949"
-SRC_URI[sha256sum] = "c603957a4966811c04af5f6048c71cfb4966ec93312d7b3118116ed9f3bc0478"
+SRC_URI[md5sum] = "5439e321351bddd5533551bbce128d07"
+SRC_URI[sha256sum] = "b6043ae1ff2720be665ffa28dc22b7c637cdde96f389a116c0c3020caeae583f"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.8.1.2


