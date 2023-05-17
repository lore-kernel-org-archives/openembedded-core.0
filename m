Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A870EC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:16:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.44465.1684311375395228338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nYXhgpKT;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30789a4c537so256380f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684311373; x=1686903373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sja+ruSGmiY+1RRNlBX92EDymlbXvtAqhn9bdInpyLI=;
        b=nYXhgpKThyBjAL9I3t97O030DGfV5jRqnOpZg/t1C6caWq33saIviRJy+kiHhzSv5z
         /IRPc+7hEDQl4xIJe3OCezAyLpiapG+anMMmYnI5LCsmXAgMvjmqExuV5A8o18zq9GZp
         BJycnNO6UN4Nw5ELAX5EVuqmo6PhQf0tQkwK9f8s4V9VxGRqJeWin/orVYopd/EzGrry
         9c0X13h63TAthikNXCcogExFYzpPhLIo4pdzkL6xtT94IK4ZpZCRwR+nDXkOivAevPrE
         +QIrOy1NwhT/8mCezBFowM7Ecd/lVfK/VZRDUV3YIJLBrhoHAeSoQCuIyJWPNEHuf/so
         GwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684311373; x=1686903373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sja+ruSGmiY+1RRNlBX92EDymlbXvtAqhn9bdInpyLI=;
        b=LkSEJHU1ZrHSOgj5/MWf5RPiPP/AoLajHOGsl+NWcRORdoi4K2ZjtA5KbkNfCDUvJd
         mom2GNpt3oniqsc6ij3Z99PVe1g1PnJMSyeEzOp7N7bQH6/tqGJP1ZdA2lsJhfUjNbcZ
         PXDmU12uSLK/NpXHn8jpX3I0LaKwpK/9J8p8K4vz7fvdkyE/uKeQa4tv6UEmqwXVT7h9
         cAm9ELlzgIBDtI4AtiAy5f9Hqpcdj8IMwLN9PvBuHahtO3xUWxsNv63i8KcSOdswRGez
         WroJ6fDPYpl93IsegkLwzp8viyjnZGzjI5SpP8XczwrJD/HZ1I+cW/73GIZMsb4XkL4W
         BK5A==
X-Gm-Message-State: AC+VfDzgXTncNKVSF+WBGpCWyvFIaOi2g0g/9/UPS8+ZOwDAcuJjBtk9
	oXocrBJWugLeGbOISSvYdGpKRllAc1dNIg==
X-Google-Smtp-Source: ACHHUZ64lWAY+sNyG0sNHweTxjDWBXkJKMoPPf0jQHeWz3i7r9jTC/QSPwqm/vGFdjASZHAeJdxE3A==
X-Received: by 2002:a5d:6041:0:b0:306:2c39:5d52 with SMTP id j1-20020a5d6041000000b003062c395d52mr27578856wrt.57.1684311373350;
        Wed, 17 May 2023 01:16:13 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([92.87.113.28])
        by smtp.gmail.com with ESMTPSA id h11-20020adff18b000000b0030785b864f1sm1925938wro.65.2023.05.17.01.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:16:13 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [PATCH] ncurses: change GitHub mirror
Date: Wed, 17 May 2023 11:15:43 +0300
Message-Id: <20230517081542.412-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181471

Change from github.com/mirror/ncurses to
github.com/ThomasDickey/ncurses-snapshots (which is linked in the
ncurses FAQ http://invisible-island.net/ncurses/ncurses.faq.html)

This is updated at least weekly, compared to mirror/ncurses, which was
last updated on March 12th.

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 4 ++--
 meta/recipes-core/ncurses/ncurses_6.4.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 367f3b19f4..eeb110687c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5a4600fdef86384c41ca33ecc70a4b8;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f2e5b99d5b6c0e6ee7cb39b992733b6;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://github.com/mirror/ncurses.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 1eb15673d1..166e30713c 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -6,7 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
+SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
-- 
2.25.1


