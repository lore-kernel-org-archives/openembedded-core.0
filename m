Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.181501.1598214073834859534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z66mgxbn;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id di22so6250902edb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/6pui5fMbyGyZDXy8G+w8B5CmqxzuS+YeoZ009D51E=;
        b=Z66mgxbnT+cbiLFTRUQDHIX7g4cPk6Z4JPP+J2Vk6Ue6ogFHH9ojZ97QBXzz39Lps6
         uVfpJLj7c7aMcShj66ZcrgiMqqgxtGlqDQXPG1iIaZAYQA5W0SrtzJ7OivW/hQ26j9Ca
         TxHx44LpUFkRpa7sqXQumFRrYX0wcItiJLqHiHbfyepUXO1iE+Kym6/cCBTGJPO+qHjF
         RI7KZ5uVkzy8DymWwiBYyfuuGBb/QdMZycY0Nk8VskfC3obhIjTMzbf+TN7boIKtyvZ7
         nfuP0aicDNk8bxWqy/ixTegoyulWBSa8PnWydMBv1xC4wEceDCJbEL4Htk/P4ordsfeR
         hdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/6pui5fMbyGyZDXy8G+w8B5CmqxzuS+YeoZ009D51E=;
        b=djHlrXfZfT6d4dm2pQiICfO/4B5RSwqVJvlIqsRpvbMXN5xt0gUSmyDGhc4GaZQzbx
         6uRZ3oIglCt6xVi/b3ZpWWulPs+4EHEUQL82XNlmlsP48ZpxspRbhpkFvKbrjm/Vqsqu
         ResidjOSllCW8ObdstBIhC8RMYOd8AYqKcfP04pYcJO5yFxfSiEwPrkQlclHnhsQTX3X
         zW5M1WCikGLMdtbGCXrJhTjQdqHEw4tTRQIO9iwQAGS3tk3h0iSqVNxy5jvLLBS8b6qD
         l/gHAjMav2cjsdng58ewMOj1QF9k9xE2bi03vBg1peo9/tc2Du4jOgHu64Dv/xR42/tf
         MK4Q==
X-Gm-Message-State: AOAM531OTjB45k3sGQtetPklCYembFTtAmD9xalKJ0IImb7KigRgyjVd
	NzR456e+5opqTOZ8dbBAyJ5dR1MZr0I=
X-Google-Smtp-Source: ABdhPJxQAHVtExx4QnmG9PixxjhB2Sf0/dhDqRUh9aNpnb2Wtqn3Hqs8UnYYv0Ckir3vhDsPGPBcrg==
X-Received: by 2002:a50:cc92:: with SMTP id q18mr2593897edi.159.1598214072004;
        Sun, 23 Aug 2020 13:21:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/37] asciidoc: upgrade 9.0.1 -> 9.0.2
Date: Sun, 23 Aug 2020 22:20:02 +0200
Message-Id: <20200823202031.24686-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_9.0.1.bb => asciidoc_9.0.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_9.0.1.bb => asciidoc_9.0.2.bb} (95%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
similarity index 95%
rename from meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
index 2f841de065..711bfbfb9b 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
            file://auto-catalogs.patch"
-SRCREV = "fce6bd87fbdef5e510310464b02a75fb32f72f74"
+SRCREV = "9a407dc9a497364c91421fd961954eddb565baf1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.28.0

