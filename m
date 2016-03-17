Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 271BB601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:32:25 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so44212296wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vUL2aPCItxQTM/AYqc/4eQbXZ7ExgpbuTRtmGWKZ+08=;
	b=qNi+i9TFVCJ87sJu74/la4J57TdnVJFep2ojEj30tq/C3/JsvkBr3EwVUpZOxPMZRc
	YvBmaU8MKwc8TgvkEyY4eHHP/9+Bvh3WVy4sU5tu35ck96xkBh8a5kuOvyfmvg/0uoc4
	ryUzgBBKWN9jTQtv4WXaJ7AZMzUF2In+owRwLllgHWCYeWgRsQL4v64BWtt1A7fHVKAG
	qs5X8stAlU+gViYwV8zrrba7QgQ+foa1kSwUrTjOMuiRnCHtzU8eRaf9dBAjODS85g0O
	Q7YlG9ndQO1Pv1DZUoAp7W3sW5VeJTX4syyKFkxaofsGw3EO+swziKKS9dr0VA1hOY7C
	TF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vUL2aPCItxQTM/AYqc/4eQbXZ7ExgpbuTRtmGWKZ+08=;
	b=c28gXUcXNK4bALEnNfYA/sKbCtoyiUZm3NxyWV97V84WfBv+a5VLI+PYruBUwCLl/4
	UzwEMhtChPLWn0fQJIKve7RRjKEboRvtHNYZiT6dcqykBQF9LJfxpqT/TuB17ZyEfuVz
	5omh0u/Z5EGcVPFqUzW6ogDpC2UqDB+C3IpIGTCmXY6pQRKtOd6p/nS6KpxuVjNRO6uS
	h34y70eLrguPMDYq2KH2JJBypBNBP3PMo1wEnELyRWPEWv0uGCpCZRNrhvlShDYIVpd+
	W+s3H1V3OuN0WMftBb+bFy/YYvIybnkNel8CucoaGT2oIXBWqjk5hnD/oinKKRY6Xhzz
	l+aQ==
X-Gm-Message-State: AD7BkJJQGQREF2/uaKSkaWtjBlAfHnN6FxPCYPDJbI9T96vjqwArWp4z+kD/HO1XAvi1+A==
X-Received: by 10.194.95.73 with SMTP id di9mr13385141wjb.152.1458250345621;
	Thu, 17 Mar 2016 14:32:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	198sm9871466wml.22.2016.03.17.14.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:32:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 22:36:08 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160317213608.GG2553@jama>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Mar 2016 21:32:27 -0000
X-Groupsio-MsgNum: 79762
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline

--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 05:29:59PM +0000, Burton, Ross wrote:
> On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> >  # Generating introspection data depends on a combination of native and
> > target
> >  # introspection tools, and qemu to run the target tools.
> > -DEPENDS_append =3D " gobject-introspection gobject-introspection-native
> > qemu-native"
> > +DEPENDS_append =3D " ${@bb.utils.contains('COMBINED_FEATURES',
> > 'gobject-introspection-data', 'gobject-introspection
> > gobject-introspection-native qemu-native', '', d)}"
> >
>=20
> Have you verified this works with g-i disabled and a clean sysroot?  I'm
> thinking builds will still need at least some of this to provide the m4
> macros.

Even with gobject-introspection-data removed from DISTRO_FEATURES I'm seeing
couple recipes (our version of gst-*) failing with:

| configure:22282: error: possibly undefined macro: PKG_CONFIG_SYSROOT_DIR
|       If this token and others are legitimate, please use m4_pattern_allo=
w.
|       See the Autoconf documentation.

and PKG_CONFIG_SYSROOT_DIR is added by introspection.m4 from g-i patchset.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbrI0cACgkQN1Ujt2V2gBz10wCgmh/LF8qt6mN6s19/xkgikV8z
jMUAn0IixRvUoAdZMGoK1+OwbDxnES3p
=iBhk
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
