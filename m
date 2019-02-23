Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id DB98E7CAAB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 17:08:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id i130so2558289pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OODrRMHtHPqEOukt+mttOX5bCMOf+96ljDdGV6m29s0=;
	b=CZQnInCDyMrmy7DByCBDm0KD3Hkbp9T2je45xbMD13RktFY8OqV8EoQgBWRHZoYO6b
	DwgEvsgM2c1KUZhIPQwEYMUiSfSc96MfJR1T3tlbzezb/A+x+IOpO6DUI0Msbq3JDtaW
	y0IEUP9EHas0CbBlulVBXFP9R3FsboqPezizcbL3UaYwIQQCydf5cR+EaRaPI4YGnBWZ
	k6OQl+Yr+KK82iwmwlP79Dhc7YCIpz6rdDQjPlh7xrMl1JwXI4Wvna3us43YEzEoYjaH
	DvrC0L9nQyV/l1Bn/NFMyRAqPlElKXovHlwxbHDxxKzE8TUn2k8YaBRB/i9IBb483ECB
	J5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OODrRMHtHPqEOukt+mttOX5bCMOf+96ljDdGV6m29s0=;
	b=n9N2OMXHKVQQuEz7Fx+PJdB0X93XeJ6bOkQg4GHqPe/uBiGbKNqa6BJoIlr2aDtey2
	iWagqvbv3YHxfMpWHW0esjzfbqCDDWCeDvpEIwE9oboy9SHQiqxFKaTXND5JqxdTx++u
	bmMmlKpYnuVOICPB43B9G4eHhem7a20DKaV45m5hOW9+5isbr0gfadsj6lafX12a9RJa
	/fNL4GEQhQY7K0OUEkA/g30DefCm/FO4roC5ob46/LjKH2jxI/g647u6KDQvE48IPwO1
	GNv1JU97QbCXX+XpRw3rnNZMkMCXKvuzmRfk5aA8cGjawMa+YwCy3o8xMJ44wPU1lTY1
	J3lA==
X-Gm-Message-State: AHQUAuaWV76xG6g6eIxTAP/Rlwv5jrA8GwE5/Ger7Oh7msVvZVMcA6sp
	tdU0YDY1Kgz/8szfw5GJQ24pB8Q+
X-Google-Smtp-Source: AHgI3IaErE+Jmw3a+fOsSslpxWX9S8150yU96ju13ZglcLUw0FspZ7FjP/UHzy5LaYKvkGiwByRjEA==
X-Received: by 2002:aa7:9090:: with SMTP id i16mr10009267pfa.85.1550941728269; 
	Sat, 23 Feb 2019 09:08:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1cf2])
	by smtp.gmail.com with ESMTPSA id
	f67sm12081540pfc.141.2019.02.23.09.08.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Feb 2019 09:08:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 09:08:35 -0800
Message-Id: <20190223170835.6169-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] musl: Update to latest beyond 1.21
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
X-List-Received-Date: Sat, 23 Feb 2019 17:08:48 -0000
Content-Transfer-Encoding: 8bit

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1691b23955590d1eb66a11158fdd91c86337e886..ad795d56ba3fb9d69f524ee676e3b1e2355cceb7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 73906d0f3c..f84c17d295 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1691b23955590d1eb66a11158fdd91c86337e886"
+SRCREV = "ad795d56ba3fb9d69f524ee676e3b1e2355cceb7"
 
 BASEVER = "1.1.21"
 
-- 
2.20.1


