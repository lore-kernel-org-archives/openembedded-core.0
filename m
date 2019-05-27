Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id E74737E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 07:47:34 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id u17so9099184pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 00:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yT9AyyQe+9arS+lfDQ43+Cg/vXaqqoNi3nqT7+xAFTA=;
	b=Tt1xutj70I/guFXIgbrR3+0JkdhoufXSePZVuQhqtgzuHxjgfbFXioEqqNhprN2vXB
	QPlbf63/ibfg2YU6+S3lzzM1LnY5NDc0HCtpC6UtyafLDe5G4CgbUIg7mZgqPGwb5X/V
	fcSduTeTP+FriMDL3wyMSna4W4VY3f2FtsZDsm9CHe4ML3PW0SJMUHhBfrg8ln7+Aiha
	qgquoPdeCm0MCcO0IEPk5Rmn1NeR+y8fxKz53lFlggfZFKC4/7/oIMSpq1f+Aqko3NZV
	lD9jU/ITKiRf9vrxV8Nnb7hTef5Fqj+iY6hwAD9FqY5Covzzij9CMmTXjqzRCkCfG3NN
	Lo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yT9AyyQe+9arS+lfDQ43+Cg/vXaqqoNi3nqT7+xAFTA=;
	b=iq51/jdkOy5/+yIOpnJiAh0gOyBHJoydVt/V/5TQl4KG/rm2ordTFDEXjVn8A76zZu
	YFagf60Vpj674uZq03aAhFfahCSAuvL0rujPc8hdD5OkHePekSeaSPyNknQqRHQY/bEH
	33V2OCeCPzYFNVsRvMoDG8EP+PP/I5iCrShZPT5r/pS2KFtnINP19UUpXS+9lpce7I1B
	9p8DLLWp4OkTxEWa0Rg1U5nChj+6fvriIjTzVWOyM6xccHLrjBx5YDahNcZ3yh1IIj8T
	yX0xpGUGFHtGx1H4RWGnrBH5yPZ9QzRJg+e/mzGy6Blldv6LuuOtEu7RS4FSbSkjMRb1
	hqkg==
X-Gm-Message-State: APjAAAVLAG7HukS2wUsdH7qS51MpS24i/MzSQwlCiH5AQ152H0Zo8LYA
	wjfh0ejOCR4XVTkBWdkwqh/BTcynfi8=
X-Google-Smtp-Source: APXvYqxLU+zhiQr30LkMhx/TJM+ymIl6NtAqKYcP+LDntqSRdYuKJjVAYrPvEhQbi1Pl1lMAr2+jTg==
X-Received: by 2002:a63:4f58:: with SMTP id p24mr8651785pgl.244.1558943255638; 
	Mon, 27 May 2019 00:47:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	194sm11825118pfb.125.2019.05.27.00.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 00:47:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 00:47:28 -0700
Message-Id: <20190527074728.27823-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] musl: Upgrade to master tip
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
X-List-Received-Date: Mon, 27 May 2019 07:47:35 -0000
Content-Transfer-Encoding: 8bit

Changes
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=65c8be380431eebe4d70d130bd38563f8df9a7d7..ac304227bb3ea1787d581f17d76a5f5f3abff51f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1e324804e1..a7fae4a656 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "65c8be380431eebe4d70d130bd38563f8df9a7d7"
+SRCREV = "ac304227bb3ea1787d581f17d76a5f5f3abff51f"
 
 BASEVER = "1.1.22"
 
-- 
2.21.0


