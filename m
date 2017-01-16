Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B97A371A9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e4so3920825pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=GF2IQSazxFD6yyPrisJLs8S79CG0BS44v7lu2vOWczY=;
	b=a2tCPtKM4BTOy6WhB1Emq0DaqDj8hzXJPTSX7ugr++2BxLWVKTTZWaoIsyBLzE4ImL
	Dcaj8ZayoG4l6KjViVetNASYOR7i5AQ38eBmJDe2eq6uRlZZTsLag8lXku2kuwWHsf5V
	MTPCJ8ZdOiUNCy+hIX8eRlPQC6zvyhXCzy6Os8q4BRmtzFrOZN+E3woGK9tENSiO7BoP
	CAS6wjtlwvXYMMn/uMSmwSbeRHCfcByTYrUy+ULzwbPis/Ngn3CCuBpWLWXBhXQlCgw1
	1gKDO+4zCkYK/x4Xnsrmgn/o0VuutfysUAtdKZUnpQy5Y0t81jSVBt6gtp1M9/2CTdFC
	cIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=GF2IQSazxFD6yyPrisJLs8S79CG0BS44v7lu2vOWczY=;
	b=UbQdSIfx+8aPPvVXd1exZRvxIsC1l7LWVse+wTujjgDr+VW42ijC6k7A9TA70Lu8q0
	xHczjwReDZKOJcbTtYbSQ33LfHwF9Q3qIwL0lj2TuPxbfA0t7qtUu2ElYZ/sL1ABeL73
	/qH+WC6LyfkFocBu+2QhP30HsHqqSr5ja2JL01Ggd5DG/ztMTXq3kBKw4oSI41cRISF/
	+tK3uiiEkp0ZvWC2YjDDRA5ckP1AQ7H9nqS4V8jaHGUPRxHG2dK6OrenXHVG3FdyKr6r
	MdV7003F4EvR0sLAi8rQNtSOTwnBXbjPBen7tKKpoOVSpt+AP1k/1sWR0PuTTZKSHFT/
	iSEg==
X-Gm-Message-State: AIkVDXJo8ws5AzHb3qwEhWgkpc7IGRwtS0VbRx2xG/VnRuAr4kM7wk5AV/enBFS1LYMhRg==
X-Received: by 10.98.194.153 with SMTP id w25mr5977752pfk.181.1484576175261;
	Mon, 16 Jan 2017 06:16:15 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	b69sm39079891pfd.90.2017.01.16.06.16.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:14 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-8-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 8/30] gettext_0.19.8.1.bb: Handle packaging .dll's for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Package the libgettext*.dll files in their respective packages.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 0f4b556046..67173f247c 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -64,8 +64,8 @@ do_install_append_libc-musl () {
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
 
 PACKAGES =+ "libgettextlib libgettextsrc"
-FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
-FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
+FILES_libgettextlib = "${libdir}/libgettextlib-*.so* ${bindir}/libgettextlib-*.dll"
+FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so* ${bindir}/libgettextsrc-*.dll"
 
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
-- 
2.11.0


