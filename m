Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6lfG-0002G9-0i
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:02:50 +0200
Received: by wibhm2 with SMTP id hm2so5732463wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 09:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WFzhWwNTwjzputDtwHfIsV3cOs4XC9fF16k17fcJ/l4=;
	b=ly+kFhKXIcQ+tm+UcPR+OthwwgDPEGTt7qrfErKWD3EosRflvhMt/gZZLv8mf4CzR0
	BMw0bQmgRJ/KZEa5Xx1Gn4ByFaBsOtcIPLoCPvM5nBQuCupXVoEfIesgFvr7irYEr84A
	WvXT8S4hmSshpUHUysZ/GU4SWBUrOA9TOhMFNooNpW9OenotuM0CUcr90zye//qb+jJ3
	TIcuGZ4JW4oeo2gE8pTK9pxowqF/jLwK/7M4gJFBjQXxToXgs6hgjDgtGnYYvTl+1HQl
	IuXFc17SmYtqIzD2hwbE9/MCVUvuJomo7zXFtH1A8atvMMQSj9Oohn/ux+bBl1SzoyKl
	/z2A==
Received: by 10.216.232.32 with SMTP id m32mr1298189weq.186.1346259036050;
	Wed, 29 Aug 2012 09:50:36 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id eu4sm11043478wib.2.2012.08.29.09.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 09:50:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346255613-13401-2-git-send-email-ross.burton@intel.com>
Date: Wed, 29 Aug 2012 18:50:35 +0200
Message-Id: <CB4AF056-1525-4567-8E14-AA234CDE6AAC@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<1346255613-13401-2-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkmMiMLtnoY6bLnHYdvIfqnD3Rml3k0kwjgPbr6awuhQ1gVbkpBmYbKXeJJ/Pd99vCesBJ5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] task-core-x11: default to xserver-xorg instead of kdrive
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 17:02:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2012, om 17:53 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-sato/tasks/task-core-x11-mini.bb |    2 +-
> meta/recipes-sato/tasks/task-core-x11.bb      |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-sato/tasks/task-core-x11-mini.bb =
b/meta/recipes-sato/tasks/task-core-x11-mini.bb
> index 98189fe..ad736b9 100644
> --- a/meta/recipes-sato/tasks/task-core-x11-mini.bb
> +++ b/meta/recipes-sato/tasks/task-core-x11-mini.bb
> @@ -16,7 +16,7 @@ PACKAGES =3D "\
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -XSERVER ?=3D "xserver-kdrive-fbdev"
> +XSERVER ?=3D "xserver-xorg xf86-video-fbdev xf86-input-evdev"
>=20
> ALLOW_EMPTY =3D "1"
>=20
> diff --git a/meta/recipes-sato/tasks/task-core-x11.bb =
b/meta/recipes-sato/tasks/task-core-x11.bb
> index f1b06f9..00e3c0c 100644
> --- a/meta/recipes-sato/tasks/task-core-x11.bb
> +++ b/meta/recipes-sato/tasks/task-core-x11.bb
> @@ -22,7 +22,7 @@ PACKAGES =3D "\
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -XSERVER ?=3D "xserver-kdrive-fbdev"
> +XSERVER ?=3D "xserver-xorg xf86-video-fbdev xf86-input-evdev"
>=20
> ALLOW_EMPTY =3D "1"


Missing PR bumps=


