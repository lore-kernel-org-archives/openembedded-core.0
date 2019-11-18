Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABE07F939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 15:40:34 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n13so10578827pff.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 07:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rqa0aSQVbwu6L1nsGEBnokFpcQXUEbKK2lHAkOsFBfU=;
	b=NgQJnSZVV9mqfnICX1D/lXrxrcUEuuMwgykPaNLzkWAee/d2ROUYKqv/7obcFqtQzP
	gDpZ3151kjVLsFP7rVMlTq/jsUnbLV8a/DLZMo0ZWkjYJ9ZoJalsoWnY7mqOHZZFb6c5
	RvpGcgmlcfw+rPuW/jQ4znsaWIb2SkZFG7bmo24Gj2I7icW5aIlLP3L0JN0UKnrcYmOf
	THCXX/13j+Je2gelRszSFJrF7Q6IBBRQZ9UFT65HVIRIg8bJIZSzIBXgfWsEzjtLqK4h
	PEdA9004p5d9n7rBCchaasLSfkr9UJJSM/x1zUKZ6Vp5fKqe1iQ1GOwPfDh41Q23VXet
	noiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rqa0aSQVbwu6L1nsGEBnokFpcQXUEbKK2lHAkOsFBfU=;
	b=kDpDh1FQq1xXv+Y4Pq3dtfXsqbMUVWLcpzy5yyWUduLaItB7zEdIMgZWseXewsWGcJ
	YsNl3bPyvzoXOGZiOYKHu2+w6kOjK/4YZ6+/XRLCvaj1IqbUHiIqzZ8xTNdF+okdCUZv
	6qUV3ptgvoDw3NalGRafSda/LwS7no9ybqMCj5mOrOUG+AWssDBPGZ9zOPbXWrzTjrss
	qyw0I+ewTh3BhJqAYwtH9SuBG8qrycsuQnhGgpScWj+aj/lbRJCgrBj3LR54X4i8rrc9
	5VhLaaehcgtftfQLfbvsSy2EVpVs6yPkLcF1v4Pufh3rqKCTSpAuWc8b5Ej3Y9U351B/
	rFRQ==
X-Gm-Message-State: APjAAAXnhK77iAz1LPB8BEdxJz2B0cryx9N1PtVsD/VGkhlA9dkOfh5l
	Ei3VhUAQJr4lDp7PH1tb849qcLpntEU=
X-Google-Smtp-Source: APXvYqzdjuqtiUrtkcstFajfq3Wgggdo8F1dvQoWIiUXYIn37IPGDkybJDV9SWDfwX4OFIaRZSvgdg==
X-Received: by 2002:a63:d901:: with SMTP id r1mr9553233pgg.328.1574091635515; 
	Mon, 18 Nov 2019 07:40:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	g20sm20099452pgk.46.2019.11.18.07.40.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 07:40:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 07:40:20 -0800
Message-Id: <20191118154020.2137700-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Remove clang specific option
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
X-List-Received-Date: Mon, 18 Nov 2019 15:40:35 -0000
Content-Transfer-Encoding: 8bit

This should be no longer needed. if needed then meta-clang might be
better suited

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
index 299d14a6f5..0139f01017 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
@@ -99,8 +99,6 @@ EXTRA_OECMAKE_append_x86-x32 = " -DENABLE_JIT=OFF "
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
-LDFLAGS_append_toolchain-clang = " -rtlib=compiler-rt"
-
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
 RRECOMMENDS_${PN} += "ca-certificates shared-mime-info"
-- 
2.24.0


