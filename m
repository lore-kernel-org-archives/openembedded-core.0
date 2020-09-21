Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.43055.1600697791029373399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=mRHIKrp+;
 spf=pass (domain: blade-group.com, ip: 209.85.128.68, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f68.google.com with SMTP id d4so12303763wmd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W04akIU4mCujYA33S1d/G79kGXDasXMWDq3ZKZ89O9s=;
        b=mRHIKrp+aOrVX4SKAYTSJtbtYYkjwwqUifMUzZNzS5pcf757wM8dcnUwLt2oiFLj5O
         w0VQEIo+W6veN2wdU/xPZRL4w+fAMfREXtNLW0hMP34Ls0b9CSU+3hOguSHfWJieF5hv
         TdRzlHT6Edz49zPkyV24FCfilH8sEXjbrx8J6nn5dXCgNDLu1a00538edEBQTZBsU6uM
         uDGfF95Ew5PJZ1qMsHlDij/kpzGhBuBmwENKs6gPYtsVeMuqW2oriEAbEhZyJ1cdUKTZ
         e18e74cSfqMkhQ5Qw2wG9qpY5aW2Yzu5BQWY/onsAYH0icn9+cMDvTa0Z/FM1qLwBQkl
         MooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W04akIU4mCujYA33S1d/G79kGXDasXMWDq3ZKZ89O9s=;
        b=gwyb7EOcM7/yv79g4irazHUhKoWKlwcN2z+8FFSDRKtrgQmI8EJ0CTdMB/MNRWdHYJ
         5VK0CMkwWfgo3y/F4/jPQnzD6h3TKO187YdxW2gLjDTXOQKIzCMUA7F93FZDCiumup1g
         tNgiaR4ufe+MDYGzYS/uAXI86Ujrs1yq6wQIiK6Y7wkstWpX+nAmE5xYDctR7NEz+4W8
         d8Hbe5yP/qYWCTqeHhNnqDdjY7zfHlHIrAzzYcXQ639Hl5dRQFrJiILvp3ecWW7FsJyr
         y1YJZhWlM/b+v6QikTUN5yZyrNDMFaGhJgfF9Pn47DwAnzc0AmrUT161CY9XIL76KFzc
         +s8Q==
X-Gm-Message-State: AOAM531QSXdirLmLMoYDXLEwIO9ncLZT1pgcmSZirTNw7+p5wqVrzT2J
	gph18fePjyzBeEXf03wX2fgxRHZiXTvCx2V0
X-Google-Smtp-Source: ABdhPJxiKs6m7qEc0mG75DU7dTkJOQCk+QOZoDVSQ5WycIJGl9OwC9a8zsVU/WhJ4m4q2mAt/P6YcA==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr98770wmc.144.1600697789204;
        Mon, 21 Sep 2020 07:16:29 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:28 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 2/8] systemtap: remove extra dependencies
Date: Mon, 21 Sep 2020 16:15:38 +0200
Message-Id: <20200921141544.3145189-3-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Most of the RDEPENDS part of PACKAGECONFIG[translator] appears to be related to
examples only.
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index e98aff1851..375e570454 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -19,7 +19,7 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 EXTRA_OECONF += "${STAP_DOCS} "
 
 PACKAGECONFIG ??= "translator sqlite monitor python3-probes"
-PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,python3-core bash perl"
+PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,bash"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
-- 
2.28.0

