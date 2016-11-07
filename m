Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 07FF271A68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:52 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 1D812E46D1B49;
	Mon,  7 Nov 2016 15:01:37 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:39 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:22 +0000
Message-ID: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 00/13] MIPS: Use MACHINEOVERRIDES and reduce duplication
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
X-List-Received-Date: Mon, 07 Nov 2016 15:16:53 -0000
Content-Type: text/plain

Hi,

This patch series adds a few MACHINEOVERRIDES options in arch-mips
to reduce duplicate configurations in various recipes.

Further info in 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10404

Regards,
ZubairLK

Zubair Lutfullah Kakakhel (13):
  arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
  bitbake.conf: Reduce duplication in MIPS variants
  fts: Reduce duplication in MIPS variants.
  glibc: Reduce duplication in MIPS variants
  packagegroup: Reduce duplication in MIPS variants.
  gcc-runtime: Reduce duplication in MIPS variants.
  gdb: Reduce duplication in MIPS variants.
  mmc-utils: Reduce duplication in MIPS variants.
  valgrind: Reduce duplication in MIPS variants.
  ghostscript: Reduce duplication in MIPS variants.
  ltp: Reduce duplication in MIPS variants.
  mdadm: Reduce duplication in MIPS variants.
  webkit: Reduce duplication in MIPS variants.

 meta/conf/bitbake.conf                                  | 11 +----------
 meta/conf/machine/include/mips/arch-mips.inc            |  7 +++++++
 meta/recipes-core/fts/fts.bb                            |  5 +----
 meta/recipes-core/glibc/glibc-ld.inc                    | 17 ++---------------
 .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  5 +----
 .../packagegroups/packagegroup-core-tools-profile.bb    | 10 ++--------
 meta/recipes-devtools/gcc/gcc-runtime.inc               |  9 +--------
 meta/recipes-devtools/gdb/gdb-common.inc                |  7 +------
 meta/recipes-devtools/mmc/mmc-utils_git.bb              |  6 ++++--
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb       |  3 +--
 meta/recipes-extended/ghostscript/ghostscript_9.19.bb   |  4 ++--
 meta/recipes-extended/ltp/ltp_20160126.bb               |  3 ++-
 meta/recipes-extended/mdadm/mdadm_3.4.bb                |  6 ++++--
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb            |  3 +--
 14 files changed, 30 insertions(+), 66 deletions(-)

-- 
2.10.2


