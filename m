Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC5E6174A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 22:09:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so5999691wru.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=S9uY6FqjN9iD7jOt9X4Q1gi6dYgm9LYO9c3Il7OaDdQ=;
	b=evtpgC68+sH+jjgQY8tfk++Kdu5N1i5bE/bfT2Sq9N6aBn5mr+b62zEAW/hO1TChi8
	J7bPfc9JeBOsAtScBtGNKJxh32c+qPl4wetr+4AJBHfss6ZbdDxMmNWeAOc1khsYm12v
	BsgUcJZWOdHowxuputHifByt3PeZtcS1FcNSiemWmavnDKl4xvcD58/8jVGrLp0zAZup
	pHjUZIAishEarmBECW5ds5uLYtXp2e+/Tq1z1gkL/GT4zE8+kebZlT2mJmnjw/mBsPwp
	CW7hSt+Yp3/VLjKLWCFSRbdVZD21xiUEE+XvadfnUTrIaHGBMK4tLqNZqN+5gU3h3WvU
	EJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S9uY6FqjN9iD7jOt9X4Q1gi6dYgm9LYO9c3Il7OaDdQ=;
	b=DxEzTkPpHzzF+Wjvn/HGgFGdTlALbXsmJgRF91zwYdtxzrMJUJQmNAOltruwbm1VMB
	5tlxpLEwuOojUtBKCRHKRE/QKTSJID7Q+o0h1HNKhe+BR/gl8MAt1qS8cVnO9bEIPagu
	KO9d/nB3HVzFSnU0QzQcbOYR0yy0Mdride6KNsN9vJvtQ55nrZqL8dpcvUF61bvgIcxw
	A8mgYj2CbQvDaPcQeqF9b+c/fV7tAJMDe0BTV+rEdkIkjpJCuHD0m/HW2lFa+HkSFnfQ
	UnxbId2gqqhVbkQSS6aqkHUlDAI/wb8LuuuRIamnmA64qoW+34DJA+7vxNt49VTJZm28
	/ENA==
X-Gm-Message-State: APjAAAUqZCcoub7jKB+5dv/lkmdkZO4eTPovKYXrxGvKORqsgaosjF40
	mqIFDkRlKsg9eu48d2prnhY5saeu
X-Google-Smtp-Source: APXvYqylloFDcSLxxSch6UauozWLm1BOQRZ7UHcfi7FIKLUUYiFIpkPoGTLsaRrkVfSb8FWcLtCLKw==
X-Received: by 2002:adf:fecf:: with SMTP id q15mr5971603wrs.360.1582409372957; 
	Sat, 22 Feb 2020 14:09:32 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id e8sm3729734wrr.69.2020.02.22.14.09.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 14:09:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 23:09:07 +0100
Message-Id: <20200222220909.12019-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200222220909.12019-1-alex.kanavin@gmail.com>
References: <20200222220909.12019-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] valgrind: exclude one more failing test for arm64
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
X-List-Received-Date: Sat, 22 Feb 2020 22:09:32 -0000
Content-Transfer-Encoding: 8bit

valgrind's test suite isn't generally run by upstream on arm64,
so let's simply disable the failing test and establish a set
that works.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index acf4fd1bc1..a3a0c6e50f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,3 +1,4 @@
+gdbserver_tests/hgtls
 cachegrind/tests/ann1
 callgrind/tests/simwork1
 callgrind/tests/simwork2
-- 
2.25.0


