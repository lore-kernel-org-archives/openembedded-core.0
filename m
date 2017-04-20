Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id EEE3571C54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 00:47:39 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id h41so9587350ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 17:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aDvNurQzOVBNosZygSCsWOehZTK563mq17ubVdArT1M=;
	b=u9RTJDAWi4L6EmXltVv+KdxDWLZ3K9O4K+tUDyjncivy2OrPQG1laUVGlN5c9SZ4mi
	GPLQHvRi3cClzsc8mE9CyIa8hmcW35M1aJwVoqq2xe5WDzgdBJTNNVrpbYnuzjPi7rBk
	+Z/C8JV0eIku9f1kwxL82Ce4cORJCne7kEGAxfnq1w5PeKVHpLsQS72QGXH6ed4Kl1XZ
	Zkz1I1pzG33X1iEM7PIoXGbrBeeKyJkvmEpRedcrOxIqghbLa2bXBnWLfmMTJfBY4B5k
	krZ5zOqT5Pq2fKr3kxiHOOAka4E9tBSmv1ljvKkJ300BwX5uqdMDGVQdC4mbltFxouL6
	GzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aDvNurQzOVBNosZygSCsWOehZTK563mq17ubVdArT1M=;
	b=hvORX4MreHXOigT2FFq//vI9hzlMxxNk0ieM4PRf4Y9vIxCvSes0x2iUNKRyjsWZr/
	cbTlxC7ozNRBE7AkUPRUbIB6lx+ZjGcnej6Z2p38UMfVGMvmqDBaJMWA6fBtlLcUH254
	ilgcBKCJnIL5vNQomaGkNFBvoGxw5/OQXj8ZHlXclFrp1gAVr/Hbpv2pjjQpkjpXXuln
	lJREEWbtl8xwendFX7J2oEYSDiFyPBh4RHzbnQpn1OfkFAVr5Z2jZSe3nTdQ9KHNASo+
	AjUGG7m5dpgl41OVuiV2RTLgJGhjMvgkO53C4FWHY4Wz7zg8n0btJq8mT3Fs94oYHGps
	FRow==
X-Gm-Message-State: AN3rC/5m5jQfcHiHPWjVQ3AnENT5NjSeuRgGpoEocxNnJSPgWZOaqPck
	Y2Y94RZruZGMUg==
X-Received: by 10.99.56.84 with SMTP id h20mr5578405pgn.134.1492649260988;
	Wed, 19 Apr 2017 17:47:40 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q63sm6590197pfb.38.2017.04.19.17.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Apr 2017 17:47:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 17:47:34 -0700
Message-Id: <1492649254-29363-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: fix typo in CVE-2016-2147_2.patch Upstream-Status tag
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
X-List-Received-Date: Thu, 20 Apr 2017 00:47:40 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
index 1473d46..b8349c0 100644
--- a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
+++ b/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
@@ -4,7 +4,7 @@ Date: Fri, 11 Mar 2016 00:26:58 +0100
 Subject: [PATCH] udhcpc: fix a warning in debug code
 
 Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upsteam-Status: Backport
+Upstream-Status: Backport
 CVE: CVE-2016-2147 regression fix
 
 https://git.busybox.net/busybox/commit/?id=1b7c17
-- 
1.9.1


