Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9207C930
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 07:04:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e17so5442215pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 23:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gKwwwzepB9yb2+nTBwSbc39tszyjYxgYBpYZ2V5jLGw=;
	b=ApohJtNbl+LQ6yiJLyibB4kYbbFqaNu7fsVoE754cg6tXqo38UKc9f/9gCosJpTxzD
	Gn0E3OCtQq/6syhCd6FemXf/jue411JVdyaWck/HrwNq8yI67x6uINMC80knxWpk/B5h
	8nEPyEYM5CUf7Crct53m1ptr0Gc3W+rVc8qwoIYuQpXb+fEUyJXdY116BuZjCfGz+mM/
	JuWeZrmbi2xhDiKHKWJBYjIQ7c814L87TYgLpCr5laOs2qJEREq+8nbYFrGDztPw8gN3
	XSh/RsFzD2hvgQF8IZjHD/l4jWgMXr8MmRv9obPD4g4T50xLBe3EsBPVpVBsBU2HOyAP
	a1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gKwwwzepB9yb2+nTBwSbc39tszyjYxgYBpYZ2V5jLGw=;
	b=SBi1mqA5wdWWys70IKLeMm9rhcHVBmH+lhaJDGppR+0VqZS1WuqFAKuqGRVHwyz3cl
	sVDKQ3CvaqWqHfM/vIWzxIbKG4HcFGYrbFOlsegkhoAAUYoSvBAo55d8hPt+9XeO81RL
	aD2bqQkQRt1B5jQE9JWjvxVw440n4OuMoBL1PQS8n3drAFMt23Vz9xxtHaXtz33uzHD/
	u1MqSa5k22Ey4OW1q9Vx/YZYVWwl4v+Xt0tY7Wx5ykw1hMihzn5ARgidBDkBHsmyqxG2
	uFGqYncPpZ7C99RB2s1OTyfezpKJ0AeE4tyCV0WNCgDGR+dy3BSlnL9Qks6KVUjlzg0T
	W0Rw==
X-Gm-Message-State: AHQUAuZq3MIDu38KONoh0Vg0TrbZ3Kuw3XdZ1BGdrWmQV2hn5DcBd2NH
	1eKAsYD9gZbukbUcdh5uBSEOAjgO
X-Google-Smtp-Source: AHgI3IauZTsZAwc7HMfb07bFcrYZLQpYw8Ysl1NfjozPsPcdqVz9A3ksUnTuoa22BZoDm/cPhxgiKw==
X-Received: by 2002:a63:3446:: with SMTP id b67mr1597407pga.122.1551251070923; 
	Tue, 26 Feb 2019 23:04:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	n1sm36678995pfi.123.2019.02.26.23.04.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 23:04:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 23:04:20 -0800
Message-Id: <20190227070420.36624-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: Use -Og in DEBUG_OPTIMIZATION
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
X-List-Received-Date: Wed, 27 Feb 2019 07:04:30 -0000
Content-Transfer-Encoding: 8bit

-Og is for optimized debugging experience.
this makes this consistent across different compilers especially gcc and
clang, -O in clang is equal to -O2 where as in gcc its similar to -O1
so it was not giving consistent debugging experience across compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c5369ec98..758e89f126 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -610,7 +610,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
+DEBUG_OPTIMIZATION = "-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
 BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
-- 
2.21.0


