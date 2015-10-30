Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9C895759B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 04:48:08 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so62018136pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=jTZav45d7VLBryOMVwQKUnFTHwfYdYdX7Yxsh8kGxxU=;
	b=kpXjzux9q19vJ0dM5j+LXDneNlPgJCjxa/OulnTqz4PkJ1Z5HdWuyRvn1eSc/zxt+e
	YIByFHP92S+Y+AD+kuu7U9hOl5tDAln3byv5K0d9DvfxTzj6eX6ZkUJA5XuHXAt4qlgU
	tfIZg6tJIZYfzu9geSVCQAxfY4hFfXaX6nt5vlxX+G94Rrd7NVb7fFUFD+AwU7gxmWuh
	dmqIvK9o5RVnJjldCjbIcWIcAw+YJYt/6SNViw0nJZDEZzRL+wkI47fs4qtw3dhvCjri
	Z0hKkaoJeiqTIhDImtNxBD4+mPBmmtrk/PGNUoT5/T9SbGDOGXhxR9Ms3scdJ39lW4ec
	HX1Q==
X-Received: by 10.66.90.231 with SMTP id bz7mr6308498pab.47.1446180488686;
	Thu, 29 Oct 2015 21:48:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:b58d:9ca7:5d3e:274a?
	([2601:646:8601:4580:b58d:9ca7:5d3e:274a])
	by smtp.gmail.com with ESMTPSA id
	bz2sm5314871pad.32.2015.10.29.21.48.07
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 21:48:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
Date: Thu, 29 Oct 2015 21:48:03 -0700
Message-Id: <B098287C-1FC3-42C2-B3F8-531887D3D4A2@gmail.com>
References: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
	<1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3096.5)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro/master][PATCH 1/1] local.conf.sample: Disable image-prelink by default
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
X-List-Received-Date: Fri, 30 Oct 2015 04:48:11 -0000
X-Groupsio-MsgNum: 72768
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CE84F385-543D-4CE0-984C-5E0D0CB99AC2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CE84F385-543D-4CE0-984C-5E0D0CB99AC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 26, 2015, at 8:30 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> Due to problems with the prelinker itself, we need to disable the
> image-prelink by default.  This will hopefully be re-enabled in the =
near
> future.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/conf/local.conf.sample | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 3ae24ab..9d1480e 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -128,7 +128,9 @@ EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> #   - 'image-swab' to perform host system intrusion detection
> # NOTE: if listing mklibs & prelink both, then make sure mklibs is =
before prelink
> # NOTE: mklibs also needs to be explicitly enabled for a given image, =
see local.conf.extended
> -USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> +# NOTE: image-prelink is currently broken due to problems with the =
prelinker.  It is advised
> +# that you do NOT run the prelinker at this time.
> +USER_CLASSES ?=3D "buildstats image-mklibs=E2=80=9D


this looks good

>=20
>=20
> #
> --
> 1.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_CE84F385-543D-4CE0-984C-5E0D0CB99AC2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAlYy9ocACgkQuwUzVZGdMxR7lgCfTbOHZ3x+izqeN7Nsa0F8JFEE
A04Al2Mb++buhhNyQy3jkdw0YUVSbSo=
=f9JR
-----END PGP SIGNATURE-----

--Apple-Mail=_CE84F385-543D-4CE0-984C-5E0D0CB99AC2--
