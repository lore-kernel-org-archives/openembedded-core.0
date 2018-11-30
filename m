Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E51A6C4B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 16:56:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r11-v6so6486033wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2uGWFpjm08QdFfHa7HKlAfZpUqrScs7LTNXOJrUDaSY=;
	b=e+yZ1JHlxUmikjWQnaB7nid+8+0dfnHBYNSUo5G5mkBc0xMe5FFe9oILdKR05KsPJY
	GI4EMKjDDFy4AG96D5kfFp2FO7tBsbH389FgFKr0PdfSw49e9D5hy41ycUAz1QCmWdFb
	0s3hAfquK4QDq3q383LkrbaNZQ1izq7IOWDKyZdnokVQmfJc+2ja1ER8yuAb1K6h+tDA
	EvaGW5FSm1Kb6qyag9RG/ndVn+7CdAoe5j5ut/y2KvrN7jWwuGHtZAH320RhK3Lby5sC
	DnEgkCRrlHXSsS7qd+6VDwJgVVvEusKVOcJXdcvmhXeLgCFtWBSzQIDnQzI4O80Tg8YI
	Yqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2uGWFpjm08QdFfHa7HKlAfZpUqrScs7LTNXOJrUDaSY=;
	b=P/iJWXzZqqCBpctQhvG/F+zXikaTE9ZUyn/1/dLRJ2U15CYVzPYcQTR3g/9lggnvQT
	Nm669wfo1NmR7LAa1XCLyaQwvizA6git9KTxNwl8uTuB6X30daJ7ElrfgEOx26cLbHnD
	QcISyAvFVD3WvMcAh7DNaFhkC2SR26qcUDKz36Q8yHdaNC+LWDnq5iADw8TwBKcTTmlX
	O/nBmsE6noCSepC4ZwW4G44RxNvyXRa0Dgdc3qfVAy6sihMkyuFsfHfE7cbXOPriZ+nf
	Lsv/53HGlzNCih4QkgpzwtwZ3OXWeTFWguhAbDnW7VgpboJtQT2xSA2wPO1wMJiOdO++
	QmuA==
X-Gm-Message-State: AA+aEWbrqk75QYc6DtsmOAw19yI7gxqwQ5kSphqlK2qWbw4mTJT4GZiz
	6T4Qm4WtSkrtip52li31xsFS2rYbrqM=
X-Google-Smtp-Source: AFSGD/WyKYRuhJSW1qY/y5HSv1Xq4v4hA3LKIauheeCYM/HmcAP35PR5R6ZrM1axh65Zgqa4B/+kAg==
X-Received: by 2002:a1c:48c1:: with SMTP id
	v184-v6mr6407169wma.26.1543596993060; 
	Fri, 30 Nov 2018 08:56:33 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e142sm3045911wmf.46.2018.11.30.08.56.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 08:56:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 16:56:30 +0000
Message-Id: <20181130165630.27415-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ltp: add missing patch Upstream-Status
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
X-List-Received-Date: Fri, 30 Nov 2018 16:56:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch b/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
index c4fd8d02238..140bfeb8794 100644
--- a/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] statx: fix compile errors
 struct statx is only defined in sys/stat.h when _GNU_SOURCE is defined.
 The testcases do define _GNU_SOURCE, but not the m4 struct check.
 
+Upstream-Status: Backport
 Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
 Acked-by: Cyril Hrubis <chrubis@suse.cz>
 ---
-- 
2.11.0


