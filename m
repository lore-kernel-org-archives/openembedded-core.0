Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 369636FDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 06:40:44 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so5703923wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Oct 2014 23:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UeihGkLJUKl1e0O+tK2ALWGfFBNt87LINT9cn6d55MM=;
	b=AdrlG5pceBR694AWD9LJDhfL9OmenFRKzaobboWIQlTbv9BNNcZW2yFOtTyI1ZwsIX
	QBP65w95HjT5gyW1wUUmEz5xklyQGBdF0FqwJ3j9DKMN817yLFuIL8sKnWvLzttZVnDP
	twHYRGEjLtxlO/uts3m8O37deLnY9VQmh/hX48iFSwbDdgJ6PMhp/hm/vT6lGOY7CFYj
	GVAEVtiGEo7bhA927mpH+LRampGwSS/Idkhu1rZWgFD4M396dGL8YqlCscvwMqZZA8vO
	xFu8j1D5KXts4dqmraPAaiiHMV+0tBJn76a6AYFn3Y5rx1q1ZVi228msvepHZw76bprJ
	U4mw==
X-Received: by 10.180.77.163 with SMTP id t3mr17476882wiw.25.1412577645593;
	Sun, 05 Oct 2014 23:40:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hu3sm16263768wjb.17.2014.10.05.23.40.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 23:40:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Oct 2014 08:41:45 +0200
To: Brian Lloyd <blloyd@familyhonor.net>
Message-ID: <20141006064145.GT25706@jama>
References: <cover.1412567765.git.blloyd@familyhonor.net>
MIME-Version: 1.0
In-Reply-To: <cover.1412567765.git.blloyd@familyhonor.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] xf-86-video-geode missing config.h include
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
X-List-Received-Date: Mon, 06 Oct 2014 06:40:52 -0000
X-Groupsio-MsgNum: 58367
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mIBGJ7C7ypTjlzw5"
Content-Disposition: inline

--mIBGJ7C7ypTjlzw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 05, 2014 at 11:00:09PM -0500, Brian Lloyd wrote:
> This backports a fix already applied to development branh of xf86-video-g=
eode to latest release since next release could be a ways away.  This allow=
s compiling xf86-video-geode against the latest linux-yocto kernels.

I've already sent similar patch for oe-devel ML list where this change
belongs and I plan to merge it tonight.

But thanks for getting it fixed in upstream!

Regards,

> Brian Lloyd (1):
>   Backports inclusion of config.h to be compatible with newer kernels.
>=20
>  ...1-Add-config.h-include-to-src-lx_memory.c.patch | 40 ++++++++++++++++=
++++++
>  .../xorg-driver/xf86-video-geode_2.11.16.bb        |  2 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
/0001-Add-config.h-include-to-src-lx_memory.c.patch
>=20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mIBGJ7C7ypTjlzw5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQyOakACgkQN1Ujt2V2gBxD+wCaAniPN4nDQ0dWG4rWT89klv7F
DpwAniZAcJWw4PWvQRNCVZ4SLGObxmza
=iEU1
-----END PGP SIGNATURE-----

--mIBGJ7C7ypTjlzw5--
