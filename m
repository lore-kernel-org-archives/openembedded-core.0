Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 75F927FA30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a17so15979336wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zed2BWW3DupylO1otunMf02UeqIzHg0Mc43uRegaq6w=;
	b=doYibeVXSqrkmvsL3CHRsVyXg03+V4VsDVMBat5QeEXbd4NjC+FyUund3+nwRBGa+K
	O+Lh4F5NudCG2qKnQ48yeS5CMeDIFdeFkGT2xeek502IWnfgPCiFAsGK8U6JKUGFi4Og
	00Pcj+T4CPlyoj1dRedtcWI39lC3BTGCUTzSDXE1fCQq3g6FgO3iwp4lOp6ex5pKjrFn
	l4FJ98y3nqF+amRfjpcIY3rhr8xGW6+1/G0ERb6ZKhNi21GJMs9Q74bDwrQMDWLCplEM
	QKXOh/XQuJ2dXTMqTP2K08QBqJMKuSnxFxAiY9A4hgTcmcf1IwZbQ+Oyr6sehGz896KH
	1kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zed2BWW3DupylO1otunMf02UeqIzHg0Mc43uRegaq6w=;
	b=oluxbe7bLmlwRRa4MWdILwGJ+ZCPLLwhzfX7CmcTMiPrg1howcRWq83YG+ceBTtcS7
	TgTNbzfSlYjGwEVPuEt3//Dmgd5GRdsdg2i3EHiqvuBkbn/iCpLHkFlhKpDQNmSb2X0H
	5OVhXznZKs6N98/dBGJyWcwgKT7bz4oFsa2VJkkol/Ldqa71qmN2Gy1Y+2qHzzzZ0Ug2
	onIYt1X0jsFvUPO3ZYNLglKbRPKlcZXNhg3tqQnjpvMb6axQLO9/Ul3V8mLBEQfwAbGs
	K2n9RMOYBKoOw2t0gO9cYnxl9jSHUvXYFoMjATH0vH7mCzuxGMakxGXp/DGWYJezbEbL
	W+RQ==
X-Gm-Message-State: APjAAAUW/vuqN6uPbh+3dbOYRFMg+CImtyKvLi/cj8b4WUakdkqioqPo
	FLbl7jbKtyNPNAsIbtczRK8Sl4tj
X-Google-Smtp-Source: APXvYqwMId4JT9nMzOb16JVavPcWWpyLvK16J28ltzUfYa7Y3/musrgEPka++fhzz2jzi/HLrZj7KQ==
X-Received: by 2002:a1c:4489:: with SMTP id
	r131mr27721987wma.132.1574082539003; 
	Mon, 18 Nov 2019 05:08:59 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:08:00 +0100
Message-Id: <20191118130801.21860-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/13] systat: upstream version check is working again
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:58 -0000

As upstream has released a new stable version,
the exception is no longer needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 62de36b44bf..77cc6f2cf2a 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -10,7 +10,6 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
           "
 
 UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 DEPENDS += "base-passwd"
 
-- 
2.17.1


