Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB236072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 09:29:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3I9TTAB010900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:29:29 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 02:29:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 02:29:26 -0700
Message-ID: <0ab803eaad49b9de11cb56f8bd538eb814265d89.1460971725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460971725.git.liezhi.yang@windriver.com>
References: <cover.1460971725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] xf86-video-omapfb: remove EXTRA_OECONF_armv7a
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
X-List-Received-Date: Mon, 18 Apr 2016 09:29:29 -0000
Content-Type: text/plain

Fixe when build with armv7a:
gcc -c ../../git/src/sw-exa.c  -fPIC -DPIC -o .libs/sw-exa.o
{standard input}: Assembler messages:
{standard input}:179: Error: selected processor does not support `vld1.u8 {d0},[r1]!' in ARM mode
{standard input}:182: Error: selected processor does not support `vld1.u8 {d1},[r4]!' in ARM mode
{standard input}:183: Error: selected processor does not support `vld1.u8 {q1},[r0]!' in ARM mode
{standard input}:184: Error: selected processor does not support `vzip.u8 d0,d1' in ARM mode
{standard input}:185: Error: selected processor does not support `vld1.u8 {q2},[ip]!' in ARM mode
{standard input}:186: Error: selected processor does not support `vst2.u8 {q0,q1},[fp]!' in ARM mode
{standard input}:187: Error: selected FPU does not support instruction -- `vmov.u8 q1,q2'
{standard input}:188: Error: selected processor does not support `vst2.u8 {q0,q1},[lr]!' in ARM mode
{standard input}:239: Error: selected processor does not support `vld1.u8 {d0},[r1]!' in ARM mode
{standard input}:242: Error: selected processor does not support `vld1.u8 {d1},[r4]!' in ARM mode
{standard input}:243: Error: selected processor does not support `vld1.u8 {q1},[r0]!' in ARM mode
{standard input}:244: Error: selected processor does not support `vzip.u8 d0,d1' in ARM mode
{standard input}:245: Error: selected processor does not support `vld1.u8 {q2},[ip]!' in ARM mode
{standard input}:246: Error: selected processor does not support `vst2.u8 {q0,q1},[fp]!' in ARM mode
{standard input}:247: Error: selected FPU does not support instruction -- `vmov.u8 q1,q2'
{standard input}:248: Error: selected processor does not support `vst2.u8 {q0,q1},[lr]!' in ARM mode
make[2]: *** [image-format-conversions.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
../../git/src/omapfb-crtc.c: In function 'OMAPFBCrtcResize':
../../git/src/omapfb-crtc.c:34:12: warning: unused variable 'ofb' [-Wunused-variable]
  OMAPFBPtr ofb = OMAPFB(pScrn);
            ^
../../git/src/omapfb-xv.c:66:43: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     { XvSettable | XvGettable, 0, 0xffff, "XV_COLORKEY" },

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 3ccd870..7ebb960 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -29,7 +29,6 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/xf86-video-omapfb.git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF_armv7a = " --enable-neon "
 CFLAGS += " -I${STAGING_INCDIR}/xorg "
 
 # Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
-- 
2.8.0


