Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F150CC4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.16186.1672594994249943284
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=akCG2D4c;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b2so27154971pld.7
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqtlUrzK3LwKSYzgXWpRHXaxJXETscqDWZaynRA5RcU=;
        b=akCG2D4cUmZkiW3VUP2UVdXrIWI6es/WOEOAt2cotHpFaUxxbDNhwenqw9+cardaML
         PgsgCaQRGgYdXSTxQUgLqDCU1Pyme2xcrkMeWtmuNxYOdtgRzJxcbQFwvGEIXzPpXjQe
         F9A95vmQdpohwnKUDrE5oeT+/1G7NxDPEH05kt6BO9LUJCIaLmDBwQslHX3xtZyE0QG1
         Rh5LXaB1TSA9BMhNeyVDoeh+52jLhgCZXEsO1pqgKK6SazenrDO5zZ1ozREBa/Wi5rft
         bMf2bHhoJ5tK1XsL74JyvLY3Z9N1p+K9RMnXupb+AYgwl6vZRRnqPyycFypTIRcj2bmw
         il4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqtlUrzK3LwKSYzgXWpRHXaxJXETscqDWZaynRA5RcU=;
        b=rZTjZUemmlsDRIXFBJuA4ToFkEH1R/2cgoPY1AtZlbbspYmDR9VdoDhsulU0mtyojL
         9qCT1JGkphmZcrzAX8N8HYja3UMXS4SG1eejxzqORkoa1yvim6mamBT8K1ChkB3Drd1+
         tXiU2wzMuYruF68bkfa3N8GVSSa9lB/K9dWWDVOKsU/xbPTVimTas1LjLjQpuJO+Bcld
         LKvbfds4hyonbFvI6lvG/UvypH14FGyVo9UP/k9ye5/j5ZejN+GgVeDumPtOm19Mpmiy
         /0qUrgXUtp/LVZg4NFyC3rEuUfoUHg+ZA+SLQSKh09LXOBgbBXBrV2R30pLPsIvgCwL6
         qdhQ==
X-Gm-Message-State: AFqh2koCBSi75pF8RCPC39tP1K43MnyHyepTpqqf51NYuuvyL9XQvTpG
	/MMwJB7rPh0nMWVkcz9FaQ6FVa5BdYplsP3efWg=
X-Google-Smtp-Source: AMrXdXtw8xdRmTAkb3wytzXiV8LfBqmgrmDFbJsCNc1piHJIQV6mxuhgPgFKUVnN3zLkwGVVLN5bmw==
X-Received: by 2002:a17:902:6b07:b0:191:c01:f92f with SMTP id o7-20020a1709026b0700b001910c01f92fmr39166521plk.51.1672594993251;
        Sun, 01 Jan 2023 09:43:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/18] sudo: Use specific BSD license variant
Date: Sun,  1 Jan 2023 07:42:29 -1000
Message-Id: <4b298ee153d649ae36e16017e8773ae569995e01.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175231

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: ff27ea21d7c14086335da5c3e2fac353e44438da)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1596d37ba13db3aff61975a31d865f33333fa45)
Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/sudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 153731c807..9c7279d25a 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain
 HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
-LICENSE = "ISC & BSD & Zlib"
+LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
-- 
2.25.1


