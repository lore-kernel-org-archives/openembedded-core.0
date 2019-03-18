Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id EF1DE7C752
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:58:12 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id r124so11816030pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BaBKkh0491x035BWDCm9hg1xGnf9wBdaKzVWCLYvDHs=;
	b=ertmF8hk3IhfJJQPvUgf5GmzmGjqufEt0jftk1qilwOMEgklKEI+Q7ZVEZK99W7UCe
	fGxzydVx30JPJHxqfxBDD/EY40gVroDYJhYYjha4UNiFBVpkCkn0MQpI8d1XL6vK3+AG
	qZ67aSH8V80ZLAUZh4lsTpIBfdhAFYAYJoIhN/hCaGb9TF9dU0n7S95/UUYxViAOa4Y9
	yojiMVmYGBXVay7cRdxEajo8BQvxmIkEhBrn92AaWJI0sdjdupjs4Pe8O/5oruHPo5Cf
	ijol0h2YC9Zysb56rsNs8pF7GdLslDQG9+Ln/WFeGcbVsX0ry1ImYBbz/jOPQ+cr6YfL
	9SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BaBKkh0491x035BWDCm9hg1xGnf9wBdaKzVWCLYvDHs=;
	b=CJVG6D6UJilGvBjD7fVsvYKfc7CSwaotLFqlCAHVhnhSCXOFKQBgyMLLplXmoUeTxG
	cVlN/PyMQNBhamX3Wv1L/WwZuvng4V+1RdNVu/wG6hXrVwHAeDUrCjRyrS4k/O4URG3b
	HzoyEIDohgIETYi84oiO1BaB92f5JrIPB6gtDDZwuhyqAb/zYARGotdVErfU+bNwleJF
	X84xHHFJ2j8sPD05tNFmZQ26xvhVw2Wygxxt+K+ZHd33IClY4Hqo/lsOXtUX6X6h+GvR
	2r0GQ3nZlzeSCjCFMiuHSdGj+g6iJprhcapTztcYxbSzjTBM2PsU3A0lP3womZURPUx7
	0cxA==
X-Gm-Message-State: APjAAAWEGBGt7WP4mGk+biSODP9PZwy+yzNWckDPy0iKqKa+kPqH4jGY
	X7p5x2z9lGpRaBD+Rf67hN9xc/mm
X-Google-Smtp-Source: APXvYqzlXKuMvB00K25oZ67oqijhuBkWN1X/j6s+FBnWW8jPWc1YKNlwtSoV5tGKKMP6GgZ4B0UdwA==
X-Received: by 2002:a63:6e4c:: with SMTP id j73mr11726471pgc.276.1552928293809;
	Mon, 18 Mar 2019 09:58:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	n82sm4595910pfi.63.2019.03.18.09.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 09:58:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 09:58:02 -0700
Message-Id: <20190318165803.10375-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190318165803.10375-1-raj.khem@gmail.com>
References: <20190318165803.10375-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-core-tools-profile: Do not remove lttng-ust for musl and risc-v
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
X-List-Received-Date: Mon, 18 Mar 2019 16:58:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb           | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 762c046636..3d8e0c2ed7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -39,16 +39,13 @@ SYSTEMTAP_riscv64 = ""
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-musl = ""
 LTTNGUST_arc = ""
-LTTNGUST_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_libc-musl = ""
 LTTNGTOOLS_arc = ""
-LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_arc = ""
-LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
 
-- 
2.21.0


