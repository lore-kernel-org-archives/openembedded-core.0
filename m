Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 880CE7D7A2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t22so4203504pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lsPyjCmq5tgfRyyT9brRfQWsIopLFgEUkmcUctA/d6s=;
	b=mIVNmtkMWoWyQGpae4EpsoYpLcnqY2sQ+easgujz6M0vKWvanMm437Uo/WG0wD26UI
	otrnnWiQm0Xwx+yN6KeikEZ0vwc+kdkRPXWAYKWOlBq2Pec03Twe5BV/5Haz5QOW1JiT
	GeKabXgjcFC6QwJZKcz5K3TExWkcPNZWIUbFTmywtO5viorWFxuIDbxZsh+ZVL2KKEiG
	IB6XrwoEGpkzVL3kwQQJo47cQpjeVns+7osEicuuFA1l9tOfWsBKywxjKWrqAUQYNMHK
	dO2dUCY/1OPXwJ27ezz60I8OZolwuUPVjpyg2v9VqAw5GwhC76+/C/p0Q/HZtSe544cz
	1A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lsPyjCmq5tgfRyyT9brRfQWsIopLFgEUkmcUctA/d6s=;
	b=p4L93EY8IPqi99MG2hpiBcWn8DbpAXE5MLZcjF7LUWOu7H1dLGhpqI0WNMBxPmHnBQ
	jKKMqjBv6HYKmO1OwE2qNColp/k1nnuwOsetUli+EA9w98yTCtnbfwweHIJCe4u6pI3N
	7WiSk6whg1gDuFAzXNsIeZQcWxR+tOndEGiZbpyVgdtzPBXS/r/Q3GXAa7IVU1PinGBB
	o1lhGttaUJVMevbFTD7zoxF8PoFYuXZNx/1bZYSztqkg53iKPY9jcBXLwTMERsyhqJ8q
	OB0Wn7DqUcoPyE+Sg8ku/P9tprsO+CRvke9vrLl7TyzpqpfULYudCkbiW2/mOXtHwIQC
	yf5A==
X-Gm-Message-State: APjAAAVuKI5YOOl10y9Nu8CTYypBIsz5kZ6GO53cqgl9QnChum1g6nEt
	0rhgo/I+PyRePmCx2pSLvYMA2t+f
X-Google-Smtp-Source: APXvYqyuVtJD1M0uFypK3DzSEShRc+GHV4hmg7CsyR6X5Sl7bcPwTpVN+pXSvm2HRlc9XQ+oDlLitg==
X-Received: by 2002:aa7:81d0:: with SMTP id c16mr19791114pfn.132.1556983649619;
	Sat, 04 May 2019 08:27:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:40 -0700
Message-Id: <4e6d7e73e19e66b1a853225101857d2f8e26cac8.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 04/43] ptest.bbclass: Use d.getVar instead of os.environ
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
X-List-Received-Date: Sat, 04 May 2019 15:27:28 -0000

From: Mariano Lopez <just.another.mariano@gmail.com>

[YOCTO #12597]
[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/ptest.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index e87a965..936bf82 100644
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
2.7.4


