Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id C8DF47E5A0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:28 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 81so3791927pfy.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=waWKYozyPjm8/SSq3S6a+7H5zixrYQEP1xBwV/3b7p4=;
	b=elLfW0Ma7OR2sPmzZwjPw1K8ezLiTi1V8eInqNPgq1dv7zdfQdFqU+TAbzLwMhDwMx
	QKrd0eo1lXtGWCfrbUBX3jxmmOHtf3A/qcf5Cr7h8OrOwfiYKQ6EDILWWDGghi+tYOGS
	BhLaKFvGLl4KJT2jcyZRFcKOYFoIQpfKG0b1NHB4A1ME+UsfRO5Oi2hNx4qX1D7/Cdew
	B4LkFl5bZsqUXhHD+ebrp1am0U8VrNFse+KukfyKuN02Ul8TdX74gI8l+ojbHPP8r0tu
	OlJ/c19O+bjPiH/C7aGJlGNjsybMO4x44+rIHuJNB2Arn/fdnySI/v4Z+rkXfejGsfiQ
	e+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=waWKYozyPjm8/SSq3S6a+7H5zixrYQEP1xBwV/3b7p4=;
	b=nCD61Cw41XC6ld/RisKm3pR93ArLtns2C5K5VCmzVOaPcJIGgJH7Sou+vQT8NFhPgy
	BV5uQeIFUjLa3D1QzU6Cu1jA5XvMK7+zs6WndwPmVUE6ezQ1SKTgn4244eGbIz0A9fto
	v2qkIRsDNRmm4ZAwGbed5ikSsijgDvYYf2dPtdsUuYY4Uq1GbBi6kp2CGrf4tZJTD5Hr
	JsASbwY/BZrrp8gckwEqmHfRaLHnpLVcuhb3BhOMJmS1rcqQvZSfO433Q3bUK93l81ER
	G1hFY12UDtDAEMA7ObWE4tnW+/nYsKYPRsDa50g7ByuHlnBL1ENWjUEmAyPsr6F0Az8K
	LCzg==
X-Gm-Message-State: APjAAAWQkJmNcaedeGv+zw+rAStTxFlSghPNIPIVe0/4I6HZm3rvR9vW
	AxRznSeoeMi/0MT8FH/fZ+QuRI+O
X-Google-Smtp-Source: APXvYqziciDOZa7Dr7mdG4n+PpTBepvfykCE/XF0t2iZTFxE/73XNAQgHcM+Tsn5Dy21jUjEQa3cSw==
X-Received: by 2002:a17:90a:ae02:: with SMTP id
	t2mr16687096pjq.41.1560092069681; 
	Sun, 09 Jun 2019 07:54:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:54:02 -0700
Message-Id: <28c274c17eb1e88e4edcdaeac7f97c4c4aba01a9.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 27/27] qemurunner: fix undefined variable
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:28 -0000

From: Adrian Freihofer <adrian.freihofer@siemens.com>

While hacking on this I got an Exception. It's better to define
variables also in python.

Signe:-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6d2860c..c16227f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -60,6 +60,7 @@ class QemuRunner:
         self.runqemutime = 120
         self.qemu_pidfile = 'pidfile_'+str(os.getpid())
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
+        self.monitorpipe = None
 
         self.logger = logger
 
-- 
2.7.4


