Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09CC678A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:15 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so23194037oib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l2Mu8Jv1cVt9UZSVbGOHWG9d1x8FzlY6zVKU1+RDYYM=;
	b=tQStEX+bTH7T+I0zc+dsxplrAyoD6LQ47JH6vGll1kwMCRCUsmAyYqCoA5RlJFVKEs
	FFrcNzieZhLeH8PUS5ks49K6lNEdRRFbLuTvDjWvrbIh2euTZlxQV6cG1EbfUsEFfSA6
	Q6PHWUCzzEqxRi1cwf3ZJ85pjxgKGVbhoG8mSGdM4llO9VJmULQDP09vdsLEw6+YmXe8
	Pds5SnmX0CYor/Y+UkNbNkTS/N9u33lOeGekDac+pJXtoIPsK4Fpe6dPeik13oy5Pli6
	uhINhzhEo10T09D4bnD26J1cXu83Q7fKm8SXQoi4kmZRIt+6vOZnrL+c0XCY8cw817EU
	MdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l2Mu8Jv1cVt9UZSVbGOHWG9d1x8FzlY6zVKU1+RDYYM=;
	b=gYTUjIpWjzI7dREoFFJlAFS2ODXPwjsFny1USZVOZCLhFhcEIvRzSnbUUObqYI4+jO
	CZKeGNOCwQBl/LK1IyIJG975A5dUiDM1rA/WPCysPCJT8qbNI0t1PxKiydOEWCow4sxe
	RULZjMvYTHpINb2iwaKo2lUB6zwtg/mezKK2e9ij4nqBzm8/BDmMTxcNXf25c22jqMhc
	QrnfY4FTnDCPhidHq66FvoqltJReVizWPfUdsG9RTBDnZY86mOnSAU4E6G6ES5BTSxbW
	pzPEyyovggvv8EZy87oUBkfM31DXahRjEQSrUXEqvQhyV3mbWH13Fels/lljTsK/tdlc
	B00A==
X-Gm-Message-State: AOUpUlGwb3wiQKg3jAZYK1AX5sno4g0eiYfqz2HS3hJmZRbYkzaivlEy
	AmY1vMXKMpkWP6SNZMHPqno=
X-Google-Smtp-Source: AAOMgpc17Jyd07gnWo6Z7NUAv+eg8zctsPCvbar/bvjia86FVHAo4VXsiS0fL2FREOXVOj9c8svs8A==
X-Received: by 2002:aca:ccc4:: with SMTP id
	c187-v6mr14478514oig.282.1533572416240; 
	Mon, 06 Aug 2018 09:20:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:06 -0700
Message-Id: <1533572407-3066-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 7/8] linux-yocto-rt/4.9: update to 4.9.113
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:15 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 5c016ed..539865c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "90d1ffa36cbd36722638c97c1bb46a5874dbe28e"
-SRCREV_meta ?= "0774eacea2a7d3a150594533b8c80d0c0bfdfded"
+SRCREV_machine ?= "3ba839d695fd3681e6920373fc260a2a3f812b8f"
+SRCREV_meta ?= "5e993963afb54bdc82a02077c29ecdbc0b12368e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.82"
+LINUX_VERSION ?= "4.9.113"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


