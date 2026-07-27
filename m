Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DA9C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 21:12:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41694.1785186760787512874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 14:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=as8bZ0hc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so21932815e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785186759; x=1785791559; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rSI4BM6EL5IGo9aNrwnVsoq0qWyJAQ3HmROoIS6NLmU=;
        b=as8bZ0hch5o4Bo586+vN/VHtUC7KZnh6j3KthKz3OhQwbzCqUZ/CfqWzVPY2mLr/+0
         Rhne2ZWxzRVSBJTlbVp76F64oT9DggeAgntYOUefR0Q/H+vGWXm/jKXHIqSw77Y/cylL
         isDKbiQHlv1POcYVmHkonrBXWkUCZJvZuENkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785186759; x=1785791559;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rSI4BM6EL5IGo9aNrwnVsoq0qWyJAQ3HmROoIS6NLmU=;
        b=JrQL6Q3x+cjEuV2p07EaI6aJ0+8HllhNGq4bVB3Nqjz448z7S9CN2G57Ot6Bx2bZ7n
         RuTul9ZIGqzVQvm79q1PEt38EXmPHsGDIQnzMZIx3xMLsl3Q2tRYZrQ0f17FoePqgk8x
         bun6AC8I9mKDidnSLy6DW/+b0q5MDrnGy7LR4sWIy51KSSLgz6HKI/7qxRg9gWEoMmEg
         2Qxn8SuMELshyosgeD7LaSnwRfzoT3fvheJ7zN3GD9srITaPgA29uNziiFPZXIR+0DAu
         YdLFmFsSo7ueFBbC/8kDEq2oBcZ2z7AqRCZynwLqdFMvmDtB7mQ8BP3z8ZqN7FuXBBen
         4MTw==
X-Gm-Message-State: AOJu0Yw/Lw4Z1W3ov1zqTiqz5KSdzsTzrxy0RJPOa5Kg3Jp5/V2HIMmj
	H/N6HBFYNoySaCCdG6zVOYP6xMxTtdddsICpLs9A+alFIp1raLldeLn/Mh/WyNPdqz3cd8Icftl
	JNUe4ZmM=
X-Gm-Gg: AR+sD13CSiH3qCyMcBSa9VcS2J9HpJccn9MvtngCEPsE9B4Lsd1DKXWhXZ9w2JvzHUV
	uv8QnF2oDOzY3zt9wT2XxVlWfriXq8DttdEUwc5r6pDaCnTlpvQVdqUCn1dwG75MmJ7jmmMgrxw
	C0T9oEHSYLUbRsfPPtHCxpV9KYQyMaNbbt7A9VvJ8/gWv9uX8pct3J7hS+Br1oyVQX33vqJlCvf
	+69cHLXAloypaci5sAmKksIj9DiRGqixX7lmUaFnYE3MiMWmyZ/ld7iseyEo3K956nhlr98IXOq
	vdF1No445vz7n/0yA7HB3xi1aN6HBlnEOMJqeVNalxHtbiC8pYoDMtPLdN7xwsC0xqnyuoJSk2R
	O0K7XsNc7iso5wVKcwrGmdDPF8DWpV7d4SoGnGj3kkmugEgU9Us9YKiLKv+pBUgxOqlCFUo8Enb
	n3SMwywAw1ah/JMh2Ipgj7c8nwQGBwQ7ho2DRjqNM65JZaCyWBEYQxTzesCk+XzhFW/f9ui214O
	cjn3Q==
X-Received: by 2002:a05:600c:6dd5:b0:493:e583:7053 with SMTP id 5b1f17b1804b1-496c4fe26d3mr4385265e9.35.1785186758897;
        Mon, 27 Jul 2026 14:12:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8ce:5352:9de7:86e4? ([2001:8b0:aba:5f3c:e8ce:5352:9de7:86e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm37488521f8f.26.2026.07.27.14.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 14:12:38 -0700 (PDT)
Message-ID: <8773d1dc4d109da78fa0ffd91bc5667a5f3544d2.camel@linuxfoundation.org>
Subject: AB-INT issues - where we could use help
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 27 Jul 2026 22:12:36 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 21:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242105

Hi,

There are at least a couple of intermittent issues where we would
welcome some help and we now probably have enough information to allow
debugging/progress.

Firstly, we suspect there is a reproducibility issue arm to x86. This
is summarised with this reproducibility diff:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260726-9wb1l3t4/=
packages/diff-html/

(from
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260726-9wb1l3t4/=
packages/diff-html/)

I suspect what happened here is that the qemux86-64 files were built
first on an arm host rather than an x86 host. In general the x86 hosts
probably beat the arm hosts to it, hence why this is rare.

To test/reproduce this, I'd suggest picking a target machine (say
qemux86-64) and then building diffutils on both an x86-64 based host
and on an aarch64 host. Comparing the ptest package will probably
result in a diff similar to the above, e.g.:

build_triplet=C2=B7=3D=C2=B7aarch64-unknown-linux-gnu

vs.

build_triplet=C2=B7=3D=C2=B7x86_64-pc-linux-gnu

in usr/lib/diffutils/ptest/tests/Makefile amongst other things. I
suspect picking MACHINE=3Dqemuarm64 would have the same result.

If that reproduces the issue, it would then be a case of iterating
through the differnces and finding a way to reconcile the output so it
is the same, independent of build host architecture.



The second issue where we could potentially take help is with=C2=A0

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13908

This is the infamous matchbox segfault, now strong suspected to be the
xserver restarting during boot. There are several things which could
help here:

* finding out whether it always restarts the xserver?
* is there a way to crash the xserver like that (race with psplash for
the console?)
* working out if we can reproduce the matchbox crash using some delays
placed in some of the code to widen the race window?

Given what we suspect is happening, we can likely improve the code to
exit cleanly when the suspected memory allocation failure occurs rather
than crashing too.

Cheers,

Richard





