Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CD6C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.17722.1667750652715546454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vXrZ1zgg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id v17so9068326plo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CgP3DbtW0rq4CYKFrLBggH1mZMAqU3TJt7+Ep1uQzY=;
        b=vXrZ1zggYHzmR7xdiFbtwkwG1Atx4wA9xorcnmhdd/pGrULrzxt59WROqGGpdkogua
         yU1+OvE88hS1rYbL1DpbWfv/VbdIMhEnFDsAdJsvyGkFp4galrAZ2BrK0kRSNCuNjncA
         pV+V/h7AdbEXk/Up5ncSDHKhtYx2ojzF6wwHdn9ZV9/946HXa3rdFmT7UXgO4qd3l8i/
         FiuMbuAy0wzfUkMStuSfwzt4oAVEp9U/Vw7RQ75uZAkCGy3e7bVWDnmQMrJIaBArn9LH
         TtDpN3A1D9K80sJCqEYN5znW+VuXnFIb6rSN6drnZDdduU7hISsyLAQ7lDAp+iXhnuYl
         GxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CgP3DbtW0rq4CYKFrLBggH1mZMAqU3TJt7+Ep1uQzY=;
        b=DzVZgIMd7IBubGQJGRfJeHDbidn6LmeoUg9GOdtyX4uP2jyZu+CIYgiV8UKmUDcift
         9QxxkD0MSxH/ciOC+MWl6nCQhI30l8HcEeRii58zwrNGrs7sOmMyKP9OKq64RvsUPs/7
         tKNSkzeWYUhRkAFDmTtDnByhMA7xqadH4Cqe6DfRJVFH+KeSFC/gE1x4nGW5CcgDW5HD
         KdD9LOA+ny4xCzin1m0jUlc7LezuxddxNESZ/uTNt4IuGwkCu9/Tac2whsNQlQRFkenq
         uBevcosDE81NDBz+VoY9m14fEC1YhLyLQPFg1Pbz3zAaC4okR6drNmHTU1XrQZA8Y+iz
         eKjw==
X-Gm-Message-State: ACrzQf2ZY6LkOuoCKVmU+C3oJlXfhvkZgrsBINbDlAiEFhL5onZElcjS
	mGSdnnut4f7i+EUG6zvF2D2+Hjj+2Sl633Ij
X-Google-Smtp-Source: AMsMyM5Z8KMkDX6sXSYmCkmFwbM+q8hNSydZsiEfKFIIBsOsg7GN0ShgaKfaUEJaEep6g/bNHp8kqw==
X-Received: by 2002:a17:903:2285:b0:188:505b:25f with SMTP id b5-20020a170903228500b00188505b025fmr20518484plh.71.1667750651786;
        Sun, 06 Nov 2022 08:04:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] vim: Upgrade 9.0.0598 -> 9.0.0614
Date: Sun,  6 Nov 2022 06:03:50 -1000
Message-Id: <30ade05280760253bb1de4f5d757363e1b7e4fc0.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172811

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Include fixes for CVE-2022-3352.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8aa707f80ae1cfe89d5e20ec1f1632a65149aed4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f2cd235329..e9fd7a3eec 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0598"
-SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
+PV .= ".0614"
+SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


