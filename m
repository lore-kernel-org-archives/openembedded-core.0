Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 58E187E321
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c6so10777809pfa.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bzpGb3YQdvdMSgZ036ekvaQnaRII482iLXBPgMMciyA=;
	b=tW5DEj5r7UcKVR8El1HG3xiWXhRBUa8rJgWd04ID5Qncgog5Sykf6krhtKlKBnMHtP
	0dcvSJGHP7RNycMy7o9gRjMROK9U0xCfRpu7KewRF6ptaD04nwPqwKLLvZXL6LgPnRZ4
	6Uk+C+lNtTSfRo08ZgENyHNnJx5MQ1m5zGrswXroBN6d64vGsXwZm0a7lxaibeVGRCLj
	JkfIpvWvj8MYdZIE4AINQTNPYkWhCIaZm4Fo7JWVpqK+MUtmAONVnPyrJ1zw+hvQ9I6U
	VAtBBYP9cYLXGel7uOfvFF4kfIM7vBZyFqB02JOZUS3VlpD2K0A9QCQ2A75rbjVkhrXv
	GTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bzpGb3YQdvdMSgZ036ekvaQnaRII482iLXBPgMMciyA=;
	b=doQ0qYVyrC158TmSKl5cU7CAh5l8UUhXSKf/C5mQzFdAcePUI0y7Z8eh9/6g3l1Dd+
	u/qfMr+WUieAEJB4Xrw7K3AYl8/cJaP0GrKjoAvH39YjQDdy5AFT11de4mXPoAxHeEaU
	ln1jenD3Em7NdcZzRLVzOuObvHl+Py6YXYtMp9CRq1h/mGledRK6lVedWo+WJGiBj887
	PJaruv0r/vhWH0or+R9bEMFEhP0sJsCiQdECD493gJtha5H6CjoRvCJsVBkiIbeifZoZ
	mZ81XgmcPkf/o8jzQNAYuWLauDhygqxl0zmkp/1WPxCRbT6vc8OzAdGqeXfNFbCVQNYO
	BRDg==
X-Gm-Message-State: APjAAAWcqHmz7sgZXDKnAfgAld+41hiI20y9cQypC6Q9/R/ELJLb2Gyk
	WswrfyYkOO0j1FgqpCW2g5utL8uq
X-Google-Smtp-Source: APXvYqza/hledH+VonIm5Aio9r6+/UoIvYPnh7xA+OOUJvd5ATRW1D6Rzw7KiAfq8Mg82O9bLUxSkg==
X-Received: by 2002:a62:750c:: with SMTP id q12mr10490338pfc.59.1559574430535; 
	Mon, 03 Jun 2019 08:07:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:44 -0700
Message-Id: <11bc4253e3bc9525a12fafe855bf8d6db4fb81c3.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 01/21] dropbear: update to 2019.78
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:09 -0000

From: Andrej Valek <andrej.valek@siemens.com>

The only change is a regression fix:
- Fix dbclient regression in 2019.77. After exiting the terminal would be left
  in a bad state. Reported by Ryan Woodsmall

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/dropbear/dropbear_2019.77.bb | 4 ----
 meta/recipes-core/dropbear/dropbear_2019.78.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2019.77.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2019.78.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2019.77.bb b/meta/recipes-core/dropbear/dropbear_2019.77.bb
deleted file mode 100644
index d2a71ba..0000000
--- a/meta/recipes-core/dropbear/dropbear_2019.77.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "5d4f0256c5d13820b0a3eaadb1a0bc1a"
-SRC_URI[sha256sum] = "d91f78ebe633be1d071fd1b7e5535b9693794048b019e9f4bea257e1992b458d"
diff --git a/meta/recipes-core/dropbear/dropbear_2019.78.bb b/meta/recipes-core/dropbear/dropbear_2019.78.bb
new file mode 100644
index 0000000..d2cd816
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2019.78.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "a972c85ed678ad0fdcb7844e1294fb54"
+SRC_URI[sha256sum] = "525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4"
-- 
2.7.4


