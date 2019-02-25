Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id AEC2065D48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 17:28:39 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y4so4766619pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=peqhhNfWWpjIck/he7bjq0N1kGZNnW1bkOpwjmOMMe8=;
	b=FmEZLBfDna50GoKWsdWpt1JbS34WSKE7qjcgrOUQ8aWQGZNy/ifkXOGSMchKj1S1bf
	Rj4CIBYyfdDbRLk7jOpUFtp68IG0SIn1RvB0zrdt7S+ekeNfHQbMIdXj3XRxVQP3qcyI
	xSkTKRBYgMdOUeAI6cCfnIYD6ut6oRM34Ybp4XTbNW9uHhWDu6yKt+IQawJb3K+d/G6d
	wpyyBvjt9Rrol6RTaDGL6R3rvdQkDLeQNhezq8uhwEtpnv9P2jzqH9W7GcQMTjU9a2ta
	uw77bqP+FL8alWZRL1mqa5M/Rf2bHK/gPNNh0a2cjI8le8ht/RFTyefcMyVMxPgvsJlO
	Gc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=peqhhNfWWpjIck/he7bjq0N1kGZNnW1bkOpwjmOMMe8=;
	b=lz/qzlQjxUFHFv7iVhkpBX/QFrmI9a1XcCne3ZLcvHi4zMyGGeEVg4P+VizOYCa5UY
	OtaBl3Mf0GMSaH42FUunH6sYg8fln+Ni9RDPehR/tlvKo43R/zVm7pmiUwuSpNV3iJkB
	uEcxRku4osZLkVAQPZTK3HsYMGsQtCOBG9ADuY468fytPVrxP9+gtWueucW8GD0fdkDe
	pcs9l115bAbPehOFz7SAYUyhhfrWZxBizf8SCo8W97iA/fi6KwMmbBMd4tyYBlYbP3XA
	gOaiOgtPM1LePPyihZWQmV5IUVOMatugj91N9/muO/b+uIPLNLfadr2mATF2Notti11B
	2u4A==
X-Gm-Message-State: AHQUAubVGyZ83g3Er8FcTwc54SUppaCBAjBA4YXglfhEu3bUSdRtssQK
	jtqjB/3LAIwX0HLPnJXbVceiw8xv
X-Google-Smtp-Source: AHgI3Ia9R8saNRgN5iJOHQtz0aUZJDK7dYeZUlkcuGr47ckYQ1GnesmWFf5Q+rXgJIP2K+TLk3lwOA==
X-Received: by 2002:a63:9246:: with SMTP id s6mr208979pgn.349.1551115720247;
	Mon, 25 Feb 2019 09:28:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1cf2])
	by smtp.gmail.com with ESMTPSA id
	v26sm14405283pgn.46.2019.02.25.09.28.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 09:28:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 09:28:29 -0800
Message-Id: <20190225172829.42389-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] musl: Update to latest beyond 1.21
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
X-List-Received-Date: Mon, 25 Feb 2019 17:28:39 -0000
Content-Transfer-Encoding: 8bit

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1691b23955590d1eb66a11158fdd91c86337e886..6516282d2adfad2c7e66d854cde3357120c75dbd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix TLS installation crash 
    https://git.musl-libc.org/cgit/musl/commit/?id=6516282d2adfad2c7e66d854cde3357120c75dbd

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 73906d0f3c..f1052278c8 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1691b23955590d1eb66a11158fdd91c86337e886"
+SRCREV = "6516282d2adfad2c7e66d854cde3357120c75dbd"
 
 BASEVER = "1.1.21"
 
-- 
2.20.1


