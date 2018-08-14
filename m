Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4BF878FBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:11:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y9-v6so12425636wma.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HMM6SLxuwzRkDQFn2Xiq7gHzpAdvtEnh3SuYaL48J9I=;
	b=XjfVNqz6vHoffJUMiK4C3YupoU+bgt9VcJEpNVVkIn8iXkOl6GMwC8no/tygFuhXte
	14bDSHbGJJFwlxWubPVtAzlR6C0/gxZMFx7zD4dDhxEQafJERHnVUG2nspcKP47+s5Hx
	Gudv4ZZNYWMZjyw2HSKK+QQH7Ib9acvOPcmQzJU0xGDocnQAKw69Tp98L9zQSugNFChc
	cyDIl+b2qeFf90qINt9PTltFu0+yzoJ4onJXquFEOolFyujYHSvj1W25SlJg9sxrXg87
	rXENjCvR8ywWu6MD1ik7zBZPtVtD2QkhJQ0Nt9KbBu21EcBMUFZjU+inAK8TvxtM2Z9J
	sPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HMM6SLxuwzRkDQFn2Xiq7gHzpAdvtEnh3SuYaL48J9I=;
	b=c/FFvhCxI2dODKq0iiB8yvY2JUu9spN/dcOGQhR0tiseP/AaOjGra+aEXKtbr/nLBK
	+XDzy1JzUc9A1Uuq8MtbQ/3cAN9ICk4yYooCvEF4Zk0nFDahCsSwBYHpBq4GSI1T2TWK
	jFzxfxLuzFdv6qdRlCjhWn9paVw8QExshXKgivdPmq08SIYxO7MrfiH9TGkRIlREEfQr
	fp1uvEjQCX9CXYrY+L6JIZIaNaQeo0T/s5CGz0DZgRzGRDZkI/ZjIx+N084B9770kDgO
	GbanBj/srqHqoWfCtex3NGR5UuZmQWiVCH2p/YBkhZelt3W6O9GkPP33SwurpHw7QXqg
	IbeA==
X-Gm-Message-State: AOUpUlHbQuZxTJH2V7MAdi55TVABaldX7KqQ+j+mgGnA+E5Ak7DCX/Hg
	0hFd6LxkP04EJBlT9pFJySRu28tc
X-Google-Smtp-Source: AA+uWPwaKAOddS/tUlmfYLWYcDocnpubY3FHzri0kpPjEkGqMWh8+JYv2EWu4y/QAZq9PH6DKwN2Bg==
X-Received: by 2002:a1c:ea17:: with SMTP id
	i23-v6mr11341142wmh.29.1534255863502; 
	Tue, 14 Aug 2018 07:11:03 -0700 (PDT)
Received: from localhost.localdomain
	(host146-228-dynamic.182-80-r.retail.telecomitalia.it.
	[80.182.228.146]) by smtp.gmail.com with ESMTPSA id
	c134-v6sm11118201wme.4.2018.08.14.07.11.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 07:11:02 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 16:10:49 +0200
Message-Id: <1534255849-10649-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] tune-xscale.inc: restore specific tuning
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
X-List-Received-Date: Tue, 14 Aug 2018 14:11:03 -0000

Since commit

 a11bdc36a1be
 tune-*: define more generic DEFAULTTUNE to share feed between machines

we are using armv5te to share binary feeds.

After 008085450417 gcc-8: Fix spurious mcpu/march conflict for xscale
we can use again the specific optimizations.

As of today, there are no public feeds for the legacy devices so let's prefer
the optimal tuning.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/conf/machine/include/tune-xscale.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 0d07333..cd08b93 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv5te"
+DEFAULTTUNE ?= "xscale"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
-- 
2.7.4


