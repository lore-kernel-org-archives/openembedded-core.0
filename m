Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tf3kn-0000ff-K6
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 08:14:17 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1282662lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2012 22:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EsyPCoM2w+arpzKgEnMgm18IPuTCNqInySCWWWCODBI=;
	b=WryKlhXcZ/q/xJq33/3lxSU8UTI6aMjYmP60q48ClMtP6Rx555/XvJTl1Z0n2bgayq
	4VWv6X8gpnVF1tg+/KRa27C/t/GTlhd95aO0JQIo/io12y6rzRDOy6udMkED8xRhLuDi
	oeyIDSEsW+gzg89mGCViBLNpAMr+NoJlNDoVHCgXVdeQzSC6uWMEJSwDBO8Xh5brzHZN
	iST4lYpH0xD9geU7gBB3ofeCHSxB+Zjsse+6y+ZhJB6O6TmTt1bLIxlJo4p8R4BqRjxn
	QRcBBhLEKDtbbCIjDOTFxT0kaB1fAxkJG47c2fjl2FGvfaawyE2TUVAiTOLm7Q1a2zlR
	LO+g==
Received: by 10.112.42.34 with SMTP id k2mr2865334lbl.26.1354431598032;
	Sat, 01 Dec 2012 22:59:58 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id y10sm3862614lbg.4.2012.12.01.22.59.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Dec 2012 22:59:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tf3Wt-0004Ih-4I; Sun, 02 Dec 2012 08:59:55 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2012 08:59:51 +0200
Message-Id: <1354431591-16490-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354431591-16490-1-git-send-email-cazfi74@gmail.com>
References: <1354431591-16490-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] libpng: fix license segment md5sum boundary
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
X-List-Received-Date: Sun, 02 Dec 2012 07:14:17 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
index 211e357..62989bb 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
-                    file://png.h;startline=310;endline=424;md5=62968b88b0425ceeb919de3fd21b03e5"
+                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
 DEPENDS = "zlib"
 PR = "r0"
 
-- 
1.7.10.4



