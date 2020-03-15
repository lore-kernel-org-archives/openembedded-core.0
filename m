Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF2B61BB5
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:07 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id j20so6827338pll.6
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=itxXS39Y7irtdZ9Yq+wh7vT3nIOsp1vDX37jqweXW6k=;
	b=GmGTp80Y5AGJ8ARBph/7X8WZDYLYdRxBS8MRXh4E9yccHq+cTcmklh270gHt7nrNAt
	P6qiiT5v+X7zWIKv3fIELT18aTh0V58dDSZCuyiq6zFZDvyb7oYbw3UKeSa7gLT3bCQz
	8E9c+faPYMKEtGslO/lssYPy3rTw0DpsQ/huLG4F0opAbvuVl9vPorJ0XpSNrVc8h6yj
	igGZlevGaiA4LH9w9OW4h4qY4eE4qoHeAtmZpfGlJ3J8bWk9cxFirER+B+91l1yrmEEX
	Eydeb8F6HFEijzwPgnrd7k9fQFm4rXdB9EqFbq0cQixPAF5nKuLl2MaEmh2u47EdGNX3
	VuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=itxXS39Y7irtdZ9Yq+wh7vT3nIOsp1vDX37jqweXW6k=;
	b=EuDj5+srJ9qD1mK2rFn1rNPcCCZnFRMiRtLksY4L3J4GPGtJh8xNh6/eBO3i/JZFb3
	rlkrkfTPy2fNWFQPNvZVAiYeYRcReR5cgyiPLJ3B3eVEs/DMgCbHp/ByR7XE7a4HHoXJ
	/9Oita6fpw9upfxVRw3hQLXafhzMqBtvFPf1MJ1Vzi9hXnLtVQkghRsRpGJxBsq9TrRF
	8jeMjc0VCfZ1DdoKp8vkQdEEj4tRn0lvopsWpTvCs/8zgHdwtQ4FInqzkBx067V3SR5r
	Z0YKJZNO8m45nCyqX/cKVA9EOgm44IweemWSNyXbbXV63E5QVDNFOjEmU5dOhh6AE6JJ
	Gayg==
X-Gm-Message-State: ANhLgQ3aoA8WVZ1MjGYZI6LXU39yO1yqdsI5hklVsyBvvK7N+hiME+z9
	BfxT6XboLheyN/Qku8me2R+vMYXE
X-Google-Smtp-Source: ADFU+vtJlZ/2+3/n9tjvO/cK5m7OJ5c8GWY3fWjx9cYA057PDzlQhdPoyncyRqwLQMfFVdCmgX/A/Q==
X-Received: by 2002:a17:90b:3d1:: with SMTP id
	go17mr19219098pjb.99.1584295928228; 
	Sun, 15 Mar 2020 11:12:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:49 -0700
Message-Id: <d6c8fd78942018bf24e093fcec3ba4899359406c.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 07/16] gcc-cross-canadian: A missing space in an append caused an invalid option
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:07 -0000

From: Mark Hatle <mark.hatle@kernel.crashing.org>

When configuring the cross-candian toolchain for a non-linux target system,
the resulting gcc configuration included:

  --enable-initfini-array--without-headers

these should have been two separate options.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b52893632dae7bc9ac75dddc7ad625e19f41050)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index f14cbf7152..4aac345bec 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -158,7 +158,7 @@ SYSTEMLIBS1 = "${target_libdir}/"
 EXTRA_OECONF += "--enable-poison-system-directories"
 EXTRA_OECONF_remove_elf = "--with-sysroot=/not/exist"
 EXTRA_OECONF_remove_eabi = "--with-sysroot=/not/exist"
-EXTRA_OECONF_append_elf = "--without-headers --with-newlib"
-EXTRA_OECONF_append_eabi = "--without-headers --with-newlib"
+EXTRA_OECONF_append_elf = " --without-headers --with-newlib"
+EXTRA_OECONF_append_eabi = " --without-headers --with-newlib"
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
2.17.1


