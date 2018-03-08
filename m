Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 11904789FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 03:18:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d26so1828364pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 19:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s2/6V2GKv42Oa/0vcUEK8+31GSUfAnCxh+0NXyA5LnQ=;
	b=iI8Dpj+Slu9Z91KVNdB5nrMVJ2lTyjDSxVBQg2u1KsMk/SnvLiRPjD7wPLi9eUMggp
	vM72H+Y7aazPuIDySDkJshrsgHrR9pDSJ8iUp3Uhbsjbi6KNiX2IcvUr3Im9WZRAYome
	yfHpk1h4bjUe4EbufLbugGBd8rBQs5rbCziS0uGCvYUabPDdu2uViDxc8m0fGftV6ulA
	Dp3Zf19mPsOJoN8v0ZVJI9LzDIz4qqQcVORJmLEZpo8LT0f/BNBbpZTi6XTr9OO87z2p
	FBs2yo/Q1m97fKC6l1aoLUtZWuhH+tmd08HpdJ3skRLGeKpCIyPcm9XVdyh1CRlovpJH
	LOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s2/6V2GKv42Oa/0vcUEK8+31GSUfAnCxh+0NXyA5LnQ=;
	b=fACzfSlJ3tUoNYDQvNCyX0/cAG+LpNx9vTNveXAj8oUCCuWIK7V9aw3Kh8obsGwbqo
	DclST2bGHrcyVyw6nGTgrNjwHhlkoDwK4WdxTj76INq1S2qPcw4zTg/e2DNysXRiupwA
	AGjL7tNjXjGyub4IhwwgIBqLyGH9AFv4/3/orX5DSiY0SFU4JiXZNezY4dXHyxCpu/qG
	7fk9IFEFduvEv2gJgMrKeybBRt7pLGhm/DrIBZcfF0XCifrOfiKnKu3WV5vVrRTW7ZB9
	3g1wdtgua/pvFxoxlWfGOHeRKZW3LfrElCZh+5ILm5YPpSd3JDg+vHOolpBdaMuNA56R
	u/DQ==
X-Gm-Message-State: APf1xPDbfLGsYGsrROFk/Z0xL6DWwjk0bLoLoOW5hpNqWUfwEu2ZCt1q
	e87r8RWCk+UXDBfo19Gam6U=
X-Google-Smtp-Source: AG47ELs35BHC4fjtpLnjfNWn3I+Xrd53RodhFpIvVWTNYOzLf+IycBogMq7OjLPubgD5gXtm5+uINw==
X-Received: by 10.98.9.130 with SMTP id 2mr24862050pfj.149.1520479137353;
	Wed, 07 Mar 2018 19:18:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	a5sm35203772pfn.66.2018.03.07.19.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 19:18:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 19:18:53 -0800
Message-Id: <1520479133-30471-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520479133-30471-1-git-send-email-akuster808@gmail.com>
References: <1520479133-30471-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 3/3] linux-yocto-rt/4.1: update to include spectre fixes
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
X-List-Received-Date: Thu, 08 Mar 2018 03:18:56 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index bdad3ea..37d4e03 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b4c6e9630df3207eb6fbadb337e5df806ee6b6c5"
+SRCREV_machine ?= "763bae6e560c5b1a5e9f6a40eaa7d267d70300e3"
 SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
-- 
2.7.4


