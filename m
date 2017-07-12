Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8557807D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:08:38 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id r36so9192030ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=n1DRAaEc8LbnQoXCzxxwJegsuC+mVluHGCL4B97jTRU=;
	b=tcfDwdI48dd6lkFFwZ+T/MHNziqj9/CSGP669ifRU45MNMYUVKT3yyT7KlQAZO/zLh
	BperWVlzHRzEe32l2mmlL1kaRgqYNhkU6uj2t8hkFRhNQu66C/soI2ke8vFUFk0D7NRT
	MlPQ++Kxa8LqRjEi96hrRKHfE01PwpYh1/lEHVQBixbBiWArOodqQkK0nBhKzICucayI
	NqAhlmsBgIBJwrZwbblJAtfz02G5kH2oibmRMoqfiyk96GYDuNZD5i15bvTxJpGUjLXF
	cvWgN7W/au7J2HV1X6F5MCgimY9DUXNhdFFrKi4BnMPyxGo3MW+x86u6MRoKQf5JjOLQ
	1xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n1DRAaEc8LbnQoXCzxxwJegsuC+mVluHGCL4B97jTRU=;
	b=bqs8KSPbYO+3lL4ib1BByOFB6WgqKGSF81Zheh6RHFTEds8y4zVbtS7EGuluieiv/X
	wswRtDa7G1UVeyakPhVI5RxZZHySlXerM3lqKO0ogyCPEp2ZslEA36e9tICh73HeA3gx
	96MQuqmVYexkOCtuW7FbPpQqBK2BwGVzgPeEzV3QBsLzishseXBXum9mPTURgHZv8ElI
	QVNIl9wpmfvFAp9L9ZPwd8dYaB+Za8stIiT9lnHnzG+o2glFxLlv79AMWUCrdEOewcxC
	7ajZW2BGBIH5eAKoX3GTToVlMZqPY7awsNk7obIgppiUiXFmHKRJ4xNL7EGihyDS6icU
	+bqA==
X-Gm-Message-State: AIVw112LMUIIKC3cJt/ySWAuk7YMG9XFToJTCyjI8dtELTYSFRiHLhpO
	N0pBBhh0hQ98O1ZToFA=
X-Received: by 10.107.28.84 with SMTP id c81mr4578352ioc.186.1499850519824;
	Wed, 12 Jul 2017 02:08:39 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F424.dip0.t-ipconnect.de.
	[93.232.244.36]) by smtp.gmail.com with ESMTPSA id
	z62sm1242611ioz.37.2017.07.12.02.08.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 02:08:38 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 11:08:34 +0200
Message-Id: <fbb61d12b6b5970568b1de221fb2b2c1337e6f17.1499850496.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] distrooverrides.bbclass: fix default configuration
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
X-List-Received-Date: Wed, 12 Jul 2017 09:08:40 -0000

When using distrooverrides.bbclass without setting
DISTRO_FEATURES_OVERRIDES, the code failed because of a spelling error
in the default.

[YOCTO #11759]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/distrooverrides.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distrooverrides.bbclass b/meta/classes/distrooverrides.bbclass
index 9a42712..9f4db0d 100644
--- a/meta/classes/distrooverrides.bbclass
+++ b/meta/classes/distrooverrides.bbclass
@@ -18,8 +18,8 @@
 # of these overrides should be limited to .bb and .bbappend files,
 # because then DISTRO_FEATURES is final.
 
-DISTRO_FEATURE_OVERRIDES ?= ""
-DISTRO_FEATURE_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
+DISTRO_FEATURES_OVERRIDES ?= ""
+DISTRO_FEATURES_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
 Each entry is added to OVERRIDES as df-<feature> if <feature> is in DISTRO_FEATURES."
 
 DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"

base-commit: f441186bafe2b8a80d3229f13aacf92138f63cd8
-- 
git-series 0.9.1

