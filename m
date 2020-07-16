Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.3258.1594933700341910271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LVtg6FAw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id s10so8536916wrw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XqFDmrmDquEZqNVbX8RWyB+fP6TmFWioUasIlcQ4rDY=;
        b=LVtg6FAwa5oaDuUw3Nuuh3mqdI65VBEa5ZhkDJzs83xtuhtBBY/QdDS/H3k/jltOl4
         k3UwaUhYR2GE8oxfx1xza/jxrWn3IFFsd5v1Wm48SP3D/2iq41BXStdvA+ideKWZqB/f
         WB6Lu462uNx/X1BGvFdGk7F2UbqyWJK29J3OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XqFDmrmDquEZqNVbX8RWyB+fP6TmFWioUasIlcQ4rDY=;
        b=eG9LxSa4HcHjKcUhO3puiqny6TW+ixQKo7GygwGnqSKI9nSUyyu5DT9NRH0waMU9fC
         +mvmIQvvxNvGESLhPWQz3R3TPNc7DYHBNWb5WsyD+smWW17VqyQQPyukoDMbeHCCAlDB
         eFmCtVuegm1BppCFvovhYccfexkpOVGcu9EUFp9/3EDySfbJ3uFTeAxRrNcb2QbgGzt1
         IHhepaHrJUOed+y7HctDX3TJiC/puxeP3tMMrdfLeSaxOAb8wYNdlaTR0/GDK3V6QY1o
         1N5eEFdLVFVzz2/XXu8jGG6GVjhOo4uw7J6E6OEEIjhXqdLuT6rX1hyLmZJm+N+NGbTd
         5SAA==
X-Gm-Message-State: AOAM530f8KH3XTzV2K6r4HNa9b09adgYWNsSYza2y46A7oOHsU3RTsvk
	ZCwqOgCRsjIrEjZFSWDkk2VtHiRnx9Dq5Q==
X-Google-Smtp-Source: ABdhPJzLv4yBjsUhRI7IExNlDpZ+yesJYszs189O8qm+CmfF8CyS0QuwfVyXsDxNtcF6Ga47MbxhVg==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr7108623wrh.95.1594933698672;
        Thu, 16 Jul 2020 14:08:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/20] asciidoc: upgrade 9.0.0 -> 9.0.1
Date: Thu, 16 Jul 2020 22:07:57 +0100
Message-Id: <20200716210808.7438-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../asciidoc/{asciidoc_9.0.0.bb => asciidoc_9.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_9.0.0.bb => asciidoc_9.0.1.bb} (95%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
similarity index 95%
rename from meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
index 63e02ce5fc6..2f841de0653 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
            file://auto-catalogs.patch"
-SRCREV = "c44cb22b0cb110b69e4909c93c1cc6e2be5470cc"
+SRCREV = "fce6bd87fbdef5e510310464b02a75fb32f72f74"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.25.1

