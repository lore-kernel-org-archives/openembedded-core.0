Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1D7A706AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 09:34:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7R9Y646020139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 02:34:06 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 27 Aug 2014 02:34:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 05:34:04 -0400
Message-ID: <1409132044-10987-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] qemu: add PACKAGECONFIG for numa
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
X-List-Received-Date: Wed, 27 Aug 2014 09:34:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for numa to avoid build error:
backends/hostmem.c:21:20: fatal error: numaif.h: No such file or directory

Package numctl is from meta-oe.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f737ded..11bec1c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -109,6 +109,7 @@ PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,mesa"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
+PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 
 EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
 
-- 
2.0.0


