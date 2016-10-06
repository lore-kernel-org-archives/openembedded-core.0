Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 033F171A21
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 03:18:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p138so1364774wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 20:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=i+NGVJq6BlEi9taoUtESxS4CuTr66k+uzjNTLojuLAA=;
	b=KN3Bu6GKN4NWaEAP9C7R4d1lQs0rZvzGota8jc1f7a1WRPz/gWPsYOTrbxnrKCfk6C
	gkKbotcRTWjad2ZZ9HcJt7QMMsEZUgcG1x3N44qRsmLMz62ULU9WzYR/NbqcJK7yZvZS
	JW472D6mbuCJhbtlkNh2UQZ0cwXcQIC1QHUagXxBBD5EoxnEt6+TwUognHjBDmNpqpw6
	gl595BKDkEDhY4eeoBecNwYrOkt3FsZKXiufNUN+IrSj7tpcZkt6g18AQPGqk/Pb2689
	Mgjq4miO1/kKEfpxJBDmVesgU8OICyJr4NGZAf+bzKxLSZM1Iae3U01id2wGBfQsVdrG
	f5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i+NGVJq6BlEi9taoUtESxS4CuTr66k+uzjNTLojuLAA=;
	b=PuguMlDVuQ0HtwnOaoJPG2XJ2syPHSp9SD3eD3Nleqk+Y5bKg3ewgRTDKD98HXZIOY
	jbZtvgrVISExBMrGpqyusAliwqJg10uR9oyhUo7ntJHbWOZQhGMn7wUluDbMrEbY4jDs
	FbN3SCpFzgsvut12bXdvos8+ixrz08GRalNRUDkWcXC4QEOxm1tmCJbqnPSgbuuLMFzt
	HL/9WhxCH930SvnbcHOjemqMkiGAK3L5EB/iHH3+W1phfYaoRc4mhTAMbBINmIlNaO6y
	6xP3Kjs79Kvdc+RG+eZHwvIS2T7LdanBt91dyYLpnZNdzNb9G+Xl7L8vbofZRmSW77M2
	mo9g==
X-Gm-Message-State: AA6/9Rn7zIigdkmlPYyzz6KkNiLtVsVq6PFHlBwUeEI8OPAEXwhpf6SvpKHfvSitkcy5Tw==
X-Received: by 10.28.148.18 with SMTP id w18mr6671717wmd.108.1475723913241;
	Wed, 05 Oct 2016 20:18:33 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:3d2d:5ee6:c14d:940b])
	by smtp.gmail.com with ESMTPSA id a5sm12031193wjd.9.2016.10.05.20.18.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Oct 2016 20:18:32 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 05:18:23 +0200
Message-Id: <1475723903-31485-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] scripts: Rename 'native' to 'oe-run-native'
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
X-List-Received-Date: Thu, 06 Oct 2016 03:18:33 -0000

Makes it a bit more descriptive and potentially more discoverable. Most
people seemed to prefer an oe- prefix, so let's go with that.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/{native => oe-run-native} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{native => oe-run-native} (100%)

diff --git a/scripts/native b/scripts/oe-run-native
similarity index 100%
rename from scripts/native
rename to scripts/oe-run-native
-- 
2.7.4


