Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C97D476D96;
	Wed,  9 Sep 2015 14:54:38 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so119875559wic.1;
	Wed, 09 Sep 2015 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=le0ua9C6TSFN1br34d4i9Reucqp9Qf+b0kSwf5Czkhc=;
	b=GcH0SDHkRYJi1P6kegREodFUJW7gg7ZIuAUVylbUsdi6blncGktwAepFHujjka576i
	PpoHUEIhtue3MLEODcrNrqOQeDw5GwjRSOjfCfm1qCXmthSGh6k10vsPmU21G87/ij+7
	ipWsxowk5wPIeYV8ohHD/HBT654KTJA5inVEl9iMWHkbNh8tsqW+nVPc78uOHuI/Mifa
	CdhqnunQasjaClZTaPUfmQmYgGBYndEvy8ERQKoE4vyy0R2C9CGvgi+XAE/X2n2iT6gp
	jiW0UjpHfGp8HriuHI8Qx8epBP3MhkKrxI4T89J5oJWCD2Iwee9O3Op0J4AViw3/yMbO
	I4qA==
X-Received: by 10.180.8.3 with SMTP id n3mr32389516wia.41.1441810478239;
	Wed, 09 Sep 2015 07:54:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xs1sm10679476wjc.7.2015.09.09.07.54.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 07:54:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Sep 2015 16:55:31 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20150909145531.GA2390@jama>
References: <20150908155801.GD2381@jama> <20150908170942.GE2381@jama>
	<CALbNGRQYuQrGc_3Bf0y5CVXHHb3uFDVaLgPcfeAKYCau7X1u2g@mail.gmail.com>
	<20150908231037.GH2381@jama>
	<CALbNGRTUBBBni8YGkpVx4=HQ97Lz8PzmZo129efUteXhYbEvFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTUBBBni8YGkpVx4=HQ97Lz8PzmZo129efUteXhYbEvFQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, wrong PACKAGE_ARCHs 2015-09-08
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
X-List-Received-Date: Wed, 09 Sep 2015 14:54:39 -0000
X-Groupsio-MsgNum: 70913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2015 at 09:14:20AM +0200, Andreas M=FCller wrote:
> On Wed, Sep 9, 2015 at 1:10 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, Sep 08, 2015 at 11:39:20PM +0200, Andreas M=FCller wrote:
> >> On Tue, Sep 8, 2015 at 7:09 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> > ERROR: polkit-group-rule-datetime different signature for task do_co=
nfigure.sigdata between qemux86copy and qemuarm
> >> > runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_pa=
tch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.d=
o_populate_sysroot:virtual:native'] to ['polkitpolkit-group-rule-datetime.b=
b.do_patch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2=
=2E1.bb.do_populate_sysroot:virtual:native']
> >> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-ex=
tended/polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea723=
c466e0c5c88a09a50
> >> I missed many of these - because I am not up to date on oe-core (did
> >> not want to loose midori for my images) - will change that soon. For
> >> this type of error: is it correct that it is caused by allarch recipes
> >> depending on machine/architecture specific recipes?
> >
> > close, the important part is few lines bellow:
> >
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exten=
ded/polkit/polkit_0.113.bb.do_populate_sysroot
> > with hash
> > 284d6bbd28ea723c466e0c5c88a09a50
> >  changed to
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exten=
ded/polkit/polkit_0.113.bb.do_populate_sysroot
> > with hash
> > 06cf7139c6588d047fa11444d88175ab
> > Hash for dependent task polkitpolkit_0.113.bb.do_populate_sysroot
> > changed from 284d6bbd28ea723c466e0c5c88a09a50 to
> > 06cf7139c6588d047fa11444d88175ab
> >
> > so allarch recipe polkitpolkit-group-rule-datetime is depending on
> > TUNE_PKGARCH-specific recipe polkit (on it's do_populate_sysroot task
> > which is expected to be different for diferent TUNE_PKGARCHs)
> >
> So to fix we could
>=20
> 1. either remove dependencies or
> 2. remove allarch or
> 3. ??

3a) add such dependency to SIGGEN_EXCLUDERECIPES_ABISAFE if it's
completely ABI safe (recipes depending on it shouldn't get rebuild after
any changes to it)
3b) add such dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS to exclude it
only for given recipe (in this case by saying that polkit-groups doesn't
need rebuild when polkit recipe is changed in any way)

> For e.g the polkit-groups 1 seems not possible what about package
> feeds when removing allarch?

I think in this case 3a) and 3b) don't apply as well, so easiest and
safest option is 2), package feeds should survive that, because new
package will have higher version (when PRserv is used) and also higher
package arch priority (all is lowest). Even the sysroot should now
survive ok, with new functionality which "uninstalls" staged file for
unreachable stamps.

Also polkit-groups build doesn't take very long, so we don't mind to
build it once per TUNE_PKGARCH instead of building it as allarch only
once but with unsafe deps.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXwSGIACgkQN1Ujt2V2gBzi8wCbBLBAJHR3q1PcLZxsmw3WULF5
ttQAnj2gIfHI5kyuc7L3b5ghVjHyxfMn
=wmCc
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
