Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBDC7D106
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 21:50:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y197so8473820wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bz6ixCE1abzyPuh7XCcH1gdMFQXTr1+NvBdD3N0+LJg=;
	b=KB8fVmeX8pbyCeNClqC5wtdKkNIeQct6zMZfqdLTalYFMF3OQhCZwgNe/4VWXD86+T
	f1TkZKVtV/IKGAVtEqXNOGuyDKDmotpMLfOCCjG15IEfse5NuMVOXdiNgHb/1RW99jcS
	nU7us3LnHoZRddBtjfJI32723auPd2D4qzBCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bz6ixCE1abzyPuh7XCcH1gdMFQXTr1+NvBdD3N0+LJg=;
	b=g/9qC/DeA0acw9xNRfqCNuXd2wmq/FAmeSAhWvf7mEKXarrUrufrcUzXKHZjVaMaB0
	NNYIa5XpBHrV/SO/gbcDFsimcvlqdb/6o0ZXMXmA94A39k+L0HxdKP9yufFA9WVU2WPD
	+Q7ICJSKWYJj0UWJ1D8fKyRxUw9PlABP56VcWhUtuht+vBQ+VicjlYZs50NR7rkUXFdY
	AvpRBR4K3acjet+0my3UFB6kb0Ix+hIwDqBVDLruvl0T0L6asb3VECoioYhBfyt1j0w/
	JQ6/EiCqCWib3l/ihZPKlrQ+E2bwbLSMLVVpoRaPBY9bYtjj0eylmXEG9itZkxcOjwc8
	iY+g==
X-Gm-Message-State: APjAAAXWCsqXBG0AkPEo0FjIdzSScieFvwFakRj0KNyviVYyUjKyNpx3
	WYg8IMx+WDUVYn5CYTsi4MhTSYiOBi0=
X-Google-Smtp-Source: APXvYqwo4I+UDlRIgwBm5ap1hV2EqaIaCqYAalklnl6QEyBszgSnMzT2dGGZzfoxGWAFvtWhEwWKtQ==
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr7642563wma.99.1555019416692; 
	Thu, 11 Apr 2019 14:50:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x5sm4657974wmi.37.2019.04.11.14.50.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 14:50:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 22:50:15 +0100
Message-Id: <20190411215015.1775-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: Skip slow ptest tests
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
X-List-Received-Date: Thu, 11 Apr 2019 21:50:16 -0000
Content-Transfer-Encoding: 8bit

The slow tests run unreliably with our current setup/infrsstructure/timeouts.

There are only five slow ones and having the other ~250 run reliably without timeouts
is the priority right now. We can revisit the slow tests at some later date if wanted.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index ef10b08bc86..c97c0377e9c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 cd ./test
-./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.20.1


