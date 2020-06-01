Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.34383.1591009871516938391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KrC/a+hT;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id ce8so836999edb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gk+KwwJGTeEpC6Rb3NzsOGEV6nizuCNZQlY7YKsOBjU=;
        b=KrC/a+hTDKxHcv+jVe6w56zKFgQHnTA8Htp8yQsWa1BdFrL8u+fMIMgGn8IQIAkWyd
         5KpAigSDlG9UHeR1L9WLF39BD/tElh45WlwHZpu471ckTbLRLL7GhUwkMzjWuZN2oSGr
         Kb6OiIArF1ee5NySYRY3fAaQVnPf6ZrRoQIFIyt4nYORnxvIXftxEtDYzi6H2cfcq6vG
         DQxiVkyIq7izGzLglDYFwb1/ZIYMINbX6JS8jJbf2lHwm0FUnuwDfIMDuKi0aqehXaem
         bAyFoNyC0IwqG2Uq+EHsYQuqvj0g7fKfNwi2BGWcyUWbCYaca/K8OMNx162TvgY+QCX9
         8pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gk+KwwJGTeEpC6Rb3NzsOGEV6nizuCNZQlY7YKsOBjU=;
        b=eeKEKAR9sAJva7mtkts4YvJJSwtDXsG0iVIrcyQjwQ6fMu9WM9C8dDuSzgdQdWmFYP
         VzQGyDUh4mMCavQtDe+iZSbVHfZETcgz9exkHS/VQEv4US6wAeX8ow4upovyfxfiUfmt
         aunsJQqhTLjmKUM+Z4+RaPyW+6Ykhu4opFBew5UlTezdDjd2Rls8/bMapKpG8gXJumoU
         m4mbMkLrk/QqtyT3AQKGlTwOI8IhFnBW6pEVdV4B/EMTLcq6iaiMKpwT9dneEEZiQjB/
         Rhukf2CcPRAESalX85vlU+AIlVxwrD5UTtRDrOx2ke4qbVCrxr4NjmZUIJsAUp4AMvMx
         6eqQ==
X-Gm-Message-State: AOAM532V/AkFbExdY0IIYz90mSznHJ74pxxeZD3B+vSLLOAHcGbE5bOV
	s2STDdDlbt/L8ACpw45O9BvubaVf
X-Google-Smtp-Source: ABdhPJx6Avd87xVZJydAmVdcBF4fF13ChySUaoYWe4IsjrpjsBQZ5lQzlrI/xiHjbI005bjoR/PuXg==
X-Received: by 2002:a05:6402:362:: with SMTP id s2mr4562064edw.337.1591009869730;
        Mon, 01 Jun 2020 04:11:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id qp15sm14745120ejb.69.2020.06.01.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 04:11:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Auto Upgrade Helper <auh@auh.yoctoproject.org>
Subject: [PATCH] lz4: disable static library
Date: Mon,  1 Jun 2020 13:10:40 +0200
Message-Id: <20200601111040.30677-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Auto Upgrade Helper <auh@auh.yoctoproject.org>

It was found to be built in a non-reproducible way.

[YOCTO #13925]

Signed-off-by: Auto Upgrade Helper <auh@auh.yoctoproject.org>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index ed4452c82e..6510156ed0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install
-- 
2.26.2

