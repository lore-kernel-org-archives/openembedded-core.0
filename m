Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07C1C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 22:27:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80994.1782685656934595420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 15:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VLoYrmD8;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so8031435e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 15:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782685655; x=1783290455; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IBjSsnNQY6bIaSQxvg/echX17wK34Vx5zky7HrLhP8=;
        b=VLoYrmD81CdeU4FLVfGMgQbsKWp9/cuqPxjR2jYHdS5zpnuGEX+VHNymzeWcxdsCZt
         shkZrnWUp1pgFCvmb1Bx3XTilIrYyMcNlhD5uechJRyZzD+jGQDL1bzOW8w5nDdpsb6w
         DoccaYzNqQAgozQk9qBMd5rJjEO1rBvPa0eJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782685655; x=1783290455;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2IBjSsnNQY6bIaSQxvg/echX17wK34Vx5zky7HrLhP8=;
        b=Ni+QUCv4bYefXp47tckicRmje7pwB5OyEsMpaDzYkxY5EwmO70Wi7AK/an4BTa+RTI
         NyOjUAcJGK4ABwk4J8FvQS39u07dyluPmDTbBaM9dlEmFy2SQzea6+QVf2KXEl+FejOW
         SCiAgdfP10iRgqEmdjzccXHh6pNzGXl2fhIF0iw8rK3aFVv4/D5UjKMiQsa8Dr+V7rUh
         Bh90//ZnjYPIxDaOH0fphB9Sg8guzwBCzHRAlud5F/+pq2ZDqoxBIGqzfJo/8jmBBX4+
         pQ+iX3uoYh89iGKkcMliCYYiyNUo03LSv7ghGgE2YG/pCWBJtN4D5sZRp4ukuPnu+5v4
         QHmg==
X-Forwarded-Encrypted: i=1; AFNElJ/J4GrLyw+wVVYjlKqvR1bzFz3v3q0BAZYQlclT99eCtuVzmdBCJ1ENG5qWwumZFyjvuhZre9IoXz0YVWOK+OEVVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUhO3iZBwPgMoSHypA9PxpxIBXO+mC+MwgMoePK8x8X6GZMIZP
	3+AF4gNbDyY6326yN5w7wmL2FrWdSJEJn310iKZgJtfPnDxhniYhf051GKOzuY6E5PY=
X-Gm-Gg: AfdE7ckdHr6M3JYu8Ij/aWJuWwWFcPOTuOOatX5CJIWa007n8Nx4KbumqmQmccCs9XB
	t4QCjxfFlk2js1cLk6/DHGUazVz0uwtOsycHlNp3Z9MszXw6/ySpyJF7tqKqYjAGFzAGWroMdO1
	ks6/XcXsf2+QbgtphGexcfDGff8Lse5NeTpl8QPkBZcaUys2J/ACrcE97a75aOURtQy3fSbj160
	kG08mFFev/Hr3BHtLX6F+9t1PRr1fsxl8WeZZJyJ1yvJsQktEjQN9RRYsdug5zB3tGOtY34wPh4
	N9wZVIiQI1u5wwkBRRw78DhyskikmbQ7jHzQwuv505E6I07n2ElQQ4vhG0be+W7ZS5aJZfpTBAD
	Q7m2tNMGncv4s1QUVTNdQrkZ05xv/xH7U/0NxazJtn/87xjFFvfZwNEidKWGwTJl7fK001Zwpbh
	Fwm6E1xzupHsxN8KROR03Rb4INLor6SGVr8urQ9MBMxbOndNRL9Bze68gFTaqtCywr2yAg9KnUK
	kWWjQ==
X-Received: by 2002:a05:600c:c3c1:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-492663e3d65mr151147295e9.6.1782685654998;
        Sun, 28 Jun 2026 15:27:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa004db220001799fd29.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4db2:2000:1799:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b124ceeesm10929875e9.11.2026.06.28.15.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 15:27:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 00:27:34 +0200
Message-Id: <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260625125532.185380-1-hprajapati@mvista.com>
In-Reply-To: <20260625125532.185380-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 22:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239718

On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f2=
0d442df192b83
> [2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22c=
cce4f5ce05c84
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42011
> [4] https://gitlab.com/gnutls/gnutls/-/work_items/1824
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

As far as I know, this fix is also needed on wrynose:
CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wrynose h=
as 3.8.12.

Can you send a fix for wrynose so I can take this one for scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


