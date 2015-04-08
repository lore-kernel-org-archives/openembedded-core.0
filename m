Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2825660089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 17:34:26 +0000 (UTC)
Received: by widdi4 with SMTP id di4so63665888wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zPrYV7+fjfuLy/Cmv0XHiKq63+GA6235WF8y8tT6rcI=;
	b=QD1fBKUnDNkceyTEhxRZF9iBxIVSFgRjWNgUY2P7tF75eI99Yx8R/ETrQOxn1ADsDv
	DMSCbBrqiRkv8/d9NblnE0KoVZTvNRDrm47UUslKH9Vu11MQp/LVPAErYIUdJpDxZlUO
	j6gGiQB6/IDCG8APkrxDhp63WUlP7qR6ODIPMRh6Us7EPL+rAZ3r8/bwN2vr9tVV/3is
	tOG0p38Y8K8917mlE1UfGAgVYXpPzgZ63jAZZX4uGutwZiprRI1Iw5mBBGD6tcEpQ3w3
	h8knibNaJc8BL1noqhDHtibm7tsDkR6jp5CGSzdKmv50ZSsZe5S60tyRFvV3o2gwhGfu
	wfBQ==
X-Received: by 10.180.109.6 with SMTP id ho6mr16426675wib.58.1428514467716;
	Wed, 08 Apr 2015 10:34:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id w3sm16609474wiz.5.2015.04.08.10.34.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 10:34:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 19:34:29 +0200
Message-Id: <1428514469-16931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <20150408165602.GI2337@jama>
References: <20150408165602.GI2337@jama>
Subject: [PATCH] tcmode-default.inc: update GDBVERSION to 7.9%
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
X-List-Received-Date: Wed, 08 Apr 2015 17:34:28 -0000

* version 7.8.1 was removed in this commit:
  commit 34a77b11350f1f4ccd952f78fd660710b6efaac8
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Mon Mar 2 02:11:00 2015 +0000
  Subject: gdb: Upgrade 7.8.1 -> 7.9

* causing couple of annoying NOTEs at the beginning of each build:
  NOTE: Resolving any missing task queue dependencies
  NOTE: preferred version 7.8% of gdb-cross-canadian-arm not available   (for item gdb-cross-canadian-arm)
  NOTE: versions of gdb-cross-canadian-arm available: 7.9
  NOTE: preferred version 7.8% of gdb not available (for item gdb)
  NOTE: versions of gdb available: 7.9
  NOTE: preferred version 7.8% of gdb-cross-canadian-arm not available   (for item gdb-cross-canadian-arm-dev)
  NOTE: versions of gdb-cross-canadian-arm available: 7.9
  NOTE: preferred version 7.8% of gdb not available (for item gdb-dev)
  NOTE: versions of gdb available: 7.9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f69fe9a..e3df934 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "4.9%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.25"
-GDBVERSION ?= "7.8%"
+GDBVERSION ?= "7.9%"
 GLIBCVERSION ?= "2.21"
 UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "3.19"
-- 
2.3.5


