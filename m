Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bA5-0004OE-G3
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:45:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NTvTN006249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:29:57 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:29:55 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:56:38 -0600
Message-ID: <01fc2a44e951dd523989d5834ccd5a4e22feb40f.1360270199.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270199.git.mark.hatle@windriver.com>
References: <cover.1360270199.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [denzil 11/18] qemu-0.15.1: add patch to fix compilatation problems on powerpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:45:53 -0000
Content-Type: text/plain

From: Matthew McClintock <msm@freescale.com>

ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447 for further information)
ERROR: Logfile of failure stored in: /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447
Log data follows:
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common', 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux', 'common']
| ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447 for further information)
| NOTE: make -j 24
|   LINK  ppc-linux-user/qemu-ppc
| /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/sysroots/x86_64-linux/usr/libexec/ppc64e5500-fsl-linux/gcc/powerpc64-fsl-linux/4.6.4/ld:/opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/qemu-0.15.1/ppc64.ld:84: syntax error
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-ppc] Error 1
| make: *** [subdir-ppc-linux-user] Error 2
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed

Signed-off-by: Matthew McClintock <msm@freescale.com>

(master rev: a9207aad5b163a071cd8298517d61514c587e0ed)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/qemu/qemu_0.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index b3fb354..2cc59f6 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r8"
+PR = "r9"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
-- 
1.8.1.2.545.g2f19ada



