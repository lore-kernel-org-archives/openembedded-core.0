Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id EFF016C248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:32:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o25so2129009wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K9jqhwX9wNpqL5pckBKCDUAWFOSGat/qCXO16LP4nvY=;
	b=H2ymWW7KniCL7qxPGh7r3AAEArC+yfEKf/XxzFSnAIJ9mD7bdzqUy2GvF4XeGWfjd3
	+wiOj9/JUpWF2qv+os9rFh0Qrhx2+mDA1Ccffugp6QCzjJrcPm/bCLz/wNTvtFR3DpPw
	s39gSW6VhDkSClkcpbkqTKEVYHqFZzfY+1ARd74CKeruGkfarX3H5UDB//wHR0e+Oibm
	LQKIBR2qnLV+wzq+VtDv5llJIW7U1u9btTOYl3x2vEb0CH5+5aeKhPgNWQ7s1+gpWUvi
	ZUj0HW9OUj2A9bmh7OX40rxwayncTgz/9NgVA3Z+1yvFpl4i8eUpIftpcsf+nBnleA/U
	AG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K9jqhwX9wNpqL5pckBKCDUAWFOSGat/qCXO16LP4nvY=;
	b=jMnk6RY2VRRC74107ZGVejgkJRn/Xkn2vkZ11gS8YqxPOxZwdxGaIFagYuyIR0T4wb
	9HBoNJIltgJfRyd7xZ74BIJatqfOnBf4YRJNc2HWxWVtJfePbSyJ5yMRDyuc87oFfQvH
	uBZxWdouhdFEvqnaIErclkjjoQXKqEr/QQVXwgSOxD+U9opmpDLgcrINrvHgZ0KAOw9C
	QpkSGxLIrVNWjlcv1qM7vRzyucRTBsdFq3MS1aH3N+vkbJFld5lEM5WcTvX3D3BUnx1J
	nMGlNF9INaoZoM53V0kDcQBHpBWQyhRDi2kYHSxEOispRCLb3Y3vsBQaJZiFPMGxs7wS
	axeg==
X-Gm-Message-State: APjAAAUQytg+RR2/srIx9MmQSaK3ZgZoPEWWjwC5xqmqB73AUGvC8EwL
	i8RatjZyekxHq0Smaiz5t2KKUFqh/xA=
X-Google-Smtp-Source: APXvYqywIy4xCt2NhPGub06lHdNFr7rRkaArgzVFCgZbnm1yBDdAGHennKbnZ6aaK4Kp2l66+C+UiA==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr2454261wmb.90.1553171524469; 
	Thu, 21 Mar 2019 05:32:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	132sm9454434wmd.27.2019.03.21.05.32.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:32:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:32:01 +0000
Message-Id: <20190321123201.3289-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libexif: disable documentation neatly
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
X-List-Received-Date: Thu, 21 Mar 2019 12:32:04 -0000

No need to sed the Makefile as we can just pass --disable-docs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libexif/libexif_0.6.21.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
index b550a1125c1..a6c9c647c89 100644
--- a/meta/recipes-support/libexif/libexif_0.6.21.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.21.bb
@@ -12,7 +12,4 @@ SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157
 
 inherit autotools gettext
 
-do_configure_append() {
-	sed -i s:doc\ binary:binary:g Makefile
-}
-
+EXTRA_OECONF += "--disable-docs"
-- 
2.11.0


