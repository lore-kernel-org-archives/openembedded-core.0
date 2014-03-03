Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32AC66F582
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 14:45:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s23EjwHG019846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 06:45:58 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 06:45:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 22:49:49 +0800
Message-ID: <b3828bf9a42717d8a1732a7469f6f95a4f26f1ae.1393855671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393855671.git.liezhi.yang@windriver.com>
References: <cover.1393855671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] grub git: add oe's kernel name to the conf file
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
X-List-Received-Date: Mon, 03 Mar 2014 14:46:00 -0000
Content-Type: text/plain

Our kernel's name is bzImage, we need add it to grub.d/10_linux.in so
that the grub-mkconfig and grub-install can work correctly on the
target.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 82a25c9..9b5d9bb 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -21,6 +21,7 @@ SRCREV = "0776112c5311196889a15058a3b1be4c81ba5e05"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://40_custom \
            file://autogen.sh-exclude-pc.patch \
+           file://grub-2.00-add-oe-kernel.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.8.3.1


