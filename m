Return-Path: <tom.rini@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0F17C5E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 18:09:05 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id k9so1786449ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 10:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jtRKZu9MvN8eqhr29Xe/mogtmQepufAiQ13hr+KSIig=;
	b=bx7at1I6m3JDcnZ98NJUvoes1s4rsoIg+wDSCXZOJhjqSHhD8iAZnIfBEGKB/Rm+05
	yt9/cwev/ULruDzlWui04WoXfRcP55ozwu2QEyJeTZabscauazS76BAFr/SwE0TgwsRt
	XISvA7w3TB0xJT/R4276fHnLNbnzzEG1X5AC7uyisR32aROd0fPKUNfBak5U7CM3h6pt
	W1Mlwnql2Jcri41lX15ztI7DXPkNnw8l2vBWuW024A3abMZ3A9aPNgIt0VBzfoMOGlNR
	CmsaBgF5foVAiAluA8b2gMY68fVwkrs1xJiZuW4Dakh39HPaQpGhZKV7uWRsLYvE1Otw
	HtbA==
X-Gm-Message-State: AHQUAuZqaPgbzv/3QtyHVmonqMdBhT5uPmozqp/5X+m73iIgiuhpr/ob
	hUUB/ioQEfU2FooiUjibunN/MF4=
X-Google-Smtp-Source: AHgI3IZ0QR84v4PoG+BPun5uBIDtaaAOqOnmK8cspEZrLF5lnd5sf7VXoWAfwuC9akehHrJnxFIZNA==
X-Received: by 2002:a25:3b82:: with SMTP id
	i124mr18860074yba.183.1549649345669; 
	Fri, 08 Feb 2019 10:09:05 -0800 (PST)
Received: from bill-the-cat.ec.rr.com
	(cpe-2606-A000-1401-82A1-4CA6-62E6-4E54-CB16.dyn6.twc.com.
	[2606:a000:1401:82a1:4ca6:62e6:4e54:cb16])
	by smtp.gmail.com with ESMTPSA id j83sm940008ywj.95.2019.02.08.10.09.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Feb 2019 10:09:05 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 13:09:01 -0500
Message-Id: <1549649341-26394-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] local.conf.sample.extended: Mention shadow-base for login_manager for systemd
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
X-List-Received-Date: Fri, 08 Feb 2019 18:09:05 -0000

While not strictly required, list shadow-base as the example to use for
VIRTUAL-RUNTIME_login_manager when configuring for systemd.  This
provider matches what is found in for example Debian and is also one of
the non-intuitive VIRTUAL-RUNTIME alternatives, so it's good to have an
example in use somewhere.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/conf/local.conf.sample.extended | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 6a1eced49ce7..010bf6ca6ff2 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -393,5 +393,6 @@
 #
 #DISTRO_FEATURES_append = " systemd"
 #DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+#VIRTUAL-RUNTIME_login_manager = "shadow-base"
 #VIRTUAL-RUNTIME_init_manager = "systemd"
 #VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
-- 
2.7.4


