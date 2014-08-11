Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 307F770A30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:20:57 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so8413059wes.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NYiP9lugBDrEos1SWpls8+hMfQxoo2sVTQ+03lGo6tw=;
	b=rbpGv5NGzb0gGM6W+R/+XFz/iwrlOsVsw4p+onCKV5B4/AGd3TaQI971pEi6VBwqC0
	Lliw9NIwsfxStW6ZyjbJYCWIx7Mv1Q7oOR1y502XnjQT+8opn9+LahkIQcCIIB3dtxca
	Mq+o8ygCauDZohhLyPQxsf6Gni+kwMYz2f5OfCtrRfaTrOUPptFDQQd737Tv3+Lf1eoI
	GBXDvEdjUVjKUGGAMn6oy1rWjNsVZEukZAv3DhdPpUqngbH+gtP9VVdy+NLWLkSom/I9
	vEw7YyF0Q0muI81aOfCojL/WbF2C6J0wFeGfPr/3FdjI6nA/niIHkKB8zFsebLQxYqP9
	fP1Q==
X-Received: by 10.181.8.75 with SMTP id di11mr20000825wid.15.1407752457797;
	Mon, 11 Aug 2014 03:20:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	do6sm42107086wib.22.2014.08.11.03.20.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 03:20:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Aug 2014 12:21:32 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140811102132.GW14848@jama>
References: <1407663535-6484-1-git-send-email-Martin.Jansa@gmail.com>
	<1407663535-6484-2-git-send-email-Martin.Jansa@gmail.com>
	<1407751403.22187.0.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1407751403.22187.0.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 2/2] perf: fix indentation
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
X-List-Received-Date: Mon, 11 Aug 2014 10:21:05 -0000
X-Groupsio-MsgNum: 56283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jtT0V0WkcdQSXbqe"
Content-Disposition: inline

--jtT0V0WkcdQSXbqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 11:03:23AM +0100, Richard Purdie wrote:
> On Sun, 2014-08-10 at 11:38 +0200, Martin Jansa wrote:
> > * multiline variables should use spaces not tabs for indentation
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 54 ++++++++++++++++++++------------=
--------
> >  1 file changed, 27 insertions(+), 27 deletions(-)
>=20
> Do we really need to backport whitespace changes?

It will make next possible backports to perf easier, but feel free to
skip this.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jtT0V0WkcdQSXbqe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPomSwACgkQN1Ujt2V2gBxPZgCgts9Gk+goN7T1pkzfSU+vIUb2
kcQAn26pmj6OixVD9Q0/c9h0kJNqRZlc
=0g3T
-----END PGP SIGNATURE-----

--jtT0V0WkcdQSXbqe--
