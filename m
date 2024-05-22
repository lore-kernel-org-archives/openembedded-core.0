Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A231C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:38:32 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.5986.1716370711393213389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=0x1190Pn;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=62UNvHhBByN1RKUTi8QkOd3DTLVx0IK8oE+XkyBUZ3w=; b=0x1190PnaH5pCV1tiv0O3zKuX+
	Bz+hTld453bN8w77bdT7hgYsdPmh0MT6nzdhD8SRmhd54FL6j4Laqt1VJRJAJX4k3nJoz3Qp63zvj
	InvzJAz6CoqteOKI2Q4ZDUToCVp1RG2osf3MYYflI5R43xKyxp2IvgWa8pR5uW2cAVbOFD8DGdDzO
	s0CPwpQHyNM1t34ckde3TqyMxyDKWtnWpG1FZD5ig/xoXnBfxXh/5imfF2l3k962DftOCM3VSZOHU
	o/tGCQKQZI0VDpf+Y8OYbj6/GlMLpI/GxWh7avCvjXbCvwiJ92XXI+NONyJy+qwIMeFrGmT1eXsKA
	gco8gJdA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s9iQW-0006Mg-Tv; Wed, 22 May 2024 11:38:28 +0200
Received: from [85.184.138.13] (helo=[192.168.8.223])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s9iQX-000KRS-0M;
	Wed, 22 May 2024 11:38:28 +0200
Message-ID: <96b1f8777059b63c09a0b25655182950e687567b.camel@geanix.com>
Subject: Re: [OE-core] [PATCH 29/42] ofono: upgrade 2.4 -> 2.7
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2024 11:38:28 +0200
In-Reply-To: <1716369289-22526-29-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
	 <1716369289-22526-29-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27283/Wed May 22 10:29:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199741

Hi Wang,

I've sent a similar patch that also removes the two patches, which
aren't needed anymore:
https://lists.openembedded.org/g/openembedded-core/message/199693

// Martin

On Wed, 2024-05-22 at 17:14 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Fix issue with handling SIM7100 modem enable operation.
> - Fix issue with handling QMI NAS indications earlier.
> - Add support for handling QMI default bearer.
> - Add support for handling QMI DTMF tones.
> - Fix issue with handling ATD*99 for non-muxed ports.
> - Fix issue with handling QRTR discover timeout.
> - Add support for QMI voice call feature.
> - Add support for exposing modem capabilities.
> - Remove support for BlueZ 4.x services.
> - Fix issue with LTE provisioning support.
> - Fix issue with SMS and address length checks.
> - Add support for QRTR services.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0meta/recipes-connectivity/ofono/{ofono_2.4.bb =3D> ofono_2.7.bb} | =
2
> +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-connectivity/ofono/{ofono_2.4.bb =3D>
> ofono_2.7.bb} (95%)
>=20
> diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb
> b/meta/recipes-connectivity/ofono/ofono_2.7.bb
> similarity index 95%
> rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
> rename to meta/recipes-connectivity/ofono/ofono_2.7.bb
> index 5e1e5f3b6a..87f1958525 100644
> --- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_2.7.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0
> file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch=C2=
=A0
> \
> =C2=A0=C2=A0=C2=A0=C2=A0
> file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
> =C2=A0\
> =C2=A0"
> -SRC_URI[sha256sum] =3D
> "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
> +SRC_URI[sha256sum] =3D
> "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
> =C2=A0
> =C2=A0inherit autotools pkgconfig update-rc.d systemd gobject-
> introspection-data
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199724):
> https://lists.openembedded.org/g/openembedded-core/message/199724
> Mute This Topic: https://lists.openembedded.org/mt/106239640/3618414
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


