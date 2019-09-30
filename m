Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 706947DE5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:47:58 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id v27so6647897pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q6q20kcbclYsy3wAcIU4/lPSMGZUUuwjVOB4ay7R/50=;
	b=DYUBE2vNMwehJ5p823dZCFbtdIEQht/zC6dfe1x2WMZBZpJXoBM3TH8bQMEYFVlbSb
	sFSEhy/iw+U3Yy+tJadIVwXuGgSYA0K4W5VoXD5fj4CFw5A2a8FcIsx3Aca9nJEJgkE5
	LqeHFXL2iTOZB/mcgo29OcavOnI4LRBwHp//qOucXhS/Svbmx3vZ8EwpfKMA5FBotG2q
	Ymrivpx9C66vDC5qWWw6wNiHDST9c3cKdWVCkMigULKqU6j0LAUptY4mIVxdklGJRP2L
	EoL2nu/ytqsI5lolAQXEB6/TQnGv7ckOJLqIonr7Dvh6XUtS2Tno+KDNAbfIOlfnMkAJ
	fo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q6q20kcbclYsy3wAcIU4/lPSMGZUUuwjVOB4ay7R/50=;
	b=la2hVkTHAnQOKYSCmRm3z96Uu7Zoa8XyXURre7//pCX5SB07HWOkqMeJE3FFvfOIGt
	736jp1s2fZoPgsO9l7/3kZUVcr43kPLDrXcD1ZYJSvizDOXKG83soEVdAYMDEWOPwHeb
	XnP62huSnZiz+yLeEN2TRESJHew5j29sI5aV7D4g/udG9xiLRhQ7mSDrv9IxsgfjAE6V
	zIvzo4PBczOakyNW6Kb93crcVZagLT68nn32UxNq4BIGXQNohFQ1zW+F0H6fzAVgQX66
	0cDkm2+Wf5Jq75lrdCTgH363CyyKo2QQ+V9Uw8gk/6JKEBzFby+PZPVIjmWTVfFBJJg3
	KxtA==
X-Gm-Message-State: APjAAAU4zAqsR8Bmuf2RZQBlheOFSwnS7M2fUhrNYPdNVPTOA6ghz8BK
	jzRI8Zg5JL0Uaq6ZqQX6g+4JTwNYaXI=
X-Google-Smtp-Source: APXvYqzNNNij6OkSSnLOywWwTar7NKma53p/onrBa11yIyCSzGZ6v0fmW716j1TlDi6rLCl6jMoJXg==
X-Received: by 2002:a17:90a:6c90:: with SMTP id
	y16mr25373496pjj.58.1569818879423; 
	Sun, 29 Sep 2019 21:47:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.47.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:47:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:00 -0700
Message-Id: <408950d64fe02350acc0ac2ad5a0ea019dbf8945.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 05/54] glibc: CVE-2018-20796 is same as CVE-2019-9169
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
X-List-Received-Date: Mon, 30 Sep 2019 04:47:58 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:
https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34141
https://www.securityfocus.com/bid/107160

(From OE-Core rev: 7e90506534ed2a70680382cf28614f02fdb98409)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
index bc40361..cf3744b 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2019-9169
+CVE: CVE-2018-20796
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-- 
2.7.4


