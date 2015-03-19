Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8D69739BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:17:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5I1KA014866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:18:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 22:18:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 13:17:54 +0800
Message-ID: <076d15fec541333ac5ce7d7cc59c6fc01f9c69c7.1426742194.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426742194.git.Qi.Chen@windriver.com>
References: <cover.1426742194.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 4/5] os-release: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 19 Mar 2015 05:18:00 -0000
Content-Type: text/plain

Add LIC_FILES_CHKSUM to avoid the warning below at rootfs time.

    WARNING: The license listed MIT was not in the licenses collected for os-release

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/os-release/os-release.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 33e9581..87fea6f 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -3,6 +3,7 @@ inherit allarch
 SUMMARY = "Operating system identification"
 DESCRIPTION = "The /etc/os-release file contains operating system identification data."
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 INHIBIT_DEFAULT_DEPS = "1"
 
 do_fetch[noexec] = "1"
-- 
1.9.1


