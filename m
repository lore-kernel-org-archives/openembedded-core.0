Return-Path: <tom.rini@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4A91D60425
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 12:26:58 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q107so2926978qgd.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=n/gnmNo8h4s0Ak4+hQ4UWA06GYJqnXQAk9odRTyml58=;
	b=SK1Pnu2j3ii6yNY3mI9kvK8RqMiL5u9EpdO58NQmh5kIb45nsZit85bboqDM2Ti5PD
	FKtuWAmn9GujCWViNMvGY7J6gFpZSHFb4WnsRv0wBA9YMWC+cIOhkccXlEVNYl9iVCR8
	cjACwUDIDvtdEcdyzhof1i9ZBfZ0he0o/5RlqF34KpetqO7FxIHD+OFuP6X0OCGNJB8N
	Bt42d0XdWL+JYI5R3/t7NF0XyBlQNqm7IJviQkN6Kb0elnSLgR3EKYDHfouy7qDnO4RX
	/LSyoGk0qiy94KMna4DsIjAiYvzN/lzm/POcQxBrTIx8gAP5l4tcoY5bmlD/hdtqSHGf
	bgVA==
X-Received: by 10.224.161.10 with SMTP id p10mr21405119qax.12.1403785619194;
	Thu, 26 Jun 2014 05:26:59 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id j9sm10999937qao.46.2014.06.26.05.26.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 26 Jun 2014 05:26:58 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 26 Jun 2014 08:27:00 -0400
From: Tom Rini <trini@ti.com>
To: "Maxin B. John" <maxin.john@enea.com>
Message-ID: <20140626122700.GM9006@bill-the-cat>
References: <1403687639-13030-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1403687639-13030-1-git-send-email-maxin.john@enea.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot-fw-utils: install config file
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
X-List-Received-Date: Thu, 26 Jun 2014 12:26:59 -0000
X-Groupsio-MsgNum: 54412
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L/bWm/e7/ricERqM"
Content-Disposition: inline

--L/bWm/e7/ricERqM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2014 at 11:13:59AM +0200, Maxin B. John wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>=20
> The on-target fw_printenv and fw_setenv needs configuration file
> (fw_env.config) to be present in the target.
>=20
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/re=
cipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> index 14b0976..89fed8b 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> @@ -26,8 +26,10 @@ do_compile () {
> =20
>  do_install () {
>    install -d ${D}${base_sbindir}
> +  install -d ${D}${sysconfdir}
>    install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_print=
env
>    install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> +  install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.=
config
>  }
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"

We should really provide some way for the BSP to provide a functional
fw_env.config file as the one in the sources is mainly an example and
unlikely to work on most systems.

--=20
Tom

--L/bWm/e7/ricERqM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJTrBGTAAoJENk4IS6UOR1WBfUQAJCp6H8cJl1Y8TV3ksn41UXt
Z+VbL5409BScQfPJ5aKrKQXvtjX3SA0UPJ76iszAJ4EeN/hRx71i8JkS6NLNuWVb
a2ONDxbp51B8P1iVO5yLe6j2a+6lbovXq8vX2KEjGcoPKmynDfZVmMo2ZiA0fOrd
wT/TuFEZirPFEE5DzpCiVhKanWoIQaMAnpz/kHsPfkI9Ycc2NE6uHBTeSOKc2Hh+
YZeF4u2a1Qozfq8YuJ/U56oeHM8C/zJi5AhiAwnz62pO5m7/dlFJZtkQFXIjpoPy
DaSXdS4HfK6ykn1b+YmGTRwzA4h5VcPMmmUCVkAj2eViSxppl4Iymv112C2IfPLb
0WLbA7cyg+Lu4T4gBKGEpMjn8SRK0yvGqGO9rxwWnMiNOZs+3WrAGF51bAboE/7s
Uk5HmM/RSmrO+LtvIRuphhMNEoe0ZIyP/Df0O5il98C0pu5xwDnLo6//JpzH82W7
B03ubMg59p08bccyoiQnnxQAT9+IliNvB5Q7lw3M/1REtp1HksZNm0Vy+Js74DMy
93ZidrNn0sLhc1WRxCTaSAPdTqRjCMexvpC8wZ4TjjEeqAchYnImmmSMq8SnmJBJ
DKSIOUQZFrTtayG2jTYM6JTLuHSHLlmYbtQZMWwg48TQnxQE88pl2F/pK6XwNCwY
zmUoASh5aHjXUE9VcXqc
=l1z5
-----END PGP SIGNATURE-----

--L/bWm/e7/ricERqM--
