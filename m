Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 735FF65DD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 05:42:22 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so7192214wes.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 22:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=O5GcuciwrRUE/llexTgWJl7TRfl0ANUfuSIP9QmFyI0=;
	b=jcd4hbpEQWoSfkIc5tPNY6qLL/nHe08q0HUtZVon8B4xyKDhRG3ihQ+WVhLTJYaAwK
	uECBYfU3K/xMTkEtalJWMZk92v4bPZZ8mUhHgZumeuKYhKyXvRF59WlnrNCykVuig50L
	TGf4FS6QKgIs8FBQX+8PBBc8rp4RzBCED5D7lYAaXhRpQtk/U/1UY6Keom1lcAJVnnOm
	VVvKYYpD7RMtKgjktK9CDO4YdA0mzGtY9PYrRvLZ7Ap5G5eFyaL1QZdaSCybJwrSpeV2
	5/Uug3uJwpCxreRRPkOl6nnS6RbbPpzSWhk5jGw9iWjbQ9lmApsvtyex/Wt1OH1FJK4B
	gIwQ==
X-Gm-Message-State: ALoCoQlcV9QPZkSpWPpJQ0wM6gJ2Tf3+s+jx1SnfgzHpAgXEnZ/uFIicA0Dled0WlIMf4Ht30DzW
X-Received: by 10.180.184.133 with SMTP id eu5mr12336127wic.26.1408513343380; 
	Tue, 19 Aug 2014 22:42:23 -0700 (PDT)
Received: from ?IPv6:2001:610:612::9cc1:85c6:9116:a05c?
	([2001:610:612:0:9cc1:85c6:9116:a05c])
	by mx.google.com with ESMTPSA id ub17sm5671942wib.8.2014.08.19.22.42.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Aug 2014 22:42:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9a75d2d91ff7a27accc4a9077a3f52bec483ef5c.1408483685.git.max.eliaser@intel.com>
Date: Wed, 20 Aug 2014 07:42:21 +0200
Message-Id: <8EE2D5A0-598B-4FBF-A7C9-EE8B59CFDBF4@dominion.thruhere.net>
References: <cover.1408483685.git.max.eliaser@intel.com>
	<9a75d2d91ff7a27accc4a9077a3f52bec483ef5c.1408483685.git.max.eliaser@intel.com>
To: Max Eliaser <max.eliaser@intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] qemux86: support X11 when QEMU is emulating a different GPU than vmware
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
X-List-Received-Date: Wed, 20 Aug 2014 05:42:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 aug. 2014, om 23:29 heeft Max Eliaser <max.eliaser@intel.com> het =
volgende geschreven:

> QEMU is capable of emulating four different VGA adapters: cirrus, std, =
vmware,
> and QXL. By adding the cirrus and fbdev X.Org drivers to the qemux86 =
image,
> the image can be made to launch an X server on when cirrus and std are =
chosen,
> in addition to just vmware. (The build of QEMU in OE-Core appears to =
have QXL
> disabled, meaning a driver for it is unnecessary.)
>=20
> The runqemu script now allows the choice of emulated VGA adapter to be
> specified manually, so it's important that qemux86 supports any =
configuration
> the user might choose without requiring the image to be rebuilt.
>=20
> In addition to adding the two extra drivers to the qemux86 image, a =
section
> specifying the driver to use is deleted from the image's xorg.conf, =
allowing
> the X server to automatically select the most appropriate driver. =
Testing
> shows that it does always pick the correct one.
>=20
> Signed-off-by: Max Eliaser <max.eliaser@intel.com>
> ---
> meta/conf/machine/qemux86.conf                                       | =
2 ++
> .../xorg-xserver/xserver-xf86-config/qemux86/xorg.conf               | =
5 -----

This should be split into 2 commits as well.

> 2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/conf/machine/qemux86.conf =
b/meta/conf/machine/qemux86.conf
> index ebc27db..3562276 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -19,6 +19,8 @@ XSERVER =3D "xserver-xorg \
>            xf86-input-vmmouse \
>            xf86-input-keyboard \
>            xf86-input-evdev \
> +           xf86-video-cirrus \
> +           xf86-video-fbdev \
>            xf86-video-vmware"
>=20
> MACHINE_FEATURES +=3D "x86"
> diff --git =
a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf=
 =
b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf=

> index 10a6d9a..bbda9ea 100644
> --- =
a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf=

> +++ =
b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf=

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


