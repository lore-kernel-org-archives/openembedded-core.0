Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 135A965C91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 13:05:34 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id m15so848647wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 05:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2FhiPExhdlvVakzK8twvEb/YqR32/Zz626jINFEAcaM=;
	b=bhctzFJ8t09ub2GQ475nXMBfW6jmL48z1c5CQy9bE/8l2eoTMRmoEJLRrEdAQrjRTO
	434Lu46OO5MfgMpp7di2RkrLAh/Nn0wtWKhaCsgbgnnM9VUHkue/bKKNAWrx6VAC4J8d
	56pDsJ5g/RMwQdqBAPUiYFEQQ8hzTyTEMHu+Huz3BsiVF/IqLNDWvgR5bRBNBDRCOnMb
	foy+Hl5MRd7868BVTqMgp3PSvKd2x0ydDznubjWhSxMKnx5KKaUfTsYoBHaln7/C4I8Z
	DtzrnJsLN3SBCWBOzfA2RpsCioTNh+MXwnGcnw2iFim2kgi52t7CamTKdQEqjYGvsrwf
	A9zg==
X-Received: by 10.181.8.72 with SMTP id di8mr32190672wid.1.1415192735040;
	Wed, 05 Nov 2014 05:05:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cg15sm2054596wjb.34.2014.11.05.05.05.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Nov 2014 05:05:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Nov 2014 14:05:36 +0100
To: Sona Sarmadi <sona.sarmadi@enea.com>
Message-ID: <20141105130536.GA2457@jama>
References: <1415190193-40532-1-git-send-email-sona.sarmadi@enea.com>
	<5425666.uucE3BEg2m@peggleto-mobl5.ger.corp.intel.com>
	<3230301C09DEF9499B442BBE162C5E482577C41F@SESTOEX04.enea.se>
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E482577C41F@SESTOEX04.enea.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix for CVE-2014-3566
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
X-List-Received-Date: Wed, 05 Nov 2014 13:05:39 -0000
X-Groupsio-MsgNum: 59248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 12:31:56PM +0000, Sona Sarmadi wrote:
> Hi Paul,
>=20
>=20
> > Just to be clear, this is for the dora branch right?
> >=20
> > Cheers,
> > Paul
>=20
> Yes, I send the patch as below, why does not the branch name come in the =
subject :( ?=20
>=20
> git send-email --to=3Dopenembedded-core@lists.openembedded.org --confirm=
=3Dalways  --subject-prefix=3D"dora][PATCH" 000*

Because you're sending already generated files (000*), it works only
when you specify git revisions (e.g. -1 my_branch).

Or you need to pass --subject-prefix when you're calling git
format-patch to generate them.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRaIKAACgkQN1Ujt2V2gBzabgCeKKRTI33VNQuOD/nHf/tbJ7ok
fkEAnRYXADLylB52dD6V4ssYEY4NwnYq
=oLNZ
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
