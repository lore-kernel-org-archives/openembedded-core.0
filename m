Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73FEC531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 21:53:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18655.1785102786813873853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 14:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d1JhA1E3;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so18967995e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 14:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785102785; x=1785707585; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgbSww4loE7dV6DB89XsmF5eUIBgjDyu84ClcHqVack=;
        b=d1JhA1E3fQF6ggRKwzvUTrc5sxm9xapKm5ylw+9LbspxRldfiTcMp4+eEVYNEcLorj
         H1TcJezBgD7pYa4Lf1LzErFUrmmo0tfrrOQqy81f0dZDuvapL39ZZMhwA4OKtdo+PuVC
         /slNNd/k9fXDIzil6Nk1lhzDmksrdQvr33VIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785102785; x=1785707585;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgbSww4loE7dV6DB89XsmF5eUIBgjDyu84ClcHqVack=;
        b=VrPp5qU754BkamL97ZIyQkk2lZha2x++ipMYlL5Fr+zcJzSH7tGkHyQEyTcpkmGllo
         oJ9Ookii2QAhx01II0FuAaqWmEtG3Ny7/pRfCu1fCIVro8fzfZn5f1XU/i3V29dybLHy
         weUuJ7Kq+5aK1BE1rDND1v5TYS1gsHxv636NoZjhiE7JZpe5wLFPHYTuS2sNWBDY8fZp
         fneGyhFXYFoFvC1p/KyrsGk1YPHQskBpfNyvGSsQViviD00xB0p/b8rPp1l0ZZ3WySt8
         qtWFsKQHX4VRHntey2KCLIrINixp2rn4vtTJigox+sTeobdfLO4pvB55QQyfok11nqcy
         ZjEg==
X-Forwarded-Encrypted: i=1; AHgh+RqiPsSZS/vMaExYVs5Zk3pFpFUAPrI3yL8qK9SVClidHOcDqkP92n2MAbI6sRJxaoj/PKzjVslRrsotr/BzjrIgiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/m8+5k4aqJjzuXT9bADm9U7esQ1XS7Lm1Bub6WcKoD25xwMCB
	rRqDJddfxf7LC/BEIeO/Fnlu4xZks3SN/CW31sbjNtbtClhA35sYEF+IzwbzH67SZ2s=
X-Gm-Gg: AR+sD103iM9d/p3US8UCxlW22Z4uzF+1/zNbB8LA/fLJGGANwmoLDQav1XGPyDuvvCq
	cqC+76RpBS3tMHwHPFlSb/106DBU7xPMS4zbXFLWyMIlOKcLHJI6Haf/BBHYLKKp4ZWzLJSZtqj
	v/cVPvkAGKfy2CrNhzwA+QXR2f2O0OxKhBWB7mmQQ/ZyphxDSGdO+gdGHApizjJUKQhgUZawEny
	OuWBwv06jNqlidpJAujzwOyyqXbijzo7RDanwiGr3Uirl7D+vWhXKvO9lJMEF/45327xL0aFxk3
	2noJoI1SuK2sjxXWSyUfmISjIKkxv/RGMA5FeeZiNPsbxlALeZ0gGXZw+GD/6RjXvMkftd+NIU8
	mBXUscCbNzxjwRyvl4IT7f6cFrPCd3XVBaBtwH81urM6lK6mGkoy+68zrEyKhMErjVj4ZoHn38D
	if75Vfg0xQ7ECGamxxAnlevc59okyt+UHRZQjNpLrtTsaLHDfO4zW5i/c67Gi8p03vi8y9rcp/m
	gmh
X-Received: by 2002:a05:600c:c177:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-496b5c7f174mr80784105e9.15.1785102784945;
        Sun, 26 Jul 2026 14:53:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4eecb4fsm168486045e9.7.2026.07.26.14.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 14:53:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 23:53:04 +0200
Message-Id: <DK8U4I0VPN0M.27M74X5RM0KA@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][patch 04/10] vim: Fix CVE-2026-57451
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260722123336.587556-1-vanusuri@mvista.com>
 <20260722123336.587556-4-vanusuri@mvista.com>
In-Reply-To: <20260722123336.587556-4-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 21:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242024

On Wed Jul 22, 2026 at 2:33 PM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch per [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-57451
> [2] https://github.com/vim/vim/security/advisories/GHSA-f36c-2qcp-7gpw
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../vim/files/CVE-2026-57451.patch            | 177 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 178 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-57451.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-57451.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-57451.patch
> new file mode 100644
> index 0000000000..22a0cfc03e
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-57451.patch
> @@ -0,0 +1,177 @@
> +From b2338ca90643e2f01ecb6547c1172716aaec4f79 Mon Sep 17 00:00:00 2001
> +From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
> +Date: Wed, 17 Jun 2026 21:06:59 +0000
> +Subject: [PATCH] patch 9.2.0670: [security]: Out-of-bounds read with tex=
t
> + properties
> +
> +Problem:  [security]: Out-of-bounds read with text properties
> +          (cipher-creator)
> +Solution: Add out-of-bound checks (Yasuhiro Matsumoto)
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-f36c-2qcp-7gpw
> +
> +Supported by AI
> +
> +Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/b2338ca9064=
3e2f01ecb6547c1172716aaec4f79]
> +CVE: CVE-2026-57451
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/memline.c                  |  7 ++++
> + src/proto/textprop.pro         |  1 +
> + src/testdir/test_textprop2.vim | 59 ++++++++++++++++++++++++++++++++++
> + src/textprop.c                 | 20 ++++++++++++
> + 4 files changed, 87 insertions(+)

Indentation was changed between upstream patch and this patch.
Don't keep the upstream indentation. (Even if unfortunate I admit...)

Regards,
--=20
Yoann Congal
Smile ECS


