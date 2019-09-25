Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E2BC97E468
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:50:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l3so7297971wru.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pY0WRUGkec5g9AxaPYUF51kzN5m1nCdKO2WG4HX1ElY=;
	b=KF334vzwokrbQ6t2svETOyHnq+wAiEfXd4jQ8lb+Cxe0G0RUTxOKGTY63YnHRQoyGf
	3ns41n3T/vYA7GdMNBsmCQ6F45CyDP8ZrwuTeiQq/Ynpucct9/kpxHO9bE2ulkJtIGkJ
	3QCQQXtbWf6xNA3dBaUN8R/jnJOTRbV8Xcpi2Lt4wTyPz2JGCiRxE4OAKPLHjHf9DdsE
	hbmZiKkdLxldtlErq8ugLaer3Ktw3jsQB2afPWqjpZkK4PcD2ihW/RdjXXjFcKA2c7Vr
	2eCmIuNbPuaZUIHEhfq2GAe66apiPz7hfeMRK3Ylhp8q9JzVGR5P1a7npRuYjNEvwhbU
	Mk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pY0WRUGkec5g9AxaPYUF51kzN5m1nCdKO2WG4HX1ElY=;
	b=GacvxgPXyh5FjCXJVkc4zsS0kbhZzG9WuR4vYqm/1gmjqRjmBMTqoMj+/tI3xjack5
	KcmTA7dzxscROdlPg4hNAd9L+Gq3wEOvyMIRnsSc1Mz06wxIz/ZRahLS/awiKfqrfN2z
	5kK8Nty3K4y5W2su0hQw04XERXJOj/nlI/0B6YU5dHtolZc88KJ1GslsMi1QuMwQVEm4
	1NqOWeGyOpj+f3EaF0uzFZW5fjIvG1a+IBDNFTucyAoHAoNqMQN0MPKXRbSZkKRIxwI4
	nYUUWzyuswuBawvtoYCcTE0BFmCOeefukFgNbmke942VQzAA7Oksh0xBwABWIT2oFmaX
	AWIg==
X-Gm-Message-State: APjAAAWErulx3fRTID0WiCqbPOHk4Rrx5tOSCymBiptwtrBHkk8hEFz3
	bXGkh/rJUdGbjEnBNSotL+jdhF3pv9gnfA==
X-Google-Smtp-Source: APXvYqxZmS7kla5UOjDtef5QydRSTc7uRm+e9gUIFC/eSaYl8f2D0g4hqGIds0G/SidB9IjX+rEfIA==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr9071074wrq.139.1569423049426; 
	Wed, 25 Sep 2019 07:50:49 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it.
	[217.133.17.98])
	by smtp.gmail.com with ESMTPSA id d9sm8724443wrf.62.2019.09.25.07.50.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 07:50:48 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 16:49:34 +0200
Message-Id: <20190925144933.16030-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] bmap-tools: add missing python3-misc dependency
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
X-List-Received-Date: Wed, 25 Sep 2019 14:50:49 -0000
Content-Transfer-Encoding: 8bit

Add runtime dependency on python3-misc as bmaptool depends on ntpath.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 7c4db85b32..6be07d7f9c 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -17,7 +17,7 @@ PV .= "+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
+RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six python3-misc"
 
 inherit python3native
 inherit setuptools3
-- 
2.21.0


