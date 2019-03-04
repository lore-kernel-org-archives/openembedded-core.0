Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 922A77C853
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:59:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i12so7244532wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3FDdKax+n+UUc0N1U+ZtxU7r8M9wTJu7r1+H2uu1/yk=;
	b=hkroqHLf/d4fN0bvrnFDuuzzJZUR6ZMKaUfJ3MiyMOWJdWJ2lhxBXXoEHocX0virgJ
	cqa9sMJMtf3QTugVk+SN7KAgaLBDJ8M3rv6JoYjb9rnITZEVXePlhcjYrDPWD+SJAfS4
	VF/c6xQHwmk0IH5eoY4Z/tyrwRrHssJsHewb1+xAITZtjiHNkMK/anHFRvI0N9zE6tNk
	MqFgXV+H/KNVBgsFuDet8WXZeIq5vOexE8xS7dSnSgbH6uKGrj6BSb6sFiEgJHPO/Q+N
	f79TjugIlYN2yJlObY6wFiUm4Sk1ZnuqfbqEvJ6giPZei/OU0n0PeZmZmArsyinwqUt3
	634w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3FDdKax+n+UUc0N1U+ZtxU7r8M9wTJu7r1+H2uu1/yk=;
	b=a8N3XAG5vpf9ijNRx41Bvf/JA6R6uEyuiUif1nEhLA2Gaozk/uq6EeqC7MZqjBkNNe
	MejzWSrg+VgUWF7q6PqwZNE45cus7tF09oCxCfPNC4BGdIOg5VYn4XI/VBgSR6kr1SSy
	zAb69+XmRh8hsWaoFeW3vbetCzefhBUbreAQWbRhORsnA4xeR4w9Itl3cQO0CbyBzfjh
	htg5WK8bRdemLrZqiS5ubJBziMA4hUnCJQ/NN/dJrRMdH91haNm6Sdqw4ZS85dhmA0qO
	K46OtnFpxwS6QqivESMSvWORYrPDUY4Ex0fRdqok7M23StUQM3BCN0JL6PC3W8+VEH2x
	D4ww==
X-Gm-Message-State: APjAAAUENmh6uQCQkzAg3PoZkCtt7Tvh+C6docDU83uwqf7GkNwmSw0a
	udQWbpT0tcdbXb4oRHoZ1AEay4CF0zY=
X-Google-Smtp-Source: APXvYqyg4KkG/fKDOGJhNRqq38f/H99YEJscquWRoezEcRPb+sO4FJpWdWTYuxfl/aexVLzlWMzLYw==
X-Received: by 2002:adf:ec41:: with SMTP id w1mr14653805wrn.184.1551736746119; 
	Mon, 04 Mar 2019 13:59:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a82sm20479406wmf.11.2019.03.04.13.59.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:59:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:59:00 +0000
Message-Id: <20190304215900.21796-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190304215900.21796-1-ross.burton@intel.com>
References: <20190304215900.21796-1-ross.burton@intel.com>
Subject: [PATCH 2/2] btrfs-tools: pass V=1 to get verbose builds
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
X-List-Received-Date: Mon, 04 Mar 2019 21:59:05 -0000

Quiet builds are nice for interactive builds, but hide information we'd like in
the logs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
index a6ca71d8689..3647232dc68 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
@@ -27,6 +27,7 @@ CLEANBROKEN = "1"
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 EXTRA_OECONF = " --disable-zstd"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
+EXTRA_OEMAKE = "V=1"
 
 do_configure_prepend() {
 	# Upstream doesn't ship this and autoreconf won't install it as automake isn't used.
-- 
2.11.0


