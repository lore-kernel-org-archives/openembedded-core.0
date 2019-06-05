Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 439E57DF72
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 08:18:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g135so1273089wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tWRDTi/QEa9zdzhz35Ivxsq+A8HrYU9Pyk/+tRU3El4=;
	b=VGhAVxMpfYwMwjFKNWdTpw3W1FrQyzTstrX6bUxVrPr31xoxv45twwAVZHBezAF3zX
	JQK1Wwe5QTVv3ZCbxXolY0RAnjWmAiiBBfbe1ANWww4w+2PAgivgjSI4nTMaEm1jNFAV
	M6SuDKQvJRKTbEZippBXFUG+CrklM/e+OqEKpauhcwytYVjnARtLocEZ2L6XAByMTNP8
	Kv1NPP9dbhjft8jz30JqUth7bBgQuNtZHTi+QzKUfcsUIqMmtpHi64fvS5Qdg70rTAi1
	MtYasM3U48oJfk9vnaJhOGytemcxZsZy17etw4Wk5zA2B/dLA0wGHeM1jJP/qKu3zbGZ
	XsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tWRDTi/QEa9zdzhz35Ivxsq+A8HrYU9Pyk/+tRU3El4=;
	b=qRwq9UI53qX+WQwuwlqEcfHH+ra6EotC1F3/2PMhuCXltZk2A3Cl25ygeG4oyLwbZ+
	aI7Fe7KuaB4dhsW/fTvugznuOgqWWjKCdsQCzvGrv2of9npXABKvfOgNRJod85jXHKsb
	GGbS4KeKqbr1qGPRrP43QFMMDlBbTcFw9E9o30lTBKmlE5r2TmVgp3LlST/ypYX8+uqV
	3U2ruqQ0LWH7ux4kTRArom/zdkLVvaoTa7vZbKrDcEj6vJPOUOamF+y6FicpCoRmh2FY
	9re8C8KZZUOc3v3K8bZ3y6vlbhpofo0wORdt2jI3LYZU2ijz+dduxKS6Ljnm6bgWFZJN
	szzQ==
X-Gm-Message-State: APjAAAXcrxZuaaTPTMP+yWM+d7+lEVIYMyNGJRTZfENpZI9/nktg8ug7
	NjhLEt80wg9rHDWoTut+FF9+mMTq
X-Google-Smtp-Source: APXvYqyQy9x6aeGWtsg/OIddvEwoqeFIPIDw2B8WlUX6IyK4ejFGiRrXQo+FD9gWvadfX9ssW6q4Sg==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr21220791wma.120.1559722698863;
	Wed, 05 Jun 2019 01:18:18 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	b136sm24304302wme.30.2019.06.05.01.18.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 01:18:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Jun 2019 10:18:31 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190605081831.GA1448@jama>
References: <20190603064703.17474-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190603064703.17474-1-bunk@stusta.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Wed, 05 Jun 2019 08:18:18 -0000
X-Groupsio-MsgNum: 125398
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 09:47:02AM +0300, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> --

You need one more dash here, now this v2 comment ended in final commit mess=
age
which I believe wasn't the intention.

http://git.openembedded.org/openembedded-core/commit/?id=3D6fa60ac102f6d397=
7df4236bd5a22680298bdac2

the same with tcp-wrappers change:
http://git.openembedded.org/openembedded-core/commit/?id=3Dcd1dc2334fd3e3d1=
db9be1d26e888051e3f59c5a

> v2: Add comment in the patch header.
> ---
>  .../lrzsz/lrzsz-0.12.20/include.patch         | 25 +++++++++++++++++++
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
>=20
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch b/meta/re=
cipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
> new file mode 100644
> index 0000000000..5fcb3aa92b
> --- /dev/null
> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/include.patch
> @@ -0,0 +1,25 @@
> +Implicit declaration compile warning fixes from Debian
> +
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +Upstream-Status: Inappropriate [upstream is dead]
> +
> +--- lrzsz-0.12.21.orig/lib/long-options.c
> ++++ lrzsz-0.12.21/lib/long-options.c
> +@@ -22,6 +22,7 @@
> + #endif
> +=20
> + #include <stdio.h>
> ++#include <stdlib.h>
> + #include <getopt.h>
> + #include "long-options.h"
> +=20
> +--- lrzsz-0.12.21.orig/src/lsyslog.c
> ++++ lrzsz-0.12.21/src/lsyslog.c
> +@@ -22,6 +22,7 @@
> + #ifdef ENABLE_SYSLOG
> + #include "zglobal.h"
> + #include <pwd.h>
> ++#include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #endif
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/l=
rzsz/lrzsz_0.12.20.bb
> index 002c774c6d..34556b2c29 100644
> --- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> +++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "http://www.ohse.de/uwe/releases/lrzsz-${PV=
}.tar.gz \
>  	   file://lrzsz_fix_for_automake-1.12.patch \
>             file://lrzsz-check-locale.h.patch \
>             file://cve-2018-10195.patch \
> +           file://include.patch \
>             "
> =20
>  SRC_URI[md5sum] =3D "b5ce6a74abc9b9eb2af94dffdfd372a4"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXPd61gAKCRA3VSO3ZXaA
HN9FAKC7TvQImzzs1LK5gUPYy6HEH4I/hACbBioAjgvtFSKbF+apnddnIkYEu0E=
=ht3D
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
