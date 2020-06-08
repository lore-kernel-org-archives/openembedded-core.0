Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.25222.1591602519773994263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jq3U7O/P;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l12so13373201ejn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUq/ngH8/1q8xjW+CscE4eDcZvV+4bPtvsiohwOiSaw=;
        b=jq3U7O/PQCoaCqrdOba2hpoUDtKMSxXPDEofgPnzBptQYuVWkyBlVNEGCJNWosaD13
         1XLkJHpnj3/XFLj3LziXpHD+cu+8aOSZeMs2mIJVDBAY8K6h5d3J8abnJqKuL7l8lZJp
         3lTm3XpRQrhAZvprFAsQUQZ5+4/ai8zDwj5Th2jXmbnlorLKMYR0IDgCB895k1xP5eQe
         CeZiDEJq6bSuY/7jYysIddvzQf5Cv5bPnx+9SwjUiznP/uNBOPovvCbkXRkLkdgypLxP
         3tr8arhtwxTjHLq8cJpKs0zMaHZeoDXp+na0stSq4hNoloA+VDhsycexC04dBRLGs/uA
         YDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUq/ngH8/1q8xjW+CscE4eDcZvV+4bPtvsiohwOiSaw=;
        b=f928OhzDR3oOyK+vDfPl+6jkPViIo5cvlSO4QKwhQENoIHb+8WmM7tScPWjdtWz8sW
         YUwkfXOQw1P2qiW6qOD9xR4Epqny2CY2OsyQt02DeIBBeK7XE6EyX6XWm9f1FT+re9QU
         deS0pVNmbIL6c7zBeb26Jb8FZMhQ0SepXBSnMZzQL6r/Gk31wJoLaDq9k1rXXrnN/ecS
         C/QKRTQr6MJL0v1NOY3j6mndoLfkeVimgRGIIVKEBJe3fmQiMrE23/bjDAtzsIcoKVTQ
         +qHKQiYx5w1+k0+WZGt8ClYFhIiU8echDmTC8OfRjsI3pZRWEOLbZnuqADjxsywpm37A
         cFPQ==
X-Gm-Message-State: AOAM533DWGRGrqYS/WpMfEtDXMw4DUH7ebChaDaK9cb/HUlUQPpO40KL
	3iLGF5JRBVAbjpBMkuGTXq5s+bL4pbU=
X-Google-Smtp-Source: ABdhPJz7+TrTGMd/ib0OpVg7ClcGVa+UjPDKCq49CJWpI2j/hhOXhh/Vl03SVoejdW8a5l4iQiisPQ==
X-Received: by 2002:a17:906:c828:: with SMTP id dd8mr20373911ejb.550.1591602518032;
        Mon, 08 Jun 2020 00:48:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/42] asciidoc: 8.6.10 -> 9.0.0
Date: Mon,  8 Jun 2020 09:46:45 +0200
Message-Id: <20200608074659.7051-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years, gpl2 text updated to latest official
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_8.6.10.bb => asciidoc_9.0.0.bb}     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_8.6.10.bb => asciidoc_9.0.0.bb} (80%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.10.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
similarity index 80%
rename from meta/recipes-extended/asciidoc/asciidoc_8.6.10.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
index 751bf0f19f..63e02ce5fc 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.10.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
@@ -5,13 +5,12 @@ articles, books and UNIX man pages."
 HOMEPAGE = "http://asciidoc.org/"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
+                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
            file://auto-catalogs.patch"
-SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
-PV .= "+py3-git${SRCPV}"
+SRCREV = "c44cb22b0cb110b69e4909c93c1cc6e2be5470cc"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.26.2

