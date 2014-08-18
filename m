Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 563AA70D30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 01:51:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I1pRD5024554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:51:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 18:51:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 09:51:39 +0800
Message-ID: <3a039520277009ae95d526166e9b07f7c2228722.1408326458.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408326458.git.Qi.Chen@windriver.com>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 02/10] systemd: add PACKAGECONFIG for 'elfutils'
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
X-List-Received-Date: Mon, 18 Aug 2014 01:51:28 -0000
Content-Type: text/plain

Add PACKAGECONFIG for 'elfutils'.
This also fixes a build-deps QA warning about libdw.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_215.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core/systemd/systemd_215.bb
index 770787b..f5e50fc 100644
--- a/meta/recipes-core/systemd/systemd_215.bb
+++ b/meta/recipes-core/systemd/systemd_215.bb
@@ -58,6 +58,8 @@ DEPENDS += "libgcrypt"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
+# Build with elfutils support
+PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.7.9.5


