Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C33686DA5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 06:33:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAF6XuiN023144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 22:33:56 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 14 Nov 2013 22:33:56 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 14:34:46 +0800
Message-ID: <1384497286-19011-2-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1384497286-19011-1-git-send-email-Yue.Tao@windriver.com>
References: <1384497286-19011-1-git-send-email-Yue.Tao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Subject: [PATCH 2/2] Add e2fsprogs-mke2fs and e2fsprogs-e2fsck as recommend packages
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
X-List-Received-Date: Fri, 15 Nov 2013 06:33:56 -0000
Content-Type: text/plain

The mke2fs and e2fsck commands are regular tools of e2fsprogs, so they
should be installed.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index 63c0057..5c78c82 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -59,6 +59,7 @@ do_install_append () {
 }
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
+RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 
 PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks"
 PACKAGES =+ "libcomerr libss libe2p libext2fs"
-- 
1.7.5.4


