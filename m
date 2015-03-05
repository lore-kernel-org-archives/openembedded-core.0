Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC4C65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:45:39 +0000 (UTC)
Received: by igkb16 with SMTP id b16so46823396igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cjC6xkNVX4wBMo43pIoW8ZTJaQ2YSDTfNxYYBQb80AU=;
	b=v4eIb6q6bANqBS52/wqZvXGXnSaYPpUf/mYaOWPSQamawC98NrWdB3HY+wG7lsycAY
	zE7qpog0PaPU0BQzz8wgCkNs50bdDoyPaUPHoYEz8snuNp3mLur84/uO2ZCDFtLz+lBx
	UkcFrlICY9FLwtXX79GsAhU0asxgBolFshO/AD9eZX1Vtbc+GTlHiHpQ678iE6HfzlLg
	r8Q1mmiw7bqzDe3SsAQrnCszxxDi9gM5z7XWNcRRDW1hxhdzArpDkLkIedIg3ZVl6qJH
	+YpPzoG2k32bK5qTxC345y0rvHJQsEBAS4d9PWWTx3JtLvBJakX7avX7zQjnFXfK7rfm
	oBkg==
X-Received: by 10.43.14.10 with SMTP id po10mr4215899icb.64.1425570340590;
	Thu, 05 Mar 2015 07:45:40 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id n12sm5226956igi.3.2015.03.05.07.45.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Mar 2015 07:45:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 15:45:33 +0000
Message-Id: <1425570333-17554-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Thu, 05 Mar 2015 15:45:42 -0000

Sometimes we need to override the gdb from third party
tool SDKs, this helps out, moreover it also makes it consistent
with in OE-Core too to have multiple versions of gdb if we ever
needed to

Change-Id: Ibe1ae59175984bbc661c243764c81cd99fef54d1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c17e0eb..e3df934 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,6 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "4.9%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.25"
+GDBVERSION ?= "7.9%"
 GLIBCVERSION ?= "2.21"
 UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "3.19"
@@ -49,6 +50,10 @@ PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk-${SDK_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
+PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
+PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
+PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
+
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
-- 
2.1.4


