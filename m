Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39988C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.17954.1675446664793889631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwcXcKMt;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id z1so5987125plg.6
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpM5JJNffvXEIU9PKFNzEnXpIQbPt38+XKTNXOEegSI=;
        b=pwcXcKMt9shfKI1Xlw2gatX0aAQau6TMx0EDhmlWwNROc2PX4MmV0s8hb/K5/w1OcN
         8tDV0BKrKxpimJJAqV5vlun+fOuHpkGJJP+Z35Q95B8phZIqLD/30AqUDO1LmtS7bP8C
         cQvjUr4zzynmfDMGhxYXJLsydBG8nQEOkv6LkjlhrndzKnA76I4o0oGe4XAnkoevKkQ6
         hJg017E3OJsFT+yb5c9iIyKUUl9DPBuqp9Dx72LvkP5xjpZ9V8qrLoTNkmPgW/iXlZVz
         lHrHTQsqMOz/fOs7WcIo1j8mqegFTJpzHFEpGIwE5yhD53Km4oCOSxWDOeMF+CyQGTwA
         a/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpM5JJNffvXEIU9PKFNzEnXpIQbPt38+XKTNXOEegSI=;
        b=gj8JYEF0FdJ75xpa6pNRkvq4GtfOL9HYyAccgiQz5pcYgnj3EB7MaWLJPv/ZLcg2fw
         dFhjLqv9ZczO9kJbOJRnRchYmXz2ROhV6Lb4dluQxGPlriWYS77T2oFYu6UqiBKuk354
         hvbKTVeHjhk8a/0quHzXl0MTCBqFW7UKiBEzOPLMzMTVLRAa4hbJ7VTNbkwaCsWVjlCw
         25HyMHQnTXutz7Lht8a6DWD5k0eor0h2iFAqwEvK/wvVNvd0vS+oZJ23BTq5nM0nbjcT
         vNCoIrdKasRp9a4SeVL660C4gaHTXdTj522kBCC62nVT6ToAjrWppfKxalAuipsv04lV
         aQug==
X-Gm-Message-State: AO0yUKUcRO5fQoqEX5jm/dZGfamvuPLp6gAPua3CYUGlhEo61skiqe2u
	d4LYTsSzp28YpGQHip42z/H07j/X038=
X-Google-Smtp-Source: AK7set/lArGb+A3HBYrWjxVpRyG7zGULXTJvumgpP2R5MP1ZbNiRqwmyAeqPs7fkstZLeLIWAzO/dw==
X-Received: by 2002:a05:6a20:1e62:b0:bf:488a:1da8 with SMTP id cy34-20020a056a201e6200b000bf488a1da8mr10013231pzb.3.1675446663972;
        Fri, 03 Feb 2023 09:51:03 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] python3-zipp: upgrade 3.11.0 -> 3.12.0
Date: Fri,  3 Feb 2023 09:50:28 -0800
Message-Id: <16c6bffdacae9cef03c9b1b90247933ed24cdc62.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176741

https://github.com/jaraco/zipp/blob/main/CHANGES.rst#v3120

v3.12.0
    gh-101144: Honor encoding as positional parameter to Path.open() and
               Path.read_text().

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.11.0.bb => python3-zipp_3.12.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.11.0.bb => python3-zipp_3.12.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.11.0.bb b/meta/recipes-devtools/python/python3-zipp_3.12.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.11.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.12.0.bb
index 70ebafc1689..1b36e425436 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "a7a22e05929290a67401440b39690ae6563279bced5f314609d9d03798f56766"
+SRC_URI[sha256sum] = "73efd63936398aac78fd92b6f4865190119d6c91b531532e798977ea8dd402eb"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2


