Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382CACCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:56:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36829.1792421777039096962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=me/Eb2ME;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so807652f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792421775; x=1793026575; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alWfpvd+vFZqUIG983AB74oxTEB7jOC9d+NP16Nh9zo=;
        b=me/Eb2METJkQ5OOK0BAOZpnmDUnEXcp+yZqSU2aPqqQHHtEv0Dj6Y81azqdUCmsNst
         0aK812Hrbv49Ly0G2IyvsbZHpCcAzzvHmBAxhatVOrgDxjv9GbEKzvuoXk0vBxPS3ArC
         XB4wqA71jJFcffhB8rryg2S3Eo33EL0vnfDjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421775; x=1793026575;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=alWfpvd+vFZqUIG983AB74oxTEB7jOC9d+NP16Nh9zo=;
        b=MMYejUm1dvtscqsPHnjO95qOGlU8eOXNgjaVruGx6x2kFYhjFv31cyMkbkRbmq26Ok
         OTUN+vnnHLDF+LrZHsDDAUGYy+63r3V3hlLlR4ZKftx+9kxl/2J1iFMR+dJh8XkcGq2h
         q23wcvaEmL2uW7a6DqCXgsdXw2xWQfbG+UTC/pdovCfDlOammUxeug12PDzRXc/r0LoD
         z7TL2DJOiP6NMqLE0wDoUdCdYD2tG9AT3kA/FgytXReMRCJLOt3I2ZkLp1U/BjOBM8mq
         sMOsJ/o3iCRMn5M+3e2JSEw/l9ljsiqvEhCu6QUMK8Bqq6uF0ZMI0gDncKEeUi4YvzEw
         52WA==
X-Forwarded-Encrypted: i=1; AKwUvBwbvjGZYWEpxj0QcHgxW/1/DWcVxLI71dJ/6pRXBhhgALpLKzTIF0hiW7Zd3p15iRc4rxovbfr/W7aNj8ujx5EMOw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKmbwB4hHJvCVtQTYsBJZ2X+Ld7b2VU7zU46n6S1PDEXD0bNO70
	e6r4ic2+KeuxwTbgf4gLFoHy5NUfggy+QqbojossrL1AQzSEb0vwFdMm+6GonkLftN0=
X-Gm-Gg: AYBFou1GkI+fDYUC8a1aji0TE/i5NLV4G0BfarmiNkNzOkg2myIU5LkQ300rvGBZEcv
	u0zITco+gEyaKYj/Fnix6cncQhwYfWAXEilF6iE8V7smCQo0DMoINSSwU/pUPCrDba7eZIyWSh9
	1RhY/CEnIresuuZ85Tzd1b60ZcBGgEDw7ox9GMXnqAw1hCJmfyh3B/qKxcUymOTSSkJmKsnTPWk
	86+Ktbz7k/5YNV0/rWaIUcL94wH5Az7ENtr/T63Qr4Sz6Fy+YScU0HjQDFukt6EC3PmgPga+eOI
	NmPsVS1gXma3A00NhNn9ZxtieeDay3rmAOb/sLz0QZmZUdptATtUdMysZ0P08X4SqVIgUGV1aOw
	6Hy24+l3d+WrVSutbeNm484V4YTiCKdrr22dyygXhCpI60dSsPuiFG/ChKEct87o8cjcD4foYKK
	dSczb59Jeb0AU408bQ86RqEHGA4kbDcL901is+uJH87Hoh587VZo+FqjZtOaP9o3K577NyOJh8y
	0V1KLHMulXp8kRAgUGhRW3zeL8tOfhL/PB2aZWKPOGR+QYbQe/j//GFpATJJw==
X-Received: by 2002:a05:6000:41d1:b0:48d:fb06:d034 with SMTP id ffacd0b85a97d-48e07fb528amr15491838f8f.51.1792421775153;
        Mon, 19 Oct 2026 07:56:15 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm20205140f8f.3.2026.10.19.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:56:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:56:14 +0200
Message-Id: <DM8WHNPDNECC.29BQ7CT8Z4HTX@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] sudo: fix CVE-2026-82474
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261016065612.3926487-1-dkelaiya@cisco.com>
In-Reply-To: <20261016065612.3926487-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248182

On Fri Oct 16, 2026 at 8:56 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> The recipe enables Linux intercept support. Check execveat commands
> and log subcommands instead of allowing this syscall unconditionally.
> Resolve directory file descriptors and AT_EMPTY_PATH to paths for
> sudoers policy checks.
>
> Apply prerequisites [3] and [4] for proc_read_link() and fexecve paths.
> Include follow-ups [5] and [6] to reject failed pathname rewrites and
> correct relative-path moves. Keep the upstream source changes intact.
>
> [1] https://github.com/sudo-project/sudo/commit/71fbe42dcd5a1c8f799540583=
a2dfb2ae6221edf
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-82474
> [3] https://github.com/sudo-project/sudo/commit/1a312af6348594df371e6088a=
eed99685977f575
> [4] https://github.com/sudo-project/sudo/commit/e822b729da31baf9154946329=
a9d6ef569f0d182
> [5] https://github.com/sudo-project/sudo/commit/d1121181a87b2b47b4dfbb2af=
42399fcc5f1e3cd
> [6] https://github.com/sudo-project/sudo/commit/02b14c043825b52be6cd537b7=
f11bd5e7e10512e
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../files/CVE-2026-82474-dependent_p1.patch   |  94 +++
>  .../files/CVE-2026-82474-dependent_p2.patch   |  34 +
>  .../files/CVE-2026-82474-regression_p1.patch  |  39 ++
>  .../files/CVE-2026-82474-regression_p2.patch  |  33 +
>  .../sudo/files/CVE-2026-82474.patch           | 617 ++++++++++++++++++
>  meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   5 +
>  6 files changed, 822 insertions(+)
>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-depen=
dent_p1.patch
>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-depen=
dent_p2.patch
>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regre=
ssion_p1.patch
>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regre=
ssion_p2.patch
>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474.patch

Hello,

I think this fix is also needed for blacksail and master. Can you send
the relevant upgrade/backports so I can merge this on wrynose?

Thanks!

Regards,
--=20
Yoann Congal
Smile ECS


