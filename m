Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3542.1793582313260077064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GLxLzbaw;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso14637315ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793582313; x=1794187113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1KzcvHPCnZ+ewGJIcPnXbE5wLx10GAnhGabVhP0VX8=;
        b=GLxLzbawmJ3qRE1K7UOmSU2KxfE6MTJat2yap+HI3Y/yJ8sbl8fNv8m7H5bgTFDoaQ
         3HWtlN70ycnX7o+yis229GNjl8WYWWPBDztX7wxIXAt1KWLf3vPm8pD631zBorhnr/uO
         +uVrcj1kCu6cieepF4Dnm7B1zBvyYYFVZM1uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793582313; x=1794187113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1KzcvHPCnZ+ewGJIcPnXbE5wLx10GAnhGabVhP0VX8=;
        b=q14plRJ6bSPEgDdpxNNCm/EcTxgCdfE4NbJ7g6ALyPJFKvCt7sOwB84Ht7IhlGQBi/
         zVPQNsYajTHYcF3Z74mVZ0Sv8PEG0U9RVAbr8UAnSE3a6YI6XgVlxs98Ny0lPRzpSYkU
         bIK+xGpx0A8sXV+ThdcBbvEBMfFeYa0mywOaHlVehCkzVioLbhvE1qNt3wlwznkeA4kD
         Y8HqqmshmJwEMH0mLZMCQwkso1ZCpSiUqBSu2fLYOXfQ5TcPxdpKwVYxxZ1jpK+quIGY
         ZT3BfN7kx56RToXk5MnMqyKABO0LDcQqsF13o+XAMD8HSuCuuDGLFuDlLgnUB/xCTMqS
         vTvQ==
X-Gm-Message-State: APuU4Z8BK8Q+5GlPt6LzyaEwas2zN3Qd7AmQfUVqx/fuq8gbjrg8s8oC
	JGPGvyvGSyFfa3UVwL1ue6vOM4i3lXy0nDI/8jHM14iqK6ufq6ZNxICXd+37QJKckcBR7hanc/g
	JKzpU
X-Gm-Gg: AYBFou0dLcQJuX9k/gRt91G1y386gm9ofd1bVGcmcjy9GJoSosoBNlNEggJF0J7Mdx7
	RKUv3Bx2WeGs8hibd9SQA9JIsVOT1Cgm4BdeHmrt4v6uTENxv4XHD22ezoJcvSS+rIJVHq19YrH
	uOPY+gW6qQ+t7/cIg8kVb64X+9YG0pX8tmeUgwU59ek0mYBzVBUNtMbJ5c8B1ZbDqoejK6Krqvx
	pp+OxU+VEcT67nhW0XIbYcgFjBsRaKK1V3OqnvkWq3Kdmdq88jjuZGxZr6tZYe2mKVV+eu9kWm5
	+v4ElAJ0LLXie07Ct8owrl6pj3+NQXjt5y/WDpi7OjNBqm7Wz6nzmm9WZhrcv8phZrMRTO6nSs8
	AjgWPRLz43HzujEFMqNwoGO8R/7+K73tmkbiBGu8SE2MQ856EqtzF6JHTo8r/h6NnNHstQXC46+
	3hta/8sTQ0t9xmOkdTwokHTEQZhg76uq+4tdGbfp33HKHCGSUBzczpWGpmo/eGtaD6f0RVNi87K
	yGSsqgm1wP0qK/to54+3lSuBAc7SEwMfLGEDsz3q4P89aPCnJ9bIZuAEp4tDH+qz5ZhS8sWCeed
	I1XcYv6+Ndp/3z+seO3QyLhm7U9MDHAJa2KP3ZVErB7RFPpGXtGkTVb124rVu5gRK6wK+UkenAh
	fwO0Uu5vum1aMtTz5Tv/26wnhNA==
X-Received: by 2002:a17:90b:3807:b0:3ad:a232:403f with SMTP id 98e67ed59e1d1-3ae897aa79emr7623278a91.56.1793582312519;
        Sun, 01 Nov 2026 17:18:32 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm16436533a91.7.2026.11.01.17.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:18:32 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 5/5] python3-websockets: upgrade 17.1 -> 17.4
Date: Sun,  1 Nov 2026 17:18:16 -0800
Message-ID: <20261102011816.3710992-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249169
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

17.4 fixes a denial of service by memory exhaustion: recv() now rejects
fragmented messages split into more than 4096 frames (tunable via
WEBSOCKETS_MAX_FRAGMENTS). 17.2 and 17.3 are bug fix releases.

17.3 added uvloop variants of the asyncio tests, so add python3-uvloop
to the ptest dependencies.

https://websockets.readthedocs.io/en/stable/project/changelog.html
https://github.com/python-websockets/websockets/compare/17.1...17.4

Tested with core-image-ptest-python3-websockets on qemux86-64 (kvm,
slirp): 2550 passed, 114 skipped, 0 failed.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-websockets_17.1.bb => python3-websockets_17.4.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.1.bb => python3-websockets_17.4.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-websockets_17.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.4.bb
index d1bec373e0..a2357ebee6 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "\
     git://github.com/python-websockets/websockets;branch=main;protocol=https;tag=${PV} \
     file://run-ptest \
 "
-SRCREV = "e87ea9be0373edd5065b5e94dfa714cfde23023b"
+SRCREV = "625a59ed613ac60e60d577dd64b8641d59ecb2b1"
 
 CVE_PRODUCT = "websockets_project:websockets"
 
@@ -23,4 +23,5 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest += "\
     python3-misc \
+    python3-uvloop \
 "
-- 
2.47.3

