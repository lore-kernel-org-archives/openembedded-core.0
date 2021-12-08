Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043ECC4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.3046.1639000807371678550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NKTSgalp;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so5264071wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fAmIzjrkYHyE5QDsTOzD8WvAAeQI3cD7OXISrRFgwA=;
        b=NKTSgalpsHsNseiCWv3KoGhdVVPhd/UzHQT950K015k2Fqz3LpWy36TBVx2Kw2123y
         5InSmeCow/bEHItENYS4w8j2O8YG+Y30KfC0U1c13/Td93+4C6lWX6OW5MV4j6i18Dho
         MjMdWWczrxfv/Owv9yXhrOzV/HYQtxn4tmyQzC/2obELlspvKN4WTVZCtEl2wANvQxXC
         4V48EhIXUIHZcpw5lRCSYMUx9fzoAD8c9whJsb1L7Pq3s6AR9GqdZkoAVO694LD3ksNz
         2kkq5BqEMj43/13TC+aIeKoC0dgWPIq0titd0rvZ0miwwIQa+iOiaN38gjBOnlGdVVjG
         mR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fAmIzjrkYHyE5QDsTOzD8WvAAeQI3cD7OXISrRFgwA=;
        b=ANBOh7X9fF14QWwV52eBlo+y0FNzadaMxy2So9RG43NLiVPlVDYoTnDxvAsgHqfED+
         Q7KB8lyj49/VcQnE3kMtKny/B9N4ju/jdbVdKbnSEa+t2beb+JhJlom7nEycIJL6fK4g
         hKdsZdXeTlDBYAp0yduemQnGzDGV/cRvnuD0+9I3ho9QRKsVWPUUtkt1JnHFkyJKTlu+
         29RrSHhhUM5OnnTQFKmouTn4uNPgYrH3tMZkjQQMhXSYwGTLwdjoXFc44BhqVwGe5AQV
         ZP3Dm9e6lij+Cet70WiIsv8fKEEo0sIOIGlUQJMXQm2tVW7f+g8CpUokEz0Y30cQLYO6
         VHbg==
X-Gm-Message-State: AOAM530I/DbdUNLztnx9B8P96zBDct3Mn/biq3rqBFzSHS+ygXwvU8iV
	BMpt9K6Eucf6XxfDmWvVNkEK7I9Py+9VGA==
X-Google-Smtp-Source: 
 ABdhPJwBsmKdQWqrenlVvzSC2LwY3wUkOv+Tpbkc5phhzKOPNUSeyz4q74GMSCe987FrxiD/TpMkyQ==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr1908962wmq.8.1639000805991;
        Wed, 08 Dec 2021 14:00:05 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/29] python3-markdown: upgrade 3.3.4 -> 3.3.6
Date: Wed,  8 Dec 2021 22:59:31 +0100
Message-Id: <20211208215947.1979470-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159379

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-markdown_3.3.4.bb => python3-markdown_3.3.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.3.4.bb => python3-markdown_3.3.6.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.4.bb b/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-markdown_3.3.4.bb
rename to meta/recipes-devtools/python/python3-markdown_3.3.6.bb
index ec1d139ab0..7b64da6d5b 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.4.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49"
+SRC_URI[sha256sum] = "76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed1ecdb1e8cefc7006"
 
 BBCLASSEXTEND = "native"
 
-- 
2.20.1


