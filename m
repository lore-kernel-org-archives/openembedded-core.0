Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1ABC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:41:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.18253.1736779287024985029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gW3yhBrz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD854E0002;
	Mon, 13 Jan 2025 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736779285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oo6ffZgsBaU/rfX3hZgEGo1A29NN74doYMldzN7NNew=;
	b=gW3yhBrzpSxcQzoaLmIFmcLZJpvNdqJJKinq1a6xFI7JhkFElFvAb3O6TWu/29Xb4EjLNb
	Z4vYzSNWaBTf+dVpDbkc+ZeN3mQKWVdUuyP52PooNjMlLXRWEHCMXZP3ZeOiM3trgfsSz+
	Pha9WMTRPBFyOz4jzAF3sYODaJ9scsonV16/e1ISmK0aA+y8fmjwou05Cq71hTLTls/nHO
	u/pUMRTP4V87tAv2Wt8//5loush/Rx5Bw/bAuS1CzOzKKyCuOIcFBlaI/P6R3lCB5HZyYu
	FqBKgMfGDjAh+ne9KbvuGTweIr3LLap4PDrdJyJgsuSO0p3UWvR5KRU87CeH3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jan 2025 15:41:25 +0100
Message-Id: <D710VH3BGP1N.20TK4UIP46NGO@bootlin.com>
Subject: Re: [oe-core][PATCH] libsecret: update patch Upstream-Status
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250112231653.673597-1-f_l_k@t-online.de>
In-Reply-To: <20250112231653.673597-1-f_l_k@t-online.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209731

On Mon Jan 13, 2025 at 12:16 AM CET, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libsecret/0001-meson-add-option-to-disable-pam-tests.patch  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option=
-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-m=
eson-add-option-to-disable-pam-tests.patch
> index 87ab8a32cd..e1daffb50d 100644
> --- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
> +++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
> @@ -3,7 +3,7 @@ From: Markus Volk <f_l_k@t-online.de>
>  Date: Tue, 3 Dec 2024 15:58:17 +0100
>  Subject: [PATCH] meson: add option to disable pam tests
> =20
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/m=
erge_requests/151/commits]
> +Upstream-Status: Rejected [https://gitlab.gnome.org/GNOME/libsecret/-/me=
rge_requests/151]
> =20
>  Signed-off-by: Markus Volk <f_l_k@t-online.de>
>  ---


Hi Markus,

According to the documentation, I believe "Rejected" is not a valid
upstream status.

https://git.yoctoproject.org/yocto-docs/tree/documentation/contributor-guid=
e/recipe-style-guide.rst#n286

Maybe you can use "Denied" with the appropriate justification ?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


