Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0B9E61261
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:44:17 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n7so5955993pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=dOcHI/agKotFeGmpd5J+QRRlFxeUND9HMtZalXckvys=;
	b=g78Yug/qdUpjnPJcjdoZxAeB6TQwfj5m3Wvg0Dek9yCWdAbSXnvbeouQRWb4lOfgqX
	WxYv9jOR7v0jVrSTHq58w3H11PM+kuQYwiezNvm8P9D3AqSAE9caHOiDFydjNU+qd23y
	wNaD0485qawYWkdrGm8T8EOjLRiaiAkCcNJi8S/qI7YUrsUUZ8yd5Cnr8JtZGHg2Or6X
	JR3UckrZeR/pbMFpBOyAAcHxyJWYT+Lo50iLzCxf0g4RtQdqjWojHAiVehcThsu1D36j
	q4h6aQU9sYj0I25zvxa++d4fsghPNTisMRSt6ZAEv3fEd+Qq2LYHKNOvS6NglakBo6Ig
	1sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=dOcHI/agKotFeGmpd5J+QRRlFxeUND9HMtZalXckvys=;
	b=QsOvJVUaYgA76tZo5IayVJ99UnJjbXBoRVND8UU4dwm/jEtOzhz55zaa9ztOOZYtmO
	riPHhEd232rmX0bdTUjan58WQ3Xn+l6Czx3kXFmtWawyLfk5XeKpZkqGHUsfORoZ6Lna
	f6w9tD4rmqX1GLAVjkUqWht7wW9h2oZbXy7lwKtlfTTJKLHns5/9pzu5g006iKC1ci7m
	o8P0g9MCeLWcIaUyfKA0+WvYtTi01hV7g2NsCe0YnvS0VlXoKMRVY0q+aaeXYPkZMT/4
	v3f4kr1J2CiHHICTqZYO9L3lE26HpOtDXrCuwFoPXeRRgNGJUJJvpzvGhPq5Kh+sEMQ6
	f8HQ==
X-Gm-Message-State: APjAAAUYJEGqX4ZiK5qmbkszst/Hv7RAvHj8GVlELXj0QdCmCQlIWxC6
	lTOTW/bewX+Sgjj2oOtYE7vvy6+bpDcL9w==
X-Google-Smtp-Source: APXvYqwIseMQ+Gt+6+v/UevDhmgGVBQU1WwE1OiLpZS6WMCoEp6ROJWWGK42I4REuOH/yZOR74qsjA==
X-Received: by 2002:a63:e50a:: with SMTP id r10mr6643775pgh.27.1581741858548; 
	Fri, 14 Feb 2020 20:44:18 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	10sm8659143pfu.132.2020.02.14.20.44.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:44:18 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 4EB4B2A04B2; Fri, 14 Feb 2020 20:44:17 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:44:16 -0800
Message-Id: <20200215044416.5782-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] tcf-agent: Mangle arch for armeb
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
X-List-Received-Date: Sat, 15 Feb 2020 04:44:17 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e0a07a9375..ed14fe66b1 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -29,7 +29,7 @@ INITSCRIPT_NAME = "tcf-agent"
 INITSCRIPT_PARAMS = "start 99 3 5 . stop 20 0 1 2 6 ."
 
 # mangling needed for make
-MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64.*,a64,`"
+MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64.*,a64, | sed s,armeb,arm,`"
 MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
-- 
2.13.3


