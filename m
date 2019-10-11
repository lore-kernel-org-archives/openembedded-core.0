Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id DC2AF6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id i16so10095006wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gN5rPZGVf6JbHi5JC78ua+oYl1cPFRbr5XmMGpdz+XU=;
	b=rG7DeXi+593XaGOjmvJIFO6yfAzuB8x/bx3AA+92LClDdgq+FKEQrzsGSXmseNcInx
	NQuc+kMUG/T9w85RXnzHZiTwvQnfPbI/tOyYEgthG9Yke4EYxLeX9Deq7b/QhQVjkzr4
	lhxuOywj6mmEJYfx3juAjTIdjPHJV2fq+VWSO7aq9Sk6luknoQX0XhjkAKFOwNzX7x3F
	Vd3W3MbZIUZwHOKTPThxqwZJ7beRJ0s8g1+1QrXYfm0rjGFb3IJ/wQ+mPD5qqx4tcO4H
	CmRb38QmYZhM2nRa2lCOsUTNeAeAXrmSan7u7OnzzqO3qGRAGEC54aG2LOgPXripfX7F
	uSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gN5rPZGVf6JbHi5JC78ua+oYl1cPFRbr5XmMGpdz+XU=;
	b=Ofo4Jzpn0Wud84wb1bF81XMn4DUSXXKQElmkPXV5LtR/wSVEYMpF/h54X7GtSe5kgo
	aWMJZ6U22NzXNU5lFlrcw3zmWHdZZf6c047ZnWCu0OryppXTjbgoywhOvqpd0ypEFbtu
	Of7RBDgbtu3M/NRI9jebLicOg8W88F2L4yrSBB7l6GbdnDlX8D91pnpBIb32i1WlNz8a
	FEQ0DuXAcFFzyXu7lugxQ+JjGlmwKGPSKdQEo2ELOLEERqoqm7qgl6i+fVXG+v7X5uGN
	y320D7ITqid4YIXmew9Ss7rgiJxDJN6kQQjpA/EI/EE3I9dBdw8knDWDXNkfGcucrRvr
	DH6w==
X-Gm-Message-State: APjAAAW3XzTdGjSCA9mfEJ64e8TyLUxLsLrOWF0SslpQocto48PfPMU3
	z4zMZcgqU4KEXPYjZ56aVRma1+mL
X-Google-Smtp-Source: APXvYqxNQSY3GR0I1cHcLnBmXTpMCdREUhS5xSVhxyvr3doFqeB4HpPbFEmzGM8I+jUC8nmblCuJVw==
X-Received: by 2002:a1c:a8c7:: with SMTP id r190mr2893001wme.162.1570794489448;
	Fri, 11 Oct 2019 04:48:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:45 +0200
Message-Id: <20191011114754.91740-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/19] gtk-doc: upgrade 1.31 -> 1.32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2019 11:48:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch      | 2 +-
 .../gtk-doc/{gtk-doc_1.31.bb => gtk-doc_1.32.bb}              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.31.bb => gtk-doc_1.32.bb} (93%)

diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 8c9bc954420..5ca4e3e086d 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 9537a7998a220b698b26d926a111bb400ff1ce01 Mon Sep 17 00:00:00 2001
+From 657310f3842c84d28f6b77e8ad4d9b93472ca5da Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
similarity index 93%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
index 4f97ce06333..50d4d99722f 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
@@ -18,8 +18,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "6239713011369a4fbdc7619350403772"
-SRC_URI[archive.sha256sum] = "a51687956d0377ac70904d03fdc73c9e116589b4a01453fa92162442b3657011"
+SRC_URI[archive.md5sum] = "07764836262e154e94922e5f2aa476ae"
+SRC_URI[archive.sha256sum] = "de0ef034fb17cb21ab0c635ec730d19746bce52984a6706e7bbec6fb5e0b907c"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.17.1


