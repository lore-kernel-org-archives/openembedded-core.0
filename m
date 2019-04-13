Return-Path: <just.another.mariano@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 85BC66007A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 16:05:14 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id 139so20611693ita.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1hptkgL4rHrFRVACbfDCR3NhFUSqLs26Qrcqf0VZcUA=;
	b=HzPoMfOjvuJwRGeO14bDcLx8K7aVYdlj+XSWMssm3II9S3ednEfb5I5bD01SNrv/GH
	N+oRmBPiVC1l/VejozVMjDthS64yEGw1w/WcyC2nIyevMlkagwjinMNLNFHUaELvJZ/4
	1GOGclMDsh2hYzqJHRjANY6y19l4vsV34duDaI4zli997xmnufFuDKJ05QeA7bT8CgfE
	SJNn7kvuJD898QrS4pMwz1NBkXNlPkpu7oBW/SZP44Mgj2j3oEmN4vkNu2xXqHrfg0rf
	0Eg7YCgGOqDOxJ+ggatKixVCfXgE4cioN7uWJHURPyH8ug+dmpbv15hBENZq12LN7gtF
	/Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1hptkgL4rHrFRVACbfDCR3NhFUSqLs26Qrcqf0VZcUA=;
	b=ijUGFlzuOLhtvprQC9A7ualFHynO/r91wv84AQXssABqAP38Dw3WIZ5AHibhMEBUuI
	OrgM1Foh77ALYvu47rwKFNqLmcR7hI3Sv+ZWq/VGjHx99gSB+1BLYrFnA+oEmKLSJgKd
	68l3+Q1kPjn/pmSZ+INMBtyHYuFiB6m8JgyHv4swts0Pqh7OSKsr/PWrcS+48TVjldpP
	BPznpxkvj+ZdKLirki88P8DIflliNnhMdbDmDv2WF8hWSEEn3p7rypt3Xg1GJO+IddO4
	/uiufdvp4CQC92EUkSEPkU1ffx+CB+R6lbU8inBNX6vkz1PEmAptSnbGV32C/ORCbi1Y
	NQUA==
X-Gm-Message-State: APjAAAX6pS9NpvFgXMgraGoWtKUF2hG3KW6ESfQi9TgqdTudcTRuN2t5
	1wmb1bAlwARuEmVp6JDd3x/RgNrT
X-Google-Smtp-Source: APXvYqwsx6M/m7URyNQof3jUcKoROrMK9owre1FzhsZwHK3mM52aEb33PTH0OUxAQ61vFFn8xTCdrg==
X-Received: by 2002:a24:a70f:: with SMTP id a15mr2749580itf.117.1555171515448; 
	Sat, 13 Apr 2019 09:05:15 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	f132sm17449285ioa.76.2019.04.13.09.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Apr 2019 09:05:14 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2019 11:05:08 -0500
Message-Id: <5ba6da88992e252b5e4139c961ad1afb4e8c780b.1555128581.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1555128581.git.just.another.mariano@gmail.com>
References: <cover.1555128581.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ptest.bbclass: Use d.getVar instead of os.environ
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
X-List-Received-Date: Sat, 13 Apr 2019 16:05:14 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #12597]
[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/classes/ptest.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index e87a9659cb..936bf82736 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -84,8 +84,8 @@ python ptest_update_alternatives() {
         return
 
     bb.note("Generating symlinks for ptest")
-    bin_paths = { os.environ["bindir"], os.environ["base_bindir"],
-                  os.environ["sbindir"], os.environ["base_sbindir"] }
+    bin_paths = { d.getVar("bindir"), d.getVar("base_bindir"),
+                   d.getVar("sbindir"), d.getVar("base_sbindir") }
     ptest_bindir = d.getVar("PTEST_BINDIR_PKGD_PATH")
     os.mkdir(ptest_bindir)
     for pkg in (d.getVar('PACKAGES') or "").split():
-- 
2.19.2


