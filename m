Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 60A3661FE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:02:21 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id d13so2063516wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rXpE/pitifQbwpCttmCVWc5cqRm0GcxNZdzUg+4h0AE=;
	b=YdI5Mjfr9YDxZZi9pwKGlpn7U0/QCTZjuAfCcx3PH9Yxq4SLJ5iw+w6cnTlQMAs6D3
	+ItghNDDEJNUyv5iVKj1KVE0kjnVK88ObzbXB+ty9GJqQlwZDvoF+VoGPAEk2g8+ff8M
	xgy8HC9I7qwIIbPRHeXdKwWnpycYNIAdNRxkAMKK3+VcrgYdSO5KRuhn0Y+RMqZkk0Tj
	PVlh/p14oPiVifM4oIJJi9en7KhEwQXdEnQHAl0Pgkkrrbri3RXa0sCBq6qwUrEbTyDg
	NiOfHw082knhLOQh4BieTvdCNGtfxmg1xt4GZfsJ1ft+lSj6T6jsXM+BsSBsClhE/j4b
	eWgw==
X-Gm-Message-State: ALoCoQkhFca8DCrEZ6maqMip0E9Whj+G23WGqeSis0X+M5IUPbkhwCzoHPiPiA7QIdWXzLaK3Ahs
X-Received: by 10.180.108.132 with SMTP id hk4mr2321468wib.12.1389697341786;
	Tue, 14 Jan 2014 03:02:21 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ey3sm22618655wib.4.2014.01.14.03.02.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 03:02:21 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 12:00:45 +0100
Message-Id: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/5] lz4: add r112
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
X-List-Received-Date: Tue, 14 Jan 2014 11:02:22 -0000

lz4-native is needed for kernels using lz4 compression, which was merged in 3.11.

Lz4 has a similar compression rate to lzo but decompresses a lot (>4x) faster.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/lz4/lz4_svn.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-support/lz4/lz4_svn.bb

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
new file mode 100644
index 0000000..41464e2
--- /dev/null
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Extremely Fast Compression algorithm"
+DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
+
+# Upstream names releases after SVN revs
+SRCREV = "112"
+PV = "r${SRCREV}"
+
+SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
+
+S = "${WORKDIR}/trunk"
+
+EXTRA_OEMAKE = "PREFIX=${prefix} CC=${TARGET_PREFIX}gcc DESTDIR=${D}"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
1.8.4.2


