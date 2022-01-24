Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF88C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:49:30 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.808.1643053769773042763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SUKb7e84;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id p125so16358219pga.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=178pGrljoJpJ0GF8RIsBzQYHXYKgxxeB+JibSijNIOw=;
        b=SUKb7e846fbv9wgkhQxuOeOQDig7pU+5pqnjoxRSfiRwbuABk+0Ri3+SZcaqcSXNZV
         ZROkRzZp27tXIk87pSsoRMsuU7rtTaCKzBk4HmXfLdpgxGeG7iGWa/xLfzYL3fw59PSF
         sxAm47V9hvtNlqAJycuKVzG4nTCUA2/Fm1QwQo8Aukybzp9BK4mqgSD/6SY1bZib2liY
         SEFxpmpmM5bTR8UWkjX3JupAs56M4aWCS0sleS5vBpXbd3Sk/nE/rK4JwQtXL+WPQlJ5
         HCzz0q/BR2sS3KT9ViiWgxZgvnzqhOob/xbVuAvsYxi/FNkRgA4qjDW8EJOYrFQfXBco
         SDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=178pGrljoJpJ0GF8RIsBzQYHXYKgxxeB+JibSijNIOw=;
        b=SK0qbHa3USZpVhGht0sS+yGypcQfQtSxIgD6FMspyj1ZC7Zr/KjoT9l0Sj0mpehxuK
         kX/khuLH2OCrCIuei8+kE7n+JGENB/IzBC6hahLAzgMJAnGr7SPh7m15mqdzM/QhlkJk
         BArcR5UWBDhzrxL63wpgUPFSI6Mz/NSeMZHhrKYq8XT1mu+T5TR6QEiK6YMP8b6ooYkB
         0SiiL6aYBlGm/4kOWCD7jqmSY0lT+V4xkPeHiG8rt6kDHrNvVywNG2vCqmGKm51O6eWx
         XI0bqMZm3pSUVYf2RjaLRlgPIpon/FNeWPZdJ8NZHmFIOA4XiNs6DreKeMtC+sBn93Y8
         Yxbg==
X-Gm-Message-State: AOAM5300Nx86NPZRiYjNPyShGTLKX4kmwkAS3k3kUq8bRMqKkANV+f6m
	3r1QPluVceR+dqramrcNybzRRPI/SurdMg==
X-Google-Smtp-Source: 
 ABdhPJwxDtkScPN2yuwLp4qsPnEU4JinYIa8vQd9pwYvehkL9phmTGXBR7mtMCxbe5R/nu3Js+puDQ==
X-Received: by 2002:a63:1157:: with SMTP id 23mr12675088pgr.12.1643053768957;
        Mon, 24 Jan 2022 11:49:28 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f265:5b05:90c1:d910])
        by smtp.gmail.com with ESMTPSA id
 t2sm17617202pfj.170.2022.01.24.11.49.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:49:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-importlib-metadata: upgrade 4.10.0 -> 4.10.1
Date: Mon, 24 Jan 2022 11:49:06 -0800
Message-Id: 
 <c8a7376395d64afdfbcbe2289aee40dcdb0ed5e6.1643053417.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643053417.git.tim.orling@konsulko.com>
References: <cover.1643053417.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160899

v4.10.1
* 361: Avoid potential REDoS in EntryPoint.pattern.

References:
https://github.com/python/importlib_metadata/issues/361

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-metadata_4.10.0.bb => python3-importlib-metadata_4.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.10.0.bb => python3-importlib-metadata_4.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.10.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
index ea19afc0c23..ff40def563f 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "92a8b58ce734b2a4494878e0ecf7d79ccd7a128b5fc6014c401e0b61f006f0f6"
+SRC_URI[sha256sum] = "951f0d8a5b7260e9db5e41d429285b5f451e928479f19d80818878527d36e95e"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2


