Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6A57C89C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 01:40:21 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q7so7172601pgi.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 18:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I2pKuSFNXPykBCRB8Qw9AtrdnxgnQZjwTl8e1VFOEbc=;
	b=FaEya216yyhR7wPKISqrZkSruD360dOCkRu+JDagHcIkOBoZnPWu/OsfssgJU+x6nR
	/fKV26sdR3kO2sfG3nYTvWQyT5znwEOcFry7r5NAo1VwPnpe09AUXct2xdKbrFpk383j
	Ebqmi/K4K0lX1BJLHTlVwqTcYefW7psoGba/HbMJiV0Evpc1mT+1UF4GK2j55HmpQiV5
	rdnckVtqZGIfPCHpAODcXO9sy6zuexYWEhh2Zz2qTsOuoQi8RUrjF/cHjOzBS1vk22H3
	WFTLL3IJ8VQ1N5HmlSpMT64uwNl8/OIfD4wg7VSvOfg3Ww4bjnpqahOcnEyGH9GI6wTN
	CMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I2pKuSFNXPykBCRB8Qw9AtrdnxgnQZjwTl8e1VFOEbc=;
	b=nSYH/7qyyiJTn6J2GflH1dl8CwHjZeiyj7gbYZ4d+0iTfoFXLpj5fPny6hV+XPjoR2
	fU7+aSFj0LEWOXRZuVUWHx4lWTyiVFHi8JQOYeu9/c19qz5lnWrzu9ImgrrzImqEzmbe
	EE6bkAzKTg0tuQcJtp1lK/wO183aBV6ZjicGBzFGaEskqhfu5HafkfUIICiGkMxYnV/6
	Calbja64t7GKCKEUZJ6HkOuInPrh0IOA6i1sJfWqZLttgAzX+2i1YdUqjcS+4jBc8+t8
	06IPIdskNhv8pXaDs7kOLS2+qj1ONQG6fL5sFqKPjNZj/qxH6bxmQ4vvCIH4WsWbk9eb
	LbfA==
X-Gm-Message-State: APjAAAWV7SgYUjfCWZHIUe6eY+pY9PpJePI+DyuZQF8Mg/2xecpPbvdt
	ldMkCbLifGiq/T24LJHtFnZxcGxVZ/k=
X-Google-Smtp-Source: APXvYqyLgowsezmNfREHS4WmD1KcPgu6I3Ut1Dt8HMAKbdADEQ3KsqQtlA0ylsrKLMPyQ9wP+iFVTA==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
	t20mr30908437pjr.8.1570412421642; 
	Sun, 06 Oct 2019 18:40:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	o42sm10610076pjo.32.2019.10.06.18.40.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 18:40:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 18:40:12 -0700
Message-Id: <20191007014012.982396-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] gnu-efi: Do not use gcc-only options when building with clang
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
X-List-Received-Date: Mon, 07 Oct 2019 01:40:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnu-efi-3.0.9-fix-clang-build.patch       | 24 +++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch
new file mode 100644
index 0000000000..c6d660095e
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-3.0.9-fix-clang-build.patch
@@ -0,0 +1,24 @@
+Fix building with CLANG-9.0.0 
+
+Fixes
+clang-9: error: unknown argument: '-maccumulate-outgoing-args'
+
+Upstream-Status: Submitted [https://sourceforge.net/p/gnu-efi/patches/70/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -110,10 +110,10 @@
+                             || ( [ $(GCCVERSION) -eq "4" ]      \
+                                  && [ $(GCCMINOR) -ge "7" ] ) ) \
+                           && echo 1)
+-  ifeq ($(GCCNEWENOUGH),1)
+-    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
+-  else ifeq ($(USING_CLANG),clang)
++  ifeq ($(USING_CLANG),clang)
+     CPPFLAGS += -DGNU_EFI_USE_MS_ABI --std=c11
++  else ifeq ($(GCCNEWENOUGH),1)
++    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
+   endif
+ 
+   CFLAGS += -mno-red-zone
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
index f844435472..6d4c303353 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
+           file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
 SRC_URI[md5sum] = "32af17b917545a693e549af2439c4a99"
-- 
2.23.0


