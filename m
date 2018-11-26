Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 23B756BF33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:47:13 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id n2so6354556pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ieJbvpMQZ1ue+PfVXZ9EExkrw54Iwo4k7NV7wRYa7Hw=;
	b=WcSxFnSIiiOa9GvK2dWkQLig6BXfiTi8uVPzgt0/s33sXw1XRW0yiE9hWigk/6zX3t
	gGXgNP8cRutm3fPvNV3T1z+wOvRcOdD5NV49F1PsESRZFq5FY2yGLPT9IZcygW8v49f2
	f7LiUT8IIgu23lUD6aUHMJ7tzYc2o/LGl4yiV6tO4HTyZOAWPJSPN3JrClDd0frz042s
	HjMsoiDIJ8bWXz2P42QabTrvU2ZFwQo56h7KJyZYK4ZKFnHoMqlkKC11KfxLxZUS0or9
	jXEvR2X27SN7wGesj+STOvDE6BM/P+BMcwc2XrAyLHARYqLXsXm/2PrRC0Nf5b6tYg3G
	jbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ieJbvpMQZ1ue+PfVXZ9EExkrw54Iwo4k7NV7wRYa7Hw=;
	b=rF5Yb9DWMnGFWYe0IG+pZqu7X52WhGPpPwtiNjo91a7+V26SuzHxbHJuxvFAMneK1o
	iy7k4rK01eD+0kixhV1ycpb8o6rFo0uTWwxIkDBRZfWpLgRWeM9UCXJWNT+s6rXiHdG4
	TC/h5StMp5JX9VNQRz2QSn3VzfqzMe5de64XH4zNKrMCkFLaOOzF4C/omEglC4D1sCzZ
	P2Tu60FG/dC6hzS55982mJ9SPyAhTPWif6FPjW5XIRvpo7laqDnGliYR2vc57SGZUBCN
	mPugeVApg0sZZ16LB2khIva21FgWZNBAs+GA+W157CQBeFppxCwjYvIG1oXq8t1AjJML
	fIUA==
X-Gm-Message-State: AGRZ1gJhHTdvF6jLn6AfG8SP1M8Rh+904b/BRXdcEaquzaj+bvw7qjam
	n9z7ZQfvn1aeunCc0HSdqsFR9cio
X-Google-Smtp-Source: AJdET5ePOlYpACj2etQLPFp8FfcGR0ftve+dYSNaLzvDqcFCjqXduCq088ArSRKcw84XCq8Rf+fJPg==
X-Received: by 2002:a62:1c7:: with SMTP id 190mr28655821pfb.46.1543247233780; 
	Mon, 26 Nov 2018 07:47:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com (174-24-96-92.clsp.qwest.net.
	[174.24.96.92])
	by smtp.gmail.com with ESMTPSA id g26sm843668pfh.61.2018.11.26.07.47.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Nov 2018 07:47:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2018 08:47:11 -0700
Message-Id: <1543247231-30096-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [sumo][PATCH] wireshark: 2.4.8 src moved to all-versions
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
X-List-Received-Date: Mon, 26 Nov 2018 15:47:13 -0000

update SRC_URI

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
index 7c81ad3..51a7aa8 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
 DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error"
 
-SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
+SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz"
 SRC_URI += "file://libgcrypt.patch"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.7.4


