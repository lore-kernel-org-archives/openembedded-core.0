Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6F85376E04;
	Mon,  5 Oct 2015 14:45:27 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so123641169wic.1;
	Mon, 05 Oct 2015 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YKsFniazOQUPlU71KG6+6/uMXdbVrCKFxMmhO0U96CM=;
	b=fxskvbwwG6tatXdCiuPckWjboc9Gve/r2PR11GxFBauVPkWFi+yNnybjqSH6VQJTsN
	ylvGRm5ZnjjFydAYBcz5kRMluLlTlpnn2R/qKI5WcZjcdh8a+T08kX0asNLdWT1JQyDp
	sBJyyPsokkUelPRsddgfI2JSxJoDqDrpeCUF5ywA7Fm99maPQJbSEA1UMMMmCQ1CLgw9
	AcYgp0bXta9m5kFzC/pb9uKmDgDimhp2ZcViljCqt4URMBAv4ubTPQgLpYNP0Q67nfFq
	JFf/9xEnLoW1n8GYJ4ooFkzYkGo9Ra78a2Fnwxu++X8xKaWH/kEUskpjaO6gUrb5qz2U
	PWVg==
X-Received: by 10.194.63.5 with SMTP id c5mr29883879wjs.127.1444056327443;
	Mon, 05 Oct 2015 07:45:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm27296780wjb.29.2015.10.05.07.45.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Oct 2015 07:45:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Oct 2015 16:45:32 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151005144532.GB2388@jama>
References: <20151003133343.GC2381@jama>
	<CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-10-02
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
X-List-Received-Date: Mon, 05 Oct 2015 14:45:28 -0000
X-Groupsio-MsgNum: 71919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline

--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 03:40:39PM +0100, Burton, Ross wrote:
> On 3 October 2015 at 14:33, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >     * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.=
bb,
> > do_compile
> >
>=20
> This fails with a giant number of assembler warnings, but works when I try
> with current master.  Does your build change some tunes?

It enables thumb, see=20
http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20151003_133632.lo=
g/world_fixes.inc
and
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717

But these assembler errors in last 2-3 builds are new.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYSjQoACgkQN1Ujt2V2gBzeZACfQ+lig2shij5IxyRUrSfr0eYk
AKAAoIdGJuHtkjjRqjvZ8qQgwDinNLZY
=OXZv
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
