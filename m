Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id C2A2B7F89B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:40 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id s64so16989614pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y0+A4pCQHoCgI1n+6fjTSDfn+JSImwP/oTgu5sqWUGA=;
	b=e7YEbVn0dug6EP8VaU+kqXsnsE8lf/7m/ejyUJ1VjAwE8GP6s/WpfDftcdcmGFHrCm
	DE+H4qvyBHQ9N7if94z1Hms5bfG28ScakqNQ6Hdn9WnwuSn163siNfmOKpK2jpJnpqmN
	ZNui0b9FoKXaKvH1OBWs9ireGZ0qv86OXy9i1VfZWdpWwRujF5ep0nlse1l+s7ssVh5L
	+D4sBTKiVNPIoiLsoeVgEtqhL5r9LItB+yP1Vwb3WTIitw+lSqkS6WT9nWLNgmtop8Dm
	+VCj7ULzUip0P1okZqSAxEdobiqSw9Lq7iiFTznHyeSbutxBIdQN3P9t4rOO5ebuUXsp
	2pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y0+A4pCQHoCgI1n+6fjTSDfn+JSImwP/oTgu5sqWUGA=;
	b=gE1V6XK/nqSB5qGPUVEbFFA1I0s0ZOsa1z6CMpzuN6PHwpvILudTLqaUJ93zPdOpUL
	x/3Mt0G/TRcycx0zaplw2WmE9dEjsFeba01o99LCySz/J+zvwOTsOn3Ph0ke0v5rNBy3
	jLVLRa49A8jtFQ8XxgSLcpp6eg1TUC6vTAd+eVpjrxc1GwPOs2RlBjwfNFzFfb25ZCr/
	+lXyeSczmovl+bGm4o+Km/Tx9KWeeYGoXMUdUszrpybG1hMetwdwOFIPcRGCsOmLJPTG
	LMEkpaPkYSoY0en2dFsSxysFrGEKoTzqLzfmbEH9cTyiS9N6fB6xPrMC/Tzk9GzyPAyD
	bNQA==
X-Gm-Message-State: APjAAAW0H3IY7s+TB32O7ScW+hgk/y5DgWmghq2rwN+DC0u3gkJ3dwOS
	CZTnL3c1lnAJ/Tp9pdv35ah+tQpQyhQ=
X-Google-Smtp-Source: APXvYqxKatE0KI/JPeqsyBhvHP94qJTNLu4vh5PM5vdCUBC975tUf6EUnv/QgGdGb4ezjawq0d0JFQ==
X-Received: by 2002:a63:a508:: with SMTP id n8mr65329378pgf.278.1577645081297; 
	Sun, 29 Dec 2019 10:44:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:12 -0800
Message-Id: <20191229184415.19514-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/19] llvm: Upgrade to 9.0.1 release
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 8bea58a98e..70ba7d86e9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "4.1%"
 GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "9.0.0"
+LLVMVERSION ?= "9.0.1"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cb2e1164cf..a84e4d21b6 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -21,7 +21,7 @@ PROVIDES += "llvm${PV}"
 
 MAJOR_VERSION = "9"
 MINOR_VERSION = "0"
-PATCH_VERSION = "0"
+PATCH_VERSION = "1"
 
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
 
@@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "0399d5a9682b3cef71c653373e38890c63c4c365"
+SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.24.1


