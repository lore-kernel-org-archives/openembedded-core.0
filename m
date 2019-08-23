Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E56EE7DDAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:38:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so9737954wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NUQA3yAsRoNHjCjRNTAlkh1LI+F/4sAfozfLo9olmkE=;
	b=nKyDbAH04T5j9uum9koky5oPOZcP/39vVKhSUG7YFtBMK2/vqRQGLZt7T1Z2AczftN
	vrfSdIzhG5WSRWv32YpAFt8La/gkXIB1WHqxI2P5VcARd13ln5a1RJBjdvOofJzK4iFf
	rv/0bLWaxUTlruDVUNbXg+ZsZ3viD5xtPC0IftHLNF4oini/wX0hZHZtAYjoO7XyIkb4
	yY2UkcM6rpct+hGmJUfiqsZl8WR2atgs7bp64SU1W1r0srUViAlzb47j4X/nwrOInKgL
	U0a/HUDXLJSjHBZ1I5OT02kMFHqjJ2lZ7eY57VMHWYjnnkT63yYSBxi7wDiE995u28Wu
	AQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NUQA3yAsRoNHjCjRNTAlkh1LI+F/4sAfozfLo9olmkE=;
	b=iXnZaTGZFDCSe6nO8uyeaDl0iMK71J0d+2XrIaefWATYJ7ASGWzrNbIxxyfxEMbbPj
	8aeAGzbuNi32DlEEBLkji9+tRMO5xbiSRJ/GqkbqAwC+y8ynLC6tjlT80EvD1p5wwSVm
	M4bIwyDxga0t7qUekZpSABCBh70bpkqHYFTc8fTqCcguuRKd+2wsERmWCUYIj6356pTZ
	yELpUzmAGD51QPzrckjQk9RXBxRMbMtiRrMygFndxxNNqC5QsD/z3pYTD5oJRxVxkkOw
	WRg+NghEdcpRPFgUthwMOU1HvQKCDxFHqk/NhQZ3v+DWiNCTzwrqHDyBTfWjU95IX0R3
	s4Ig==
X-Gm-Message-State: APjAAAVvLhNLkMurKquIEajpww+tNDLUqhyNPPJN8KE2XiTqiAVZNbkC
	kQzx1hgoNt1kmqfZz4NB0rdjMeui80I=
X-Google-Smtp-Source: APXvYqyUj7kEEDYJJ39iHHvRrR/PgCasIu7MXaidGj8N7Pm2gJNHyuFoPA47EF8OHO8Ge/revpRnNw==
X-Received: by 2002:a5d:6acd:: with SMTP id u13mr7102601wrw.257.1566592709167; 
	Fri, 23 Aug 2019 13:38:29 -0700 (PDT)
Received: from cmtcleu60844809.rd.corpintra.net
	([2a02:8109:b5c0:1428:ddc0:95d5:be7d:53aa])
	by smtp.gmail.com with ESMTPSA id
	m188sm7920891wmm.32.2019.08.23.13.38.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 23 Aug 2019 13:38:28 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 22:38:23 +0200
Message-Id: <20190823203823.4373-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] iw: upgrade to 5.3
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
X-List-Received-Date: Fri, 23 Aug 2019 20:38:29 -0000
Content-Transfer-Encoding: 8bit

Separated build dir doesn't work because Makefile points out source dir.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iw/{iw_5.0.1.bb => iw_5.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.0.1.bb => iw_5.3.bb} (83%)

diff --git a/meta/recipes-connectivity/iw/iw_5.0.1.bb b/meta/recipes-connectivity/iw/iw_5.3.bb
similarity index 83%
rename from meta/recipes-connectivity/iw/iw_5.0.1.bb
rename to meta/recipes-connectivity/iw/iw_5.3.bb
index 87b21e668d..f7f13f5a30 100644
--- a/meta/recipes-connectivity/iw/iw_5.0.1.bb
+++ b/meta/recipes-connectivity/iw/iw_5.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "a0a17ab1b20132c716bba9a4f9974ba6"
-SRC_URI[sha256sum] = "36fc7592dde7bec934df83cd53ef1f2c08ceec5cd58d07eb8f71cc6e8464013c"
+SRC_URI[md5sum] = "6d4d1c0ee34f3a7bda0e6aafcd7aaf31"
+SRC_URI[sha256sum] = "175abbfce86348c0b70e778c13a94c0bfc9abc7a506d2bd608261583aeedf64a"
 
 inherit pkgconfig
 
@@ -26,7 +26,6 @@ EXTRA_OEMAKE = "\
     'SBINDIR=${sbindir}' \
     'MANDIR=${mandir}' \
 "
-B = "${WORKDIR}/build"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-- 
2.23.0


