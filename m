Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1B7C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 14:16:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.50265.1654006611579038829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pEzPsHBS;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id f21so26857389ejh.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CUfdjjnut2KGEd1CYWt8hdaRz+lKsDIkeYS6X3qH4U=;
        b=pEzPsHBS67qhI96UTgVfUxiWs7jLLZak4zU4VNzrfy2hIvd0pk/Ijoy2EosiQtpwg6
         IPL/0NwjctQMmR6XKMR3wYCFaDNaTn7WVwudnjeYvPJV+j0c0mtz7hLj+uRm3wPjdgjk
         498nvQRvrp3NQX+SVxpr9ubtQ57jm63KYu4oweancvuinu5N4bM8oTLSoCuUOlmStdMx
         PZtBGnku4ZAU3HvrDV9YMfD3h+dJeuE45XcsqhxY5KwJ0aW53JKuwMPf/aR5NooFLTYt
         pA4LqLMig3nM+jwGOjxjYmOdH5rlz6ijN5EHFYqEWczKEkWLkFGDaT0vO/85dp7K8yTV
         isYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CUfdjjnut2KGEd1CYWt8hdaRz+lKsDIkeYS6X3qH4U=;
        b=ClC7atnfbK97PQIspxshEPeX8sita0vuez7uDMt9YbeQqmgFg1xUgljT1pwFhPBHKW
         3/E9yT+4yCdCaTrzB136oTvksXBbRuQNsC522Vtr57PtxuzK6PFsPQrP8RFVZ22Mc5Rl
         o45cMDMWfdBQ7B1SH7N11aVnVpyM8/c52j4kbcFLPLMWN/hmXjdnITiWJ2l0qLYNWoXZ
         gClkw3WMLn5bg8YE1MBCE4qbKACxJumPYB9Mi98XplgKEFAZABJeYvEWmo/md9ks9Gfc
         nkXVi/g24b3eYLmlKUfYMw+ll4jFL42JhW9ukmhwhiYEyTIYvvI9PjAxKzzvegMvLJCo
         JoTw==
X-Gm-Message-State: AOAM5309FeRl5gEH7W8CYHBDCfylwoSAX2EZimnJSxUvRLWM6CjY6hz/
	kd0vKfi6CDezUuvGlYJa9A89hgikXFk=
X-Google-Smtp-Source: 
 ABdhPJy6DxY/4ya2uwjOCx92tTQE5fzUfxv03FYlZQu6zBMJEBJR/jcx+TZMci75USyONOhjMUJuXQ==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id
 l4-20020a170906794400b006dab8342f3emr54408762ejo.353.1654006609568;
        Tue, 31 May 2022 07:16:49 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-12-122-122.business.telecomitalia.it. [87.12.122.122])
        by smtp.gmail.com with ESMTPSA id
 bo17-20020a170906d05100b006fe98fb9523sm5030254ejb.129.2022.05.31.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 07:16:49 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] ncurses: update to patchlevel 20220423
Date: Tue, 31 May 2022 16:16:45 +0200
Message-Id: <20220531141645.3401821-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 14:16:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166312

CVE: CVE-2022-29458

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-core/ncurses/ncurses.inc                         | 2 +-
 .../ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb}       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb} (77%)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 7a7c7dd227..1abcfae1fe 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9529289636145d1bf093c96af067695a;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5a4600fdef86384c41ca33ecc70a4b8;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.3.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
similarity index 77%
rename from meta/recipes-core/ncurses/ncurses_6.3.bb
rename to meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index f0256dad22..f67a3f5bf4 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -5,10 +5,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "51d0fd9cc3edb975f04224f29f777f8f448e8ced"
+SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
+CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.32.0


