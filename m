Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 76A907523F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:39:09 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p126-v6so6861444wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=A1SFZkr2aDNwciuQqnXif6PZD7GIOrxt9v2UIocmVOc=;
	b=srKWzYtGZTZOMHpAQsW0B1E3ZnLNJOmivbk7VQofmDYDW1TLvA3lx3CbRFR5vLDE+V
	wvf2fANp4sqkCedLx2XP5HVMkeFIIm+ioZBA9H8P2W8Eg4JItcamJS+3nemrs9DsXx5l
	MteGJC8VgC6J38JyaNxFto771HW73yyX9cJVlaO979cLcuihZ0lhLswWyyZd63egmk2N
	U2KffHpwGhV9UOBRQNoZNj9z4QfJrvf+Ayn1xzSqQGNAgd/+6XCfT9A6c57Nu3b0Tj4P
	NYcVp9TvKbRS3dCTNEK/GTC0qtntP/MkVKICUr2bNeVmYaXs4TbK707ToljSX4p8o33X
	Khgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A1SFZkr2aDNwciuQqnXif6PZD7GIOrxt9v2UIocmVOc=;
	b=My6E/+FOzBi5nnKJiv3PXbMP5+SxupSXcNpvytfSPokDzB+MvCps4D6TrTEqGR2S2k
	WvElVbE4JBaTQYKdoEtZklQ6RjREItya/Iek27u5zNWP7F4FK4URfv+Ufv37dOeSGJcr
	TKQk4EeSaL5sE/5Fo/ckc7ScvFHS6j3BpH4fjaXFckhh4c5mx1O1Qy+xE6H9R0KezPp3
	7xQMEWYEQx2kZc+it8e0enD//h6+GFXEsNK3mJpuhPfrrTopTi22ivhNXZfT+L34WHeN
	gNpW+xujUV1DglSfL06qb8cGk13TetKs0j66Y+W05vsCnwW2ui+5HQUQxGdlCGqVRP2G
	srpQ==
X-Gm-Message-State: ALKqPwfgnzeR/UliS3smRQhr5+/yHz8lQnuy3IFHnnoZcBmF9lJ/gwWO
	x02JyKxs8v++XIavhENHzL6yTZJw
X-Google-Smtp-Source: ADUXVKLXUk8EpZd6DyU5zNX74MnSRZ1dOYyNsEYmjVgTfqZeydsxUh7hy566PhnmDXPhfW0+45QFSQ==
X-Received: by 2002:a50:f552:: with SMTP id
	w18-v6mr25037877edm.230.1528130349760; 
	Mon, 04 Jun 2018 09:39:09 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	c13-v6sm4186051edr.78.2018.06.04.09.39.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 09:39:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 18:39:05 +0200
Message-Id: <20180604163905.17292-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v3] minicom: fix SRC_URI
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
X-List-Received-Date: Mon, 04 Jun 2018 16:39:09 -0000

The original source, alioth.debian.org has been permanently taken down
by the Debian Project. Use Debian mirrors instead.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index e6afe2b655..d963da7436 100644
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
+SRC_URI = "${DEBIAN_MIRROR}/main/m/minicom/minicom_${PV}.orig.tar.gz \
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


