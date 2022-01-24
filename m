Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:16:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.76.1643044591221383722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lZCxTi08;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso33287179wma.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 09:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IEHlZzP1omzXB3A6o55PPXj+kRbVcEKqpTQqZ4G99hE=;
        b=lZCxTi085OR9cAwhDoIPZkKnFi8c1+mlKkKSQiasiASUiU5XKhUbGmPGOlx1EqVNde
         HH5ZXoXB+Z++KaGVbCNbaDAcMmROc//rOcY6mr3C5PNCkbPTU9QaoqPQGWMLLen5fLTf
         cLn1tOPp9qpePn//W7hvimXqVW7jzAuXfeoGaRGf+OVnVQj3cISAZnu58iTV5uCohAqX
         vpG15xmgNPgVPW8EYK5Gdh2GNXVkDb7jGDXv+j8GUhPj2k0i6Qk0AMda7evWSBEMMVmB
         m6URWD0SoI1Y9/zvft37MjZQOTOYgEgm0zcbH0RthRShKUpKsjdkxAqani936FO1Pk25
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IEHlZzP1omzXB3A6o55PPXj+kRbVcEKqpTQqZ4G99hE=;
        b=camrOW2B/ikFmD2yuKc2995eYiacgCsbnzrs7DMJ3GykgMWisSI1r97dsdEMwUCPRC
         CKu/5jJbESKkr3q36k7U9aCrsmyQW6Hswv8mWtX9ye9TlUwQg0saAU5qu6QK7EmCXNhk
         5OE0VcuZaIuSUazfq6dvNQnrfqwaxa/F5PprdhWn0DktPTI/4cKfHoFfcSe9J1jrUU6z
         EytbWV5mCqdGZUQ7LCqUOIhwnUSQZN7xeDmaxx4FOHojP6x5GBwOwPJRfRf2JSzH4wO0
         VC5kOxCuIftGGGYqIP2CSRVV9H4OxgzmebEhO4tPFeqTm77jsu7u1y+VpjjolpTaawTr
         ar+g==
X-Gm-Message-State: AOAM533Zna0GLsWYDBB/rF3OWUjz3gnoi6zYOoheTq5rQSfma2/T1dwo
	oUTmZ9EmVZX1mqyWoT8qrYXdfLVgLOk=
X-Google-Smtp-Source: 
 ABdhPJxxuJVm4lqfCEBI1zWG4xCOmBeNAU8SFwn2R8ZBsh6rgR8vWovcsWLISvF8aM6SeyeP9IXO1Q==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr2651009wmc.120.1643044589642;
        Mon, 24 Jan 2022 09:16:29 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o14sm3085839wry.104.2022.01.24.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:29 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH 4/6] glib-2.0: Use specific BSD license variant
Date: Mon, 24 Jan 2022 18:16:07 +0100
Message-Id: <20220124171609.20282-4-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124171609.20282-1-nishaparrakat@gmail.com>
References: <20220124171609.20282-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 17:16:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160884

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 91cd1ef01a3f3883c04bac67af2672ec60e20fb8)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c3ddf18387..1849a6e05c 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPLv2.1+ & BSD & PD"
+LICENSE = "LGPLv2.1+ & BSD-3-Clause & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
-- 
2.17.1


