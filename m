Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A5C5F77242;
	Thu, 12 Nov 2015 18:58:52 +0000 (UTC)
Received: by wmww144 with SMTP id w144so213611180wmw.1;
	Thu, 12 Nov 2015 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W4F3Z598IereMruzIXJFwyXnb27TQ5cGicirU7JnZwo=;
	b=IUOPLGd1kffWuoFp0BCQ1rsN07uC8Rx4sgUaXJKp6ztIQ9XZPGbKt1kQRIu9wPtUdE
	hX5YoLVWGt9GFYbrZQ4eSadjWEXTA1Y5OnxTo9U13W0VuMbtl/waBBplPHcgUIn19aez
	/Fh7AXmEs6gqeVZ/0QONQSb/kwtr2tu1Hl/mGc73EfyEYdu1zRP6uY5O6efCUVekt/41
	dUEgkM23/xey3kOEelYitSQKW6gxpP74NUZBZT81czCeY62sMLmxCwiBPiqfRizVNN4b
	gbRHUMEvpMR+7qTQzbia9usuCfDDiuPB8BfQH8frf31xcRxg9IhkddDgS3AGq3vGBP7C
	iBKg==
X-Received: by 10.28.63.22 with SMTP id m22mr33704771wma.58.1447354732168;
	Thu, 12 Nov 2015 10:58:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	at4sm15903478wjc.9.2015.11.12.10.58.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 10:58:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 19:59:07 +0100
To: alexander.kanavin@linux.intel.com
Message-ID: <20151112185907.GL2574@jama>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<20151112171915.GK2574@jama>
	<58904.10.252.13.130.1447349938.squirrel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <58904.10.252.13.130.1447349938.squirrel@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Thu, 12 Nov 2015 18:58:53 -0000
X-Groupsio-MsgNum: 73307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00hq2S6J2Jlg6EbK"
Content-Disposition: inline

--00hq2S6J2Jlg6EbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 07:38:58PM +0200, alexander.kanavin@linux.intel.com=
 wrote:
> > There is already enough meta-oe bloat moved from oe-core:
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-November=
/112665.html
> >
> > WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0, =
but
> > it isn't a build dependency?
>=20
> If increasing bloat is a problem, why do recipes in meta-oe need to be
> maintained indefinitely? Old cruft can be dropped from meta-oe, just as it
> is dropped from oe-core. Just ask the public if it's ok, set a timeframe,
> and do it.
>=20
> qt-mobility in particular has been dead for several years, and doesn't
> even have official upstream tarballs anymore. Why spend time fixing it?

That's why there is increasing number of PNBLACKLISTs with each release.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--00hq2S6J2Jlg6EbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZE4XsACgkQN1Ujt2V2gByO+ACbB87WSUnGp4f85wLbGsz7d88J
bRoAniMWuR2yD+m71jStsPLGUqkJXX0/
=C4ub
-----END PGP SIGNATURE-----

--00hq2S6J2Jlg6EbK--
