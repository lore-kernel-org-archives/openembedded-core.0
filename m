Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C205607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P8GX0f027602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:25 -0700
Message-ID: <7301955390c34f949f62dc9610497263388b7c8f.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431066.git.liezhi.yang@windriver.com>
References: <cover.1469431066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] git: 2.8.4 -> 2.9.2
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
X-List-Received-Date: Mon, 25 Jul 2016 08:16:33 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.9.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git_2.9.2.bb

diff --git a/meta/recipes-devtools/git/git_2.9.2.bb b/meta/recipes-devtools/git/git_2.9.2.bb
new file mode 100644
index 0000000..3eab96a
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.9.2.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "7faff70073c2c4a503cd584071fabb84"
+SRC_URI[tarball.sha256sum] = "3cb09a3917c2d8150fc1708f3019cf99a8f0feee6cd61bba3797e3b2a85be9dc"
+SRC_URI[manpages.md5sum] = "6f8a2f890e40f18f4c96a5cd70722ad3"
+SRC_URI[manpages.sha256sum] = "ac5c600153d1e4a1c6494e250cd27ca288e7667ad8d4ea2f2386f60ba1b78eec"
-- 
2.9.0


