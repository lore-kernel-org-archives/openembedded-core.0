Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FC6C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 09:27:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.7120.1643880446921159634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 01:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=vEfcsDDq;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0CB6082D3B;
	Thu,  3 Feb 2022 10:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643880445;
	bh=TbjFh6q/ZHTQ/ki6W7RAKOeLancFIq2XcTH0sbSlg1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vEfcsDDqLLoxsBbW7aGwFK2ZLwJFEXN+iejxHRuzdbfe+GqiyTTJMYBEcgm3XgdJb
	 sTp4O7F5XrJjLYTs0XBuJ2spe6fNwPEmIWCZ2JE6rSGTMG7G4MqGF87eEp/Jg5ZAU8
	 +iwlPHVbglhVaQtjBscX9mr5PSz1zszMLyfF7cRz7KyJhrXvD/rOk5vTqxGX6srqUB
	 4WqDBFPzMSVOcwR/LAL1TqrwvOrArgXdTEsK+RJEJW/c1ZPKD9cyJ/8F3LfV4h9EzC
	 RhJtIRIDXqONcKMBh5FU72d4iqs6qsIGcFzLljP2yc7ZR7jcxQ/XxH7HdGpf00+XSz
	 d7/fqZRCXmdrg==
Message-ID: <b0455db7-6264-fa4f-92bb-e86e4d3f143b@denx.de>
Date: Thu, 3 Feb 2022 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 05/12] gstreamer1.0-plugins-ugly: 1.18.5 -> 1.19.90
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-6-ch@denx.de>
 <CANPvuRk8qzTD7_has-+VOgagCA=909ZaCW3zDUsVBRPHPXxnTA@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANPvuRk8qzTD7_has-+VOgagCA=909ZaCW3zDUsVBRPHPXxnTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 09:27:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161270

Hi Jose,

On 2022-02-02 18:58, Jose Quaresma wrote:
[...]
>     @@ -13,7 +13,7 @@ LICENSE_FLAGS =3D "commercial"
>      =C2=A0SRC_URI =3D " \
>     https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-=
ugly-${PV}.tar.xz
>     <https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins=
-ugly-$%7BPV%7D.tar.xz>
>     \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     -SRC_URI[sha256sum] =3D
>     "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
>     +SRC_URI[sha256sum] =3D
>     "5242a42c3fad209030bd2e8630b08ae93821384c2278965764a039d31ab2a246"
>=20
>      =C2=A0S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
>=20
>     @@ -23,7 +23,7 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D "0"
>=20
>      =C2=A0PACKAGECONFIG ??=3D " \
>      =C2=A0 =C2=A0 =C2=A0${GSTREAMER_ORC} \
>     -=C2=A0 =C2=A0 a52dec mpeg2dec \
>     +=C2=A0 =C2=A0 a52dec mpeg2dec gpl \
>=20
>=20
> This will require commercial=C2=A0licence support
> https://docs.yoctoproject.org/dev-manual/common-tasks.html?highlight=3D=
license_flags#enabling-commercially-licensed-recipes=20
> <https://docs.yoctoproject.org/dev-manual/common-tasks.html?highlight=3D=
license_flags#enabling-commercially-licensed-recipes>

Yes. I am not sure if I understand your point. The `LICENSE_FLAGS =3D=20
"commercial"` is already set in the recipe, see first line of this diff.

regards,
Claudius

