Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E5473607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:49:55 +0000 (UTC)
Received: by wgjc11 with SMTP id c11so34077920wgj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qOwI5b4xSyrFDOu0ieX8wjfTLe21QCOPlc33SVRz8mg=;
	b=iyTiwbHkIDzPhsU8IIk1srfji/fv3Bvrl/t6JgGGDlCGOYX7zRv1EnI3Mxe9FY3umv
	WLVyFvRaVV0QWrpfkxmabMGzcQNRWKH84fAKeW/pEL0goncEy+FYYDQxpsWIFDwQgdQW
	Xg1PsS3pmi/z9tNSbb5vHJm6PBpmjlMJJhF9X08nwRJ7ajHBS8DXueEevyD5OeBOcaxc
	TAVHxNzecV7sVjkOfvLTWD5KIwM7/J4EXfsmWBqUh24wu1OPJzXIU5rmeNS9NCY+aqUM
	ffnYHZuAGG+d1kM/jOpU4Uibfz/QAzg3fmfPgsOUHEzNumn44VEOptRm9w6rnYuSc90d
	/8hQ==
X-Gm-Message-State: ALoCoQknqxu5XU1QH00LMWpldIb5sNRZOtG9sz9zUaJBobnmf6R1RpN07/lQfYgZz22R0kNvhZna
X-Received: by 10.194.189.148 with SMTP id gi20mr47137248wjc.22.1431967796035; 
	Mon, 18 May 2015 09:49:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.49.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:49:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:20 +0100
Message-Id: <1431967531-25163-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 02/13] libfontenc: upgrade to 1.1.3
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
X-List-Received-Date: Mon, 18 May 2015 16:49:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libfontenc_1.1.2.bb => libfontenc_1.1.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.2.bb => libfontenc_1.1.3.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
index b79ab8f..a181f05 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.3.bb
@@ -13,5 +13,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "ad2919764933e075bb0361ad5caa3d19"
-SRC_URI[sha256sum] = "a9a4efed3359b2e80161bb66b65038fac145137fa134e71335264cbc23b02f62"
+SRC_URI[md5sum] = "0920924c3a9ebc1265517bdd2f9fde50"
+SRC_URI[sha256sum] = "70588930e6fc9542ff38e0884778fbc6e6febf21adbab92fd8f524fe60aefd21"
-- 
2.1.4


