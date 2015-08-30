Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 86A0376DD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:21:58 +0000 (UTC)
Received: by pabpg12 with SMTP id pg12so6288321pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=N1N4V/Nvmv+fnWpR+939i0rO/N3C8LKMUXS09ZsoQX0=;
	b=Fc8E08UqxCxRCOmXYEFDei7UF0dIA5808srxcoexUh4IbcymmicbquYh5ywcXS4Cfh
	/bRO9DVGjK3ZfH9VSOMuPiGLd5aHDj12jluo6wBdNdkdty7fJelYxHZQ9eg5xPwgWr9N
	XcbbRYrEbSTetJ3svlNh9X9zZFx6ufKoMgMXSpDYkMTLsWnByKNR5W3EKpjo4HxgATsf
	D8jv8DP6E8GdqsNS4JfWIojXWatPjbk7yZgTC5biPspNQclLG5F7opKaGgcOQueEi8ng
	kNNoenLtmNjm3CGJJGXSTAPIdGtZLXIYA0NwFMo2TcK+nxwM1jcnSEUpQ2YLHTd5ldbj
	JAmA==
X-Received: by 10.66.136.237 with SMTP id qd13mr31473660pab.84.1440951718915; 
	Sun, 30 Aug 2015 09:21:58 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	j5sm11708469pdi.7.2015.08.30.09.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Aug 2015 09:21:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 09:31:10 -0700
Message-Id: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Sun, 30 Aug 2015 16:21:59 -0000

There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
exception, there is no other occurance of GPL-3.0 use, lets mark the
licence correctly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xz/xz_5.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.1.bb b/meta/recipes-extended/xz/xz_5.2.1.bb
index e0ae48f..cf7fba6 100644
--- a/meta/recipes-extended/xz/xz_5.2.1.bb
+++ b/meta/recipes-extended/xz/xz_5.2.1.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 # which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
 # and the LGPL bits are under lib/, which appears to be used for libgnu, which
 # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
-LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & PD"
+LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
 LICENSE_${PN} = "GPLv2+"
 LICENSE_${PN}-dev = "GPLv2+"
 LICENSE_${PN}-staticdev = "GPLv2+"
-- 
2.5.0


