Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 615797F8D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 16:23:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q13so17809568wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+aMFGmhNO1vqQ9cOE6SX7Z6pOx2jyormCNX0C6AXsUI=;
	b=JhMXzYfB0uJJtGzTUIzSoD/ThIENBw3khq0pFvOZoNES6Es/797o6ZAOJkax6NHUdF
	w+y6Ayaf+H005D7yrBiGOCT/joRkRGP5+8oThAkMSpu1bb+GukJWyfApH4CVuAVZzzHy
	+EXAukjOxBZIkkfdjv+qh/xD5av0rVZgRI8tLJMo8gLfnqFHZC4E6fbWWWukxm6/CqdE
	QuLM56aJYxyIXe93La0lYr4J3AgUThydSx2940k/w7lmBQM9nK6zFFhV0vJLeHkxxRAK
	SmgmVMFnz1VrtgkJDGvtr0/guGNoirp46UXvk281WUfS/HOk9mVeJyKVcVithr9HJsSi
	YHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+aMFGmhNO1vqQ9cOE6SX7Z6pOx2jyormCNX0C6AXsUI=;
	b=BHEZE+8vldXoJmjGELSUcrgGQfSyAc4fu2pL9FftAdAjI+7nTua6SO4PPbrVuoXub/
	9tkMMxyK0msPVll4ZVqvbJhFkXzUCf5MFCQdPcb0t5PFJ6O+DwI1onKYvj66yMOwhelc
	Znrc3q927kxcZ1+PwSjWxDP3hKr6rkCBD+0VvettzFlLuUxmM/wFEcZ6yO+7jq+VAkJS
	Srmd4P9Jw48wADy1KfUas2cYXfixkhOh6erwpO84rp/FYSX4hsWqlHTRdtm2+ym8neh+
	5ypY8we0QpRkadFdknRSpOaAlA0Bq98vnlJOYmiplRcEzQyffFBtjsKUHctevipqkAJj
	SqZQ==
X-Gm-Message-State: APjAAAWcItgLaMeAxaa438CjgZiVYbAhc03DCjR+yQBn8EJ+VLlrD5ja
	cKd+mTMPWE7xRNcCHQfPffKvvieHbqQ=
X-Google-Smtp-Source: APXvYqzmuz4ydJi9bqVd0ucd0IjRtMW5l0z/QvMFglYYtg56ZBCOqDbU8dxPfvTowtZ0LfdRUTIk6Q==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr7890711wrn.303.1572884632909; 
	Mon, 04 Nov 2019 08:23:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	16sm16708315wmj.48.2019.11.04.08.23.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 08:23:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 16:23:50 +0000
Message-Id: <20191104162350.30594-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libpam: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 04 Nov 2019 16:23:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pam/libpam_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index 6b73f0a2fed..a2aa1ecd16b 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -163,3 +163,5 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-pam/linux-pam/releases"
+
+CVE_PRODUCT = "linux-pam"
-- 
2.20.1


