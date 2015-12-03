Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B71D6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 06:44:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB36i3YT017421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 22:44:03 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 2 Dec 2015 22:44:03 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Dec 2015 14:32:26 +0800
Message-ID: <acbe0c86991efd2efd47b5863d5207c92bb90b70.1449123744.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1449123744.git.kai.kang@windriver.com>
References: <cover.1449123744.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup-core-tools-testapps: disable kexec for mips64 and mis64n32
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
X-List-Received-Date: Thu, 03 Dec 2015 06:44:03 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 95b3988..750ba84 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -15,6 +15,8 @@ inherit packagegroup
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
 KEXECTOOLS_mipsel ?= ""
+KEXECTOOLS_mips64 ?= ""
+KEXECTOOLS_mips64n32 ?= ""
 KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
-- 
2.6.1


