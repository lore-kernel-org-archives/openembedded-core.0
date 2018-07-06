Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E8167786D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 05:39:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e10-v6so7431387pfn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 22:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PDDj/Xiy3jTzXiD1IjDmKNCOZi4gzxlUekLoUQyU8/w=;
	b=KFmTGUEYWNhrt/4BFNQyPddCQre6/mDHUBp+svuaIKvpf/S9O0adUAT7clETyrXCxu
	DQxrLq9CuR9xOqV22Z69tIxNg5hMkNNsv1YZggiC0G8ekZRpnPbhPGafv54mdz/6yEOi
	bMWFIVcTQo00qTdM85UZJ0/c5v2W8TCh4Cvjuqq7BJTrZZZ4tHYYv3X0mU3CtiWs+c8l
	I6HmRf7+Pghs5UKPwmsBppfizJ5nIpZazyodcG436kZBqDVFNTrUJ37f+3ccs6RfppY7
	lLWV2jlOuJlIb13dxFajcA51K07Jj/Kwf/B4Wu55KQi9ivvHCX8TxJLsHMcOz2r8xuNZ
	NzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PDDj/Xiy3jTzXiD1IjDmKNCOZi4gzxlUekLoUQyU8/w=;
	b=GhS8ALpXTwbB1MT6tVrAxP0SpcsIpVyGS9QwljT3miPrSfera5yHLs4zEPJ1/J/N9K
	ZVW2qK6390U/zaJeV2bwTyqD1O6Taf7SwpklpdDoSWWJd6n/if/B0TaFAVhAGcPT7gho
	HGEz5VNVoRl2JbABaMRMedeIvpkineDQwlGGag8XGLwcJVbLiUhEh+crQZLoAVdLSRvs
	TRxO8p5setevy5G58gpVZ6LJmNbWHloCqYmq9t1JpA2Y2j4FwHtHZ6VRTqEbr9AQm1m2
	wEbaCObCEpQl5EEHSMKjy77/01h3+uvddN/QtVBp3NwXyqUKUwi61orNh/gQZGeCs+Qb
	5zAQ==
X-Gm-Message-State: APt69E34gQcgUr1TMnkzI4vkXwZ16mx/vp45GNwQax0AoLQYcSB+YkWC
	wcu7wOnzWTk6UXghze5OI+588A==
X-Google-Smtp-Source: AAOMgpflLsOK/avcbF0eY2EpMc3pd4HrIXC7TyVgc95WI31YPkovtX9eN5kWY9XxImbuExDVtNUG+g==
X-Received: by 2002:a63:ae42:: with SMTP id
	e2-v6mr8144537pgp.351.1530855589632; 
	Thu, 05 Jul 2018 22:39:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2af])
	by smtp.gmail.com with ESMTPSA id
	i12-v6sm9517684pgd.87.2018.07.05.22.39.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 22:39:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 22:39:26 -0700
Message-Id: <20180706053926.14853-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] musl: Upgrade to latest
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
X-List-Received-Date: Fri, 06 Jul 2018 05:39:49 -0000

add kernel 4.17 inferfaces and wire additional syscalls and dladdr fixes

complete change log
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=d5e55ba3320c30310ca1d8938925d5424a652422..193338e619de7c993efa2c0e1a87240bd732c181

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index ba2de730f3..2bcd45d571 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "d5e55ba3320c30310ca1d8938925d5424a652422"
+SRCREV = "193338e619de7c993efa2c0e1a87240bd732c181"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


