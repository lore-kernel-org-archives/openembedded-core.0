Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5872F327BD
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:52:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15669.1776757925504829988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 00:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x75AmUDt;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so61981045e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776757924; x=1777362724; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPLnNEP1oPAkFDmSP0YuBUhk6isBktyNQ9NQRxHC83s=;
        b=x75AmUDtBZ70zvL4PDCU8gfYOqpNwmGvvnrYpo2bnYTMd5bJZxIXvlJ6STRCwSVBaS
         zHCaTGv7enb+e0UxqiVSC3jmD70JxH9RzCH8Q9r34tmVJQT0khZwaKr54Hq04eR/axXY
         j/Ik//plejJA4iflwL/AVdNLH80KnzPawlZPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757924; x=1777362724;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPLnNEP1oPAkFDmSP0YuBUhk6isBktyNQ9NQRxHC83s=;
        b=g0C+QYzMxw5it7xz9f+If/Mc6gN7l7B3+2u04cnTZ/k8JEafPChguC4tZr4XMCv7EQ
         80c2441vVLzMoj29NATCubIPZLshmacPT12KFzZfwY+DBprLWxe4n+SS/DT7IRBgtwYZ
         csMH33gQaHMjLIf6YGcnEmrXbmnjmVgQHXbLACLosMhJdLNP4cuMpw6o9WFPYNq8Itqi
         O1u8jNDVrb9QA/2Um2cT4g3WUs/FgKSwkqERoa9v4ubJQtP7zYfd/UO7UrkG+ezBjBTV
         WS4vOJjo3aYybSA4/2KZFBdo6aP1YGxPioMDs4sBS+9qY1aPIYIkPCUKYZ2F1LP9T6Bv
         s0og==
X-Forwarded-Encrypted: i=1; AFNElJ/pp8qfDdhhHef972y8FoKq2WiizC9CIW1TSyKmSyglxjjV93+sbmxYiz7GJpBROP3OGVKmK+52NCd+d4G60FVPpw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwncsOeix4M+OmAbwpJ3K4xsPRZGLTrIvHdUIHdvGS5fV84bdB2
	kre43Ca0Qx+JPveUW05efs2N4jCxa7r83PFofnh7Wg4FrMOy58kO/n8WjeApNYpgDc1wYiR9sDr
	rpApJ2No=
X-Gm-Gg: AeBDietWI1+WajMvfQuXzKAQuISmbKEzA+qz37N34ISAoUDWAEqEmxSV4AH23COD5jR
	xdkytLRwclsWm+SavefCbAixoWIN09c+ieTvukXrp6O9w+x/id1tVfHrfJXISC9IOnfjYCCgszf
	P0e9cKFzLCpAwunOeZtf3bldDvsRhrDWgheBlQtBfJw4t69X1TzcAk8BnuQ1Y3X/BUuPFOvwYRi
	g+rLHs2MEePlts5pnp258uqAYjzVzvMXzZLxAVW0Ac9lMC37AePWyKDz/OdMrTTMxup68BIvv63
	QiJFXEw1SSSn4cbMDlBlV9kTDRE+3x4kH23eOKcpFPLdxvPhWqqogTRPATdiq4AoPhTIf/5aUcr
	GJe6u+CtF0tHrdR0sF01Eu9dEbk7BwuWvDY4wbiz1BC8A/0pKSKtZv1NwxnYf2rQjX/KMZQp6Ur
	wbtjubT9vsqbl0TL3xRZITlbpS0wNrya6hRqpIIC3/rniM4Qtssm3Q9QjY97rGX4uQwUm3cR3uh
	k7+0K/ji3zk/nP6O99l9Q==
X-Received: by 2002:a05:600c:c085:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-488fb765b04mr184880495e9.17.1776757923677;
        Tue, 21 Apr 2026 00:52:03 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb755938sm144052095e9.3.2026.04.21.00.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:52:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 09:52:02 +0200
Message-Id: <DHYO49JUR52Y.1OUCD7ZQJ693R@smile.fr>
Subject: Re: [OE-core] [PATCH v2] oe-selftest: Add static postgres
 user/group for reproducible build test
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <xiao.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260421070646.1290375-1-xiao.zhang@windriver.com>
In-Reply-To: <20260421070646.1290375-1-xiao.zhang@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 07:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235603

On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via lists.openembedded.org w=
rote:
> This adds the static postgres UID/GID entries to static-passwd and
> static-group, fixing the "Nothing PROVIDES 'postgresql'" error when
> running reproducible test.
>
> The selftest environment requires static system user IDs to ensure
> build reproducibility, which was missing for the postgres user/group
> before this change.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>

Since this is a meta-oe recipe, shouldn't those static IDs be defined in
https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-pa=
sswd-meta-oe
https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-gr=
oup-meta-oe
instead?

Regards,

> ---
>  meta-selftest/files/static-group  | 1 +
>  meta-selftest/files/static-passwd | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/stati=
c-group
> index 6a9ece20a8..a08795c4ea 100644
> --- a/meta-selftest/files/static-group
> +++ b/meta-selftest/files/static-group
> @@ -31,4 +31,5 @@ audio:x:532:
>  empower:x:533:
>  cmake-example:x:534:
>  meson-example:x:535:
> +postgres:x:536
>  nogroup:x:65534:
> diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/stat=
ic-passwd
> index 98017c8153..ba1dcd54d8 100644
> --- a/meta-selftest/files/static-passwd
> +++ b/meta-selftest/files/static-passwd
> @@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
>  xuser:x:530:530::/:/bin/nologin
>  cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
>  meson-example:x:535:535::/var/lib/meson-example:/bin/false
> +postgres:x:536:536::/:/bin/nologin


--=20
Yoann Congal
Smile ECS


