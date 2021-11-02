Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A61AC433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6614.1635842593089264223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R/v10Jpc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1481373wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o5bZZ4IvYJ+fWbDyEYnYqV9KRe7O0P5vaOT45IBO9pQ=;
        b=R/v10Jpc8xwVyHSC8GQU2q4HEXhBEhGlwiI4RybdN9yM7g1NZguYyyALrAdR+liglU
         pZLJKTJaktZ1a2TbriutMvu69xpyxmjAnmVpaBpknLOX3yjbCQRuoh1bs/jdHJL3ydQu
         sSHmEM0LqDhrLPff0wvimVjncH4Vec7xJAb0rDucvFk22c18VlT+NiJrVD7aYjsGpYzO
         vp0heD8JtbR8npd9dnx344AmdmdtT4uPJ1Q++QPoDirHEtBViECVv050o45TpqKn8kZT
         rJG4sVtLk26Op5OipWbMpdHJ3VLhf3Luwv5ZnRCeSgEpYhTwb12sqUVimi2AF4mRdLj8
         aV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o5bZZ4IvYJ+fWbDyEYnYqV9KRe7O0P5vaOT45IBO9pQ=;
        b=Ok8H/ALBxpoLWDMalTd0VxE2JWA/BuFMVgva8Ads+vI9P6g7pnn0Pn+M7BPf2UAIsZ
         N/QVgel1JJ8Od+tc2iIatdJzK3itdQTZEntjYK1IYFWak21mOXI4dDLwuDiYACqhEh9a
         HaMm/AXzsUwbilooL+cnX8gO+dfE1Fx6e7IaALlq+u3cp9MM2FFl2P/D44Xrun2UdR0R
         X9fqLSgtPc6Xcv93Y/5N8CJ8U3UQT7JrKnOwoH3V8Xh89LBIuzQ91hhnWuaJWPMP8Rnc
         lTFEE/1deMd1J4DPuKh4YjcsunFU8U3l7j0O1SBV5bX/3ADPRK4VlR6v/eNMshexymFi
         O1ow==
X-Gm-Message-State: AOAM531sF0RMcRdnxN9cC42scQuwzJmBQaJwnhMKps2vG6VfQSO78jda
	zOXBq/7N6r2dcP45u3qGeAy+fmh8/0U=
X-Google-Smtp-Source: 
 ABdhPJwysZvEdhPaXc/XKqx0oALRKp4bFpQoy7NJGZ3v2aRz2vTEUVOkrkRjkQy6LZmpYnCnfQrBiQ==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr5169066wmi.173.1635842591736;
        Tue, 02 Nov 2021 01:43:11 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/33] asciidoc: upgrade 10.0.0 -> 10.0.1
Date: Tue,  2 Nov 2021 09:42:41 +0100
Message-Id: <20211102084303.2974802-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157749

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_10.0.0.bb => asciidoc_10.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.0.0.bb => asciidoc_10.0.1.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.0.0.bb b/meta/recipes-extended/asciidoc/asciidoc_10.0.1.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.0.0.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.0.1.bb
index f7fa66851d..40574df6e2 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.0.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main"
-SRCREV = "4667219e473a24e8e645eb9b9fb0a7ddba322f44"
+SRCREV = "74823bed08e7b823d2b6cba8636a1fd67fed6cc9"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.20.1


