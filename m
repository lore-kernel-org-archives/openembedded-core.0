Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30147C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:32:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7282.1784475120514201513
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uWpvU0K1;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10308885e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784475119; x=1785079919; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K4YCV5jIOLKXtUV/WFlr+BtIA9tDa/fiCuAchEjANhQ=;
        b=uWpvU0K1GzkVyRJcnI0uijv2llv0fBrNxbdmh6iKHFgZLB83KZk+UcJ9gMmajErKhK
         /88iI6NqRbRAyfSrL/NhhOOkOhEcyIGr0vT+zq+lWg69HQgqXZQO9MuU0JBsQlRKf2yu
         Z7ipzZGQioayzzUFEEKkVufQUUk5HLzkLVyUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784475119; x=1785079919;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4YCV5jIOLKXtUV/WFlr+BtIA9tDa/fiCuAchEjANhQ=;
        b=VaQiFt48uNsrblzsMC3Ldl2V/BvB9+WMA9EZYeTq2xL+25wTDP2m3bIOdQvYI0Jzmu
         Db/MNSoaF0UIckiB3y36ijDwS5BNqQTOkz5iQEN+lkv9pVQSSGZilxmd+emcqqNvQhJO
         FOYzZLxNxgWOG03ZMTuzcJur1ByzXwMlKAAwDcEUyhmvl4avZbrpZk8WfLFpasC5m9Nf
         7m3yLQBUOYGxHNas3gY1ltg0voWj5XAJznxIaHh3UesiJDYwitu+ZTgdw5ZPK9cLm9rT
         0pmMs4HKDCmX6i8aOByGLJxoNonSG1GNtGu9FLcndbrvLbEI3fhQ1ksZet9bx78RPCwY
         bOrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqB2cqC2sHX+1XsZyBL+NwOOctUDEpF2yfgW1NE3FjAlQbb+1T3Tx2OYG6BTtJRFJ0dhZ38wQsSW9yPOZVHB8K6vw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoaL13H7siPt6GGQb1nx7YxDVAe6HHfhUcCiyBql80DJRpYAP0
	NtynwjPj5hb800tdmXtx327v6VhoxgKHkKkx2zrpL7N28pFQgX97O/L/g4TnYClNnYaHk8MiJwr
	GOnmMU38=
X-Gm-Gg: AfdE7clZvZab3vrwZ7+pgyySb7Fi80jIqXD6nToVn78xdSO4+BTkAcpTwsgQs8qG3mU
	y7HvsfNESXx3uwmNQ8qvCZAspkSNXOOpG8lgwj6pQbAq7qAmzZtiIg9scv0jIQuO3bKuYuAqqm5
	qmXIaFt/oAKS2bMCN4m37hrGhL9Kdvuk9lCC+52NUBUTr+9MnHpkLjHQGVg6PZ175jhqKC2vepH
	NUDP+9h2z4OzUmfo/Oxt3sOUr/dxvi5SNXxpt8IXnJnJxRCIhx2X4sZeKaCPp/Clc6gv+XO4Ql0
	yMjQBwzBpii//S+ViIMv9yRaurXmQf7YbBCHHqs7Czurm6tUxVuqpMXM06kFIxrCBmJ8x5dBgYR
	Y45aHHp1FCjSUpz3/++8A8idYjCi0voLGDL/DdRA1OnUv/loAYbSxNuZsyyeT+epa7NW9Uf3NnU
	nCugOA/+VqG/tJ+pTjNHa9VADIaea6raPbBjyC8+bkq0K++YMIh5HZWW2+v0Ihb0NmHvRhqi8ap
	m7rCQ==
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-4954a3d005amr131404075e9.8.1784475118751;
        Sun, 19 Jul 2026 08:31:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm206440015e9.4.2026.07.19.08.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:31:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:31:58 +0200
Message-Id: <DK2NMW2XCD0E.3LT07QREH5ZZ4@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] systemd: Fix CVE-2026-29111
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: <jeremy.rosen@smile.fr>, <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260520095957.3092276-1-hsimeliere.opensource@witekio.com>
 <DJ59MG1GNWTJ.3GZAL2LXOBJ70@smile.fr>
In-Reply-To: <DJ59MG1GNWTJ.3GZAL2LXOBJ70@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241292

On Wed Jun 10, 2026 at 11:35 AM CEST, J=C3=A9r=C3=A9my Rosen via lists.open=
embedded.org wrote:
>  hello Hugo
>
> when reviewing this patch, I found a couple of minor difference with the
> upstream patches
>
> [...]
>
>
> I suppose that these are due to backporting to older version of systemd
> but could you confirm ?
>
> please send a V2 with the explanation attached to the patch and ping us
> here
>
> Thanks a lot

Hello,

Gentle ping for the above

Regards,

>
>
> J=C3=A9r=C3=A9my
>
>
> On Wed May 20, 2026 at 11:59 AM CEST, Hugo Simeliere via lists.openembedd=
ed.org wrote:
>> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witek=
io.com>
>>
>> Pick patches from [1], [2], [3] and [4] as mentioned in Debian report in=
 [5].
>>
>> [1] https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425=
d7e12085feb2a6
>> [2] https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81=
e43bd1dce01d69
>> [3] https://github.com/systemd/systemd/commit/21167006574d6b83813c759675=
9b474f56562412
>> [4] https://github.com/systemd/systemd/commit/54588d2dedff54bfb603667082=
0650e4ea74628f
>> [5] https://security-tracker.debian.org/tracker/CVE-2026-29111
>>
>> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
>> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
>> ---
>>  .../systemd/systemd/CVE-2026-29111-01.patch   | 168 ++++++++++++++++++
>>  .../systemd/systemd/CVE-2026-29111-02.patch   |  87 +++++++++
>>  .../systemd/systemd/CVE-2026-29111-03.patch   | 103 +++++++++++
>>  .../systemd/systemd/CVE-2026-29111-04.patch   |  37 ++++
>>  meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
>>  5 files changed, 399 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.=
patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.=
patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.=
patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.=
patch

--=20
Yoann Congal
Smile ECS


