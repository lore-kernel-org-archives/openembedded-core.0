Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2DCC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 22:00:00 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.53493.1638136800301886003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 14:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eVAlYUWr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 8so14653820pfo.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 14:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y6C0iqEJM2Oyt8R6SBpuFKp+MOFfwUZDdYlREmMaOeQ=;
        b=eVAlYUWrrM/DNL1Xd8h1jw4m+/8NM/cCwpspkZdPGuKzf2sYUV1xgggxY0twtxSQz8
         klDEvRo3EoGi7ZUJpm1ydq3d2OxkHsMDlkcz/XWqh6mEAqA6NnnSFuBylXkbN/BRR0X/
         lOrhOp10QPLYvxhdvXbrVVHdyGUCChXNS8VoOV+suE9FCDfLxdEtJapPsA/e5yy4hzJS
         ZWqcf3+3Gm/fa48PtTt6YEJ7gK/FMAXMMutG67FZLw5QLa42iVOsMXcv0fCi7zmJW3SU
         4gYC/g5n47DIC1ba8AZMvbw9n0LzUhdYKZc2NBhZemnNb1oT/H+M7cCmETbcoBaeEb/b
         8N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y6C0iqEJM2Oyt8R6SBpuFKp+MOFfwUZDdYlREmMaOeQ=;
        b=b1UYtjiH7OXDncOeie+E76gN8Pa1cC7MdnFIYED83nPZrUOWWkgzfE7bt75EgTzHYd
         X8iR3zWmRpCMv1P/NEpvLQYOyhMRvs449LsCcKauvVp7GOitG8hx9KkuIF05YaGIXen9
         Sg2eEMR+B6L9Qb/a66UjD+PLaCwRQSQCpXLx65QuSPC4Foq3coWsr7PPLESQo5mnhOzg
         s26RPDsNNssj2QvYegUL2PH2Ex/fV2655um77QvhXtyHBuaCPSF5X+2qrbxKRcttLLhU
         t0WOq038XIHz45zeDp63aQFInNXiXqDPrASAbiaoauNwBm+yZ0ShIOg6SjVf6xQ+aC/Y
         KhrQ==
X-Gm-Message-State: AOAM533A5tqBS5MPliGYLMHx0qBgFOG6d1mRI5hD8YZEnFHnC4DwqHZE
	1ubbw2Rml9EWWicMivI03h2y4jAanfS28PDLEbM=
X-Google-Smtp-Source: 
 ABdhPJwknULAY9NGf2r/iIk2bYV02xzT33Aq17fwe/el9+cQLb3Ob9mUuUztQaViK3HyU1wuDlXWOg==
X-Received: by 2002:a63:550a:: with SMTP id
 j10mr12931626pgb.400.1638136799253;
        Sun, 28 Nov 2021 13:59:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 40/42] systemd: add packageconfig for wheel-group
Date: Sun, 28 Nov 2021 11:57:52 -1000
Message-Id: 
 <e313da3bea3c4e116065ec7b82c324bd932365d1.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 22:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158922

From: Peter Bergin <peter@berginkonsult.se>

If the distro does not include the group 'wheel' systemd will
complain when trying to parse ACL rules for tmpfiles.d.

  systemd-tmpfiles[273]: Failed to parse ACL "d:group:adm:r-x,d:group:wheel:r-x": Invalid argument. Ignoring

Systemd has a configuration parameter to avoid using 'wheel'
group in the standard config files for tmpfiles. Add this as
a PACKAGECONFIG and enable it by default to keep default.

(From OE-Core rev: 1b5648e6aeb9837cb807ce086c26fbfaa16f6f8b)

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 457cc45f51e78a532930d0347de271f24ae0a2ee)

Upstream-Status: Backport
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index bf33b8d6a1..b6f5a47d63 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -96,6 +96,7 @@ PACKAGECONFIG ??= " \
     timesyncd \
     utmp \
     vconsole \
+    wheel-group \
     xz \
 "
 
@@ -188,6 +189,7 @@ PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
 PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
+PACKAGECONFIG[wheel-group] = "-Dwheel-group=true, -Dwheel-group=false"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "-Dxkbcommon=true,-Dxkbcommon=false,libxkbcommon"
 PACKAGECONFIG[xz] = "-Dxz=true,-Dxz=false,xz"
-- 
2.25.1


