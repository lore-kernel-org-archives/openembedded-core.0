Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id EE88A6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 22:12:59 +0000 (UTC)
Received: by lfs39 with SMTP id 39so121591579lfs.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 14:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3coN6NwzTD1z4DHmsqvVtcG354KTOCjt+BKRRVyu2A8=;
	b=JwD4taQEi6/0iogv9Oivx0tFdMdGVzQOdYWdAToPWfMBPEnwvJxtgJxK8GfA6fpinr
	Y1SECmVBUSbn1ZLqykF1cXu3os+gzB0fnbmxd+8yHiYJ/ETMqhn9IIrOAz4Xkz5txEZu
	zTRj9NcuqajQru48wFA2GGMNCL57QGXkeePRmPIuY4oINOmVL6P++QMhuEkCPKYE3ro+
	cgPbVPbbTfMz7htGrovSHKpk2q9AHh7OZ31Lav4chdBk8a4X0PKP1y5CV4olzrBOHmwB
	DrC9Bdjcw9cC29L/9FVZI+/x3GGPiUzhihDRekqawt1gDTBuPYEoQXWDnmbytlm/eSV6
	nMVA==
X-Received: by 10.112.157.36 with SMTP id wj4mr11575826lbb.100.1448316779504; 
	Mon, 23 Nov 2015 14:12:59 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	mp1sm2093494lbb.43.2015.11.23.14.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 14:12:59 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 23:12:38 +0100
Message-Id: <1448316758-7954-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] initscripts: hide the error in case system is not writeable
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
X-List-Received-Date: Mon, 23 Nov 2015 22:13:05 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To avoid reporting errors for /etc/timestamp is not writeable in a
readonly system.

Reported-by: Niklas Soderlund <niklas.soderlund@external.atlascopco.com>
Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index b038fc5..1632a5f 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -10,4 +10,4 @@
 ### END INIT INFO
 
 # Update the timestamp
-date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
+date -u +%4Y%2m%2d%2H%2M%2S 2>/dev/null > /etc/timestamp
-- 
1.9.1


