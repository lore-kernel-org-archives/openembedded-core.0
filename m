Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 256CF77A56
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Sep 2017 01:41:01 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id g13so6885580pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 18:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=YXjpCbosmgttGP8dGLEgbo2tMiMxMKwtfeCjy2PbyZ4=;
	b=fxKFF7sVzUiKAM8yS+kXNcavccO9LRoWFgLZr6JgbB5gF3yzOJgk3S73k0Zsxz13UF
	rTUZXHgF7zKwgjzOw8ZAQAkP2znbD+NX5wWy/NVMWPR4lPVNXLxwL4SLjlpQjowXq2s1
	izNKE26GfRBljA4KlXW42/X9yY1Znwxj6Kw1dIBLN6PEBDO0oxABRJmpQ4PXYvRQJhXz
	5uK7OjBZevfMWJ6V4kLC1AYYeop/Y/dom+hRaAuT461Jnvho46I1I0o+mgigjTp2+wiY
	c8mExsIQHA0h1Eu3Y1E6h2SE1aH8dEuz7FmTmH750JQSfGQV85LR0+dnmR0jJPPVbMQb
	3Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YXjpCbosmgttGP8dGLEgbo2tMiMxMKwtfeCjy2PbyZ4=;
	b=GykUp89lIF4lq4toxfxsolWG7BT2SAyoy/B2OAWmzYOmgUXHHTBjAYFr25s+cgQLjm
	cjHODxbGJoJGvkALsBO9DGGjABHFHrlww9QPEWLMWQUG/iMf/1BuBEGnCXsuB0z5rPp8
	gVCLV6m/N8YzbksOtmqXNt81nGkmvFtfV5RVMfjIV7SoIudJKiSBly8AdCiQ+DxeHjws
	rn+4hU1+tw8gD50bugu/oT47sbrAImiVoNHw1IWEnPcM1Pd6jjxwYHOYGBiNGt1ggOko
	+RLrcI49yDpa1l44I4zDjzoOHxy4L1TAjzx9WY7fqSv2V6Qe9GRDb0IyM/w92m2RIFK1
	4kIA==
X-Gm-Message-State: AHPjjUhyr/oSlkAkW/N4osGCOtyqxLxdXzrTY6q18TVb0PpDEbnfWigK
	OhUqMyOMq10/vw==
X-Google-Smtp-Source: ADKCNb4aW0rps6ZM1GEyoUxRQnI69HVWNsbpByRjJQWBApmpppngYnAhCaTiF2VKehVQlt4fFQYxag==
X-Received: by 10.98.15.209 with SMTP id 78mr5053404pfp.87.1504921262971;
	Fri, 08 Sep 2017 18:41:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:a4cc:2cce:3cd3:65])
	by smtp.gmail.com with ESMTPSA id
	j83sm5635571pfe.133.2017.09.08.18.41.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 18:41:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 18:40:59 -0700
Message-Id: <1504921260-10735-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Morty][PATCH] For the next morty dot release
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
X-List-Received-Date: Sat, 09 Sep 2017 01:41:02 -0000


This is the last patch to get Morty to build cleanly in AB 

Jussi Kukkonen (1):
  neard: Fix parallel build issue

 ...0001-Add-header-dependency-to-nciattach.o.patch | 35 ++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.16.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch

-- 
2.7.4


