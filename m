Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872EDC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3411.1637741316763111104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lZBnLVgB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id o29so1432285wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cv8lQKR23DZyBsNo/uBwlpw5Z9U55H5tLhFQY8boMk0=;
        b=lZBnLVgB6JKNI+wwPS7XMtOECODXElr+EV4lCw4Ut0IGYvfH+oNgDIUs5OYxZ68wvc
         2FFXEZQkj22azkcRSV6HtpMjQY+lyVzTrlhS0W314/EytnuIuJX5V9slxfX52DWqWLZw
         dWV9iSXSH57zqpUyE5nDnNidRLV23tamPw4iiZ42ffnhUXzi8n3hpFj+86lkjMjuAsj5
         iRf4/uxCe8kqZVknOuyA8GFL20Jd1sem8oG9Vn81fsz2BDF/SNXJ8LNwbpHh88Iev0WS
         pDSatJ1KivKr9aLbJ4ai15YSq2hlIynC/1+xCSZSUkTjeoUAHlBs1ef2ay8Gs5aBNs0j
         oT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cv8lQKR23DZyBsNo/uBwlpw5Z9U55H5tLhFQY8boMk0=;
        b=1uAA9kUHCW6O9RKLk1p+bjtOtmW2px8TeNjuT7Wg5ylcSRV7KfVH3NxoKl9ylh9Ami
         l8m23ag4kpPaUSdJ3Qm1HmQfZtQ/rioKlycfac9E2UkTd5AH9u0as1v0oL0+Pg6+MLJZ
         HdSXKbbe98mddOhsrTJX1uvDJtEMsTPyBlhOnOFSwyMH4YzCUnSbMiYLuj/VD4Ci2P+v
         794ZiOJYZ+Imdzumz5S5dOww8lKXz2Pj1hnsdxQM3P9Om77alnIcux5fFWB1EFfJhuA7
         LV/IE0ut0ybi2K4E8sKowk50PoDGTgfS5kYeWLFqKgBTYXpHlzhld6XOEUGW/DfPG6mT
         0YTQ==
X-Gm-Message-State: AOAM531TkaZWwraIAEslF6qumjuZJpxeczSPHyQvvVVdjHf9yQY4Yqo/
	lbZWgxBej7cJpFSOzFJO+gv3ONgpgvgqVg==
X-Google-Smtp-Source: 
 ABdhPJwMfGhaHr25MIcFRES5D9SgAwk9Qp9LICtX/UyJXB16fn30TbhLZFL/1mcezB1UG6qDTPRcUA==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr12064646wmq.18.1637741315095;
        Wed, 24 Nov 2021 00:08:35 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/21] glib-2.0: submit patch upstream
Date: Wed, 24 Nov 2021 09:08:12 +0100
Message-Id: <20211124080828.530981-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158661

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
index fbdd4c2660..7690bb37a6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] gio/tests/codegen.py: bump timeout to 100 seconds
 
 This may be necessary on overloaded CI systems.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2348]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  gio/tests/codegen.py | 2 +-
-- 
2.20.1


