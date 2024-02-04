Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE635C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 20:34:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.47176.1707078854942130236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 12:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GpToGIBB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fb94d42e4so30214145e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707078853; x=1707683653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuA2L7RkzV1cDUCftomy1atjRUFl8Ac9l65LoAVeW+Y=;
        b=GpToGIBBeFbvpODCnH2fTqhQtvOx730Zzf8oCkFhUQuX7VYwA/QHxz5c/NJlCbmHo1
         FmXIlMH8IglnAnG2UYedqg7rZMvqy8QPWjj9Jp9td/7UaANE9cUfRwgwZbBwg5A8nbpq
         qEJX5FIkKBkMkNpEZQmqHi8ybqBjgvWjEY/WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707078853; x=1707683653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuA2L7RkzV1cDUCftomy1atjRUFl8Ac9l65LoAVeW+Y=;
        b=H+axjNPjuh2yL2v4lNFo2oyN8OC+XpbEZEWGexwcbGEvF+bV9QbHzXL2dKbRKTGmUr
         D1ffG++0jDPOKmXtHgjTzkbZUQ8W8UbDF3G++70mot0mklTsM04t7fxhUcKbCTThdHu4
         91BxHqnP786SjhNTL0PPyFKxKnmKk5eT7uRbvl4i+EyzsrQpjx6CewpvIiHzWRr1VnjU
         dt1fQlkuUH7dfBjTul1RiIm59y8yAYXjvPAmjrma4Hio/By2NbjqTM7sRZtPy+uYOq+3
         0MzrSX6zAMSeIZ0WFR1k3VzjhxlYmDyuB7+auRbwdTVNoteyqGhd3bnkzSetvPwjN4az
         WvVA==
X-Gm-Message-State: AOJu0YyQt2f1N1HdZ2U8TP8Ne3VkQG22HWtWgZFW9gIcZnshfJg8nVc5
	kPlERETDtoc+XC+UHnWpU3pR9GSJy3pYpl1RaB6VdIgiNzUn+ZtEnsI0CBAxkajNr7lQOoHWzF/
	M
X-Google-Smtp-Source: AGHT+IHudUVVO89VQWi5KQRIneaW+tYfYsqxb4m1/n+GkrdkeIN1bO6F+OY0vjSRBBoLtGF4l05BCA==
X-Received: by 2002:a05:600c:154f:b0:40e:68a9:ab56 with SMTP id f15-20020a05600c154f00b0040e68a9ab56mr3027687wmg.36.1707078852980;
        Sun, 04 Feb 2024 12:34:12 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ea0:9a0d:a119:2213])
        by smtp.gmail.com with ESMTPSA id iv15-20020a05600c548f00b0040e9d507424sm6636260wmb.5.2024.02.04.12.34.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 12:34:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-markupsafe: upgrade 2.1.3 -> 2.1.5
Date: Sun,  4 Feb 2024 20:34:10 +0000
Message-Id: <20240204203411.2342606-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 20:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194911

Note that 2.1.4 broke python3-jinja2 so skip to 2.1.5 which doesn't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-markupsafe_2.1.3.bb => python3-markupsafe_2.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.3.bb => python3-markupsafe_2.1.5.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
index b346cc85d9e..a38c97695b5 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad"
+SRC_URI[sha256sum] = "d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3 ptest
-- 
2.40.1


