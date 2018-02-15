Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 65D207017B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 07:49:32 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id x19so1321577plr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 23:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9gf94P0NFYhwQhru8xqiiBnjIWFstc9c75YItwf+lk4=;
	b=mvWBxndnS2aOoZTdt5rJwezLifPtyHN7pUHDg2ZdRntBfnIG1hIYAqVwSjIb2QooMc
	X1fFy3Y7xwdYI8oCHiQiwNzHWzXFoi7C92x5vBL4zXwLZEhephYE418/HiWWx2n3TTqu
	GlS1eLcbkCf4zaufB25SWieyrNs4BG8hPMTsivRwHuv8CJmED9fYWyCk1yXIqohNdsDi
	0PbxkRRaciKfnbesCoZ53aDSNFGwY37dXq2ZeteVM6A0g0c1+NhteBn6/MOg62/S0soZ
	W/z0icBENMSvX6jopj2QmxLrsHvMj0NssWtziRhkjqeRkpyK7xuTl4TThcRiHQbRfDyf
	UrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9gf94P0NFYhwQhru8xqiiBnjIWFstc9c75YItwf+lk4=;
	b=uHNU4krpNOOBKaothvIL/X6TISmdMV0VjmPO9wqREQdC+UYQYsvphtE+NbidkYHINQ
	jAVjgBUo2pv5WQgpdfKg0/dsBamVs8dbmKslM8WrNIvXiaSa0o9+AP4pdvoTYzuvCZcx
	YiaA+Rd3ZmDh+cxffRFGiT8qBw9JNNo+COznxKIXLFEZI/bxk/58ke4IcSuAw3GhzoAi
	DAFK563562d6u7Hey7en+Gt5zhIgnaybnnC4f2+BjC2MU2tGZexhZUbqOUz+B8Z5IYXD
	LoK/U2ecDTLe2a8mEtAaIMpc8MuFeSFEf1IdT5UU8CDHoB0XgbEzvmE1QzgcctMlY/j2
	M9HQ==
X-Gm-Message-State: APf1xPACrdIRLnV7QQj5365R2iISR4rxeLTyom1ZWb8NoZ91KOgtG6db
	X1By7m8MQF2LMb7fwbPdLxjOsQ==
X-Google-Smtp-Source: AH8x226h9zHzVjhe2yaq/nWY5l4LPx0EJLMVs0k7Bt9uFls+94uA8+D+DIKS/xzduX3fjbd8879HYg==
X-Received: by 2002:a17:902:5682:: with SMTP id
	j2-v6mr1695453pli.441.1518680973370; 
	Wed, 14 Feb 2018 23:49:33 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::1da0])
	by smtp.gmail.com with ESMTPSA id
	m80sm46176278pfj.163.2018.02.14.23.49.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Feb 2018 23:49:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2018 23:49:25 -0800
Message-Id: <20180215074925.35300-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] eglinfo-fb: Pass -DMESA_EGL_NO_X11_HEADERS to cxxflags
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
X-List-Received-Date: Thu, 15 Feb 2018 07:49:32 -0000

This helps in compiling on graphics drivers which use
this define to differentiate between eglfs and x11 headers
e.g. mali or mesa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
index dc2820cda7..cccdd2073d 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
@@ -4,3 +4,4 @@ EGLINFO_BINARY_NAME ?= "eglinfo-fb"
 require eglinfo.inc
 
 SUMMARY += "(Framebuffer version)"
+CXXFLAGS += "-DMESA_EGL_NO_X11_HEADERS=1"
-- 
2.16.1


