Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id A006F60144
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 10:27:33 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so5496033wes.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 03:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CGc9+Y4CtUtgZzC8a/Va+GLB3s9obo19ZnA8D0OM3ms=;
	b=b08cpVcyqFvmZ4T4xAppIHNk9pah9TkNCaJtT4h7Nr6EIM/apWZTtJDCaSNKPlZZWC
	U1mC1LQrHddfe0A2fuw9VfU7gH3XM0mAk7jMS+ofFPJV143PqF3TY8+WZWqBkoycGr3x
	u7LflnY12JuvChI1ZoPLW1EfPD6GoZ/XWaQ1UJGME43FoVd6ZlZbOCznwT/ql7GhKxpC
	NjX431gnYmsbAaajutUsTCypL+elF4e67W6OLG6QnVJ7xLaAEmazyCDy48wMIryw3TCI
	nFc/vOkQcQfEvIxYbFuRpMaZJNVaozzxZiSifg6SHBnA9TzRhgJvwEtDn1JKNaZisWK+
	Lu9g==
X-Received: by 10.194.184.101 with SMTP id et5mr31728016wjc.14.1407493654834; 
	Fri, 08 Aug 2014 03:27:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lq15sm5841171wic.1.2014.08.08.03.27.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 03:27:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 12:28:05 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140808102805.GD14848@jama>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
	<42649926.Kn7RmW5cEk@peggleto-mobl5.ger.corp.intel.com>
	<20140806143734.GK14848@jama>
	<2430037.0dFcuVztg3@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2430037.0dFcuVztg3@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Fri, 08 Aug 2014 10:27:40 -0000
X-Groupsio-MsgNum: 56143
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pd/ueeoza9+75UV5"
Content-Disposition: inline

--pd/ueeoza9+75UV5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 03:42:38PM +0100, Paul Eggleton wrote:
> On Wednesday 06 August 2014 16:37:34 Martin Jansa wrote:
> > On Wed, Aug 06, 2014 at 01:41:58PM +0100, Paul Eggleton wrote:
> > > On Wednesday 06 August 2014 13:41:56 Martin Jansa wrote:
> > > > * building with libav-9 fails with:
> > > >   | checking for POSTPROC... configure: error: Package requirements
> > > >   | (libpostproc libavcodec libavutil) were not met:
> > > >   |=20
> > > >   | No package 'libpostproc' found
> > >=20
> > > Does gst-ffmpeg actually work with libav > 0.8?
> >=20
> > No, not yet (see world status e-mails), but at least this is step
> > in right direction IMHO and doesn't harm libav-0.8 users.
>=20
> I'm just not sure gst-ffmpeg should be allowed to get past this at all if=
 it's=20

It gets past this when libpostproc is built before gst-ffmpeg, adding
the dependency only makes the failure with libav-9 to be deterministic
(always in the same piece of code).

> not currently expected to work. The known working configuration is either=
=20
> gst-ffmpeg + libav 0.8.x, or gstreamer1.0-libav + libav > 0.8.x.

FWIW here is patchset used by gentoo to make gst-ffmpeg-0.10.13
compatible with libav-9:

http://dev.gentoo.org/~tetromino/distfiles/gst-plugins-ffmpeg/gst-ffmpeg-0.=
10.13_p2012.11-libav-9-patches.tar.xz

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pd/ueeoza9+75UV5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPkpjUACgkQN1Ujt2V2gBwqAgCaAlVBHmSaj8LpFh2HQMfFRdCg
vB8An2zTCzNmQhvERwcqn7ikXYNVZ9Sw
=y4+o
-----END PGP SIGNATURE-----

--pd/ueeoza9+75UV5--
