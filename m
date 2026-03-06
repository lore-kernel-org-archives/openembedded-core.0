Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A7EF0180C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64472.1772781789032616716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w5fyqByr;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so103974805e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781787; x=1773386587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrXin+/BxoEdBjBVSUTfE+iM5flf4TUK2XcBa2YBdIg=;
        b=w5fyqByrKqBotQuwrUJ9lKLf5q8JnDWvu03kum5B2rQ3YJVLDLOhXh2xE3QBuP7ZbM
         +IK/QuAnGiVMhF2A6X7jC9x5ul8X8PhoLrFCBFw2SFaIcahYn4UZv2MXkNoIDzqrF0ux
         /vK8ZtbRVVybuSS2aOKWI3/g6FE7A6zjpxafM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781787; x=1773386587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrXin+/BxoEdBjBVSUTfE+iM5flf4TUK2XcBa2YBdIg=;
        b=a6Dbu3cP8Bd21lY5UPC9u7x9hNV3qM5OuGjAZRgjP1gxSJZtzcdzjZ2cBZ8Lomp8EB
         aIU891KH234TT6ENC2F5YijURTqYjGyCHc615v0G5WSR3iYGkFjHIQe4S4cpVTb96DvM
         viKvhMksqjVyyRz/fywQ/xYR+D2Z0edGptpNZtOYdfCsyRX4s28LQBTY5CU13yvwHCzI
         nRnH+TtGh0RTDC1Eg5uuKTICx1qCjPyCnYTXlaBAGgXdR1sQj0WKKQJG/kmLTgq2m7RO
         Pm/GwTvHWmKFI1aJa/vpoi3lJKuNnEWk1sa63VkhcId3K1sriEiP7tPxgx2M2/OlpBpg
         tEpw==
X-Gm-Message-State: AOJu0YyAKVr/yQNsCqcUgbbeV+spkI1TZD/p56TVQh3bO9Sel22CgQkH
	o3d4MynDJThQCOsLzEcI7YRv1PjwCX2KK3cPVN1gh0NLponUufNYnd6AemgQyBazwhfMI6ckE0K
	RZuMd
X-Gm-Gg: ATEYQzyjIyk6T6hgcYCBq0RHDxq75E6/ZEWbRWKBxHY0Y5k8slhTXK1Iu9ro8BsX9nB
	2Yno94RDMOXenM27WaJB/jhHWWTuZnIJM/0RN6k7FeNSImB7Ng+E6ghuBJpypa9no4E36yxgJGw
	PL3XLtxbcxYkNzoHpeAjx0YyaXzaY4MRM0GseZL2OfMIFJlCoWOLTUJpoyxczo0aMcwrTaEOKFr
	9Za2WvbIWoPyWd95ZkFGlZ87BEy3gZWCAa8TqloWEzBiobop+NnR9B2dNupwVjrOtGMn000MbmJ
	iH2NjYCQXysoNzkZZbByN1XFN7ANWC0aNa/d9l8wYvJkUr+U6GlWIkwKzCJUqK3qtqEleaUVrVp
	9gfzWIQ3Wj3vrbX4YqH/5lRsQWLzLyrp2z3/VCH+XduGrTWXQlRmn9ChzIWnKb8vahGxa8vfT37
	qjtHXomRUc31d9n3kjdfnl4in+kKixgVulJxO3i1IgiwJPbKCntHJHXpvcABZyqEp29JInAfoJG
	sjjHk3lrFUaAI5Z0H75seqJsYzK
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-48526918939mr15913085e9.7.1772781787120;
        Thu, 05 Mar 2026 23:23:07 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 13/16] create-pull-request: Keep commit hash to be pulled in cover email
Date: Fri,  6 Mar 2026 08:22:13 +0100
Message-ID: <8b40a2daa8f41e95ed421ef58f8eed3f034d67fd.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232552

From: Paul Barker <paul@pbarker.dev>

The cover email mangling in create-pull-request was cutting off the
actual commit hash to be pulled, making it difficult to verify that the
changes a maintainer merges exactly match those intended by the pull
request author.

The extra lines we want to include are, for example from a recent
whinlatter stable branch PR:

    for you to fetch changes up to 6c4c6d39ea3202d756acc13f8ce81b114a468541:

      cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c78f5ae4a5ba3675b78cc226feb7b9fbbfd8da19)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3d..5c4414ecd5f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

