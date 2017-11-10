Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0E7E78672
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 15:55:13 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y42so9009519wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 07:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=N87awrPG5eA4LC+EW+35mvv6tOAiw4+xMD89Qb9ryOY=;
	b=ZpoCUbzixWrPLqCx+CA92BuuSQ+khseQG/zhFsgLQGXXT06xt6loKDOsQAyuztTi+W
	z0gQr2gs7uJC1705rTq/rZPZ+N37CTUJzQsKdVOFtXvD+QugEdiaQGkzRAxAXl9/Kkf9
	stMxFyG3MbdAoflwXQNEFOBBq6qiyfq2bM123jlfQKqExkIQP9042RKI68b9LnLXtSdo
	2GaZYTHr316/pomPC7ffbNtvHmm2fUT2OCb5uPmnDp9cKQ53OlA6YiDDJBwQLAnoLYEQ
	irp1kGPmIbrSFLnDB09zY59zLric+HLdqKCkeulNQv9JUtu6eUsYchqjAWVSmRG8OeOn
	HUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=N87awrPG5eA4LC+EW+35mvv6tOAiw4+xMD89Qb9ryOY=;
	b=rh2qxVBpbfiH3d12H2pE5nuXv8fdpJuM2C9So4Mhkm71OHUQS7Jse6/9GdP8kr5HSM
	601/d3LWRefQbXGLhMaBsLgTkZGMy3rL1iDXEWSTJ/I1/1p/C1xHJgCwFasrr9bMwIOt
	JtcYSAd6qE1ut9EaG1+tAdadlJZK4Adr7PtNpfI5aEfIGMaSbOw/QR5/aSJdQXhqcub1
	o9VVjW4jOd6EZUKCCdLxXiYhdJvQm8UFTAP5zzjor4y2ihZIpHO7CQa0eg4TM8mjOKZN
	LoM4fiwYww/xh9ZUxNUkqxuDcypgJF29FeS2uuqJQyo5KbDVKbVQj56NUEc+VJzWuOr0
	cAig==
X-Gm-Message-State: AJaThX517cW07aiyAg0eCb5tDbmZ4PRS3nIjEXq70F6tzUlhqTm/B9E9
	Pzu1LP0uSOR6aznIVEMPzmQXJe2R
X-Google-Smtp-Source: AGs4zMYXN136EmSHjYhhDLwAbFJax8H8s/v4b3zD1bFfvWjVkPkpSiqS03cPGJ+eYDrO3Lzb083ZWQ==
X-Received: by 10.223.179.26 with SMTP id j26mr759306wrd.123.1510329314264;
	Fri, 10 Nov 2017 07:55:14 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o8sm26095069wrc.10.2017.11.10.07.55.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 07:55:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 15:55:09 +0000
Message-Id: <20171110155510.26427-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] packagegroup-base: remove hostap-utils from wifi support
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
X-List-Received-Date: Fri, 10 Nov 2017 15:55:14 -0000

hostap-utils is the userspace part of the Intersil Prism2/2.5/3 wifi driver,
which is a decade old and obsolete.  Stop pulling it into all images via the
base packagegroup, BSPs which still need this driver can do that themselves.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index f9e6e2edd87..313628e6c79 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -292,8 +292,6 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
     ${VIRTUAL-RUNTIME_wireless-tools} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
     wpa-supplicant"
 
 RRECOMMENDS_packagegroup-base-wifi = "\
-- 
2.11.0


