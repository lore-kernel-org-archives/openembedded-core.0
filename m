Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27889C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:34:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.15955.1736926448802987410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kk8XayOP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72D1740002;
	Wed, 15 Jan 2025 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736926446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCE4MZs1RiLb3zGMlLJrrCOzFe2sOSNFqnQ7t8Bbaxo=;
	b=Kk8XayOP66u3UQZ2Ot0wHxhZXZ0qsXloIluKaZZjiIB4Qw4k+8mK3JQcGbf/RWzTNbZfpp
	UqF7JwqyJplPV/dW0AN+Pi2nHYhMOG8lq1T+88n5Q2vzD6tWVZj81xRBoY9+3zyrEAfXNe
	J5lHCTii7Qh8IozbA6WwEkUJVIVKqQqwy4Lo9RIO3ph2BqUlfyhH0wjU82h50CcN9FiZB/
	IbyoKH2gPvCvffHSB+qMiq6ieVf4//cDfYMucqCd7UV+RryZSQRxh+pFOUqIhOKI0LvWkL
	2XDKZF2Zo8Cb9O6Z5LYedZkq6/br8MnWoSjs/SZY/A1xVEhc3kPe/tSKT7nV8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jan 2025 08:34:05 +0100
Message-Id: <D72H1DJGYUS9.1MNU1HLIWJ4DA@bootlin.com>
Subject: Re: [OE-core] [PATCH] scripts/install-buildtools: Update to 5.0.6
Cc: "Aleksandar Nikolic" <aleksandar.nikolic@zeiss.com>, "Steve Sakoman"
 <steve@sakoman.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <aleksandar.nikolic010@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250114111224.22466-1-an010@live.com>
 <20250114111224.22466-2-an010@live.com>
In-Reply-To: <20250114111224.22466-2-an010@live.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 07:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209816

On Tue Jan 14, 2025 at 12:12 PM CET, Aleksandar Nikolic via lists.openembed=
ded.org wrote:
> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>
> Update to the 5.0.6 release of the 5.0 series for buildtools.
>
> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> ---
>  scripts/install-buildtools | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index ee6bfb89eb..972671d50f 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME, stream=
=3Dsys.stdout)
> =20
>  DEFAULT_INSTALL_DIR =3D os.path.join(os.path.split(scripts_path)[0],'bui=
ldtools')
>  DEFAULT_BASE_URL =3D 'https://downloads.yoctoproject.org/releases/yocto'
> -DEFAULT_RELEASE =3D 'yocto-5.0.5'
> -DEFAULT_INSTALLER_VERSION =3D '5.0.5'
> +DEFAULT_RELEASE =3D 'yocto-5.0.6'
> +DEFAULT_INSTALLER_VERSION =3D '5.0.6'
>  DEFAULT_BUILDDATE =3D '202110XX'
> =20
>  # Python version sanity check

Hi,

I believe these patches are both for kirkstone and scarthgap. Adding
Steve in copy to be sure he see them.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


