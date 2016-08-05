Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A9F117017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:26:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id i5so42148545wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BhxDV4w7dqEAFWpJlvdlfaLRCUYhxky3oKt4amjJrYE=;
	b=BJ+7iyJayJKIqgwYb4PXmpQnmHw3eQEGAGc2Kf2axdeYNkmJ1+IQfCE9+VLlIRZa9t
	fCWZlPfSIAPYfMLyAPUkZNk0hu/xKyLOjtCevR5OiAF2F10blId1usFp5kavzw6vMrqt
	8NULGsAMv6xsc/BLYpbMe7RNHydUHr+W1MjAVlq9qhR9uPp5Sw+74HfwxF6aVmdZN8kQ
	MYXjudLQFq3U3rq/R675W9/3h00co+QbigMfvfS2yWXkveNL2PvAyizXZjfR4MaZ9Z0J
	p+eIo1jn/1CWwVNputYZp/xtYCl19+6wdCGw6oqA7do1tdHej9MGM8J5tr0CzJ3kN/so
	Jh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BhxDV4w7dqEAFWpJlvdlfaLRCUYhxky3oKt4amjJrYE=;
	b=l1EXo92kur97F8dlH8P5Lk110bVjqFi6Eaqq7BqtG+oocooQbbwsLEn3zsKn0Nyn2t
	89+JhoY7cTR7/2DdLM9MG/6Fksn3DEriv0Jfg+Tig6FlvR7uJ9eaf0NDQSHsK2roggbZ
	OBmqNsjLnUeMntTQ/764w2hW6jljAvoYUrLlMWKYr/UfoUfyjBc/DDWNsAB/NHhvSCO1
	5ON8ZUZ7WHUlmdg4iFSan48Tf8rTpNFtVcjyVZrOjUdOKfGmArDTr2Rr98pNzj3dhs+c
	YN3vy3CoCzqkdkp2L8IOpIOuuWZ2h9DLrDM8q674Nxobn8bImELcwz+QLo5dYkfRJx+P
	p8Mg==
X-Gm-Message-State: AEkoouvcdDm0fj4Z6MhrqS2gZ83aSHj7bwNUISVnMs/MkAX95Y9wAEBjuM3ewjCTa5J/S1/G
X-Received: by 10.194.0.211 with SMTP id 19mr2948971wjg.124.1470410812397;
	Fri, 05 Aug 2016 08:26:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g184sm9124361wme.15.2016.08.05.08.26.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 08:26:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:26:47 +0100
Message-Id: <1470410807-22869-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][V2] hdparm: set LICENSE correctly
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
X-List-Received-Date: Fri, 05 Aug 2016 15:26:53 -0000

LICENSE is recipe-wide so should be BSD & GPLv2, and then override LICENSE_${PN}
to just BSD as LICENSE_wiper is GPLv2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.48.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
index ec3d26f..cd85776 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -2,8 +2,12 @@ SUMMARY = "Utility for viewing/manipulating IDE disk drive/driver parameters"
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
-LICENSE = "BSD"
+
+LICENSE = "BSD & GPLv2"
+LICENSE_${PN} = "BSD"
+LICENSE_${PN}-dbg = "BSD"
 LICENSE_wiper = "GPLv2"
+
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://debian/copyright;md5=a82d7ba3ade9e8ec902749db98c592f3 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
-- 
2.8.1


