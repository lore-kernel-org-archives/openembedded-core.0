Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD0178994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:26 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c14-v6so24276wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vrko4futcodzkIr0lVXz4bSf5XnJ6PcwkqfYJIpeAfo=;
	b=tPfrPM/0rtlPcBxk2QBOr5AYn0IJkvbgdANvaMkVp4ci2E7nPG+vDC2j21m8Clvn74
	xIHtmpUoSURYpJmkGbVih9MYkXxkfVGAU0eyeuVSg3UcKCbffnhdt8kuUsBOO7MxbhVJ
	gaCMGXzYKXV7q5YBDXJWIYHvtB0GlBDi8W8JOVd/JxV+TgTtgu1bIZmkW6wEFZiNG9oy
	3GDX389JYW1aNyyDmksrixyrEca3ymTBiNgfC0/YThgaiQTYYrYQVw55ZJQMWvcWJedh
	Md1jVs8QKuGvGjkYHz2h18l1Fvqief0RtyU/cpCf7lO6bA4GMdf/n1cvMEoZDHxt2ag3
	2rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vrko4futcodzkIr0lVXz4bSf5XnJ6PcwkqfYJIpeAfo=;
	b=LH/6AHh9xRhf6nnAs4CXHNZPEIXs05B8caCqdkr13JIH3wSLA636op9wZ5D8Ik0AGL
	8DqgiTlIESYiY7TCbiVgKb0yR5CK/vMltGm4+28R/dKVsjuzBD+MMIJir0YqmgqEXx5/
	RmlzNtp3Vk9F6rT9IvGHWSRdJxWuSJjvOQuA3o33/QfyXU5kbW2G5V02ERz0pM9vw/fV
	LuooJFO9mM5Ttil03M6oraFgeUMkkCCEb+JOt4qR3Rj573+AeFWqyQZxb+tdXH0+QBSs
	7epeHHMf46T6uRS+TjFN2N+7+WwagzDGG7hJlUPW9ngGfwRYssNwjWpoZRR1BVelAtDG
	44Ng==
X-Gm-Message-State: AOUpUlHv6fGYYogpL+6G+6SJGCkKHBYuB4h2o9Z1LgunYdyHdp+cY5q5
	43Q0DwhjAq0cey8EBEw2ZoxZhEdB
X-Google-Smtp-Source: AAOMgpcCjaNYkfBXlzNtQVJBKfh5v25ZWP4ntbTiwoePdtYtAV4ySJtQPezc0b0hHP/cxenIXLPs7Q==
X-Received: by 2002:a1c:2482:: with SMTP id
	k124-v6mr1718973wmk.87.1531845566717; 
	Tue, 17 Jul 2018 09:39:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:05 +0100
Message-Id: <20180717163910.3196-10-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 10/15] pciutils: upgrade 3.5.6 -> 3.6.1
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.5.6.bb => pciutils_3.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.6.bb => pciutils_3.6.1.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb b/meta/recipes-bsp/pciutils/pciutils_3.6.1.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.6.1.bb
index de974edcbd9..d71a29adc80 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.6.1.bb
@@ -11,8 +11,8 @@ DEPENDS = "zlib kmod"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[md5sum] = "8e52278399b7b35fcfc031bc05da80a8"
-SRC_URI[sha256sum] = "f346eeb90cce0910c05b877fe49eadc760fa084c0455fd313e39d4b2c2d4bb21"
+SRC_URI[md5sum] = "1adbcc258030ea92609100703f29c92c"
+SRC_URI[sha256sum] = "fcc0431cc951c3563f1e4f946d27c8e2161cfd81f25316e6bd783fa6118469e0"
 
 inherit multilib_header pkgconfig
 
-- 
2.11.0


