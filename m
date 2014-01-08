Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id E19716C963
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:37:51 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so978474eaj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=EiSLRjYw3Z0VH9UFrfuE7iAF2XLpOS8Hau0E+zkBVrQ=;
	b=X9saob+f1owyyWFT5z3D6fbrxF2LA10pCs1BmkKh8hREid0omajT4pOiN2ffUVWBoM
	fRyqptcOcb6ue71Ikac36iV7EtAXWfYUEUOihYOnzU7LiamvmeaRSQelJxrpWMDvtH6I
	llZthYB7NMKD2fAnwMlBtjSq7jlWNuxaKCLWTi98UIi4giu3EUB95Pd+RBlCEGDdSIsu
	lK9AdjXiawL7QJ70e3T3DXrSQeiVYh3znQxE81wGdpBfWfDqyrnfzvXdo73DZ3EMl8Ud
	XtU8BmXYGTvz5uzc6tZ63LOKrSq8j+AA0YqoJiDCM8NkGtQa1wOHC37T84wiFdBsa203
	tCVg==
X-Received: by 10.14.3.130 with SMTP id 2mr46485364eeh.36.1389202672651;
	Wed, 08 Jan 2014 09:37:52 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm191197284eeg.4.2014.01.08.09.37.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 09:37:51 -0800 (PST)
Date: Wed, 8 Jan 2014 18:38:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140108173801.GB3709@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Wed, 08 Jan 2014 17:37:52 -0000
X-Groupsio-MsgNum: 48724
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lpbaaqEfWJan1gxl"
Content-Disposition: inline

--lpbaaqEfWJan1gxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

since this patch:
commit 263e654e5d28fa7f6b0c8cc23f57a31448e88a40
Author: Valentin Popa <valentin.popa@intel.com>
Date:   Wed Oct 30 12:27:39 2013 +0200

    Mesa: upgrade to 9.2.2

    * License is still MIT
    * removed patches were already merged or
      another solution was backported.

I have to define MESA_EGL_NO_X11_HEADERS in qtbase and qtwebkit again to
build them without xlib.h available (DISTRO without x11 in
DISTRO_FEATURES).

Are you sure that
meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
was resolved in upstream?

Regards,

--lpbaaqEfWJan1gxl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLNjPkACgkQN1Ujt2V2gBzXSwCgg3EPhhRsemCo+72KXnIQpkYa
6QoAoJGAYh818SndrSsKUAmjrlAvDvA9
=96cS
-----END PGP SIGNATURE-----

--lpbaaqEfWJan1gxl--
