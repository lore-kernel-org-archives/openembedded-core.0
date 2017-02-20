Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCB5771C86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:00:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1K30jGM019147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 19:00:45 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 19 Feb 2017 19:00:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2017 19:00:42 -0800
Message-ID: <3d97fab0cc3b5e107761b9f5126a306d1c7d3e19.1487559493.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487559493.git.liezhi.yang@windriver.com>
References: <cover.1487559493.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pigz: set downloadfilename
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
X-List-Received-Date: Mon, 20 Feb 2017 03:00:46 -0000
Content-Type: text/plain

Otherwise, the filename is v${PV}.tar.gz which isn't straightforward.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pigz/pigz_2.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.3.4.bb
index 53c56c59479..f4832dffe15 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.4.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17
 
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
-SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
 SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
 SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
 
-- 
2.11.0.rc2.dirty


