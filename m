Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C578460684
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 17:14:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p138so15688986wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GJlwukVL9LIOW9BaWA5XAXNNoEA1+LHCsszSddpjXkk=;
	b=B1S5b4ZQN/J7ziDhhY7D4aY19hU8sAFaBoIYdVo4Yjt+MziQwMPFzJnChrOBnwHDyg
	uqGLSXImA7ra7BR7WnXgT/UEbHMU4j/08c7mLNvZ9kJvrFxq0jEfUz0jQtWrqUUKEMsi
	43fTqGjhc8kdxnaMymoHfocWGZweB/LaZUhncGjvf3p4bJtoxOnyzCKyJRGRlpMBn84X
	OnOx1O6BkAWbHO3iDzgRdLb7J4ZFewVsV6yZ239awjvUqne/8rgyAYtbcsLIIj597Y8N
	DybjoIcV83wRYs0Kj/q5lUljcLRs1bOx4YFTXFYvmY6HCq863s4KI2YiETJG8XlQ9a1u
	b1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GJlwukVL9LIOW9BaWA5XAXNNoEA1+LHCsszSddpjXkk=;
	b=LUbZWYRnpD2IYIFwl5Tt19J2ymsl+RJgYE/E2VT1L9toDZlbLSMJ3lhZSW+gPMtHHV
	i/685nVxOivFDLWOLYL64tawMKX7lo6uB9pDUC7jUwhhTUZE5pwTOSX2j6IwDZB8HnRq
	Ac1c2OdKx6w65IZfGHm+x1AVeUo7SwD5VT5JSwulup3mbqQ/749cIyJBNrz6mZNRswjD
	WwrFRNelAwTruesti1HZdu/95sqguDRhzen3fl/wnunxTjk/iSuy2QJ7wdmH830Oyp08
	YjRETkSEbuFSUVDfd9X/7HIwCO5V6vacKCN412Pxrk9csb6oijB5ETymXW7r4mT9PDSj
	weqA==
X-Gm-Message-State: AA6/9RkZwcGLQ4Gj8oC1ztKi4NZoIZPdpWwpW6f3e9geiFo/Je00XvfqLcvPMYR7/GrUWg==
X-Received: by 10.28.45.14 with SMTP id t14mr9802585wmt.20.1475514897265;
	Mon, 03 Oct 2016 10:14:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	uq6sm3003199wjc.37.2016.10.03.10.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Oct 2016 10:14:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 19:14:53 +0200
Message-Id: <20161003171453.9151-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH] systemtap: add dependency on boost
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
X-List-Received-Date: Mon, 03 Oct 2016 17:14:58 -0000

* otherwise the build may fail with:
| ERROR: oe_runmake failed
| In file included from ../../git/staprun/../util.h:44:0,
|                  from ../../git/staprun/../util.cxx:17:
| ../../git/staprun/../stringtable.h:17:29: fatal error: boost/version.hpp: No such file or directory
|  #include <boost/version.hpp>
|                              ^
| compilation terminated.
| In file included from ../../git/staprun/../util.h:44:0,
|                  from ../../git/staprun/../privilege.cxx:23:
| ../../git/staprun/../stringtable.h:17:29: fatal error: boost/version.hpp: No such file or directory
|  #include <boost/version.hpp>
|                              ^
| compilation terminated.
| rm -f libstrfloctime.a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index da30fa5..15f0d4e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,9 +2,9 @@ SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Lin
 
 require systemtap_git.inc
 
-DEPENDS = "elfutils sqlite3 systemtap-native ncurses json-c"
-DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native"
-DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
+DEPENDS = "elfutils sqlite3 systemtap-native ncurses json-c boost"
+DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native boost-native"
+DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext nativesdk-boost"
 
 RDEPENDS_${PN} += "python3-core bash"
 
-- 
2.10.0


