Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7C57067B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:39:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA6FdcHY004847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:39:38 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:39:37 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:28 +0800
Message-ID: <16eac9384e3fd980a6478352dad1f14529d609c7.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 25/25] poky.conf: Add support for aarch64 to QEMU
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
X-List-Received-Date: Thu, 06 Nov 2014 15:39:38 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-yocto/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index eaf06d3..144260f 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -44,7 +44,7 @@ DISTRO_EXTRA_RDEPENDS_append_qemux86-64 = " ${POKYQEMUDEPS}"
 
 TCLIBCAPPEND = ""
 
-QEMU_TARGETS ?= "arm i386 mips mipsel ppc x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel ppc x86_64"
 # Other QEMU_TARGETS "mips64 mips64el sh4"
 
 PREMIRRORS ??= "\
-- 
1.9.1


