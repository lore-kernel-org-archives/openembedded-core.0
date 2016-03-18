Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9F5862132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 20:42:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so9012415wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3tXnMMZS04bf83bKrOhhZmpsGrlIGU5ji730gA5Jk6k=;
	b=i7ABS25CKqm29iQW1c1Q7+LcS+IpJ/IiEo8+PjISwGFkVvaP1laiZ3V1jZttSaLiB2
	hyvgQOcTVCqoOFFozcq6N5rBund674wWYmAUzjp6tpifnZFlvWXxk57BcId1WkNOSySc
	lTI1b5lrCBSBQPiJYrIZ83EbovoiartbELV1v6z2xAb72pSI/JrWbrM6hsFnaF26ppvT
	lb0xoB4wAoB5bCqErVubUTplAkyEMCAsM/o1fiTBv3+VMEubjGqMT6xCf/+vDw/QSBSQ
	wNA1pVl5Szkqjlu7beGxSx/QulI5AbyFRoM5eOnbQdud8tR8ZbEVgoYOylcHONk65Fes
	B9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3tXnMMZS04bf83bKrOhhZmpsGrlIGU5ji730gA5Jk6k=;
	b=XxMgQx8EUfKJRv7nSkgD1vJdjpQSaKDg7gVSaShFcdD3CA4ETPFZIu1yZQEC8mVM7+
	1AVkMyxoqPhAcejfBp97sgDJPZNEDmeso63fIDT2W/Nv7Wgu2vlogCVtqjSAs46CFggl
	JFH8lirXA+mKsJr/CHHEyDbtF5DrO5tgjodH7/DWDt5ZzUDb1NX6kEC4Th6UvOe0niBv
	qFNapu+ZyrQUqvMD/337Hvkqsi6nMx3WeGdzg5aDRiCadBQ0tKJ0LByeRfgefkf5EZnv
	n18pwFiROJY4QfkuKv1HnKdNjIm33vcCvy076uTvv4yNMmGrN2KNMKKdwcpXGvd22uhw
	zv7Q==
X-Gm-Message-State: AD7BkJKO+8B9HcBWO2WdhzHLVLPLpg5ZM2NpI84s8VOffJ0FuaB2vH+3VbqW0uFOS3OhJg==
X-Received: by 10.28.213.142 with SMTP id m136mr1324669wmg.24.1458333751897;
	Fri, 18 Mar 2016 13:42:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vw2sm13724002wjc.43.2016.03.18.13.42.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 13:42:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Mar 2016 21:46:26 +0100
To: alexander.kanavin@linux.intel.com
Message-ID: <20160318204626.GD2555@jama>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
	<20160317213608.GG2553@jama>
	<51498.10.252.7.138.1458328949.squirrel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51498.10.252.7.138.1458328949.squirrel@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gobject-introspection.bbclass: make additional DEPENDS conditional
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
X-List-Received-Date: Fri, 18 Mar 2016 20:42:34 -0000
X-Groupsio-MsgNum: 79818
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 09:22:29PM +0200, alexander.kanavin@linux.intel.com=
 wrote:
> > Even with gobject-introspection-data removed from DISTRO_FEATURES I'm
> > seeing
> > couple recipes (our version of gst-*) failing with:
> >
> > | configure:22282: error: possibly undefined macro: PKG_CONFIG_SYSROOT_=
DIR
> > |       If this token and others are legitimate, please use
> > m4_pattern_allow.
> > |       See the Autoconf documentation.
> >
> > and PKG_CONFIG_SYSROOT_DIR is added by introspection.m4 from g-i patchs=
et.
>=20
> Disabling building of introspection data will not guarantee absence of
> build failures, I'm afraid. Some recipes will work just fine unchanged,
> but others, including gstreamer, do need custom fixing, usually because
> they have non-standard locations for m4 macros, or those macros themselves
> are non-standard. So you need to rebase your recipes on top of those
> available now in oe-core, and particularly this snippet will fix the
> immediate problem you have above:
>=20
> delete_pkg_m4_file() {
>         # This m4 file is out of date and is missing
> PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
>         rm "${S}/common/m4/pkg.m4" || true
> }
>=20
> do_configure[prefuncs] +=3D " delete_pkg_m4_file"

Thanks, this did the trick.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbsaSEACgkQN1Ujt2V2gBy80QCfQF1DE9Apygb6hDACZUqOe7in
A2gAoLfi8LCg5kAehAXcuCuDICMUOvNt
=EjTK
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
