Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 889F66FFDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:59:07 +0000 (UTC)
Received: by wmec201 with SMTP id c201so28485570wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RzpbTu4CQ32TDhRLjfuIsOlQ1bjfStc2MYnl0V26GM4=;
	b=U2Eb2se29j33W9tcfha179rLceB2I+ZiybdjK9xeJlmfoEx34OR5fojC1A/jIlWggK
	aS9nOPjUdm6zOHs0jbYCNqVOocUjqD1n0M4IojhjUoX/3iNABrRGakcyqTMhatWUrsu/
	TW10oWmoFyntWvZ5WI4TE7WcmIJcJGoeAybju9kwWCnpwc1kpcrLuRxQRIsovS+ltNQL
	o1Kdn/ZMK2griqe9W0EGEltLjcXJGKy/njUSLqRQgcZiu8sZTwJ7s4BVuknX7ka0BT8P
	wIPeLzHnxOpRivuZ0hD0D1XeyTBpvDjmmgxN+IRC3emUsMN+++IRH0aqJhtBgLqGk3QB
	rUNA==
X-Received: by 10.194.77.51 with SMTP id p19mr13139011wjw.159.1449759547636;
	Thu, 10 Dec 2015 06:59:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l128sm1196082wmf.10.2015.12.10.06.59.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 06:59:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 16:00:51 +0100
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20151210150051.GK2246@jama>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
	<1449755316-17611-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1449755316-17611-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 03/11] directfb: add fPIC to CFLAGS
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
X-List-Received-Date: Thu, 10 Dec 2015 14:59:07 -0000
X-Groupsio-MsgNum: 74611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mit9XoPEfICDqq/V"
Content-Disposition: inline

--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 02:48:24PM +0100, Martin Jansa wrote:
> * fPIC is missing when building directfb-csource.o
>   | arm-webos-linux-gnueabi-libtool: link: arm-webos-linux-gnueabi-gcc -m=
arch=3Darmv7-a -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/jenkins/=
workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako -I/home/jenki=
ns/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/includ=
e/freetype2 -I/home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc=
/sysroots/mako/usr/include/libpng16 -Wall -Wstrict-prototypes -Wmissing-pro=
totypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O3 -g2 =
-ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE=
 -std=3Dgnu99 -Werror-implicit-function-declaration -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed -o directfb-csource directfb-csource.o  /home/jenki=
ns/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroots/mako/usr/lib/li=
bts.so /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroo=
ts/mako/usr/lib/libpng16.so -lz -lm -ldl -lrt -lpthread
>   | /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sysroot=
s/x86_64-linux/usr/libexec/arm-webos-linux-gnueabi/gcc/arm-webos-linux-gnue=
abi/5.2.0/ld: error: directfb-csource.o: requires unsupported dynamic reloc=
 R_ARM_MOVW_ABS_NC; recompile with -fPIC
>   | collect2: error: ld returned 1 exit status
>   | make[2]: *** [directfb-csource] Error 1

Please cherry-pick c075d6e514b0a4511007844baf96ad44d7513399 instead of
this one.

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/directfb/directfb.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-g=
raphics/directfb/directfb.inc
> index 446aaea..e00b59b 100644
> --- a/meta/recipes-graphics/directfb/directfb.inc
> +++ b/meta/recipes-graphics/directfb/directfb.inc
> @@ -20,7 +20,8 @@ SRC_URI =3D "http://www.directfb.org/downloads/Core/Dir=
ectFB-1.7/DirectFB-${PV}.ta
> =20
>  S =3D "${WORKDIR}/DirectFB-${PV}"
> =20
> -LDFLAGS_append =3D" -lts -lm"
> +LDFLAGS_append =3D " -lts -lm"
> +CFLAGS_append =3D " -fPIC"
> =20
>  BINCONFIG =3D "${bindir}/directfb-config"
> =20
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZpk6IACgkQN1Ujt2V2gBxm4QCgkQZUlkARMcBFcGi9hYS9xei8
BlEAn2zbcvb+t5fz74utEOkFXZC4KHXx
=0Qmz
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
