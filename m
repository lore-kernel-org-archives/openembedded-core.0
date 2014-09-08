Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1523E6FBB9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s88Jtkrj019874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:46 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:27 -0400
Message-ID: <35987ae25c4c2fcab8dafc38aa847b0a05ec6dd8.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto-dev: bump to v3.17+
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:47 -0000
Content-Type: text/plain

Update the -dev recipes PV to reflect that the development tree is
now at v3.17-rc4.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 595f72d5bb6e..00feadedd894 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -35,7 +35,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${K
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "3.16+"
+LINUX_VERSION ?= "3.17+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


