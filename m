Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id E86516FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 04:00:23 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id s5so96192011qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 21:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LCkE2ptRgPx/rJok2X/gZBHDP/uCZdmVATqkYhAAVMw=;
	b=nPqotQMHfCbRUyaAv0F9kAPo6slmh8k0B1PteomPE/BppeOFgrFfGbn9vUvLQet8BP
	+gUrhMf99a3cJK/XiRtfu0FHHqRiG0NDjHd9MuP+JFtWdLlH2VfwUko3Zps56sXZv0lH
	X7jD9sVdtEZRWbuQm6LVTi+vmJ9x7ZpBrhoc1MCop1rNHasC5treQdE7ROpdMFs/6PbU
	FigBpjANCrnE73vaS6ZZyV8swfL5+tMDziWhtX76kZJ1qvs+G9Hdncp8uVqz88sXuGoT
	tGxnbZzy0fvwSjC7Y4rWi3qKsPZjrWyaoeoyplcUp2Mxin79P4CX3Tlih0PFJRWnVwBy
	FX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LCkE2ptRgPx/rJok2X/gZBHDP/uCZdmVATqkYhAAVMw=;
	b=SfnnEnnTlOIhS87mmH6OANHjoKxXw+gzZ1eQx26lsHPr33KCiy4Pwb/9Puf1KxgBdZ
	+tSsvBCs6RqEsK23qDqRpp4LUL0XIYPMnLTw7Vvx+d5I0KAx2RBnoi/drG4pwgXDLgXZ
	WzcVdKbs4oROBC46UQ4+TXceeyngMCkF/ushoOlHBbqps1Ze0Zz1cDhNd0IKXX1UfVyP
	6x3J7MMZBwqVJtyzGtWS9HSUgpio2EAn+bN8zJ1mLdz4v4vLAKn7Q/acEp1LudrMlswM
	nfxnCDbiduvK3GJNh4mfeyiC6F823BiX+/lq2MU4MEWGidx1aLcJ/Cd03Q5BObAHK1te
	OnNw==
X-Gm-Message-State: AD7BkJKRqClxykGVCOODDuSrX7pki0QbTo6UU+XFSL3guwHTgUnLiDLSqjZJCRQsSLsARQ==
X-Received: by 10.55.204.91 with SMTP id r88mr33000795qki.21.1459137624198;
	Sun, 27 Mar 2016 21:00:24 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	i46sm11057224qgd.19.2016.03.27.21.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Mar 2016 21:00:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 04:00:14 +0000
Message-Id: <14cb9948ea49c797fb5da57c2dde5fea657425e9.1459137452.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1459137452.git.raj.khem@gmail.com>
References: <cover.1459137452.git.raj.khem@gmail.com>
In-Reply-To: <cover.1459137452.git.raj.khem@gmail.com>
References: <cover.1459137452.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] musl: Update to tip
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
X-List-Received-Date: Mon, 28 Mar 2016 04:00:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rich Felker (2):
      fix padding string formats to width in wide printf variants
      fix outdated pathnames in COPYRIGHT file

Szabolcs Nagy (7):
      deduplicate bits/mman.h
      mips64: add recent linux syscall numbers
      add copy_file_range syscall numbers from linux v4.5
      add IPV6_HDRINCL socket option from linux v4.5
      add SO_ATTACH_REUSEPORT_[CE]BPF socket options from linux v4.5
      add EPOLLEXCLUSIVE epoll flag from linux v4.5
      add MADV_FREE madvise command from linux v4.5

Timo Teräs (1):
      fix gethostbyaddr_r to fill struct hostent.h_length as appropriate

updated paths in copyright text

see http://git.musl-libc.org/cgit/musl/commit/?id=dc4520d9c0b79bc5944f509e4e9061e5081e38ca

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index f2390e6..d27867f 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c9c8cfb4e5e4b9ee6ff570f078950120"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=082411391b4d1ace0d30f4c84317cc05"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 507e793..d4f9819 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "de400b6609becbc6a5ae87fa8b155f02a860e257"
+SRCREV = "5978eb703ce0e64dd778a88c1ffffb76fe5e2202"
 
 PV = "1.1.14+git${SRCPV}"
 
-- 
1.8.3.1


