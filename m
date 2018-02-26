Return-Path: <matt@madison.systems>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F3DA37875A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 68so6937148pfx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CU66VQ/7dMPSPj2XMcI7MmXAwKgK5ruE2PcalLo06Vk=;
	b=MvFXFN15xUxCExGbMGCjtIZo+pl+e1a3S9+t1ioU4pxE4ddp73c5hISf4VIwYhUptw
	6xN8UhLw+yVoPEGjy7+c2x6/TYOawbgBR5HsrxMlAmeu1Jqvu0m5WNAl3jHvsnICCSbl
	OtFGILCxsKl0XmCF+mvQ5VB0vEL7iWsBmkzc80XQ514pgrixyxZKYEKlmttxHvnc0jQ5
	/Dh5HnlFHVGpJbTVHdFQLrpgOJqzO3oW4hkCwW1096+K/nCOdZivgkgivhc3olEpH4nk
	PLRRlRFYXycEoxLWI2DWmfpLwKZrvwsH7n1wZEt4wGzxyHtajFKr6HgFeHzgLSAyzx1s
	ZH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CU66VQ/7dMPSPj2XMcI7MmXAwKgK5ruE2PcalLo06Vk=;
	b=oV05nTNqa3ExC7BqLU2IvQcyMFu7PRcJFi/oY4U88P/HDwkakmaB4qKIvMbCrXslPs
	B7xYnhfkz7CLAJFQHrgMCaK89I/deAneJVHUPtSMNQUtT3U9Ay+eWxEesvjrA15g5Kgk
	pZABj6bRAWMG2mU7AJ6E7D4RbU7l2iiEtA8q+WGfZvSUXZs2vdoxB26PLBIG/wUznVUT
	lviTd95fD9aYFiR+tkEss0bTauge9Buc2NnVByTbBqYOIEWDtIkXoU1AiZMsScY3fqK+
	elVQZ0go3Haxp1pS4S47NnZkHqc30oMWTG65EE77OgYZtlTLintXtjjoJ8ujg26a8m1O
	1U+g==
X-Gm-Message-State: APf1xPBptV30YSsvBppidARxlMYlLMDUUnQlgPYU3QUyNtO5CRN/B1X8
	YPMSK5jlgShYww8TmKxfp3KBTcFC
X-Google-Smtp-Source: AH8x225xyYLeKTpy0uYnIx7+YmX3IDyfAHoaI72y3LKtsDPnmF8RBhMqiY+suf9Nu3dVYSJ3i1AZKQ==
X-Received: by 10.101.86.73 with SMTP id m9mr9428487pgs.70.1519673646082;
	Mon, 26 Feb 2018 11:34:06 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:04 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:12 +0000
Message-Id: <1519673596-4750-5-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 4/8] go.bbclass: remove debug-related commands
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:05 -0000

The 'go env' in the do_compile function and
the set -x/+x in the do_install_ptest function
were used for debugging the bbclass, and aren't
really needed.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index bd7760d..1f6a21c 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -87,7 +87,6 @@ go_do_configure() {
 }
 
 go_do_compile() {
-	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
 		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
@@ -119,7 +118,6 @@ go_do_install() {
 }
 
 do_install_ptest_base() {
-set -x
     test -f "${B}/.go_compiled_tests.list" || exit 0
     tests=""
     while read test; do
@@ -153,7 +151,6 @@ EOF
     else
         rm -rf ${D}${PTEST_PATH}
     fi
-set +x
 }
 
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
-- 
2.7.4


