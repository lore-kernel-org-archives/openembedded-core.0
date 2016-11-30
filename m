Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA3871B02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:26:16 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 37FACB89A3C; Thu,  1 Dec 2016 00:26:14 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:26:13 +0100
Message-Id: <1480548373-23237-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ffmpeg: disable unsupported extensions on mips32r1
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
X-List-Received-Date: Wed, 30 Nov 2016 23:26:17 -0000

| Warning: the `dsp' extension requires MIPS32 revision 2 or greater
| Warning: the `dspr2' extension requires MIPS32 revision 2 or greater

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
index 86279f2..c988d57 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
@@ -88,6 +88,7 @@ EXTRA_OECONF = " \
     --libdir=${libdir} \
     --shlibdir=${libdir} \
     --datadir=${datadir}/ffmpeg \
+    ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
 "
 
 do_configure() {
-- 
2.7.4


