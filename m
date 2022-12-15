Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FE2C25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.142644.1671132070132559747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZP5FBXaT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so3750493pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHNvpewMCjhAtLNWcaTu81RWPIrqSAzTPu2+TTl5XQI=;
        b=ZP5FBXaTEsbNo+BDV6E4T8P9vqlycsGv69uJYPokTlGURNvcvjHwF9bgdpS9sHZrIJ
         o2Wi9aNRJt+FYw670Sq/PAhLeEWIA36Tqt1eeaWEPh3/Lji6bdnJI/ods2+JzOwk2ylg
         4de212o15zxUaAVw1U2bZqVMQ2l/iPJTkZYNYdNIPeOamol6NkLLwYwa+2wisPrVc7ze
         RB2w308p2tr/VxLREdo2/a/GnZUH9u9v7IM+AATPowz9F4t5KRR5ClZUpeqjLe99HlGd
         zkfh55HPtiZB2Tx82hg+5uPHc7RmhBS1Q72Z3i8AiWfJGFGzuVb9nliMM6ovLlMz0CIO
         NTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHNvpewMCjhAtLNWcaTu81RWPIrqSAzTPu2+TTl5XQI=;
        b=E3ojfHjS6SB/rdD8kgiatpAM04Erxfbf59JjhuXqlQQfLDuAUGFbMWOChtzMpFNPy/
         KCJjFeD1X8eqFh80g3zFrfzd3vBy4wSwSzVINB+7mmoncyRdV+ZuVQoxNMxPG3L3D/Nx
         dcv+TP1Pf983oIxENVPvSyCE3jciok1JFt+g6YQxMOdTeQYg6GS/X+VGsXDds85rw0OG
         3PItVQdF46DlyFb8cBpRmhIWOYmD7/ncMAU5uqfH3pyCq1pt6y24fwbqY5kU9wZ7eL0U
         4WfiJP9n1u8GvZxGba7jWlN9xGqxrLsOVY+ENgMC447nmIOUNbEskZy+Att1nJq115Mk
         OcRA==
X-Gm-Message-State: ANoB5pnMsphEdRVa9Ee9ONevxNP2IQk6zUG2/wOvH2qCPMJIEfdtA2bL
	8293fanA+FKgI9VjwNv3XiTaclM5bdrG0G4asaU=
X-Google-Smtp-Source: AA0mqf6cfnVa4olw0y8ryTAiIcmFoa9+knDF7S9g+LaRou03hWIef+zmppbq+VjWZcR4e3xvz+3XcA==
X-Received: by 2002:a17:902:8343:b0:187:1f0:4579 with SMTP id z3-20020a170902834300b0018701f04579mr28734629pln.61.1671132069130;
        Thu, 15 Dec 2022 11:21:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/30] vim: upgrade 9.0.0820 -> 9.0.0947
Date: Thu, 15 Dec 2022 09:20:28 -1000
Message-Id: <e6b2f6113232e5c1f38f1885f34061c570790323.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174596

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

Includes fixes for CVE-2022-4141
https://nvd.nist.gov/vuln/detail/CVE-2022-4141

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 160f459febc7fb36cc0fe85c63eb26780ace3bfd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 298a111853..d86841efaa 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0820"
-SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
+PV .= ".0947"
+SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


