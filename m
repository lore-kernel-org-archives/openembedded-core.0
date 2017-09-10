Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E99EB77EA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 13:15:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h4so3771941pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=zqs1NS71hSfcv0C1p3G+IMk8XV86iFpGfAOY2QytPMc=;
	b=eHs47wt33DdeB9Te6wRqRSWH0NUgxJNBoywtY4mXXvTNG5zy0o8Let14uiW61ZFTHU
	QQKtuLB1Pbb2uZA5PZgAtDOVMqno1FLGeBlGS+19mtQM63B6el9IxMjlUoPoG9GhmoSK
	oFuN0drKDGOOHvBRSiKehjuVnzopcH2YsULbzN3Gv1UPf4uqoNGumhZBtWulZz6gG2F9
	bsCmwdrF7IrLrQX9UPSIYgsoV6hoM25z1WAzxuNJzS0hbn9nE6aCttUlmRVySf1aLrEh
	SSY4Paw2y7kFQB6sDhfpScdbiG4yrr0aDh2TheEutvGu8Tm5m4z78MyhJZM5+/CkTQJn
	Zrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=zqs1NS71hSfcv0C1p3G+IMk8XV86iFpGfAOY2QytPMc=;
	b=PVDa7Ft6q92kUjKfmxnlKWE/7CbjIdwSBtmSpM3oyxwwjv0lcq0r7SBRYLaRpZQQJN
	eNMp3mswet2T6h0VtHdT0e/c3TAEOnYqcbScNuwiAr+293cXdJ0rNvqgbqWjTYd/ui80
	LA89ZYG2/Mvu5bwmkwvK3l3/KsbTJkQkTTMn8tnVfhbh8lyDE9Oe+jJqb7w995iklKrQ
	L7RFBRXDdFWjxhPxqZ714Yxs/v8tQWIfpFfHPcNJVfLUcsqzVLs864AXkGHkbw38oqrg
	8LLAPc0ckaDJd4gzUa2Q5rARBvE7UKUAJWwdaJ/WlnhfDHgENO9+LcDjLmH6mLu/LamV
	+zcg==
X-Gm-Message-State: AHPjjUh6YUYkmfsta3jSD3r69D6Gz4yjnJ0SFhG4ObaYPmSyLRE+/EWV
	jT8MaWkq+qtUO3whV/FDIA==
X-Google-Smtp-Source: ADKCNb6hOmXCPZDTS91mO2x6WRpm51qre6nVTuqMwXJabkQKAqpaO6yyAgrmmXihC8Ep3U+UTQOxTA==
X-Received: by 10.98.69.136 with SMTP id n8mr8788126pfi.291.1505049311855;
	Sun, 10 Sep 2017 06:15:11 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142]) by smtp.gmail.com with ESMTPSA id
	s184sm11829727pfb.123.2017.09.10.06.15.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 06:15:11 -0700 (PDT)
Date: Sun, 10 Sep 2017 23:14:46 +1000
Message-Id: <20170910131446.4555-4-nathan@nathanrossi.com>
In-Reply-To: <20170910131446.4555-0-nathan@nathanrossi.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 4/4] icarus-verilog: Add Icarus Verilog recipe
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
X-List-Received-Date: Sun, 10 Sep 2017 13:15:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Icarus Verilog is a multi-purpose tool for simulation and synthesis of
Verilog. It is also useful for linting verilog and other tasks.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../icarus-verilog/icarus-verilog_git.bb           | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/icarus-verilog/icarus-verilog_git.bb

diff --git a/meta/recipes-devtools/icarus-verilog/icarus-verilog_git.bb b/meta/recipes-devtools/icarus-verilog/icarus-verilog_git.bb
new file mode 100644
index 0000000000..d1e4cfdd33
--- /dev/null
+++ b/meta/recipes-devtools/icarus-verilog/icarus-verilog_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Icarus Verilog is a Verilog simulaton and synthesis tool"
+HOMEPAGE = "http://iverilog.icarus.com/"
+LICENSE = "GPLv2"
+SECTION = "devel/verilog"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/steveicarus/iverilog.git;protocol=https"
+SRCREV = "ac87138c44cd6089046668c59a328b4d14c16ddc"
+
+S = "${WORKDIR}/git"
+
+PV = "10.2+git${SRCPV}"
+
+inherit autotools
+
+EXTRA_OEMAKE_append = ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}"'
+
+# issues with install races
+PARALLEL_MAKEINST = ""
+
+# don't regen aclocal or autoheader
+EXTRA_AUTORECONF += "--exclude=aclocal --exclude=autoheader"
+
+DEPENDS = " \
+	flex-native bison-native \
+	gperf-native \
+	readline ncurses \
+	"
+
+FILES_${PN} += "${libdir}/ivl"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


