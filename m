Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10402.1794663620548589581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 05:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ojBaU6uv;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso740194f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 05:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794663619; x=1795268419; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRlQqxm0EboJK7QPAgswyC7p9ExUqL4NicHHx0h43U4=;
        b=ojBaU6uvN6MrPvGGNGyNnVT43XBTiR3pCwJKXj8YxmXthjimryJQz6f92biKp/+oxm
         y3/K6/qfoJj4dQJf509++AbwElxChJTEJO5lsGjqy5WsxjDf1+0kZ4DHPLwhx05IkLrw
         Xdw6cNikkcgTwbb11OweRKqwUMxysFn5MPx3FHgFx/kLuUoigLLE5z0T3u/fIsW6A6Q0
         R53y8HZNNYcmR6UqmlmA8r9ZOsD+8nPaf6WCFHRoy3kiSuGEbxpDSXucWEmcPSO/tgbk
         LCREWJGEpIN2zdZjTFwmc0NdpSfxG5sH4I8o6vl5RCQpJOvrs4atEak7I+mWq3wAHu8i
         g7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663619; x=1795268419;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRlQqxm0EboJK7QPAgswyC7p9ExUqL4NicHHx0h43U4=;
        b=whlxUlvIeL9//83BRyx213fnMwckXqoLB9wKkQ23VH93TDi41C5zOPCjb6advVOvcf
         2EMp1hv/aUvj/WN9EWJAYxlqXV6k39GFXLmakY7y6QpQfP4VLhIkfwHXG25qSNyh19Qa
         QWYNjcxhmU23eT9gluC21kq+qbcE4W2umTWGOkTypeWMeehYG123VyY/J4UR5hgcm565
         CNvBphnZ4xF9ufgjvM0FOtx62gZ35M2SoEgyQzjJy0WTIAQobKkS8zq+BSZsUTUDZgQl
         EO7eRRPtwSKDoKWdhM9wgPppQ6cJXWhtGsDM0a40A2A9HQA6Mz+KgcBcXQfrp7VphvUp
         ydGg==
X-Forwarded-Encrypted: i=1; AL+hErHrolVaGESKCVdkiekkpS7gMmBmrDSoX9uzbNy7DLuQjoQ4PWk+AB1fjCZPAENvFStsX2cdC9QRGgNqBQAtMZK1bQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+KoajQrQyg1lbpp1Rhr80Azeste/wFxCFNoy4TOErVqJR3HRXa
	Z7/4F6a9xwMtS5GOYGflKFVLAJ/SQAPSGLYtTYiJ234eJWctYwU73n5Gm6Z9QEjiQBg=
X-Gm-Gg: AYBFou3S5jE8Jy8m2qfEUON4jhRmV4MW0E89u+GYDSBnU80tkpQqDIH/xGwne+0S6u0
	OQvBj5GA8j3SzQIlyVjEv7hJxjHuOHemqlrvJdWFT53AANOo2U47rPYzzFZSajrHb5HcmQUfCj8
	OFLrR27w7pcwvwP5W6n2Pe3n1w5CbQldBszclhyzbwLw3VcfnAGiFk8lkew7ic4QoXiFiPbCsQ1
	ceGqHYf3NUM+hHFrxFgTSPo0JCMeWbe6EVVhkE4Pz71G3to9sOQpbpvK+a0+hcrm2EhHZiKAi25
	wMcj4K8zRPuc9q2+noaIt0lBucHaGHQ1l+yX1OZOazlXFaRP8+EoHLtpIetJ4LHw2CaZUr8K8TT
	nPDBs/w2s9nLjfvbMWTuhnuOVH6713bvNFEdj+ZcmB0alJX364jl3Qg/GspIUxG9jj7FeopcPma
	frsW1M9PeCTpl1SB2/RyFAv8eRcZ7/MEiRSDJ0R/qe+XIIYw9btKwBFIrNSlIW3vopUA0Q5aqRq
	jgNE+Ux8aOefT9vrbi8Im5bQA7jtq3a8e18UfgsxYuGrzh8Bdve+Q6GUyDyDSV33pg299VVHijY
	xapNX0qVN79GUzBST8QZ54+rMbSrQ2f1VYn7WRJRybYTNfaDI4XNgZE7dy3espeUaH0oM95yZSX
	h/AVnusaMOmMz5aRZ
X-Received: by 2002:a05:6000:2990:10b0:498:1d72:106c with SMTP id ffacd0b85a97d-49c747700fdmr8536126f8f.55.1794663618560;
        Sat, 14 Nov 2026 05:40:18 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm11158108f8f.59.2026.11.14.05.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 05:40:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 14:40:17 +0100
Message-Id: <DMUZ5O4N7A3R.1ICN3JE02JJZ5@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/3] expat: fix CVE-2026-113351
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
In-Reply-To: <20261105091719.1622520-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 13:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250202

On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the allocation-tracking reset fix [1] from upstream PR [2],
> which is referenced by the NVD record [3].
>
> Snapshot retained allocations during XML_ParserReset() and exclude
> those bytes from the next document's allocation-amplification checks.
> Include the required counter extraction, accounting-settings
> correction and both upstream regression tests from the same PR.
>
> Retain Expat 2.8.3's XmlBigCount counters and adapt the accounting
> regression to its existing protection-setting APIs. Omit the PR's
> comment-only encoding-check change because the later check that it
> explains is absent from this source.
>
> [1] https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd9=
5faa29132e67aa3
> [2] https://github.com/libexpat/libexpat/pull/1431
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-113351
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../expat/expat/CVE-2026-113351_p1.patch      | 39 ++++++++
>  .../expat/expat/CVE-2026-113351_p2.patch      | 65 +++++++++++++
>  .../expat/expat/CVE-2026-113351_p3.patch      | 80 ++++++++++++++++
>  .../expat/expat/CVE-2026-113351_p4.patch      | 95 +++++++++++++++++++
>  .../expat/expat/CVE-2026-113351_p5.patch      | 70 ++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  7 +-
>  6 files changed, 355 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p1.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p2.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p3.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p4.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p5.patc=
h

Hello,

I think master fixed the CVEs of this series by the 2.10.0 upgrade. But bla=
cksail (at 2.8.5) is not fixed.
Can you send a blacksail series to fix those?*

Thanks!
--=20
Yoann Congal
Smile ECS

