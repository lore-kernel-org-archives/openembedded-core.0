Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id BC94E65D3B;
	Thu, 11 Dec 2014 12:14:14 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so6215264wgg.7
	for <multiple recipients>; Thu, 11 Dec 2014 04:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qEnEpS4t6PX6S3jXEnMA8QSKBKi1PN7lXbRcplUgA/M=;
	b=rMo8vQWDpcXJFKSYjncEfglH2ijtwJ7YrH3UK5OdcEXuyEQ0heAOElUUlpd1LC4QTi
	iw6l2KVaArRlMh0tZgLpC50WHLQfd0hdCqAvnalNBWoLysWZwm76+mVtA2xF4ghCrpPo
	5wivY2mrhFtQvj0zx1H4wa3fxYmG77SdfkT5RMKK1/L2Zpz4s6JOntxEcnv4R8OW2O4U
	WsxDIpC8AgB5OCAWMgb+3hv/iFP9wK2p37rSLqNKTdCydjZ7p09zFUDHpBaNRpWDVFyz
	fCc4F4ZYmowtYF8/P7jzTSONYZXAn4TLL+xkABeEWmgblaJ973pX2bZFxZ3+twN9B6xd
	Sb7g==
X-Received: by 10.180.228.37 with SMTP id sf5mr22549511wic.35.1418300054694;
	Thu, 11 Dec 2014 04:14:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jp3sm2729979wid.9.2014.12.11.04.14.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 04:14:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Dec 2014 13:14:17 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141211121417.GB2467@jama>
References: <20141211092332.GA2467@jama>
	<CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 12:14:17 -0000
X-Groupsio-MsgNum: 60440
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 11:13:51AM +0000, Burton, Ross wrote:
> On 11 December 2014 at 09:23, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on
> > gst-plugins-bad-rtmp, but it isn't a build dependency?
> > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when
> > building with minimal dependencies?
> > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created
> > when building with minimal dependencies?
> >
>=20
> Coincidently last night my world run gave me warnings that
> gst-plugins-bad-rtmp was depending on rtmpdump without a build depends, so
> I've copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to
> gst-plugins-bad.  Presumably this will fix these errors, although that
> warning seems odd.

Why odd? It just means that gst-plugins-bad-rtmp* packages aren't
created at all when rtmp isn't autodetected.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSJipkACgkQN1Ujt2V2gByFHgCfR89MNJWBJxTehvS4BMK6+NrM
RAAAoJVW7tUsJRIB8SN5XRbiPhuY/wEw
=1HKl
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
