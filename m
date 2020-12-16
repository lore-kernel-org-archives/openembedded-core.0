Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.2873.1608093127135988437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 20:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tEvDbDxX;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c14so16424591qtn.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 20:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eknvn2HomXMvDeGOZ33TTx68pG+yp0jMeJe6zjoLZe8=;
        b=tEvDbDxXCP1DYMlaFzxzOwOfQ7pY4J2Tyw5aXQBEscouwJdAOFGVHnHIw66JZsBLbJ
         X78sAnOCUlji24uwrXS4RWMVzg/EisiIaOAgCZFe+4PvjAvT7Sn+WiBqSDUWEECO0ZFf
         QrbB+nmq+8zHW97v6w670VI3baJ6kSLjPypRvOZuIh0SPpHVkwIHmVW7ZaY5ZGRsLWyA
         cc3vzcM1L/j4QdTJy2DjinHIrT0x+839CjEXwM+ADGz6IgPZImJk330dzBSmF2gnK0tj
         wWBUaRIpfUPDILwgD6EWs17/DG2Tm1NbsPPEJtC3JFyJRhsnMEaZHjAcoR0W0a2Orp4T
         dKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eknvn2HomXMvDeGOZ33TTx68pG+yp0jMeJe6zjoLZe8=;
        b=EbFko05l2n2XymjseZpSEcH1ygqcdpN/VC6hDSU7kRUZfyPoN6tLkJKph7FNcmBvpF
         zdxPAYtUh1G5j9ChLyXsgBAbl/CwXPszHdA6L1rwyTwor10qaYJjf3UKkFihj1l2DQoR
         6qz1vkMbsh9Xj6c36NHHgDDqvdXdwuYeva/mL1n0jpi8r75+GYyDl6Dcq4joeSX7Opzt
         I+W+mz3wsbdCQKU+KoRN9vgOYlwDhc82Bt43Q94rvt7vpwEsmz1uDsPvos4AcRIZu1HR
         Hx3vEWOTaZRFQo60HcouJZ7JJncDeA5xR0rsWSbklyneXbqZ1YoSqflC11kaQVlcPyjz
         MItQ==
X-Gm-Message-State: AOAM532EOfNlsjXCrokZDTzrzF20f0yV40Ea78/sCD6vCiXP5Hmsck/k
	cTcUstTVMjxNa0Ac6J8oOSAayrrSrp4=
X-Google-Smtp-Source: ABdhPJzpzMvX2AOdwo4dfOl96hJT+XuleCBJ9FuV5pXFqn8l4aioqZ2Tty4tRBnu+KpXqEhTt/lxZg==
X-Received: by 2002:ac8:70c1:: with SMTP id g1mr39798181qtp.108.1608093125276;
        Tue, 15 Dec 2020 20:32:05 -0800 (PST)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id d9sm473558qtm.66.2020.12.15.20.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 20:32:04 -0800 (PST)
From: =?UTF-8?B?TWF4aW1lIFJvdXNzaW4tQsOpbGFuZ2Vy?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH] meta: add missing descriptions in some support recipes
Date: Tue, 15 Dec 2020 23:32:01 -0500
Message-Id: <20201216043201.18344-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb                        | 4 ++++
 meta/recipes-support/aspell/aspell_0.60.8.bb                 | 4 ++++
 meta/recipes-support/atk/at-spi2-core_2.38.0.bb              | 2 ++
 meta/recipes-support/attr/acl_2.2.53.bb                      | 2 ++
 meta/recipes-support/attr/attr.inc                           | 4 ++++
 meta/recipes-support/bash-completion/bash-completion_2.11.bb | 2 ++
 meta/recipes-support/nettle/nettle_3.6.bb                    | 3 +++
 7 files changed, 21 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 7073af8c98..c9b9bf0f50 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Apache Portable Runtime (APR) library"
+DESCRIPTION = "The Apache Portable Runtime (APR) is a supporting library for the \
+Apache web server. It provides a set of APIs that map to the underlying \
+operating system (OS). Where the OS does not support a particular function, \
+APR will provide an emulation."
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "util-linux"
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.bb
index 629987810a..f1d931b39c 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
@@ -1,4 +1,8 @@
 SUMMARY = "GNU Aspell spell-checker"
+DESCRIPTION = "GNU Aspell is a spell-checker which can be used either as a \
+standalone application or embedded in other programs. Its main feature is that \
+it does a much better job of suggesting possible spellings than just about any \
+other spell-checker available for the English language"
 SECTION = "console/utils"
 
 LICENSE = "LGPLv2 | LGPLv2.1"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.38.0.bb b/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
index 88add83dd1..a0657950be 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
+DESCRIPTION = "At-Spi2 is a protocol over DBus, toolkit widgets use it to \
+provide their content to screen readers such as Orca."
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
diff --git a/meta/recipes-support/attr/acl_2.2.53.bb b/meta/recipes-support/attr/acl_2.2.53.bb
index 5bb50f77f7..b120c1f16f 100644
--- a/meta/recipes-support/attr/acl_2.2.53.bb
+++ b/meta/recipes-support/attr/acl_2.2.53.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Utilities for managing POSIX Access Control Lists"
 HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
+DESCRIPTION = "ACL allows you to provide different levels of access to files \
+and folders for different users."
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1+ & GPLv2+"
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 0c3330a686..97bca46982 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -1,4 +1,8 @@
 SUMMARY = "Utilities for manipulating filesystem extended attributes"
+DESCRIPTION = "A set of tools for manipulating extended attributes on filesystem \
+objects, in particular getfattr(1) and setfattr(1). An attr(1) command \
+is also provided which is largely compatible with the SGI IRIX tool of \
+the same name."
 HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.11.bb b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
index bab8a018ce..f00e0fc5b7 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.11.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Programmable Completion for Bash 4"
+DESCRIPTION = "bash completion extends bash's standard completion behavior to \
+achieve complex command lines with just a few keystrokes."
 HOMEPAGE = "https://github.com/scop/bash-completion"
 BUGTRACKER = "https://github.com/scop/bash-completion/issues"
 
diff --git a/meta/recipes-support/nettle/nettle_3.6.bb b/meta/recipes-support/nettle/nettle_3.6.bb
index 90f8625ae5..7c1b1a2d5c 100644
--- a/meta/recipes-support/nettle/nettle_3.6.bb
+++ b/meta/recipes-support/nettle/nettle_3.6.bb
@@ -1,5 +1,8 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+DESCRIPTION = "It tries to solve a problem of providing a common set of \
+cryptographic algorithms for higher-level applications by implementing a \
+context-independent set of cryptographic algorithms"
 SECTION = "libs"
 LICENSE = "LGPLv3+ | GPLv2+"
 
-- 
2.28.0

