Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 037417C892
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:36:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g12so6043453wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3ZTS6lrQcJFmyR6+j4zCbYxhgDdweFTR0cqRNbmsw04=;
	b=sfRhBrPr28Pd03eBG4hQO7JO+RQGqgPZsi/as1n3kgddC1XH0daUUhrlQWcUyitVS5
	jfvrYc4URNcMnr8eGLI51VPzW2NfvXcnbHNtciKBiCNRu/ao11WGEqcu2Z/dYxqLlpte
	Fl+8Bx6U8NpFAWU22Ie2dypam2Cvc0pJuyKzMvZAhKZBesSwH951TZjCT+a7ylVEcA9P
	FFAG26wIDthP4JWU5Q1+k1FYcq620M2X6c69BPYIHN4E2i11ewB53PbCVaaIVTzYlXzJ
	fzHOF4cuRtDDbOVmjS//rn54Owd2/yNX9JCKpt86ScJswrL40AOJJ84foc4Ew8AB+n5m
	bUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3ZTS6lrQcJFmyR6+j4zCbYxhgDdweFTR0cqRNbmsw04=;
	b=f5nM8vKhYV4RQLyRJPW+jtR7ZcFQVn2IPqnYiQdt66UfLGL2W6sZ2pq+WP0iBtWbdp
	LB6/m/TF008kZq/x6leVNsbLO9o4Kf9PJQDR6n6e5Njk3rd5OUiYSW0AlYtRRgXBWZW1
	1/r2JsaXNrMZWotM0qGflR+x0OwsgSKVvNaKHKI3q8yIn2hFY6EbYkzfBfQVKx3+z6xB
	rkG3kDOM8QGc82B4WQ1qohWkMUzFxdxk0hN4LvsuKnCTC4MlGab6WQMXyq4GRys2t4w3
	0aXXpz78jC9B/ItqrRULs1+Wb6aKII6qLCg6Z3p3QGEOHzk0QpoWUyla1uxYgB1UFaRF
	f+PQ==
X-Gm-Message-State: APjAAAUW/14jrCEU5MDdhZqdwzgj6DYsEF96jUIqfQtFH9J0jT3cgwFK
	YiKHrpbv/RvBubEvyEM/EKX4Hyvi
X-Google-Smtp-Source: APXvYqxhQnMkq/QAD53pGRNL2K0CciZWACAqE9UgUHIoMm80uhTEe/j46TbYHuyterOXyeXmkQkq9w==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr12515189wrp.150.1551713815474;
	Mon, 04 Mar 2019 07:36:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s8sm5523414wrv.12.2019.03.04.07.36.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:36:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 16:36:44 +0100
Message-Id: <20190304153646.59135-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304153646.59135-1-alex.kanavin@gmail.com>
References: <20190304153646.59135-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/6] qemu: remove support for building against host sdl
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
X-List-Received-Date: Mon, 04 Mar 2019 15:36:55 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 985289f5426..a9d28bf5a38 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,14 +80,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


