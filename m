Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA9D772B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 10:48:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13950801"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2016 18:48:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B6C0841B5F44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 18:48:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 15 Dec 2016 18:48:01 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2016 18:46:48 +0800
Message-ID: <1481798810-36217-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: B6C0841B5F44.A872F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 0/2 V2] gdb 7.11.1 -> 7.12
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
X-List-Received-Date: Thu, 15 Dec 2016 10:48:08 -0000
Content-Type: text/plain

1) Upgrade gdb from 7.11.1 to 7.12
2) Delete 11 patches below, since they are integrated upstream.
    0001-include-sys-types.h-for-mode_t.patch
    0002-make-man-install-relative-to-DESTDIR.patch
    0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
    0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
    0005-Add-support-for-Renesas-SH-sh4-architecture.patch
    0006-Dont-disable-libreadline.a-when-using-disable-static.patch
    0007-use-asm-sgidefs.h.patch
    0008-Use-exorted-definitions-of-SIGRTMIN.patch
    0009-Change-order-of-CFLAGS.patch
    0010-resolve-restrict-keyword-conflict.patch
    0011-avx_mpx.patch
3) Change default gdb config to 7.12

Zheng Ruoqin (2):
  [OE-core] [PATCH] gdb 7.11.1 -> 7.12
  [OE-core] [PATCH] Change default gdb config

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-devtools/gdb/gdb-7.11.1.inc           |   22 -
 meta/recipes-devtools/gdb/gdb-7.12.inc             |   11 +
 ...nadian_7.11.1.bb => gdb-cross-canadian_7.12.bb} |    0
 .../gdb/{gdb-cross_7.11.1.bb => gdb-cross_7.12.bb} |    0
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  |   30 -
 ...0002-make-man-install-relative-to-DESTDIR.patch |   28 -
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |   37 -
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   53 -
 ...d-support-for-Renesas-SH-sh4-architecture.patch |  921 -------
 ...e-libreadline.a-when-using-disable-static.patch |   50 -
 .../gdb/gdb/0007-use-asm-sgidefs.h.patch           |   36 -
 .../0008-Use-exorted-definitions-of-SIGRTMIN.patch |   50 -
 .../gdb/gdb/0009-Change-order-of-CFLAGS.patch      |   34 -
 .../0010-resolve-restrict-keyword-conflict.patch   |   48 -
 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch   | 2601 --------------------
 .../gdb/{gdb_7.11.1.bb => gdb_7.12.bb}             |    0
 17 files changed, 12 insertions(+), 3911 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-7.11.1.inc
 create mode 100644 meta/recipes-devtools/gdb/gdb-7.12.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.11.1.bb => gdb-cross-canadian_7.12.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.11.1.bb => gdb-cross_7.12.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch
 rename meta/recipes-devtools/gdb/{gdb_7.11.1.bb => gdb_7.12.bb} (100%)

-- 
2.7.4




