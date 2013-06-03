Return-Path: <danismostlikely@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id EE4F66A60E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 23:12:45 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so8203470obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Qd+zkW/YancAHiPNbmewns7wOUZxvnJ4c3RL3W3njkI=;
	b=09RM5vJAQJBK5BitRS5O0GwsiqGxiGg6xo9x5ix27M4J5myMBfoHOHIj/366k+3Beh
	VBQAzBpERPUBc5xBclb4eyVm87ff45Ylvc5XkR5AFtLsO2NHAZ2hXwXOC2Q5Uj5n0MhV
	n97S5kBAlrgbZsfwC2H/z3VwgehYnSbiA5bYPMdLEMrasCGM+hXe6bYVkRmlGHwZi3uG
	EQBle7Bu+VHPqP3NQ9YJNqZx/BaAXN40o7yzXZnROwpVdWmwv6AFADdKShAhL1VO17nI
	sXuT2n3BYRK5dOs4tQMNHdjDGCZDosVwCDEK+UeHc0e3LRwF/6PSROG0jjnM+GedAaR/
	jLBw==
X-Received: by 10.60.98.173 with SMTP id ej13mr11292619oeb.72.1370301167088;
	Mon, 03 Jun 2013 16:12:47 -0700 (PDT)
Received: from mediabox.gateway.2wire.net
	(71-17-188-15.sktn.hsdb.sasknet.sk.ca. [71.17.188.15])
	by mx.google.com with ESMTPSA id oe10sm3315459oeb.6.2013.06.03.16.12.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 16:12:46 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2013 17:12:27 -0600
Message-Id: <1370301147-4582-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1370301147-4582-1-git-send-email-danismostlikely@gmail.com>
References: <1370301147-4582-1-git-send-email-danismostlikely@gmail.com>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] python: enable IPv6 based on DISTRO_FEATURES
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
X-List-Received-Date: Mon, 03 Jun 2013 23:12:46 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Base this on DISTRO_FEATURES, because we don't want it
unconditionally enabled.
---
 meta/recipes-devtools/python/python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index d0ed55b..80609a8 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -27,5 +27,6 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --with-wctype-functions \
   --enable-shared \
+  --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
   ${PYTHONLSBOPTS} \
 "
-- 
1.8.1.4


