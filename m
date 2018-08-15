Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEC379086
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 01:40:15 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f1-v6so9903790pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 18:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NjGXdPC6KCLNa4GTUkv9PnGa5JUVB3N7lAKLUiGKQ1c=;
	b=XMgqJNCc4yX0xysp7i45OhleM3VB+Hm8yezWFFMko0Ig3Jo3NMB4bLwugai29aU9kL
	zwWGL29gOrlxnTju/+/7/imb0ei2JnKuPvXnvavBOubtTMYz1ZZysVB8iu4jqqyROJoM
	mgPM9JSJfo1i0mqHebrHURGDXKgOC495b4etJBlwOykxS036y+fNZ4G1Wuzi65eUo3rI
	plM7eo/xvdLnZTDpyx12z4OR21Q0tfoA8tEfqAK3sKOuBIyhZpgr/eu/6XSt09cSe6O1
	uImy3ccWFZOy107XP6e0KzDsaAvgPzoFWx7bI68er+22+f5eO8ZZw4woMtOvIIRoMclL
	LtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NjGXdPC6KCLNa4GTUkv9PnGa5JUVB3N7lAKLUiGKQ1c=;
	b=SGjW4lAEUgDmZYUfiNK5+4uovq8te/FnlGCBZzj6iiZAKp0yXGWp170u6FJG4mfqyZ
	B8RIIlyppaYXeIVNCykCR/t7mPmbVztYLh3jpB7D0tPdDFruS2B9T+UsE0ZNUIIxysUz
	ksr8j7nfFDdQFn2tYXuxi11c1g9rchnVlGwi1P7TKvBraKgG4coruI79gxHnvnEih2w3
	uJEaeWkbPHgjEWPZJ2bwvR0EgxC5RvA0M6WOd+bfBABtPVeMPxKhOBQsCWlobCkucRrh
	7eOjSv2cqs8sWgOP2Q5UHM8/N+n3bvzxa0uZbT/6A9usNBq6rC9OJlIyg//Ub7pHj90i
	XBTQ==
X-Gm-Message-State: AOUpUlHzkeyFlTVxLZaMOe1FcQDa2NtNyMepmsu9GeWyi2qEBpFeGjvf
	PdjYQ8xtwpmnzh2ayRNnXTMHXdzo
X-Google-Smtp-Source: AA+uWPyIC2Sa64jExv1GoqLeO60JlbGl50wecDJ0Jzkw8C9DCvZLFzeCGibQnCW7HYLNZHoe+A6DkA==
X-Received: by 2002:a63:f616:: with SMTP id
	m22-v6mr22866984pgh.293.1534297216247; 
	Tue, 14 Aug 2018 18:40:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	j15-v6sm25327387pfn.52.2018.08.14.18.40.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 18:40:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:40:05 -0700
Message-Id: <20180815014005.30479-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180815014005.30479-1-raj.khem@gmail.com>
References: <20180815014005.30479-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] security_flags: Add PIC to cflags for some recipes on ppc
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
X-List-Received-Date: Wed, 15 Aug 2018 01:40:15 -0000

Fixes issues related out of range R_PPC_REL24
e.g.
/usr/lib/xorg/modules/input/libinput_drv.so: /usr/lib/libinput.so.10: R_PPC_REL24 relocation at 0x0e8602c4 for symbol `libevdev_has_event_code' out of range

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 6245e89ada..52e1e4ebc5 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -30,6 +30,9 @@ SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 # powerpc does not get on with pie for reasons not looked into as yet
 SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
+SECURITY_CFLAGS_append_powerpc_pn-libdrm = " -fPIC -DPIC"
+SECURITY_CFLAGS_append_powerpc_pn-libinput = " -fPIC -DPIC"
+SECURITY_CFLAGS_append_powerpc_pn-at-spi2-core = " -fPIC -DPIC"
 GCCPIE_powerpc = ""
 GLIBCPIE_powerpc = ""
 
-- 
2.18.0


