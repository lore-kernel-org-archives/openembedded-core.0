Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.15285.1631124106966344001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e51O1lPh;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso2204081wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f9hq+Ea3L3i5Bob0qMZAOFppM1LBhg/7/TC1vXistfA=;
        b=e51O1lPhzM3rKYZfMMV2PVAdZwqk8mwvDOMtwumfxTHCAee8QDpDBXehi+51IHyTRV
         K02zzOWQ1ym3FkZ65mlwsan8/Zf+Tk6ZZ84+Iy5wqmQNw+LcwyKG5cNgf58XcaKxj+0e
         3EW+2bxPSSa+Js15XWaFXpXf9L2CAkyV1UtFdQMa+EN9kSkCkQbCW3IHcpxrA45YXyeA
         ZPT0DW0Eb0N6zD4x9teFUDm1ZOyIV7o8xZCwKQCNny3kJBH/sSAhsLMlPLgqB+c52wgB
         gVDw/g9T5yNXKUvLIcsEx08U9gzjrzHjBjBH2T8vTPrkAxBzxXQfC/CN9HmNKotcIpW3
         cXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f9hq+Ea3L3i5Bob0qMZAOFppM1LBhg/7/TC1vXistfA=;
        b=RVl7n6VkI8p10yEhb6z5UTixGerJXQpHbzRIgVBcpnMORGsdcZItzE6d9sqd0DGTrA
         YcEdc210wTDF2fMHcfXdLqNG8yQ4wCM9vQP2skoCvKocb0TNrmRn4a5okNJw+xI/5TKY
         R42k0pA6oCPSJoFURIapwV79duqsj8LjSgdLvxo6DIjoJhErwTdD6GaYOBopeP2xrJhr
         jwx3z+jmQe1xpk2rm04gUPI6JaNd7cVGURrj9nszhlhQH9X19/qPs2nxVOskIgGQGr+b
         xmhawlsGUavhYFXsLFOPEXAYQbIyk6SCXwJ+xfdqFNK9M0Bl2sAGyzHJ4J3/wIwwUpKj
         P/SA==
X-Gm-Message-State: AOAM5326WbuIb1uyeMFs0elAiTSXnlF2rmR0ZaHDNNTf8damibs/PAYD
	CIbZ66I2sxDQ4ndrqFNK3+n2cd1YqqM=
X-Google-Smtp-Source: ABdhPJzSXirNZt4VDI0hMk3YwLAdf6+5inQywLjBByoduqq8JUxj0RsBBRpxuh9Gwfq/coJlx+x3jg==
X-Received: by 2002:a05:600c:2189:: with SMTP id e9mr4928721wme.12.1631124105627;
        Wed, 08 Sep 2021 11:01:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/26] libgit2: update 1.1.1 -> 1.2.0
Date: Wed,  8 Sep 2021 20:01:24 +0200
Message-Id: <20210908180125.103473-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

License-Update: includes portions of openssl headers
https://github.com/libgit2/libgit2/commit/0903cac1d08817e87c556f5a3e6ec881be86c7f2

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.1.1.bb => libgit2_1.2.0.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.1.1.bb => libgit2_1.2.0.bb} (59%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.1.1.bb b/meta/recipes-support/libgit2/libgit2_1.2.0.bb
similarity index 59%
rename from meta/recipes-support/libgit2/libgit2_1.1.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.2.0.bb
index ae30a7a100..6df42e473f 100644
--- a/meta/recipes-support/libgit2/libgit2_1.1.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.2.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & openssl"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
-SRCREV = "8a0dc6783c340e61a44c179c48f832165ad2053c"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
+SRCREV = "4fd32be01c79a5c003bb47674ac1d76d948518b7"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

