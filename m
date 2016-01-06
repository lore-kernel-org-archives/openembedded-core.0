Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A66BB6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 09:22:52 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l65so52198354wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HwAcFEeVoTEnz/C+/to3lD3t3NpNr6qFHRpTtWOn1ZE=;
	b=r4E6grA6J8SUcUtiL1bcxqJ6a0K0kUxdFeOx4Z8DARv4zLyxKvLaiWMaMo7JzlxM4C
	iCjFJgs7OG4gs0ZIYB6LlLItC4VHDpTIqbpahvq/lgG6NUiYh6uJF6eq2LgcV6IWhJyg
	h98RFK09jbSprHRq4Fy5PpFK1KivcqtJ30RAxy2kmb8F6c7TwldycRylCZE9YdlmZjUk
	aUms1U81PJcNCeS71I1FDPfyKk8SDALo9kgzDIN0hLcxq8C5byhv1OhCjmMXOzyNL/iL
	3tsCtYT648RV6M6omhmOuy6qmZRmCyeFdWRCgVtGrzgePdtVTwv5FY71X9LtJ3x1aE7O
	pGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HwAcFEeVoTEnz/C+/to3lD3t3NpNr6qFHRpTtWOn1ZE=;
	b=Lm7DHuf7BcI2xhJ1eLRi23EGxOb9mu4RN3J5FwRXUffQDQQYVhd0t1SdkaLXiRtVCX
	6k7CNMQkKvP67MGs06XwAo97Jy3gcsM83FdCwMNG2ruwra8BfGQv2txT8Rr0Y5d3EQYb
	lkfZVdUIiixNh9yjzv6blh/LUZxsvLbY+TmtmsbIk5i2rDdWSQ9B3QKuABIZMY5uc/lB
	GeDGLw0D0/8cU41z6ZioSF+wlw3pL6QSttWTWe2fJMghv9V05o1onc7oAUBzKU0kNbLN
	ob70C7Xwt3BqNuQyGSmjcj8y+QbahDR/JO74iSWD3Q+GMdcAxGhCUd3hl3ZFHpLdvllE
	D6AQ==
X-Gm-Message-State: ALoCoQlZu3cx2jweX1M0MwFmA/sgVyjSnNda7OOwT8xpTD3D9qJVCLmcO1Y1qJHCp1eDqDDNAXer5vEdD2uvlq9FOlWrr8xewA==
X-Received: by 10.28.178.206 with SMTP id b197mr8631018wmf.20.1452072172632;
	Wed, 06 Jan 2016 01:22:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	qs1sm34443596wjc.2.2016.01.06.01.22.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 01:22:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 09:22:49 +0000
Message-Id: <1452072169-1415-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] systemd: enable compatibility libraries by default
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
X-List-Received-Date: Wed, 06 Jan 2016 09:22:52 -0000

Too many packages haven't been updated to use the new systemd library names, so
enable the compatibility libraries by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_228.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 6673042..19b7b42 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -59,7 +59,7 @@ LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz ldconfig \
+PACKAGECONFIG ??= "compat xz ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-- 
2.6.4


