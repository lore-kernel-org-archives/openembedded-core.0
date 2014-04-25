Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3E165DD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:40:29 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so3009466eek.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=w68lCuVkTq9iC4bVwpHqNQKFkuU5rkCE/4BCY6lxvN0=;
	b=CxwA4hVkyS9WUkxa549mdcHbrN0j+Dul2xK1Jd8bFbeb8a5zMKjLtRqGY9HKR7lpJB
	1aL3YzkXka08iCmuqIrcxndN9u/TGkW8/FngY4DjBcgrZ6y+uOUQW0cIjrimGzjj6694
	TWVb0mohnxeWZ9Rl2eph65GegEd//NeHSKS4Y10aA8/N2KIDERZdiEhE77W7bbRCb/53
	7WwrKTeefKIg4vYuz6eQ9w4csxlMA9LYD1JqM5IO33/+1ebf+3oCoPRiH7A+d3CO6Irr
	bZlkT5QcyYnZHrI9/RqVDaxQ1iTpB38ZATB3XPBq4eDFXssj5Zdr6jHCvapXT5dEtBu4
	PMOQ==
X-Received: by 10.14.115.1 with SMTP id d1mr11799437eeh.30.1398444030556;
	Fri, 25 Apr 2014 09:40:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm26107867eeg.4.2014.04.25.09.40.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 09:40:29 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 18:40:28 +0200
Message-Id: <8b81589aeaaa73278e17e2fcea0d55f27629fe1a.1398443925.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES
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
X-List-Received-Date: Fri, 25 Apr 2014 16:40:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexr4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index 57b6717..bde649f 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -10,5 +10,5 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7r", " -march=armv7-r
 
 AVAILTUNES += "cortexr4"
 ARMPKGARCH_tune-cortexr4 = "armv7r"
-TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
+TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4 arm thumb"
 PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp"
-- 
1.9.1


