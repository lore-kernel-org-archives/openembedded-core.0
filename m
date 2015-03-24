Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84C8D73C24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2OIvvkW010678
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Mar 2015 11:57:57 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 11:57:57 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 Mar 2015 14:57:53 -0400
Message-ID: <1c63179dfe46a004623f41434957fc34fe23d7e6.1427222980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1427222980.git.bruce.ashfield@windriver.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] skeleton: clarify linux-yocto-custom workflow
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:57 -0000
Content-Type: text/plain

It was pointed out that the kernel development documentation recommends
making a copy of linux-yocto-custom, while the comments in the recipe
itself suggest a bbappend.

To keep things consistent between these two sources, we update the
comment in the recipe itself to also recommend a copy (and rename).

[YOCTO: #6925]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index b1a0784c1b7d..05463c026304 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -4,11 +4,9 @@
 #   kernel classes to apply a subset of yocto kernel management to git
 #   managed kernel repositories.
 #
-#   To use linux-yocto-custom in your layer, create a
-#   linux-yocto-custom.bbappend file containing at least the following
-#   lines:
+#   To use linux-yocto-custom in your layer, copy this recipe (optionally
+#   rename it as well) and modify it appropriately for your machine. i.e.:
 #
-#     FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 #     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
 #
 #   You must also provide a Linux kernel configuration. The most direct
-- 
2.1.0


