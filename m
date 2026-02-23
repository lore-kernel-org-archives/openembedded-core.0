Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348A0EA4FD8
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:25:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37539.1771860311397405367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GLjvQEzW;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so55740695e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771860310; x=1772465110; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxVunOwn7lebGagAG9QAuyq0uRsFMo0p01QJgPfWuYg=;
        b=GLjvQEzWsYg27PD0G87dOQOnPG+6/RIvHO5zCc7nqcCZKWLnzxXMHeZjQw40GBJ+b4
         TvdrCx8eMR90UCpz9NO9X5t1SXHAeva5bTUvRqpyeXeSQRFlDkeHxAIlVhMPx6cYgwLU
         8KLYZt3wGBMkJTOqxGjwodN+fCTUNiO/3qJgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860310; x=1772465110;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxVunOwn7lebGagAG9QAuyq0uRsFMo0p01QJgPfWuYg=;
        b=hBJy5ud853ARU05YmS8PLzHev2nu8sXVNlaXs8pUqAwjcVPq029S/KYFmgS7M5I2ma
         NHmnt2jjx0wp/5rZkdqy3J9WJfv3fqM1DW5fh6rCYkQgCf2znkDMupKdmrAmy8I6HUde
         ydG5r1SQ9XKvrcPQZ13f2lOjymsaR+2V6PyE6FH5LV7jrb0UZuk4Ka5mjfUedYTac5dP
         EDUN7JtfLk2nRlIsv0QnsaPbA7I/PLzM0tD/51Mn9xcw2NMNALGt8adc6299VIhqle/I
         VUGLA2yNiCDf1rjNIGQqpUo4ZXA2thx4JdVKtLLN49G7O9F0lmXL/sdFn0ZyoWAyu6rk
         Au/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZtgtwXb+mZDY+DRuAb0Fu4FKSRVMN427CKqtzvZvPDQMlKPBu32pnxnK1JaFYNbHQGDCOHPokFlRo4MyXTurIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjAT5OoAoiZrKkuqZ9Xqnb+OmVst0a8RYkycXQimAbpUJUGUW/
	NBtS6zAb64OniCCK4FyxAeQZyMxeSDaf8sxBZnbA+RXcuRZIAc4dYQ/eb3evO7tioCOtAHX6Stn
	SXKet
X-Gm-Gg: AZuq6aJl6l++1ckYo7rTMMwr+T25Wuyk0UBwiAoIyEIalWMjWUCsCOdas1icsQM9evM
	OHgeQUzak+DJvLR9WKruymZ2Kz1pw0hgdJELPixlhP8LsSvyKlzq3AGWdlElg0CcjgNZIRENp69
	CWpF6j4DYISAvnIlSX5bivvapp2jAPq1aGiK5pxY32Z1e1T4oOYOwMSbSZg2lT2i3YVdrn6UyL0
	iVejKYN74/T4TdJH58lh/0ebL7a17dQGv0V1Vj1u4VjnpBOWJJLMocsOWMte2PEby0EA9tFqQvF
	Xl6qzgqlfEb5c/d/RNZE3IHHRk4zLEaIEJ5VBzqwn1/Yk15ZfDLHtcia9KsrToLfNk9Y+xSRIJD
	QPo4Np1uiuWRJmbL33/3QJsrAtZHpS83j5Cvj32wnlJopfaAt7w74XR24VlXWpmA7Tj76iCg1Vs
	qNrNvEPMH5doLKAQZN5ADSi3xkZaFtn2s2oCrCoIecAORQEfXQsE4yPWC8o1lr+RHfyDpX4+/tO
	2sykyq6PmcZz7do/XRzhYVFaLM=
X-Received: by 2002:a05:600c:1d0a:b0:483:9139:4c29 with SMTP id 5b1f17b1804b1-483a95b58e6mr158075345e9.2.1771860309711;
        Mon, 23 Feb 2026 07:25:09 -0800 (PST)
Received: from localhost (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3ddd3c8sm132844365e9.2.2026.02.23.07.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 07:25:09 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 16:25:08 +0100
Message-Id: <DGMG24SACBZT.1OZ48FG1IZ0IT@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH] libsoup-2.4: Security fix for
 CVE-2025-14523
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rsangam@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260218114518.16602-1-rsangam@mvista.com>
In-Reply-To: <20260218114518.16602-1-rsangam@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 15:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231672

Hello,

Thank for the patch but it needs improvements:

On Wed Feb 18, 2026 at 12:45 PM CET, Rohini Sangam via lists.openembedded.o=
rg wrote:
> CVE fixed:
> - CVE-2025-14523 libsoup: Duplicate Host Header Handling Causes Host-Pars=
ing Discrepancy (First- vs Last-Value Wins)
> Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/383cc02354c2a4235a98338005f8b47ffab4e53a
This patch is not merged is any meaningful branch.

You need to justify why you think this patch is the right patch for this
CVE.

> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2025-14523.patch  | 79 +++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-145=
23.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..3b534a64d5
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> @@ -0,0 +1,79 @@
> +From 383cc02354c2a4235a98338005f8b47ffab4e53a Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Wed, 7 Jan 2026 14:50:33 -0600
> +Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
> +
> +https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/491
> +
> +Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/=
commit/383cc02354c2a4235a98338005f8b47ffab4e53a

The proper syntax for this line is:
Upstream-Status: Backport [<URL>]

Regards,
--=20
Yoann Congal
Smile ECS


