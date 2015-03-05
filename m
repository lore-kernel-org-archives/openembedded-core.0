Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id EBB8F60144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:23:54 +0000 (UTC)
Received: by iecrl12 with SMTP id rl12so72355549iec.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 17:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UbpmtBEjIbzrIPOiPes+jhVwe+pN4V8eNQ+TiBCcOpg=;
	b=E3qFoFCxSOqs5Qw1LrPNnyFuQ9frf1o+4wTqTmrLfh//cM+iNAhYH59LA1WHy+b0on
	V/29oUAMu93jjFocIbZggK/IeEsN52kKuWvEnMVc/XIXWlrsmGtfnnlB9gMw+//PjA0E
	ysXXsiN0fecMZcWWw1kQTqR4JVa5jSfzD5KI+mEIYhRqZt6LppLaXCILhzNgEYuUPYUB
	jsbV0+bteQ2SoFWMijUI0mAARB8TG0kMFjn1hX38KyvX7Ke7pHRJh8V7aIBDu5UCsdlN
	i3EjITgnyMUGE5FhJp74sJfF2z52Fxvke8GkdAKu5MHbHImw7BI/kOApNzqtNbYRkSb4
	tcwA==
X-Received: by 10.50.66.235 with SMTP id i11mr16999778igt.40.1425518635508;
	Wed, 04 Mar 2015 17:23:55 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id o8sm11814008igp.11.2015.03.04.17.23.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 17:23:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 01:23:48 +0000
Message-Id: <1425518629-19739-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Thu, 05 Mar 2015 01:23:57 -0000

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
index c17e0eb..5ed04b8 100644
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
+PREFERRED_VERSION_gdb-cross-${ARGET_ARCH} ?= "${GDBVERSION}"
+PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
+
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
-- 
2.1.4


