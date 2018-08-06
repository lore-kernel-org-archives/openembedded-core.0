Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED5978AAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:13 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 8-v6so23293265oip.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uQS9SliICZLYUalpcjbJFtw5c8mRtL1U9mIzt2oSOmQ=;
	b=qDMFpvVFVILIfxDvb6rsLva73DvRxRVkMujdvXpWuCcOADpu6R73cnjaacKhnxmeiA
	llSIlmb6hphkz6TIfYuCkpjvMXCoWVzn+8AVd5Dcegv4jhTkTf+q9+e87WPHuhJGvjTO
	VyyR1VkrIstJpwGdWnp1hX6N0mB3TA7yZxXyYgh/cg/WdLglTcvHmBLsrIh7wzkcGXq6
	VjXlKqDxacsareToHiiisnRqH0jgwmChE8lq1/f7nSBLhKLEAEAPnLThkQmFddpARwKU
	Uo3PRl7vyEw3nMclRAva8CR624HLgnaIKRPTVpbTFYc+iZOOxWq5A5WGwcRubVDvUxsf
	mi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uQS9SliICZLYUalpcjbJFtw5c8mRtL1U9mIzt2oSOmQ=;
	b=ElQWSwlW1P+MdI+lvaHLvGzIJanhXttmz5iSbxkFN3cmFUveOONntzGOHy7JQbVTFK
	BY2Iiq0v/pEv19Zjohynz6vtK+ShmdCOGQpmOUsbd4so4blLII0eoMYwuTdb0i3C/DkH
	Lg/8XoP+oiWgB56OlPndEWCnLh4k/qHk4frcei8ET0EWDC0d49IX0RL7OmKCcbTrMCPb
	bDAUBSuQy+1EOsNhHlPFat49ez0e/DRC3v7OYBHy0euOKJibXqYGe55UnNa3Wen+CDI6
	xDa4yACigUBuPeuAuGZel9QH6UFldwc0dOB5tPvUkktR4LkmQzm7E7OvuIrIOp6nAnDR
	vIvg==
X-Gm-Message-State: AOUpUlHBbuW1MyQOe5+qwazslCG7ftgJtYw/m2jCwdm93c0hLCANU5r0
	+kRh73VAzGbpOilT7zytWeI=
X-Google-Smtp-Source: AAOMgpcbe+nqAxYT9j6L0diNQEYr36Z8xxiCuDdQABYDc/aPZE3//dTw9qNMjwz4QqqHrWqPiIiyuw==
X-Received: by 2002:aca:ebd8:: with SMTP id
	j207-v6mr15833514oih.206.1533572415055; 
	Mon, 06 Aug 2018 09:20:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:05 -0700
Message-Id: <1533572407-3066-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 6/8] linux-yocto/4.9: update to 4.9.113
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:14 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index a5a165f..5826ba6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "23369eb7e07c839fa73a8c1e85aba37a07bf14c1"
-SRCREV_machine_qemuarm64 ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
-SRCREV_machine_qemumips ?= "cab9e059447878f5383f91a05db12813f69cbfc1"
-SRCREV_machine_qemuppc ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
-SRCREV_machine_qemux86 ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
-SRCREV_machine_qemux86-64 ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
-SRCREV_machine_qemumips64 ?= "c2e5ef83b612d50f50fafeed9930dbea302fbe8c"
-SRCREV_machine ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
-SRCREV_meta ?= "0774eacea2a7d3a150594533b8c80d0c0bfdfded"
+SRCREV_machine_qemuarm ?= "cd831469d8eb4d900fe65985921d2003c59f3a86"
+SRCREV_machine_qemuarm64 ?= "1b742cf55fc29d0ffc9d651520ad7d59145bbc07"
+SRCREV_machine_qemumips ?= "24b020741e8762ec8aeb5be95f842332083b2028"
+SRCREV_machine_qemuppc ?= "1b742cf55fc29d0ffc9d651520ad7d59145bbc07"
+SRCREV_machine_qemux86 ?= "1b742cf55fc29d0ffc9d651520ad7d59145bbc07"
+SRCREV_machine_qemux86-64 ?= "1b742cf55fc29d0ffc9d651520ad7d59145bbc07"
+SRCREV_machine_qemumips64 ?= "100a1682529e34d118d5552c9db773635cd2c621"
+SRCREV_machine ?= "1b742cf55fc29d0ffc9d651520ad7d59145bbc07"
+SRCREV_meta ?= "5e993963afb54bdc82a02077c29ecdbc0b12368e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.82"
+LINUX_VERSION ?= "4.9.113"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


