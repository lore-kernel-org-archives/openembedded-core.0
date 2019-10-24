Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB7F97F9C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:34:44 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id m19so21592089otp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wKI1I/k+YC5A/OaYCOKFIlWYKyNyZft5ACgAKordUk4=;
	b=FTpsawAbjqwa5A4X/SVSjU1SGWMAkd+14lysSsVreF7Xd3kEjJ41aCf4EIvFas7HiJ
	3OkHEoqOHgLWvY400QgjYO42Q6RyOlRiavbl0ubjQxv7M7jzNnHc2zBAt4RCWNfWdJ5C
	w8B8hDlVbyqY2hdCYSolJ0VQKa7rmAD34Ck8LwYY+GmTRbaf6VX0eVqGEioNeH0AdXYk
	OYajTtQIzbZBS/1Z0pbpC/NOxBJd0vpq1/QAhwEZMpki5nTvc8l3BiC5884RVs1FNorH
	6BN5tTMNjWu5wOSQtaoAJa2Xir2FU6MWy6XRAVQY1KMrZoC4t5goTdk/t4c7JV9n4HMS
	ZFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wKI1I/k+YC5A/OaYCOKFIlWYKyNyZft5ACgAKordUk4=;
	b=pLbo5B7VNpEQJLGqyINlV/uP1cCHd8UBqOKc3oAqLGfkbhoZMnDwhRbXq23w8d6YXH
	F40b65A8qEUr9zvxjeU2TuAeFZV7/y9MOrWJFQtlvorBwKXA59A9h9Grl9uYrtEwGuUd
	RSWaTzU1q2oDxpoXC0Tsybm3skFQ4XBhpPKGTtgKR9H6NNNvvZ9Rk/Xhg1+AWqqMFXNF
	EUz+0+innfGMy9Dk3HCze5Pa8Csesg0gqyJrV7QjxEc6budWJk468hgkd4w3bCnRNzCq
	Czv+uBSqEmzPdFuKLhi1GNrE+g12PMqE7f1LElkDH6UqZQW1YyPetGZ5skbEiW/ec+9t
	IdyQ==
X-Gm-Message-State: APjAAAWchGX4sQWNA9RtKnLjehp2ywxhDBMLoj7XbRVUYcKjSttGF/uW
	2Gs+hf9LCWdO0gd66UwCkg7SVj1GE6M6Fw==
X-Google-Smtp-Source: APXvYqzidmn4HlluZuQpVgQ2oOKK7phyRwaKUq9UkDqelBPGIA1TDVKg+0e4mmD+5gzd99Iw3KaKNw==
X-Received: by 2002:a05:6830:4c1:: with SMTP id
	s1mr13695939otd.280.1571942085362; 
	Thu, 24 Oct 2019 11:34:45 -0700 (PDT)
Received: from alago.cortijodelrio.net
	(CableLink-189-218-29-211.Hosts.InterCable.net. [189.218.29.211])
	by smtp.googlemail.com with ESMTPSA id
	v132sm6817994oif.34.2019.10.24.11.34.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 11:34:44 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 13:34:26 -0500
Message-Id: <20191024183426.23676-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perf: Add /scripts to sources
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
X-List-Received-Date: Thu, 24 Oct 2019 18:34:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As of linux-next-20191022, we need bpf_helpers_doc.py in order to
build libbpf, which lives in /scripts. Otherwise, do_compile fails
with:
| /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0/scripts/bpf_helpers_doc.py: not found
| Makefile:184: recipe for target 'bpf_helper_defs.h' failed

See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
endian, tracing}.h into libbpf") from linux-next.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8201c0cb60..a463eebc52 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -113,6 +113,7 @@ PERF_SRC ?= "Makefile \
              tools/Makefile \
              tools/perf \
              tools/scripts \
+             scripts \
 "
 
 PERF_EXTRA_LDFLAGS = ""
-- 
2.20.1


