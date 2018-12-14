Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 993E560069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:05:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z5so6112743wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VScN2MjNWrzW5iIBJb/pEjGk8zFsHvKr2+7GEm9SqZI=;
	b=ZyZLMGp/qW4NLdLAr0NmsGGtlM+2sanaVX6CFmAolL/m8u+bpzdjlgIaqfbVx4SoaB
	ooOMoe2agtleIhC2D/2WmEoWfHXWMdR2pcx8WgcXFFjIyK7pMPOsmL+0iIFjPcz3hL8i
	M24Uf7aK4Aglx26tnBXElGaKQULao4tjs5Oyccv3ToqxmgaQdJBb0dbftlKYGdwlMej1
	3YwEmIHnlYdDEBCTeAJLbc44xDh8B3KOEK85oxUMXoMf37Xna/c8ZU5kFZykoA1BBMW2
	0uW4/s4aJAm8j12x6uAHvmpFO+lPGnRsU5PcHV+IZhZG346k8Fn1LAGu5Vaqh9oVbljc
	I5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VScN2MjNWrzW5iIBJb/pEjGk8zFsHvKr2+7GEm9SqZI=;
	b=Vim/bJIaGzbEeYq53uVhHRwA9fPZNUT4Odoqo19oezpc/3koH/Npb0zLCAiKmQ/sLU
	jm590q2U4nM+l2s58KE/SfYPmi2t01k98860qo1HzjpcagWFieiBAp7jeRsIn58htTH+
	+17pQ/cFOzU4lWNYM3/kGjWDudcFO9AK5prBV5qpvcDXJdCTQoSygUw58n6hP9ceubuy
	IIrAfijp/BraepkyFa4XunUyQ9OO3ARqZuOnlYqw5+vxRXNOEUVElHPS8Xb8yz7ZkSxa
	RVRVMlSal3t9RCsp6wQxz4c9gmIzWuDvWHhujn0rl423uQoS+LJsyQyCdnLFnZMOxswu
	cyIQ==
X-Gm-Message-State: AA+aEWazx2pnrnuQVgJQMCjmYCeHZoVoIGwAYSPNe32YoN1GVm8t1c1Z
	CBopNsMlrW6g1V12pvGvks0w1Sta/NY=
X-Google-Smtp-Source: AFSGD/XfXVF/yi+b7AUihL48VDhyrNSWM6lVM1zh3K5kgMj5CZ3R5fM4XXui3+NMM2iP8wBtFQq9TA==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr3464219wrt.141.1544807128508; 
	Fri, 14 Dec 2018 09:05:28 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n9sm3917188wrx.80.2018.12.14.09.05.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:05:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:05:25 +0000
Message-Id: <20181214170525.30419-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Revert "popt: update SRC_URI"
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
X-List-Received-Date: Fri, 14 Dec 2018 17:05:29 -0000

Go back to use rpm5.org, as it's the canonical host for popt.  The host is back up now.

This reverts commit 347ee336dcc94e6fa4e4788117013615b90abd70.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 377d1084495..478288f9bf2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "https://fossies.org/linux/misc/popt-${PV}.tar.gz \
+SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.11.0


