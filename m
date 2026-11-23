Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55124.1795444539956020015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gwvjXwBP;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2964738f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795444538; x=1796049338; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GKEQ/bVg0tExvBBQzH3RCMblAhpvzoYi0flzpZKFx70=;
        b=gwvjXwBP8uyagKBkGRG/73KusEpe/40t9kEY7iAExaZwSaDkamUb9CXiqTQ4P4BICb
         QXWjCid8E1w9Jqe4Te++gKZI5Obii3I0/O7IU9zslDOw5USeFWjXOWNmJawxDZiAr8tp
         X+65u0mKdGMVettloGbHKFAX4MkXbT6pJ72150rmoAcMDV5pJlgDby1QTbNHIqaa2dtm
         gujUES7SpMdWpNUaqFNuwPLW/NUCwE6Ti9RJ8PxH++sKX6zl9rJ0mt859I3xSa36FYlp
         WvPXNFYSxyN5d6rBanvOEor+HCZNU2H1jBZJoL0EbSOhUz6QtRI95n5XqozsGtPRv+S7
         1y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444538; x=1796049338;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKEQ/bVg0tExvBBQzH3RCMblAhpvzoYi0flzpZKFx70=;
        b=aLN0Yr+GbHU0lYzIKarYESreZJLV4Wamjq278QMgh8bVNRM+yEsj0V1U6lvkCaoI8N
         hZtP/nZMMoxWFoA0evHvqWlYHG0uN+UubbNcUU/tEO1I/kJQmY2i9ZaVxNsgiW8nDuwt
         2elffZcLBsJk7AvasmAym2CQc698NQXk/ZGV+dHTzEUoRfYnBi3Z+bFCEoxYSXPZ1rze
         /mI6YrQoRL/aickALKE0BsWm62X3CoXcemLohLM2/EXgwZNhCTEVYHY1eKXdVNuiboLs
         FNjCJZIivEbUIx4VihL1tqc0D+QmzqtL3apMpB4TdbqD0lX4OEC7au/xVlxl2S5d7b9O
         ValQ==
X-Forwarded-Encrypted: i=1; AL+hErHUk5S3WaMKwjO8aRli2K7vc2iPkwxi8ce0a65fy3vzOPbkCRexUGp1zMdM1N5VMFtyChU3DuLdEXCQh1rQ5a2+xQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8Lv2TnpwyQBDcIPbpoi1UExRWIGzKZt0mDGYyldGUCzoE9GHBk
	SYl2uQ4h4dYVlmGoRnXRAvjLE8TOuKRj7EPM4+4qDl6bmL1jpPA8wo2HgpaOIMmyGvlbs6spxho
	ZpMy92zg=
X-Gm-Gg: AZFdTZcMZTinVvN0IAJSOl0FSU2LWIP6mQV45b3trHH9lICbFnfk/L/tlrsrRRW5hXW
	fa4XhXAY4Cmd6llze0M2/1tGuA/uTIEp2DJTrRGuQVUDuJO2/q+8x2hnXMUqu/ubSbAOWzahOnn
	+yU0nQpgJTk8MtG7+tnjfw0Bm1E9H92xSQSLEF/fkesg1s5z994Xl/EE83/rGWJn79/GirxOuvE
	ysl9NZYBYO3ehw96u0el+39DESgmRtX3J/BO0v49IaEOoT/vnnqB5LR6fA23RME5ktFAr7Qbetv
	uEFBo3YohgTgJ/dbbrq/byK17EIaCHDSXnd8/cWH7NWLHpx8EyVQ9MQZSzio4MtQvDpStEoxS0/
	PUB3b/ONUqhKL2AaYMjHQ3VGjW5Jlp2gFvOg6Fibaz+QKvrMN1vJCojlI32qPsS7Aunj8T7tGN+
	k7iaszOS0e20mOst9KVYoCiJCTAnVXaAaGq/oJipNUAIfcfczE8nuKuN29IAPJ5tGSgUmjKTMW6
	Xvffijn4elxqsB6Y7qXBHmbB10bslALFm/kTwmwPoL/yp5MSinB7Wgohbei9XgGvV1sHUqSVgu6
	VFfMefDffFdi1jsaWdGYTPL+Mrbd0Kyq/e25rNqut8AiX39j5nhl6Nv145OZWhA/52MMEO6ryt0
	XqDPyWtyyl7mqTg==
X-Received: by 2002:a05:6000:298d:10b0:492:9630:6a7f with SMTP id ffacd0b85a97d-4abb5db7829mr15953844f8f.55.1795444538072;
        Mon, 23 Nov 2026 06:35:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm6250825f8f.19.2026.11.23.06.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:35:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:35:37 +0100
Message-Id: <DN2NYXS7DWXP.6I9DV9LMCYLU@smile.fr>
Subject: Re: [scarthgap][PATCH 2/3] sqlite3: fix CVE-2026-119374
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>
To: =?utf-8?b?Sm/Do28gTWFyY29zIENvc3RhIChTY2huZWlkZXIgRWxlY3RyaWMp?=
 <joaomarcos.costa@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261105141827.2142719-1-joaomarcos.costa@bootlin.com>
 <20261105141827.2142719-3-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261105141827.2142719-3-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 14:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250922

On Thu Nov 5, 2026 at 3:18 PM CET, Jo=C3=A3o Marcos Costa (Schneider Electr=
ic) wrote:
> This vulnerability, marked as High [1], was fixed upstream [2] since
> 3.54.0.
>
> Backport the fix to sqlite v3.45.3.
>
> Some function/macro definitions are required to compile the backported
> code, and they are provided in the *-pre.patch.
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-119374
> [2] https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21=
df5960704d9
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> ---
>  .../sqlite/sqlite3/CVE-2026-119374-pre.patch  | 73 +++++++++++++++++++
>  .../sqlite/sqlite3/CVE-2026-119374.patch      | 67 +++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  2 +
>  3 files changed, 142 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-p=
re.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.p=
atch
>
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre.patc=
h b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre.patch
> new file mode 100644
> index 0000000000..1192cef006
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre.patch
> @@ -0,0 +1,73 @@
> +From 315df7b9dc2ac2abc55c3636439fd532e3090ef6 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
> +Date: Thu, 5 Nov 2026 11:48:59 +0100
> +Subject: [PATCH] sqlite3.c: add fts5IndexCorrupt* and FTS5_CORRUPT_* hel=
pers
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +These functions/macros come from multiple upstream commits, and are requ=
ired by
> +the backport for CVE-2026-119374.
> +

Hello,

> +Upstream-Status: Backport [multiple changes from v3.54.1]

That is not precise enough. I check that the submitted patches match the
upstream commit and here I don't have enough info to do it.

Ideally, backport each commit you need as pre1, pre2, ... with each
having a "Backport[URL to commit]".

Thanks!
--=20
Yoann Congal
Smile ECS

