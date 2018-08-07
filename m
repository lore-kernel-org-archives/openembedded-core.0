Return-Path: <anders.roxell@linaro.org>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4B4C74FAD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 12:03:59 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id u7-v6so13209353lji.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NpWL7i/srKoHX1gpy6aThTlLk/7lmYzBttKbgaX/G+M=;
	b=KjNDMd8M11Y7Eyi0FpVg9j3OdJLHU/OvG/SJ3LgCvdAklDb5U5jwU0IyBn/WV5rsT5
	hw207kHs4o5AXxTIq/KPH7ToZlxYdymWdy26pBQrE7YIvx5jf8zAyHwGuMPjAVTTqrN4
	zqsvgP+bz2vtQGRuzhM0pasLRtSxrdMAvhAN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NpWL7i/srKoHX1gpy6aThTlLk/7lmYzBttKbgaX/G+M=;
	b=BEypEJZzkHdq8PFMEFWFQXLSomwSOpX6jlFNrB3nNDMUS2tE27JQtbqeFBqTNFB+zV
	fGq1OW9QkNYpePwQqStcc27OFIgAWvpyPsMiCuQHkA5RQgU7pIzb99WRjejIIoq1pxPT
	CI1DQSQB4LH624T5DFVEHfFt3lileWdo4synFHud7l2UPav6jNXxIgG1H+HROgNCJP0y
	hUhNys17+pFPimYUO5CE4ruMonRbh7pPzM3nYsRCTEak+rZQKoW3lNjIIT7SOcGEE9DA
	xx5JC2mXd7rUTd2xtYlHSVoUzJFjeHwWXxUq0zZIRxFBrBDfJvoeMBC77NKs+ipAEmaL
	4BZw==
X-Gm-Message-State: AOUpUlG8gttZTrhtpdZPJZPhSYc1LkAHQ4Gc7zOLG66Hhek6vTldeSnu
	U9crAea6l9MZlJBj3XYgBVcoqfvcSV52jQ==
X-Google-Smtp-Source: AAOMgpeIbPXeZVJvXRhSCoVPEmWSAXrtWEshw5newk0XKr2BmO3g+ZYzDtuVw9jWObjJQ7W2PCGi5w==
X-Received: by 2002:a2e:8:: with SMTP id 8-v6mr15774590lja.112.1533643440163; 
	Tue, 07 Aug 2018 05:04:00 -0700 (PDT)
Received: from localhost (185-130-167-110.kund.ip-osteraker.se.
	[185.130.167.110]) by smtp.gmail.com with ESMTPSA id
	q65-v6sm256777lfb.80.2018.08.07.05.03.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 05:03:59 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2018 14:03:57 +0200
Message-Id: <20180807120357.18154-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] Add aarch64 SDK machine
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
X-List-Received-Date: Tue, 07 Aug 2018 12:04:00 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta/conf/machine-sdk/aarch64.conf | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/conf/machine-sdk/aarch64.conf

diff --git a/meta/conf/machine-sdk/aarch64.conf b/meta/conf/machine-sdk/aarch64.conf
new file mode 100644
index 0000000000..98d8380ecb
--- /dev/null
+++ b/meta/conf/machine-sdk/aarch64.conf
@@ -0,0 +1,2 @@
+SDK_ARCH = "aarch64"
+ABIEXTENSION_class-nativesdk = ""
-- 
2.18.0


