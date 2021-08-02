Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002021"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002021"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651662"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/37] gobject-introspection: Fix the license (add MIT)
Date: Mon,  2 Aug 2021 15:51:56 +0800
Message-Id: <57b90c098ea7e8caf8fb861e3b7adf77da30ac10.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>

As per upstream the license should also include MIT[1]. This is also
what Fedora Linux uses[2].

This should also address the problem with auto-generated scannerparser.h
file which has the following header:

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

Taking advantage of the Bison expcetion, more precisely the following fragment:

 "distribute that work under terms of your choice"

it should also be possible to reuse the MIT license tag for redistribution of that
work instead of adding the default GPLv3+ tag (which would otherwise be required
without using the special exception).

[1] https://gitlab.gnome.org/GNOME/gobject-introspection/-/blob/master/COPYING#L8
[2] https://src.fedoraproject.org/rpms/gobject-introspection/c/6db290968fa1f92967851dc60115dfb3ea173cf7?branch=rawhide

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3685b51982ac4f611d3e235c8818474563548bd9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gobject-introspection/gobject-introspection_1.66.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index ebac8d3a43..3b884f03e9 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -6,7 +6,7 @@ generation for bindings, API verification and documentation generation."
 HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gobject-introspection/issues"
 SECTION = "libs"
-LICENSE = "LGPLv2+ & GPLv2+"
+LICENSE = "LGPLv2+ & GPLv2+ & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
-- 
2.31.1

