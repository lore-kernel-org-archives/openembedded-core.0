Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 53F926017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:09:25 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so50441wgh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MBJ+Tj/puv1OefN3shl91u6ldZerAPJ0mPmvOBOY6Fc=;
	b=qsxBvqXYEd/r3NjQm2MVatSsxICC34r99nHr4pX+oX9D3X/l6ybG1HRnoGT6KIah8u
	D/qrLlTg+3gThGeRM+D4DbersGxW/Te63Z+xkjvT78ReYXlxfpT1Rsh3wI3uoFYMclx4
	LHsvEfbSB/vVYwjSH3Xxtl17ynaSygRdE6kSgGSb5eDJvwb2Ae9efXSxjNd1vDe5F3y2
	ywqA34pWczgi96oz57PDgKDBcqloOOZz9nHqgB3Ke0GLC9TAg5JRiM54fMBRc4JRvcFC
	T86LSSGfJLOo+qeGKE6ULyQ8CIVchFDV0MuThTyaouce84jS25JPF9NafttqEDpyEquv
	3Knw==
X-Received: by 10.194.110.33 with SMTP id hx1mr59002516wjb.12.1412136566398;
	Tue, 30 Sep 2014 21:09:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kx2sm21230440wjb.6.2014.09.30.21.09.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Sep 2014 21:09:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Oct 2014 06:10:20 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20141001041020.GC25706@jama>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 04:09:28 -0000
X-Groupsio-MsgNum: 58275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QFYA38BK7dvhx8Kf"
Content-Disposition: inline

--QFYA38BK7dvhx8Kf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 08:55:53PM -0700, Khem Raj wrote:
> On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko <denis@denix.org> wrot=
e:
> > On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
> >> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.org> w=
rote:
> >> > This line above ^^^^ has a very long trail of whitespaces and it got=
 commited
> >> > that way, unfortunately :(
> >>
> >> Better was if you commented before it went in.
> >
> > And how would you suggest I was supposed to see it?? Nobody saw it. My =
email
> > client is no different than others - it doesn't mark trailing whitespac=
es. The
> > reason I saw it is because I ran "git log -p" on the file and that expl=
icitly
> > highlights trailing whitespaces in BRIGHT RED... :)
>=20
> just for that may be we should start using gerrit ;)

I'm all for it, it would make my e-mail - review - patchwork -
master-next workflow a lot easier and reliable.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QFYA38BK7dvhx8Kf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQrfqwACgkQN1Ujt2V2gBy7bwCeNVM+zCLBaBCuMD8zs68EbfOo
5GkAn3zHT4TeKF4lPpn8ZQvRQT3ogt+i
=hsPc
-----END PGP SIGNATURE-----

--QFYA38BK7dvhx8Kf--
