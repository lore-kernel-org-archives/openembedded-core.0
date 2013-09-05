Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id EFD75615F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:02:46 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so728013eak.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ka0Iho0vYKiq4IP95pWKlIDM0TbvElxYqCOJoLwqhFA=;
	b=OAFw8yl09XkQ5NAMkWOhNmrkM4QgAgeWJU3aGjBtvCp/uPrOZDVT6ZpSW6NFPPuKfM
	DpcP84ItIZhrNeImUZ/OKfUfY2KWT7MhQ94I/oPpX5PFGulyEDG4QXK7Jmv5gr+edvrY
	ViQVwQIBiDEOyfRDMeJNeSNpP/p2K8ZBCqAfm2SxzlChohbP370VBnRGcbdEGHdYpub7
	wmI1kVoLs4AjNC0sn8RVo2MUyv4Z8FUCDEnORQ5LptI3g9MiqYYKmahGat7SdU3H3mEA
	CR41UUSrZgSkl++R+jyKqeGkOSb6AuTDax3ju07h0ha6gQb/sKvxf1GQTBEe040ZKUWP
	RigQ==
X-Received: by 10.14.225.199 with SMTP id z47mr11678945eep.24.1378368167778;
	Thu, 05 Sep 2013 01:02:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm46434607eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 01:02:47 -0700 (PDT)
Date: Thu, 5 Sep 2013 10:04:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130905080407.GH11500@jama>
References: <1497435.xtb1AxO9Wj@helios>
MIME-Version: 1.0
In-Reply-To: <1497435.xtb1AxO9Wj@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: OpenEmbedded Layer Index updated
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
X-List-Received-Date: Thu, 05 Sep 2013 08:02:47 -0000
X-Groupsio-MsgNum: 44526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Content-Disposition: inline

--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 01:10:47AM +0100, Paul Eggleton wrote:
> As always, feedback is welcome.

Great job!

One more suggestion (maybe I've overlooked it):

It would be nice to be able to search recipe across all branches
(including oe-classic)

e.g. if someone asks me to include ace in our builds I would like to
just search for ace, like:
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dace

and find it's not in master/dylan/danny, but that it still is in
oe-classic
http://layers.openembedded.org/layerindex/oe-classic/recipe/13881/

Now I have to run the same search in 2-4 different branches to be sure
there isn't recipe for ace already.

In many cases we can assume that if something isn't in master then it
isn't in danny/dylan, but that's not true for e.g. mysql5 which should
correctly show availability in oe-classic/danny/dylan (and master has
mariadb).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIoOvcACgkQN1Ujt2V2gBwBvQCfWggLASgqAFoEd1TJmtRETXc8
4egAn0f5Mu4I8XKXVlgpSx036MpJBFV+
=Dm2u
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
