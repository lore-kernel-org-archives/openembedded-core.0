Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226ADC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:40 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.6493.1646731959236734336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ht4h5onS;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a8so37791926ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YAYMWjPICvVaRUMjoDZKlkE9qf7fZoWr6JkJ+PRTwC0=;
        b=ht4h5onS3Z5+vnSyL3uSu20YIYV/d7W6JG46Q+Ps19gmM5xvla9PEQA5jZtu7EZfF+
         HYlBY5OJ6HJAUuyc/QGxk9U46dFRZ+rpOS7yhtw6MVEPnVvJ8NylrL7G051ANYERnZz3
         nzFpEwLPyS+sGDetyAOKonK2bVb4dbQoyFl7XB7Wgj4ErFknwC6eTsVhS2wuWhMmo2bR
         720/OLb8ImNxVhZXM1IL7vPOxJIr4QZ9b96U3W3GeSvkqSGh3MtadWfKVjq8spRgF1H9
         LNjN9G/K3yxGvKrUVVsDpF31SEnzW2mWTGuKjLvJ9gUMyGDCREdFjQ3whJEKz3pi761B
         dNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YAYMWjPICvVaRUMjoDZKlkE9qf7fZoWr6JkJ+PRTwC0=;
        b=yBTdbNvUTI/u36k4QLTd3nBwVu9Ba16OtjVTECoWedu+FTF9TvGwo+sIJo95y/cUjO
         k5IfLdQg2aMDk7aot1JQiT3QSXVe7ObI+XOcpA9uPIOPI5A2tMGgvsZaD1iRR1fncl43
         VdgV03SSkgvd4t86KWVBhzIe4Ccs/3/6xqisvqs3wRacqJM4k75Pij1IeCWkDC9BLiFI
         nAgT7wdEvNCbqkOJbGobF/BPSbxiTxvK5nwq2SR+VCkTnSLL1nFfG6JnQ8ANru7W2sOv
         FRUBQCklXzXRxTcTVTq55HIzY55MJZZjCz8tpF0R68c7JDTC054yZCcfaep4GHOlL2aj
         8JdQ==
X-Gm-Message-State: AOAM5312GIHxl9iTvvDQAVSJ33PfZmIyx+BKnVBoWndx0p506mwexyMO
	iV4vyJdYEg2+Xv8X5/fciHPycDZFGS8=
X-Google-Smtp-Source: 
 ABdhPJzEHHXvDU3xZJITJXnyUpocMvNYtVg2+RFk1uw9EZgpbGHathvtC2hIU0XNOCXhi01ZnXQq+Q==
X-Received: by 2002:a17:907:2d29:b0:6db:2b1f:333a with SMTP id
 gs41-20020a1709072d2900b006db2b1f333amr7677461ejc.704.1646731957815;
        Tue, 08 Mar 2022 01:32:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/16] webkitgtk: upgrade 2.34.5 -> 2.34.6
Date: Tue,  8 Mar 2022 10:32:21 +0100
Message-Id: <20220308093224.3436483-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162890

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.34.5.bb => webkitgtk_2.34.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.5.bb => webkitgtk_2.34.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
index 9f5846858f..52cc185eb3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "68930643af7a47a3af05f46d66e784422433753dab335d3282f319a85a5629b4"
+SRC_URI[sha256sum] = "6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.30.2


