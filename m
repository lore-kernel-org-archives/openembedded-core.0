Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D277606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 16:18:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b15-v6so11611476wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sXZ+DcCOZOEoq4lHrCeMW0H2o4qnbeh+p+CGr+9HsQA=;
	b=rfJRVsFaE0UbObN3rgq8rLp7UANDQgXucHLYvbgtIRfjbzdfFcFh5znT551BuNh20l
	2nFCejaJYkvKvPwQ61n70XTwzlZ2ym/P0ORByb8rjjm3N5T9EcE8MnBJUh49d+AFzCGL
	a69mPOz5igSSd5+fhHUMyJ7EOHbhDUNpO8/S3rTLNPJx8OHKWt2/KdMcEtrDbBwVViAf
	jALSkAqL1aO0Gu/D5zcVAAM4v3feX9NmvKoq6KcL0//xWDolgGQvzkfq6OX2Bnvwa+Pf
	Zj06UqDtUuTxRJtJifGwFD1djq9QGabAZu8ivgUdQzP9sDnpO9p6X3v5V4a+RJ36J/1B
	hDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sXZ+DcCOZOEoq4lHrCeMW0H2o4qnbeh+p+CGr+9HsQA=;
	b=QMjADXeBGEBMrc+j53lS/zZ0vOVx9GNNZfLKEk0Jlnq1gb9rheFlyZDwEWbCZJi0Yu
	a0cniYqv6eg45evEsBjU/2cHDrWdiPjs7Mnq37JIapOEJM87laLgjh4jZd1YAHgwPOBf
	XgXdStO9JK1T13j5a4rND7a4RTualm2THIOcU/eoWtZTEr8+lbzBmHS3k0WAhQKv3mVc
	M+APGaMlLUrZBapnthQp0YPcYqlnpsLxFE6+D8Th3BagE79nPHxtHDQSZmjBD/u2P+HM
	ff/0oA9VjuumLZI013EBgufGZv4eHM6VnfTUFeix9UY9xSr2+/bskKIrqLA2zuWT1wYM
	T5lg==
X-Gm-Message-State: APt69E1iXO7OFuZpOtAVons7ghf4HKL2NnVQyjskTfBoc1rlCEyaS6jY
	Ou4muAwkhZiRJBp09IzeJV9L5Ijh
X-Google-Smtp-Source: AAOMgpdo4K4He63zCwv5ocyej0i5WdMU6rd46ytDWeLpjbNXfHTuQ3N1oXi+D3cXxdCyO3bvN1/giw==
X-Received: by 2002:a5d:6250:: with SMTP id
	m16-v6mr16138226wrv.179.1531153128123; 
	Mon, 09 Jul 2018 09:18:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j77-v6sm18141512wmd.19.2018.07.09.09.18.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jul 2018 09:18:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 17:18:45 +0100
Message-Id: <20180709161845.9645-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: improve code style
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
X-List-Received-Date: Mon, 09 Jul 2018 16:18:49 -0000

Use elif for consistency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 4a54e9ee9dd..66c44e8bb23 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -52,7 +52,7 @@ def meson_cpu_family(var, d):
     arch = d.getVar(var)
     if arch == 'powerpc':
         return 'ppc'
-    if arch == 'mipsel':
+    elif arch == 'mipsel':
         return 'mips'
     elif re.match(r"i[3-6]86", arch):
         return "x86"
-- 
2.11.0


