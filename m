Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96CE47547D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 01:09:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w58191Xv000104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jun 2018 18:09:01 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 7 Jun 2018 18:09:00 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jun 2018 09:18:32 +0800
Message-ID: <1e7b926e34d491b9414d856d29f4e2e705986ec8.1528420480.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528420480.git.dengke.du@windriver.com>
References: <cover.1528420480.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] trace-cmd: add PACKAGECONFIG for audit
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
X-List-Received-Date: Fri, 08 Jun 2018 01:09:00 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index 27c7c19..d9cc9a7 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-input.c;beginline=5;endline=8;md5=3ec82f43bbe0cfb5951ff414ef4d44d0 \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[audit] = ',NO_AUDIT=1,audit'
 EXTRA_OEMAKE = "\
     'prefix=${prefix}' \
     'bindir=${bindir}' \
@@ -21,6 +23,7 @@ EXTRA_OEMAKE = "\
     'libdir=${libdir}' \
     \
     NO_PYTHON=1 \
+    ${PACKAGECONFIG_CONFARGS} \
 "
 
 do_compile_prepend() {
-- 
2.7.4


