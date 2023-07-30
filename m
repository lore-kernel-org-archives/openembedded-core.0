Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B8AC04E69
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.78409.1690740104388919944
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Cad1AX8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so2197918b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740103; x=1691344903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elSirK48+rEGCGzNdFlYj8W5V1jzoy1eV+g/1kwDSF0=;
        b=Cad1AX8V93SU4CXyEzz1V/6xLbQe3aArfgFaN7oEJBaKZxs0YzEUSP8buweJlAhDuU
         q8N1KV7RODdjTI/rI2zIC/eo1hyIpddyMwAWoV/QA69eD40MbC0/X9XGNAJ75DUsPRUn
         kuMFQePuStENmkr/mmf5mjNlg0cX8wyUoFK/dGb2gpuoU8iou/aVtLurBZLk3qmcN9JP
         QZ8+BPAKoEEtyCUq1AO5mJuhgb2v8v6x7Jm/g2orBGS3+rsOLu61O9m7uUOIZny5uSTs
         ksE/84+FRRYGk3+WQ+m376FdJePbUMmR2CslL9dDeZjN8HcqcAZqItBTEjAliSRSVBtU
         k8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740103; x=1691344903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elSirK48+rEGCGzNdFlYj8W5V1jzoy1eV+g/1kwDSF0=;
        b=WS3fu7/2kpGhzSpES1Rkx0NihEHbiZtaCF5qvQEbLtHkb5TOLHjJBywza3zHpGfW9J
         sRi43I/YV+GqZj7CWmjOALSkIO6iDv4F3BDTy/1XT15WKgfpAcMjJiIvuFbdIjeR9oY5
         sMQwuMfCjBOFXjJIiSSxHYkeXR76RfJRd9Ab+d5uUT/aXY04Irde64fXXAKO511wcV8E
         pJW67ctDIe0Oon9Fsf9URcMhcyVoYMBlYE9YEOc5+9/d8xLkdRQ/E1iVKYPzSCgN8Ryt
         SQtZOWKgoGGKh7qzs9RJq/MKJEEGP7JTdU8kys3a5pLb8cICz4HuVqzDzgw+uKe5v7vp
         +g4Q==
X-Gm-Message-State: ABy/qLYZ8k0gDJqMIZp+z8+0YhZFSIzOAn33oscAVCSx3qnj8qq1GTXJ
	vKGP+5WhXR/A7fI1XQwRQHgRybkXVPm8DNgk13IU8Q==
X-Google-Smtp-Source: APBJJlFPbmYh13y45/8zinLu4dcXadKD6BUJSt1+OljT9ZZdVKQjwbG78US5xKdl4WAu4hA09tZSRQ==
X-Received: by 2002:a05:6a21:4988:b0:12e:7c29:a6dd with SMTP id ax8-20020a056a21498800b0012e7c29a6ddmr7410669pzc.43.1690740103483;
        Sun, 30 Jul 2023 11:01:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/30] python3: fix missing comma in get_module_deps3.py
Date: Sun, 30 Jul 2023 08:00:47 -1000
Message-Id: <4152d895e9bd01ce09423904caf328920a36b16a.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185102

From: Ross Burton <ross.burton@arm.com>

Wes Tarro <wes.tarro@azuresummit.com> noticed a missing comma in a
preplace() call, add it.

That said, calling replace() with one argument results in a TypeError,
so this is obviously dead code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b2e2c8d809e7ca34451ec9702b029a00dfb410b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3/get_module_deps3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 0ca687d2eb..8e432b49af 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -32,7 +32,7 @@ def fix_path(dep_path):
     dep_path = dep_path[dep_path.find(pivot)+len(pivot):]
 
     if '/usr/bin' in dep_path:
-        dep_path = dep_path.replace('/usr/bin''${bindir}')
+        dep_path = dep_path.replace('/usr/bin','${bindir}')
 
     # Handle multilib, is there a better way?
     if '/usr/lib32' in dep_path:
-- 
2.34.1


