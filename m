Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8217385B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 18:10:44 +0000 (UTC)
Received: by igal13 with SMTP id l13so48242290iga.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 10:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pP90+QqC0Fatke2MkPw0+jU2AW654Lodjh+DEstNG+0=;
	b=ZTCk1ll6Bhz7b6NOi/ud2iOg7no1l3nxRNgmA8RLVihaKhKS/J/O64CbSNRj+5JR3X
	wo6P9dJKhPfcRD+bHpuGVdjHmT7qkVBXq9ppHFs2IE0Jth1AOLpRJgtATr1pcP1OET4J
	PZowAgyUuCb+y/oPU/dkl1elHKsFDpnHw4kMw2xGZx3hjOXWDo+xT6UMlgESSPl1Es17
	ER2Jp49oGqXILE0c9CWVgBjrDONII1s/pTA8V1HoqJgb/TscujY5/hGeIEEW1m3B0nSC
	oLQyIXZgpNp6phgx4qQuiBGTNekcZ9USe26U77JNflsHK4qbvHubPKHrMl1RsHqvWcQV
	6NzQ==
X-Received: by 10.42.206.203 with SMTP id fv11mr5119994icb.72.1425579046082;
	Thu, 05 Mar 2015 10:10:46 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id 5sm13251498igr.17.2015.03.05.10.10.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Mar 2015 10:10:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 18:10:36 +0000
Message-Id: <1425579036-31022-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V3 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Thu, 05 Mar 2015 18:10:48 -0000

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
index c17e0eb..f69fe9a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,6 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "4.9%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.25"
+GDBVERSION ?= "7.8%"
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


