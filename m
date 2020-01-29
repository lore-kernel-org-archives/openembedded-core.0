Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id D67C96061F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:53:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b17so4347256wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uFPOfTe40MJhX4SORnoMmRnBwqzq1a0tVGhbvlfSHYk=;
	b=Lrr76lLxnsfgnupCF0TwIWYLrMKMrZ5Ldh+7r5aauWI2aml6BMgy6hj5A6rkCr89yF
	11kJSsXHSeucl78xvg5EwGul0MKpwaAoI7UjP9qUNVeHhpcelUpBTwR7BlBvObmUD4pZ
	dWIMhPNDzZr+ogaX5Y6DrPQMU1jw0tktxgcXzUNk6LMjVTI6dOYzNR20gepWn4kEgvl7
	e59NBxNccgqvAw/c7nv51FYrI3bJZz1qtf93DQV8bIk74FjygI2h2z5MIrTpylbuaVNU
	mcY56OmgM/WfqWQsRxYyWWjT8QkBvGj7UAs5PZSrrd247WKgVqHwndQ3uydeGXzq77gq
	YrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uFPOfTe40MJhX4SORnoMmRnBwqzq1a0tVGhbvlfSHYk=;
	b=hnhoQGgf/BfxB2ZsFpNxmyAlNN5HG3AjnR/w/DlqR7QG1C4EF9Wp1jb54NnqZiguxu
	0vVvjRMYi4ccBMb/Cu+W5m8d6OwrBi3niN+Wz+CKGi21doXqp/KaX0fCNw9gISnNmSBW
	t1t2bL2D7aZ0tEAakMBpuXbecySV+fa7Wlx+uJD6wanKtwmBQVNz/NR7dgnEiPEtw0YE
	m3YC1d6rsWrdGW4c1DYPL1efPAt87T/+TXjmOaxl1oR+wLR7Aikwf+bQS4bZ+PGzzHol
	Lpn4cMwFSid6GWBXu9tnNqAkg2fKS4xTAcsv8Jc/+iOuBKqD3qPsWp7Q6v6s5ana1Syh
	kHwA==
X-Gm-Message-State: APjAAAXE/C5Je5dw2JW0rZEA/E7enhIAtrV+CnA089sjkN+8aEZabCcy
	6cclHHLAkJgz63oEat8TOjGuFfEn
X-Google-Smtp-Source: APXvYqzBbKVBsbTDrv84XWZvNuIwrRMeH6O6nRRMj2beP4yKg/JDxsECKo+99nyt3QKQ7cZplEALcA==
X-Received: by 2002:a05:600c:285:: with SMTP id
	5mr2245308wmk.120.1580288896555; 
	Wed, 29 Jan 2020 01:08:16 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:27 +0100
Message-Id: <20200129090738.1398-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/24] kmscube: upgrade to latest revision
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 82720045b31..a1a295f6604 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "f632b23a528ed6b4e1fddd774db005c30ab65568"
+SRCREV = "76bb57d539cb43d267e561024c34e031bf351e04"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.0


