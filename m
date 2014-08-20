Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6203865DD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 05:41:58 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so6477239wiw.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 22:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Z0+gsu3JS9t3I75IOZD0gSF4m3JXTdThIpBNWKCWcfQ=;
	b=EJ3QjM6JqOq+3qiWcGoJ7fHKolLbl21D08IqXwmbmmxQ/Kf+GG/QPZbfyaZahhhqZA
	Lr6PdFxlg4ZLctL4LvJusOTQAjsVkfQmgXCBNnKRH+mK1b5eeVXjV2+2f/Bd25qVPdlV
	8niUmkdT6XSzDGQ1RoRImdqvgJ44x+JyBEoHkjPUD8oSHFgXS7Opj276AebK6a4f4ByS
	IfbFoPydrXYx59oX/Yd57Q8UymsBPYNTj/e0i2a3Q18v1Q1KKa340WgJoj4wuHtfVUa2
	9iwR/ALo7n4bDAroMlIi1a7XlLrtGixHJ3ODdxHWHmOigIT+FAD0CmmYYvCSRF236gXj
	YcoA==
X-Gm-Message-State: ALoCoQlQRi8Pjd56qvf+jrSMVJnDiicWgxgDrV5JhGwyZzSe0juPsrkRItUCHvtFF4oTM6OKxhVa
X-Received: by 10.180.73.236 with SMTP id o12mr12505568wiv.22.1408513319949;
	Tue, 19 Aug 2014 22:41:59 -0700 (PDT)
Received: from ?IPv6:2001:610:612::9cc1:85c6:9116:a05c?
	([2001:610:612:0:9cc1:85c6:9116:a05c])
	by mx.google.com with ESMTPSA id ub17sm5671942wib.8.2014.08.19.22.41.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Aug 2014 22:41:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <957f4c1719a0d430683dea575f044fdc92408486.1408483685.git.max.eliaser@intel.com>
Date: Wed, 20 Aug 2014 07:41:56 +0200
Message-Id: <99AAABDB-5CC2-46B7-B1B9-A444FFD4B094@dominion.thruhere.net>
References: <cover.1408483685.git.max.eliaser@intel.com>
	<957f4c1719a0d430683dea575f044fdc92408486.1408483685.git.max.eliaser@intel.com>
To: Max Eliaser <max.eliaser@intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] qemux86-64: support X11 when QEMU is emulating a different GPU than vmware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Aug 2014 05:42:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 aug. 2014, om 23:29 heeft Max Eliaser <max.eliaser@intel.com> het =
volgende geschreven:

> QEMU is capable of emulating four different VGA adapters: cirrus, std, =
vmware,
> and QXL. By adding the cirrus and fbdev X.Org drivers to the =
qemux86-64 image,
> the image can be made to launch an X server on when cirrus and std are =
chosen,
> in addition to just vmware. (The build of QEMU in OE-Core appears to =
have QXL
> disabled, meaning a driver for it is unnecessary.)
>=20
> The runqemu script now allows the choice of emulated VGA adapter to be
> specified manually, so it's important that qemux86-64 supports any
> configuration the user might choose without requiring the image to be =
rebuilt.
>=20
> In addition to adding the two extra drivers to the qemux86-64 image, a =
section
> specifying the driver to use is deleted from the image's xorg.conf, =
allowing
> the X server to automatically select the most appropriate driver. =
Testing
> shows that it does always pick the correct one.
>=20
> Signed-off-by: Max Eliaser <max.eliaser@intel.com>
> ---
> meta/conf/machine/qemux86-64.conf                                    | =
2 ++
> .../xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf            | =
5 -----


This should be split into 2 commits.


> 2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/conf/machine/qemux86-64.conf =
b/meta/conf/machine/qemux86-64.conf
> index 642a2d9..837f9f4 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -20,6 +20,8 @@ XSERVER =3D "xserver-xorg \
>            xf86-input-vmmouse \
>            xf86-input-keyboard \
>            xf86-input-evdev \
> +           xf86-video-cirrus \
> +           xf86-video-fbdev \
>            xf86-video-vmware"
>=20
> MACHINE_FEATURES +=3D "x86"
> diff --git =
a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.c=
onf =
b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.c=
onf
> index 10a6d9a..bbda9ea 100644
> --- =
a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.c=
onf
> +++ =
b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.c=
onf
> @@ -30,11 +30,6 @@ Section "InputDevice"
>     Option        "USB"           "on"
> EndSection
>=20
> -Section "Device"
> -    Identifier    "Graphics Controller"
> -    Driver        "vmware"
> -EndSection
> -
> Section "Monitor"
>     Identifier    "Generic Monitor"
>     Option        "DPMS"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


