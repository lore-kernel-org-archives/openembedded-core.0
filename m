Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4F456A597
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 14:17:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5GEHHdq001734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 07:17:19 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 16 Jun 2013 07:17:17 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Jun 2013 22:16:25 +0800
Message-ID: <30a61ca7883e5f9d8858c7b89884874e74a972c5.1371392062.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371392062.git.kai.kang@windriver.com>
References: <cover.1371392062.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/2] strace: update depends
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
X-List-Received-Date: Sun, 16 Jun 2013 14:17:18 -0000
Content-Type: text/plain

Build strace with libaio and acl to support more features. Because no
native libaio package, just add dependencies for target.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/strace/strace_4.7.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
index e360e63..bcc7bd9 100644
--- a/meta/recipes-devtools/strace/strace_4.7.bb
+++ b/meta/recipes-devtools/strace/strace_4.7.bb
@@ -5,6 +5,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
 PR = "r4"
 
+DEPENDS_class-target += "libaio acl"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch \
            file://0014-x32-update-syscall-table.patch \
-- 
1.7.5.4


