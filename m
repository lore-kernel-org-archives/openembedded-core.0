Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EBDC07E543
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HdLB4F2wz5c
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566885122;
	bh=TcHGIqHtsaAhxHMRTRGvvxwuj7gPPNCHLJbJ3Xp4rjk=;
	h=From:To:Subject:Date:From;
	b=JAjWODW0BRcfMvjDObKFRliO3WMp74VLWlOM3gkr0revH/hRW0GrYyy+nQZbfo1yk
	FEAh9O7mEue3IIgfSOMvJSENm1QpVx+CcnIG8aItvTZg+A6Ys46e2boX0UzqheEdVw
	QzBG5tmcpjdHbGkDTu7pRvIHeN9plU1ncQH/X1S7DOA4P2Nnz9VhibcwpAzHo14F0o
	9R445MACOYFiQJ3shqoihQ5JOQ4MDLfsgmLyhi4Z+qOATawEvWLCIvMESOv5Y2SHjQ
	0QOlLDmsd/7HiEk7/9YXkMcxSktY/ZgH9+LTg9zE6pF0Cc5i/EWpBpUCxZjd4BiMoP
	7X5wkWjYv8WfqNdUZGU5Ne8nFntU/qccHxAybrpaKrlJJDCe/9sFWvAXhSh+Hkn9nR
	JtRng12WJ/o9lFdRaIhTH5nhjUCHBiatF65wu1HahFrL4rU/Uig+gq4e2R+CEYiu+/
	ysoG6QiLf+fGCFDsnnHyOwqzvdLMUBf18tydK/OVvdQsbY+VBalwzklcvSRyw34RFA
	nQPUm/lxJkrYQbuAPyK/8qB/kZdUJkzaJDPXWG+TCikQPgildkpYYRmDccITsy30Kd
	lnzQFEsUxwWf+1J1/qoQRiODkHJ1cviQqn1jn8sfHbuT+/Fu1vkAe6bBk5ZPIkuR5K
	hlwYddD91xLFQD7aho4QD6tI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 08:51:58 +0300
Message-Id: <20190827055200.3690-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] flac: Upgrade 1.3.2 -> 1.3.3
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
X-List-Received-Date: Tue, 27 Aug 2019 05:52:02 -0000

Remove backported patch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../flac/flac/CVE-2017-6888.patch             | 37 -------------------
 .../flac/{flac_1.3.2.bb => flac_1.3.3.bb}     |  7 ++--
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
 rename meta/recipes-multimedia/flac/{flac_1.3.2.bb => flac_1.3.3.bb} (91%)

diff --git a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
deleted file mode 100644
index f01791680e..0000000000
--- a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 43ecb6431077ff54e9df27f71737e6e96d6c039f Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 21 Aug 2018 14:46:43 +0800
-Subject: [PATCH] From 5f47b63e9c971e6391590caf00a0f2a5ed612e67 Mon Sep 17
- 00:00:00 2001 From: Erik de Castro Lopo <erikd@mega-nerd.com> Date: Sat, 8
- Apr 2017 18:34:49 +1000 Subject: [PATCH] stream_decoder.c: Fix a memory leak
-
-Leak reported by Secunia Research.
-
-Upstream-Status: Backport[https://git.xiph.org/?p=flac.git;a=commit;
-                 h=4f47b63e9c971e6391590caf00a0f2a5ed612e67]
-
-Update patch to version 1.3.2
-CVE: CVE-2017-6888
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/libFLAC/stream_decoder.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
-index d364b0c..ebf93da 100644
---- a/src/libFLAC/stream_decoder.c
-+++ b/src/libFLAC/stream_decoder.c
-@@ -1759,6 +1759,9 @@ FLAC__bool read_metadata_vorbiscomment_(FLAC__StreamDecoder *decoder, FLAC__Stre
- 					}
- 					memset (obj->comments[i].entry, 0, obj->comments[i].length) ;
- 					if (!FLAC__bitreader_read_byte_block_aligned_no_crc(decoder->private_->input, obj->comments[i].entry, obj->comments[i].length)) {
-+						/* Current i-th entry is bad, so we delete it. */\
-+						free (obj->comments[i].entry) ;
-+						obj->comments[i].entry = NULL ;						
- 						obj->num_comments = i;
- 						goto skip;
- 					}
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
similarity index 91%
rename from meta/recipes-multimedia/flac/flac_1.3.2.bb
rename to meta/recipes-multimedia/flac/flac_1.3.3.bb
index e8599f6bab..fea2be1f6b 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
-           file://CVE-2017-6888.patch "
+"
 
-
-SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
-SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
+SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
+SRC_URI[sha256sum] = "213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748"
 
 CVE_PRODUCT = "libflac flac"
 
-- 
2.17.1


