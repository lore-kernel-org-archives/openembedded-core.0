Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4E769731C1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:45:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f206so1684491wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=qGnA3Reo/BZlE11fn3uWKhdd9x/XxElzzDqdZGmaY/I=;
	b=rS+MVQ3U4XbfH7W+WKVVjjx7ujuUHV22aybZpRq6T7gG6mV/gGp6Zv58gt/rXmTjjb
	KhJyM1GLp96Rbj3/zttska71x7pY6pa0fR2XXksAz9Un+mg70MRtNtTBYmClxiGZSsev
	ZH1SrB8P3dztHn/Z0JliY27nkG8s4ZQ4l4rtaxDR8P9tKWKdrEg+B3ajQKjp8Vh1ptl3
	GJzngziTaGTCRxY2h1QJhxXg9v2tFMOBuHUNt6XY5i4kIPNupGCfdlQ7glMNKdnRm6Ut
	6GNDBQ3GfQW1RtR+Dm+NGiufuw4s9h6FSO46LeAQfSUbXswwhLKeHKcOOykaZzcGKzPq
	vDvQ==
X-Received: by 10.28.178.138 with SMTP id b132mr93687960wmf.25.1451933152371; 
	Mon, 04 Jan 2016 10:45:52 -0800 (PST)
Received: from sgxcmp131.intra.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	id1sm86667735wjb.19.2016.01.04.10.45.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 10:45:51 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 19:45:49 +0100
Message-Id: <1451933149-4626-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.1.4
Subject: [oe][fido][PATCH] Corrects the URI of the openssl's recipe from fido. The sources were moved to a new subdirectory.
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
X-List-Received-Date: Mon, 04 Jan 2016 18:45:52 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index ba9bca6..a5b8ed3 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 DEPENDS = "perl-native-runtime"
 DEPENDS_append_class-target = " openssl-native"
 
-SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+SRC_URI = "http://www.openssl.org/source/old/1.0.2/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
 
-- 
2.1.4


