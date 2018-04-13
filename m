Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A08507462A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 14:38:29 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id q13so5300054wre.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=U+JcLyqmTuLG9qA9owQTl9Sv0wnVhu84V5bt2k8VdBw=;
	b=K7rXYQGJ/uTEDccs2bpZOzUNjA8Di6rBW9JCfkE9s3BFvFeE5d7oIctVUOEhGiQ2w1
	vy0ahdXZaBA7c6F3SJpvCvLtBzfL+dn9Zw4kr7W2NvYdLDYH3FUDCZBxiQBH+e5H/I1L
	P0UvBYqNtyEdMFRv0fYNhiemUCbbDLptiGxIpJ4ZH6sAIYrxWpplOT6L4qPVOPaK5sVF
	7Wuhv8XIEZ6SxMgGqRSnsCIuOCm/0awvBn1JCJIKanhr2vmIwu36aKRJQ8VV6/3pfaa7
	m+1PPXEOx8nl2G8ej4JX3q/gCv+ORodxGvL8d0bpeTacRgn2CFZOSm41Cl6BHyPB9ud7
	PHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U+JcLyqmTuLG9qA9owQTl9Sv0wnVhu84V5bt2k8VdBw=;
	b=WK/bK1C9BG5i1TvWzNE1BbwNc2fV52uHWuRFiz5WN3xgQ4hMHOAKc/6Fl22HNxPbVr
	4D+289G5WlzkTmm1fMvZdSvTkBxdiPkzatZ1g+wLgJ3cqROcI9fr6j/XTz5pOAy0hnVL
	4Oybu2eXbmsqgSu+pPYBM1b4S525boUOGP85E9Z9iaGQ0ZmFBbkvGq3P3ly1NOaWe/mz
	ptPxpDaA2BMUxcqTtbsAb2lkgIslJlFnbee5TrXpXQ7IB7eKFJTdklK1WqXLiqqKNd1F
	Gw+VGrU0ZjY7kLc5hX7SNLRm4pfS9A603k4AijQbGSN2Ycy5vXKcef871izw0G3Vp+Ut
	3SxA==
X-Gm-Message-State: ALQs6tCztjxS1axsAplJjjT72TwopLIjUHaJ35LPaKIvSaqt6KqWHFtf
	p5FNaivSmHSxRg8xeNjz80wou7je
X-Google-Smtp-Source: AIpwx49pahUiKMbhEL5ww+d3yGfk4lJOIxwyeiNQ/6Y835yX0SK77AogzV9ixaxVP5oIszB1c5MB3w==
X-Received: by 10.223.185.21 with SMTP id k21mr4089232wrf.116.1523630309858;
	Fri, 13 Apr 2018 07:38:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w69sm6221601wrb.94.2018.04.13.07.38.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 07:38:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 15:38:26 +0100
Message-Id: <20180413143826.4564-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] packagegroup-core-tools-profile: include systemtap on MIPS and aarch64
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
X-List-Received-Date: Fri, 13 Apr 2018 14:38:30 -0000

Modern systemtap builds fine for MIPS and aarch64, so don't exclude it from this
packagegroup.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 554f5298890..fa0e363d863 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -33,9 +33,7 @@ PERF_libc-musl = ""
 # systemtap needs elfutils which is not fully buildable on some arches/libcs
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-musl = ""
-SYSTEMTAP_mipsarch = ""
 SYSTEMTAP_nios2 = ""
-SYSTEMTAP_aarch64 = ""
 
 # lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
-- 
2.11.0


