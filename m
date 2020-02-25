Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 698C56168F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t79so285322wmt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3OajSvlXgWB5nCE79XLnst3S061jsq7J8j86A+v//2I=;
	b=MBfxUoOpl886C6ixUWP+X+c7aA5XGr8jIlhd8CKthQEm1s6cRHOEdQyrsaayzMtUqm
	lEAxxK7APgBRG2TpJYKjDL0moyMvhFAJGqRt9QwjfLU/Anc3l2c97VmEaepTSsWF0fja
	N0HnvR440cSDeg1uWhZrHVfc7bANgRzA8GTyhIZRRp4UbpLGWrTS74wSmoVqVSguepK5
	RyB0APOh48UDAan6i1k9dW4bm284CAe5BYN0n61Mh6EjMKNUenoGp9iZ0tGALPwoNQvA
	06Ds1zIDOUaaecRM89vhTqJGx38NHD/XbQuUCMv6O5T/xFmTHEhw0full3REdxnG6HQH
	OAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3OajSvlXgWB5nCE79XLnst3S061jsq7J8j86A+v//2I=;
	b=qx8kFl8imKRwCj0zlHQbGV/lm9rGbY3QSEx1H3AP8Z7j2gAWfnySnF5lkBP/dkUikk
	ZsWqKmndfSc/DezdtZGvAgoFqxCj/+SwfhLrw5X480qmXlDZw5CqZs9R9skuuqACJBwi
	R543neP7XK9VJjggYncs6aX0rS7g0kIw4EYqvE6uMhDMQ6sCeW46bT6v7WEQ1/5nJasF
	xgElwiKRr1qrM7l0K9Cc6Rw9pLFFuu6GhUX9m1CT2qd20Og2sGLzBFpJuF1nU1U/FHLa
	VNjinxAt3rL6NYkx4lb+ZOBxjeiTTC7LvzZGDC8ygB7DE7KJSNvtH7TFY2A3GHWqmldT
	j0ow==
X-Gm-Message-State: APjAAAXk5tJvz3QzX3+pUFPsfSrbmmtUJcey3Zvlg9zMIyomMGo8VYe+
	nLlTy4YuJJ9CfMde5mMyLW7rH5Dd
X-Google-Smtp-Source: APXvYqze4Df5ELx3y66DqIAh3FhJ5+3mIOr38vjebHYvlL2r+c7x8ai8L6yaFeybB8dgvXKWPgrK8Q==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr629085wma.8.1582656848767;
	Tue, 25 Feb 2020 10:54:08 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:27 +0100
Message-Id: <20200225185335.19326-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] ncurses: upgrade 6.1+20191019 -> 6.2
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:08 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years and holders
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc                           | 2 +-
 .../ncurses/{ncurses_6.1+20191019.bb => ncurses_6.2.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1+20191019.bb => ncurses_6.2.bb} (89%)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index b7bf4c0d81..4156bf4f7d 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc180a8c44ca642e97c35452fab5f66"
+LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=5526f2f3a29edc95538b368a4771edda"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
similarity index 89%
rename from meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
rename to meta/recipes-core/ncurses/ncurses_6.2.bb
index 187777f6ef..b6d899c878 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://config.cache \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "ea70ec815b362f5bbad7a827a2edf50fd2b459cc"
+SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.25.0


