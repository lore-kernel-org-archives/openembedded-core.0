Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FF5E95A7F
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.27690.1696717552446326227
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NAfvZFcg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-277550774e5so2301487a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717551; x=1697322351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbdnX4QS/J8hLIcvtdwQBMQIAWIQOyM6ivqJuq5ZtOo=;
        b=NAfvZFcg9gT9fqzkcj/2XJJ/Mr0Sp6HN9aaAxD9i5A8cBcCaudLW9E0ByCBEVVNuHt
         3VZSI2FuJP/XEB7glAw6lhghaF472jRmK+St8irQnYhRf0vb35rUneBQFgJLuTJdbZGt
         WOIajQ+rkLHITxBZuWc3QlEBJwHtw3DM98lV1WutRfU8S6Qu2Im6DjlxgbyLsA/88TYF
         d7DUlc67e+ihSnQ6P4UWjMEQyGbzUhy9RK5j7oNuXn01o+Vl+GksHw5cRtvTgg3kn4SZ
         B8HALItiB59At+bx4n9wt0B0htFgSgIDS0PXuu7kphYbpXL7TLi7UlVYFnfxDbp2XpXW
         Cbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717551; x=1697322351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbdnX4QS/J8hLIcvtdwQBMQIAWIQOyM6ivqJuq5ZtOo=;
        b=kEZTvGy+IsP+JTfHzBD80FTFVjJbyNPJG3cHd7noDoYqluqEa9Fnz0m7iks33vv57r
         keRKsLWiKdT7N5lO/p9b1t9KEuMH4551oEYI63OIcuW8TkA/pLVXSxeQRYu74kPEJQbl
         SvBDTEQfldbd4SjUdXmt9qb9VuvyBiFazoFvAq66hVnFAPYWCBNaZN+Rr1yGM/TZdFrK
         CBBlps6e5jAaM7cpdvN0cbZNWFk0aNnHtrgNzDgyYBds1/isX6bruC7NdnD9cku63/u/
         fTcbXSY1pGJBkcNKM5F+ZR8oJOLthG2ArUq7RzwPmrQfkQw6Q/URhDiysZzUM9N4tLZl
         DOAw==
X-Gm-Message-State: AOJu0YxqFGhL1qeyh8p6iz2jO+uiNSaWLvlCYlCfUKkVoXqQCEm4RCcB
	RhxzJj4BQRHcawNWvIozC7HbBvbYPj4XOVIzt0Y=
X-Google-Smtp-Source: AGHT+IHl4vPLRPG/kCbfGCYnInnSNw6hG/0cEy/cdSMzs9zhulcA4lVlnBzNXKagQU2qB15v1KJ4kA==
X-Received: by 2002:a17:902:e74b:b0:1bb:6875:5a73 with SMTP id p11-20020a170902e74b00b001bb68755a73mr14100178plf.2.1696717551666;
        Sat, 07 Oct 2023 15:25:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/19] README: fix mail address in git example command
Date: Sat,  7 Oct 2023 12:25:10 -1000
Message-Id: <73f8bbc74fbc7b0962314e5517ba8fd754e5507e.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188815

From: Benjamin Bara <benjamin.bara@skidata.com>

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff1c5ee9201cb792bb60f3338a5ee6d2d9f11ef9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 31b1bf52b4..687c58e410 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -22,7 +22,7 @@ for full details on how to submit changes.
 As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
 The git command to do that would be:
 
-     git send-email -M -1 --to openembedded-corel@lists.openembedded.org
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org
 
 Mailing list:
 
-- 
2.34.1


