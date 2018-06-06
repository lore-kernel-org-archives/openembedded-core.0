Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id C751C77FF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:51:24 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o13-v6so13044630wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mMCwIKna0hbp2fao++AZ04OgFyG0NL7rz6jKgOBJYaA=;
	b=elLZ9psVlMVGlAxOnss+sj5jDGXnTuXUQX4k/lKgn7StWNOhxtC6JG6dGVSwVyBK15
	qBlRNmbCvfdTZjogi7Ilp8hEfz/tKh+pA6RuZ6Zq0yLFG3HUupmBWa5idFODKk4oPxCd
	t4Qa1KcYwL7IAqWZ6vgScEzZK0tzjP2vW+FXQnmiHmoGoX3UvBNUN90aJtlqHpPwt0x1
	1tN6cVJgMcO/zyq2kLURu70w/ttF9FSVuYOz62yIcQz8WuZYUMDnddxTf3pNjuWMVz5b
	kdpG3l64FzPaKvdho44J9fjs1vqSTfpEWzoek/TESIZDcsx+fmxBV3wNKD2C1Ki0kuav
	+VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mMCwIKna0hbp2fao++AZ04OgFyG0NL7rz6jKgOBJYaA=;
	b=FuKaVtiiNl2/kE/WyOJCzvwbx+orG4VC//80lmVqagP7kjiwmd3kyV8ODPMta6Gr9/
	8XFGwT100AE21ql/nxRhH1ldPML8RV+1RMlbDTclIGZmZ5JUxA07LeC0HdKqj03i6Gwc
	9swtxR47/FI1NVD9/1TKV1c3IaM/60IZkIg8Q/9tXvU7JMWEsrdnOvdKf5Lu94FWaxvY
	+uBX3EWRKw3+sGaSUgmiBpPcwKD2QRyKmEkj1Nvb7CFqrMavKNoVZoRos2Y/sejEBvW1
	2Az7ukA2V5ofE8Eokop0w32ftmqNTxkni2kBSDo9e0xRPc0AUBP4pTf3sz0+iNqQB8dG
	mEEg==
X-Gm-Message-State: APt69E1LQs0JAdpP4fUrIZUEB+XSO+oJ1GXM4PmCIR7YGgoBeREpsu4k
	SHrdKUA9/vq39C93sLbEKVWvuSpu
X-Google-Smtp-Source: ADUXVKLlPnfaCZNOlwwmM6borVs2A5qyZTIweA1GTl3FfGeCERW+8B0pGDsdBfNghRfA38vAvnkcXQ==
X-Received: by 2002:a50:b4a1:: with SMTP id
	w30-v6mr4879842edd.254.1528307484916; 
	Wed, 06 Jun 2018 10:51:24 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	j43-v6sm19362331eda.26.2018.06.06.10.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 10:51:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 19:50:58 +0200
Message-Id: <20180606175058.29352-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2] minicom: fix SRC_URI
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
X-List-Received-Date: Wed, 06 Jun 2018 17:51:25 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use snapshot.debian.org instead.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index e6afe2b655..a0e8e17f12 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Text-based modem control and terminal emulation program"
-HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
+HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom/"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
 SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20180606T155409Z/pool/main/m/minicom/minicom_${PV}.orig.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
            file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
@@ -16,7 +16,7 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
 SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
 SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
 
-UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/minicom/"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.17.0


