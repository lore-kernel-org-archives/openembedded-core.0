Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32CCC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 07:57:07 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.67904.1718956625972477428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 00:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=O5L38x0t;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=85zkLZiqDV8luTceSzfhCSP4TwIWXhlaeHGpzPwKkJw=; b=O5L38x0tWvGtsXokg3wveRJ6im
	2Tmh004F8z5+mub+0gsznoeMjlwyl7nmmeW33UmeX/mFiMtQU29aIsKlnkfbUhm3btCCfJvgZPyRl
	kibYfrEytIxCUVTaE/anCz3m4tCnA9YOBuN4t91lUcSrqqg7h36dVcSOOsb/pMenxeooXk1/6dE7P
	pXmBwGDnYQF2ewFimDL8xXY3rawdmk37PCe5j/t6igqy/3ldKnVlj6G7HFjegwRq2UhNy12bPdIKR
	0+RlIyczAEbUXhaiMIbQyrImLmenSXLiUuqm7ryGNyUI/x/J5PuD7nOS9DxqCZmgYDyFu/TfbH4/y
	lWIXyqiQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sKZ8q-000MQA-6T; Fri, 21 Jun 2024 09:57:04 +0200
Received: from [185.17.218.86] (helo=[192.168.64.76])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sKZ8p-000MdE-2a;
	Fri, 21 Jun 2024 09:57:03 +0200
Message-ID: <6bb8188e5bcf50c8054cf986d4c7e0ca82fdf460.camel@geanix.com>
Subject: Re: [OE-core] [PATCH 19/22] ofono: upgrade 2.7 -> 2.8
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2024 09:57:03 +0200
In-Reply-To: <1718936206-8080-19-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
	 <1718936206-8080-19-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27312/Thu Jun 20 10:34:55 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 07:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201000

On Fri, 2024-06-21 at 10:16 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Fix issue with handling USB TTY device detection.
> - Fix issue with handling GOBI versus QRTR detection.
> - Fix issue with handling QMI based PCIe devices.
> - Fix issue with handling CRSM result parameters.
> - Fix issue with handling PPP ACCM for Quectel modems.
>=20
> License-Update: use SPDX-License-Identifier to specify license.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0.../ofono/{ofono_2.7.bb =3D> ofono_2.8.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 5
> +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-connectivity/ofono/{ofono_2.7.bb =3D>
> ofono_2.8.bb} (91%)
>=20
> diff --git a/meta/recipes-connectivity/ofono/ofono_2.7.bb
> b/meta/recipes-connectivity/ofono/ofono_2.8.bb
> similarity index 91%
> rename from meta/recipes-connectivity/ofono/ofono_2.7.bb
> rename to meta/recipes-connectivity/ofono/ofono_2.8.bb
> index bc1f3efd04..2aed02cdc0 100644
> --- a/meta/recipes-connectivity/ofono/ofono_2.7.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
> @@ -4,14 +4,15 @@ HOMEPAGE =3D "http://www.ofono.org"
> =C2=A0BUGTRACKER =3D "https://01.org/jira/browse/OF"
> =C2=A0LICENSE =3D "GPL-2.0-only"
> =C2=A0LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D3ce17d5978ef3445def26=
5b98899c2ee
> "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D5edd2126537851842453c=
61fbf551851
> =C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "

This should be "endline=3D6" to avoid using regular code as license. See=
=20
https://lore.kernel.org/openembedded-core/20240618073439.2068944-1-martin@g=
eanix.com/

// Martin

> =C2=A0DEPENDS =3D "dbus glib-2.0 udev mobile-broadband-provider-info ell"
> =C2=A0
> =C2=A0SRC_URI =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.t=
ar.xz \
> =C2=A0=C2=A0=C2=A0=C2=A0 file://ofono=C2=A0\
> =C2=A0"
> -SRC_URI[sha256sum] =3D
> "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
> +SRC_URI[sha256sum] =3D
> "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
> =C2=A0
> =C2=A0inherit autotools pkgconfig update-rc.d systemd gobject-
> introspection-data
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200984):
> https://lists.openembedded.org/g/openembedded-core/message/200984
> Mute This Topic: https://lists.openembedded.org/mt/106792582/3618414
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


