Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.12699.1626103979573133470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YMhUPAXd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id k20so11657418pgg.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PmjhS/1hWxIIciRwWhs7UZdL2qqBJ53bdLluUnAZb/s=;
        b=YMhUPAXdGD0EfjQhQwp6w4tHuaIoJYXYJWuiN9IaD8eHEQ7B0rI3zUzPQymThmTM/M
         sdDhzUUdvogDYCf4CTrIJB7romnvXGHvo4qCyT+7owctl670xp5mBGNmH1D8UYdODSQv
         XWWJBR/LVYJIXlB7lrHeCCxuAatlejPP/ddf7c2/GVHEnSRjI+dnhYr3i3ZwBIE3YnfX
         cCx569DUiyC7MBXA2mHs46hUP0Hbub1j7RMkB2Uzl9AMXmCEvnm5mveK/g2yutc1J85H
         NYe3porzopzWbOw2zLRPgRpy4YYeQfcQu0d2C66QZcBS7a3spskRj2LjfInxELlnUfVu
         FOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PmjhS/1hWxIIciRwWhs7UZdL2qqBJ53bdLluUnAZb/s=;
        b=XOhTRI7bJw3NdNKLqIuIIcQNUXPHSxqFC/OdXxk9LRwSPK+9JG75p6DsZcGhzkDpvm
         X+9pElgA1za2IFrnSKobxJRkNjvTli1fOVZkldLKNBSbxe6C+NxFZEii7bCp7xKMj4IE
         +acVVDvIxR6MJkInKwgFIA341L3777WOYQSpCIsfi0ZyixCsVdGCzxUg9kb4RNDLBuQk
         bLVv8jsgJ8f5X7CzaV28IgrbtzZ2TqIj24NiJ5bemt1/KXMqFT81QSOVO8tVZ7XTy0LV
         TIc03kyL/53GRmInODxrqoL8udLxFxVuB/vwsUQ9Z1MGULGHch60zDUfR6VK5PHXP7kj
         dH3w==
X-Gm-Message-State: AOAM533PRxCBKlXkCFdxWhc24WjYdTW7g37WqlYxLg+ap8W26ClwoNMY
	P2cebui8BdxYcETUnBdC1KO5EJFTSF9dZfmX
X-Google-Smtp-Source: ABdhPJzMukFQPX0pqp5DTWaf8MURfnT7l2GEQ8zGNQexcl224q3thNmRDGYL8e6Gn635lK6m8vE99w==
X-Received: by 2002:a63:de18:: with SMTP id f24mr47736805pgg.112.1626103978749;
        Mon, 12 Jul 2021 08:32:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] update-rc.d: update SRCREV to pull in fix for non-bash shell support
Date: Mon, 12 Jul 2021 05:32:04 -1000
Message-Id: <2a692b74f49952636098427ca523bc1590b9d81c.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

This pulls in non-bash shell fix for enable/disable command, upstream
commit 8636cf4 ("update-rc.d: Fix enable/disable command"). This way
update-rc.d works with e.g. dash shell again.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Changqing Li <changqing.li@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f697332a3a753898183d7c5d2965dd75db9b0a24)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index 75632d9434..da716674c3 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d"
-SRCREV = "4b150b25b38de688d25cde2b2d22c268ed65a748"
+SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.25.1

