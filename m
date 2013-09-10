Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFB96B1E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 18:53:00 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so4115054eek.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gz4x1qU/DBffstBsUASXsecAVOwe1XUbVs4QDr2ZGp8=;
	b=Atq1+2Ze98JJy71Ev/48J2lQyDu8tXCMbbK01V9zf03FjPBSKVyzKOHzInl24FVz02
	V0KnHt4MmFC3jd/+2R+1OdYoF0vH7sqw2817c8/2ZUoFsZg4hDFmG3TLQ079L1Q9Z2s1
	2jn+SOF8pUNHT8vL1MUD74ogQgKyXoVC4my51TifEG6CaJI5XDuEVQ2dMGEJcvtqo6X6
	YYfA7JO0peUWa9K24vDEYdfhS8OAlAyQ6HQwVNs0ZeDK+vbA2TkeJcmSKCfPOJE/N+Bt
	U4inC2i7gq6TcJKPYlZcT6deZd+hszHaaXSEDpWUBflXpXxLXGYTnftzAY/YWCN0h5lw
	zTfQ==
X-Received: by 10.15.43.206 with SMTP id x54mr29644eev.79.1378839182029;
	Tue, 10 Sep 2013 11:53:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm33661614eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 11:53:01 -0700 (PDT)
Date: Tue, 10 Sep 2013 20:54:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130910185427.GV11500@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [WIP][PATCH 00/20] Deterministic dependencies II
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
X-List-Received-Date: Tue, 10 Sep 2013 18:53:02 -0000
X-Groupsio-MsgNum: 44786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7OjtA+nCOeniMjk8"
Content-Disposition: inline

--7OjtA+nCOeniMjk8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 06:02:47PM +0200, Martin Jansa wrote:
> WIP because verification build is still running and I must admit that I'm=
 mostly
> testing that all dependencies are correctly "disabled" and in the end det=
erministic.
>=20
> I'm not testing if every possible combination of PACKAGECONFIG options pr=
ovide sufficient
> dependency tree.
>=20
> But it would be nice to get some review in advance and be able to get this
> in 1.5 if I manage to fix all possible review comments and/or issues disc=
overed
> in my builds in time.

FYI: I didn't have time to finish this in last 2 weeks and will be very
busy for next 2 weeks so I'm OK with leaving this for 1.5.1 or something
like that after 1.5 release. I did some changes from review comments, so
the branch has slightly newer versions.

If you see something you really want to have in release please speak up
and review/confirm it for me.

The same does apply for longer meta-openembedded patchset with
dependencies.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7OjtA+nCOeniMjk8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIvauMACgkQN1Ujt2V2gBxRQgCglcjHk+ORCxhI8IniGa1taAmQ
dt8Anibs/zRR7N3F8P+JtjB1Iv6eK4Jy
=ohyf
-----END PGP SIGNATURE-----

--7OjtA+nCOeniMjk8--
