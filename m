Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id ADD6D61203
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:19 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id l3so5689401pgi.8
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CuA6gRt58WCRTxg9YlxloJq6YRxpeCj2K6dV4BAbSiw=;
	b=IOL6faimrNzfmx61P8bk2pX7ZI1j0EvtO9W5XMwgitd7DukqK+DqFlC4X6p81gw2xf
	3yeMcY6v+cuLErj2b6P8GPiey2O4Q7TDYkqRLgZ1uKr7pbtiTvvoioBnCbrWYeS2aaJb
	YfMsXg7wONtJulTHxi/kyEDmCQ7eF7qQz0hGTOZOiEEOJgORVNQZMTWkbnb/AvuaMcf3
	N4LaOUjD6J41I5YqWWPP8pvwSrNrM+/qJpWLXgSioHeDfk+xVBo5xn8XtDNaLNyhvoya
	Keh7ZjqLZ+Wr8qZDsl/r4wPrE0Uc7vThLaag7a3FpPesCCPd9WLB4obOUYRq3RqrPQVC
	3A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CuA6gRt58WCRTxg9YlxloJq6YRxpeCj2K6dV4BAbSiw=;
	b=QamewI625tBVcrYKEK6a2F3UH+yUePZtcqEqnA7ulwkGtsUe0e7v98CS0lHxS1HEFO
	c+rtk0AC71IRVv+/wud0Ksr5KGmkbq2G1vCbqF7rugyENDVsap7JXNMDgbe4PkMUJhqD
	xJ4DdgkKC4yOunfDXal61kan+QoXDjehaXG+55k5HC9Fo4sRDW0qeL4SaQ979ltcf0XW
	LG7FVE3FmOVsu1m2hNoWoqiz/OShFrCNQU/KtQR0pKa+f5Afg5QKrDQelZQb1B8fl2uo
	/dHef5ZhIEtjQeGDv1X0OaWM9tR7DDVxSRgPkZt5t4vRvKVOTHSmIU4r6/h9hZcT66bB
	f3CA==
X-Gm-Message-State: APjAAAVGLXrHBlde3hLoHYtPZpMManWeQp1JHcBHyp3CNiycXOV5HCpw
	75dS4OO9J6aB4Zv7qlDS0a0r1MSR
X-Google-Smtp-Source: APXvYqz1UcN4XzqNmeNZMRx7rjJIYdoFRFGWRr4I6KLP11oLfG9zEMJJLf/VpASXSQJWh2az3Ju8IQ==
X-Received: by 2002:a62:6c6:: with SMTP id 189mr31526454pfg.224.1580828780007; 
	Tue, 04 Feb 2020 07:06:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.19
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:07 -0800
Message-Id: <5c9a1dd59387ca9972e7036272dcd47a4a168efe.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 7/8] webkitgtk: fix occasional link error
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:19 -0000

From: Joe Slater <joe.slater@windriver.com>

Partial backport from WebKit.git.  See patch for details.

Fixed in webkitgtk 2.26.1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webkit/webkitgtk/fix-link-error.patch     | 45 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.24.4.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100755 meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
new file mode 100755
index 0000000000..9696ddd691
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
@@ -0,0 +1,45 @@
+webkitgtk: fix an occasional link error
+
+Part of ae465a4e...  Changelog is not included in the source tarball.
+
+Upstream-Status:  backport [git://git.webkit.org/WebKit.git]
+
+commit ae465a4e3b1498b6c4038fc7e596e0e3662d116f
+Author: Hironori.Fujii@sony.com <Hironori.Fujii@sony.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date:   Fri Jun 28 07:38:09 2019 +0000
+
+    [Win] unresolved external symbol "JSC::JSObject::didBecomePrototype(void)" referenced in function "JSC::Structure::create(...)"
+    https://bugs.webkit.org/show_bug.cgi?id=199312
+    
+    Reviewed by Keith Miller.
+    
+    WinCairo port, clang-cl Release builds reported a following linkage error:
+    
+    > WebCore.lib(UnifiedSource-4babe430-10.cpp.obj) : error LNK2019: unresolved external symbol "public: void __cdecl JSC::JSObject::didBecomePrototype(void)" (?didBecomePrototype@JSObject@JSC@@QEAAXXZ) referenced in function "public: static class JSC::Structure * __cdecl JSC::Structure::create(class JSC::VM &,class JSC::JSGlobalObject *,class JSC::JSValue,class JSC::TypeInfo const &,struct JSC::ClassInfo const *,unsigned char,unsigned int)" (?create@Structure@JSC@@SAPEAV12@AEAVVM@2@PEAVJSGlobalObject@2@VJSValue@2@AEBVTypeInfo@2@PEBUClassInfo@2@EI@Z)
+    
+    No new tests because there is no behavior change.
+    
+    * Modules/indexeddb/server/SQLiteIDBBackingStore.cpp: Include <JavaScriptCore/JSCInlines.h>,
+    and do not include headers which is included by it.
+    
+    git-svn-id: http://svn.webkit.org/repository/webkit/trunk@246922 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+[ modification of Changelog deleted ]
+
+diff --git a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
+index d1b047c..0899a9a 100644
+--- a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
++++ b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
+@@ -49,11 +49,8 @@
+ #include "SQLiteTransaction.h"
+ #include "ThreadSafeDataBuffer.h"
+ #include <JavaScriptCore/AuxiliaryBarrierInlines.h>
+-#include <JavaScriptCore/HeapInlines.h>
+-#include <JavaScriptCore/JSCJSValueInlines.h>
+-#include <JavaScriptCore/JSGlobalObject.h>
++#include <JavaScriptCore/JSCInlines.h>
+ #include <JavaScriptCore/StrongInlines.h>
+-#include <JavaScriptCore/StructureInlines.h>
+ #include <wtf/FileSystem.h>
+ #include <wtf/NeverDestroyed.h>
+ #include <wtf/text/StringConcatenateNumbers.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
index c090782411..1c71762945 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://narrowing.patch \
            file://0001-gstreamer-add-a-missing-format-string.patch \
+           file://fix-link-error.patch \
            "
 
 SRC_URI[md5sum] = "c214963d8c0e7d83460da04a0d8dda87"
-- 
2.17.1


