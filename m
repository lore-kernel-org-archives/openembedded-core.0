Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7DD6AC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:51:05 +0000 (UTC)
Received: by igrv9 with SMTP id v9so125341520igr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3ZgMKVbWq7TKDoTPVRJwHFlIJq/WKTKzoTdkHhYHF1I=;
	b=I8MX3nH/rej4YGWZ72vToUQkdRtGIj7pA8CuVVa4GyuQTRdoug0ybZTQly53r7EveH
	47P0T4ZMg5O9JcO07SGCTGZCdyvD1JY8dvhDUosFSu636ihxsoO5L9jE5AlQP3N1Hn8l
	IM6IU9ML6rEuDUwEGKSm5vaEfB3bTy40ySF74wpf1x5v0UXoGn6CyvLGzZ6Y0yqm2Ob7
	6TqXJ43v4mz0EH+WccK4eymB25FjvcKESUbdsk+allGckG6zqJ5pUX7kzqMZRRgSxX49
	qSlfUswwpAAquijwew6Ilr0d6XfwT2pgejEYaFIB6yYuSXfjUYEu/qz3/4P2/Y1f/7T/
	ACCQ==
X-Received: by 10.50.97.33 with SMTP id dx1mr70170183igb.1.1436215866327;
	Mon, 06 Jul 2015 13:51:06 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.51.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:51:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:10 -0700
Message-Id: <1436215810-23722-14-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 13/13] libffi: fix typo in fix-libffi.la-location.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:51:06 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch b/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
index 0a49ab5..775bffc 100644
--- a/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
+++ b/meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
@@ -1,5 +1,5 @@
 
-Upstream-Status: Inaproppriate
+Upstream-Status: Inappropriate
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-- 
1.9.1


