Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 781F1660F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 08:43:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5J8h70Z008409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 01:43:07 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 19 Jun 2014 01:43:07 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 16:42:59 +0800
Message-ID: <1403167380-25786-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1403167380-25786-1-git-send-email-ming.liu@windriver.com>
References: <1403167380-25786-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] grub-efi.bbclass: Ensure MLPREFIX is applied to depends flag
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
X-List-Received-Date: Thu, 19 Jun 2014 08:43:10 -0000
Content-Type: text/plain

Add MLPREFIX to depends flag to ensure the correct grub-efi is
dependended upon.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/grub-efi.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 5c80c17..505d032 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -15,8 +15,8 @@
 # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
 
-do_bootimg[depends] += "grub-efi:do_deploy"
-do_bootdirectdisk[depends] += "grub-efi:do_deploy"
+do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
+do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUBCFG = "${S}/grub.cfg"
-- 
1.8.4.1


