Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.5854.1609856732570006137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s4Q7bCFg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id p18so21351588pgm.11
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h29h4ZPjoggAvsbrlUsMSGIpkyMhnmnm6jwRVwCN4pQ=;
        b=s4Q7bCFgPBeUwnCLf+xjtpCcnxiouaJHBNilH6m8NGpBx1nAtRjmuXjzKaYjpBMJJO
         R6kWtBcwxYrwxgK5BjRSUXLVTChTrEgrMsWadVQPoAek0JlxvXfczl22drq5xQazGdbA
         slUIsuIQyswVBADxriOJotbubQceCnvfs31F+lc0NyrRg6IQM7KQoiURsWpOnu7LUmvW
         ST7jRoUs0heW6Yu3VvZAts5CCG+b8/cEAcEWrttMPWhCW6NOfeuOVXD/K736bI4BJYZf
         zBSQdr24UyZ5Kr3tabDXvvsetSIfVCYByRceB+cWRLZ2vmt9nlbSWUO6XdqiGl2CCzRZ
         31Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h29h4ZPjoggAvsbrlUsMSGIpkyMhnmnm6jwRVwCN4pQ=;
        b=PNFdJ0nV1qpGCa4banVVNoe5j1CzbgA73Q/vmATM/Q04qeV3Qd00a7LD/EBimqOwQY
         7i2F+2PpI9XusoJ9y9vhyq3+HlevfctCvqAwH+0mlsp8gaxrH7sKDx0SvMmkCaYOBuqo
         pB4xkyMRe3mTDEfWX7i0TEQQx24fl8Au8ipQVgfbRV0Oq2mO1GIy76ygwo+POJkBCGYQ
         ZGdK7ayBAQ4V/UJlROeB2KUP193ECx454pJALm8XxDEddjp43TGhdc2LNfa52906BsNm
         HrW7+8OvbCSUTOs+SPA9Yi4goN59hTPQy/T55xmvD1zS9EkbZXEpEXZTQUCCLoivpdG5
         YNDw==
X-Gm-Message-State: AOAM533XmIPIiNRGuwW3zMC5G2NwmE9vLBDiLaV9OYOG7zofCVyVgkLN
	smmm3PdsNhR5UyY8ekaapGeNfIVnc9zqPjATFKE=
X-Google-Smtp-Source: ABdhPJylUa7STpYufxM9XbG903Q8IASY6zbF9hdNmvj+pRIBffQmr8Dq2bbBwEHoRR4w/ZD/HnKPoQ==
X-Received: by 2002:a62:2585:0:b029:1ab:7fb7:b965 with SMTP id l127-20020a6225850000b02901ab7fb7b965mr67952258pfl.2.1609856731598;
        Tue, 05 Jan 2021 06:25:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/30] meta: add missing descriptions in some support recipes
Date: Tue,  5 Jan 2021 04:23:40 -1000
Message-Id: <a6694d72a6b2ac6c33183aa418673e882b0d07a0.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2654384db4999c78bc3d98215a4eecdab63541b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb                        | 4 ++++
 meta/recipes-support/aspell/aspell_0.60.8.bb                 | 4 ++++
 meta/recipes-support/atk/at-spi2-core_2.34.0.bb              | 2 ++
 meta/recipes-support/attr/acl_2.2.53.bb                      | 2 ++
 meta/recipes-support/attr/attr.inc                           | 4 ++++
 meta/recipes-support/bash-completion/bash-completion_2.10.bb | 2 ++
 meta/recipes-support/nettle/nettle_3.5.1.bb                  | 3 +++
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
diff --git a/meta/recipes-support/atk/at-spi2-core_2.34.0.bb b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
index 84e05e77fc..bcef8ef169 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
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
index f13a83a7b4..8515f96bf7 100644
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
 
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.10.bb b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
index 93e7d9dc3c..58e565dee5 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.10.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Programmable Completion for Bash 4"
+DESCRIPTION = "bash completion extends bash's standard completion behavior to \
+achieve complex command lines with just a few keystrokes."
 HOMEPAGE = "https://github.com/scop/bash-completion"
 BUGTRACKER = "https://github.com/scop/bash-completion/issues"
 
diff --git a/meta/recipes-support/nettle/nettle_3.5.1.bb b/meta/recipes-support/nettle/nettle_3.5.1.bb
index d92db0ef95..a9550ed033 100644
--- a/meta/recipes-support/nettle/nettle_3.5.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.5.1.bb
@@ -1,5 +1,8 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+DESCRIPTION = "It tries to solve a problem of providing a common set of \
+cryptographic algorithms for higher-level applications by implementing a \
+context-independent set of cryptographic algorithms"
 SECTION = "libs"
 LICENSE = "LGPLv3+ | GPLv2+"
 
-- 
2.17.1

