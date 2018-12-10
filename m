Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id E765B6C4BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 17:11:51 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j10so11280562wru.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mvGNap8dnI1JLDffeDhu79eFrts++B+nvimGhQTtvHY=;
	b=JeQgmhCXZ8vXtW1R+QdfI46wi1Er0GCXX4QwhbOZoQtTX/hAbXWCmPuQLC4PIkYY/f
	sL50hB3bTeU3xtZ6dNTaW1cUR+HfS8kfYvGMZCvgAuiWHuqOhGTlydVL6ZMy2uN0zCgW
	JuyQIPe2r/0iDcFuRp4uLNsFnm+HOsUjCVcYpH8mQPab7qNXK2YuvBw/DyYyPSsMj4bx
	hRb9w5tIemWWPmMV71LpULeo+qew9iQxZalM4kbNNnCOsVB4EsvIP0Q/ORKil0UBtg1W
	Yy4ATy7EUkvxXwc+ZHyOY0MBxBtJ26sDWX9wO1dvePO/nA4FFBuxC/lUhw7U/gE1b2UR
	0jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mvGNap8dnI1JLDffeDhu79eFrts++B+nvimGhQTtvHY=;
	b=gKB38YduGcoV3LAWQH+tqlKns7GW83uYbnhY7iwUiL2JYtivhpnL3r8X4J+Mmg9f/t
	+ddZkcLCXPtZoyD8k3BGEP3m1nPfLJ02CVW+oUW9HRS76V5KfQJ40/zqeGeJRgRDlTMn
	fsS7RH626oCV4Xkamylnwx8EfvOKM2C7SWqgKNUSTSUlN45PVl4QWyaGrHNJI7NvSJpM
	yFHDd9aBapzZrXnQDuNNtpBRJZw6NBfqhyu7+syzyhYPIJJxdi8tdkSTN3bNiaXe2kKD
	d7Ekp43cW+ar/vawv15W3NHnwNSFxVdx7Qz+/TbRsmDOeVOSn/YPIJOjVJwf40HtYaag
	r/mg==
X-Gm-Message-State: AA+aEWadPl4HTkWTZJNU5s14t1s42Eh8dQZfGfAQxuDJ4UFTITNdtstn
	qbZbYsLbNzWKbw1nuPizc1kr4JWr1d8=
X-Google-Smtp-Source: AFSGD/VfIqZdOtY+Yoh5Pd/yaajKurKt9gwOLyiOEdafqY1zY0oeXfX9UZor67LWF06fsUbBWiBCXg==
X-Received: by 2002:adf:c612:: with SMTP id n18mr10115860wrg.174.1544461912084;
	Mon, 10 Dec 2018 09:11:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y13sm12343505wrn.73.2018.12.10.09.11.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:11:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 17:11:38 +0000
Message-Id: <20181210171141.10722-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] nss: fix Upstream-Status format
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
X-List-Received-Date: Mon, 10 Dec 2018 17:11:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
index 7ba8d16483a..bb1c6e3b345 100644
--- a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
+++ b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
@@ -2,7 +2,7 @@ Subject: [PATCH] Fix SHA_HTONL bug for arm 32be.
 
 In arm 32be, there is no need to reverse the host value.
 
-Upstream Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
-- 
2.11.0


