Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 884A67067B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:36:16 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so7622674wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vIuIlx8uQ/LzyBwTuiSC9Cqp5irvxfn9/igtdNY/xd0=;
	b=EsXJj1gX8tkfTd9QFfjTNlgJansVACfEpz6p/BCJL26gXw0LZO9y0CLy/us8cW+271
	abhXDVyFSsRYPFEWSzCDRCwm5bhdU6sxFZtOJ69VYzR6uLayvRRH53OJ1cFdRy068K0V
	ztE5LSsLwQzGupNoxSrtcvvc/1FOWocfCODOICGXR6kHeHlZ7mIrjeHQmOAhCzqreG7U
	mUOGbnGl+otD6chFjg6gzjjYedfJSBNNAWP+2fCX0GScRHO6MvIYQcj/Uo5EW9Cb7wxI
	zzrjn2wmJz1WBeYTIHQPWC5aQYKcMM46WT5Xz/CFx9BHAc0Za18YYtbxDeEIuL61F7Wy
	yUzA==
X-Received: by 10.194.82.106 with SMTP id h10mr5759404wjy.37.1409236577599;
	Thu, 28 Aug 2014 07:36:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xm4sm15432393wib.9.2014.08.28.07.36.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 07:36:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 16:36:25 +0200
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Message-ID: <20140828143625.GG16066@jama>
References: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
	<20140825101437.GP20524@jama> <53FEF8CF.6000801@gmail.com>
MIME-Version: 1.0
In-Reply-To: <53FEF8CF.6000801@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] md5deep: Add Recipe for md5deep package version 4.4
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
X-List-Received-Date: Thu, 28 Aug 2014 14:36:20 -0000
X-Groupsio-MsgNum: 57089
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline

--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 11:39:27AM +0200, Sven Ebenfeld wrote:
> Am 25.08.2014 12:14, schrieb Martin Jansa:
> > On Mon, Aug 25, 2014 at 09:56:31AM +0200, Sven Ebenfeld wrote:
> >> I need to build hashdeep/md5deep within OE to include it in my images.=
 This recipe enables OE to cross-compile md5deep. I needed to add the patch=
 as do_configure_qa is complaining about cross-compilation errors otherwise=
=2E I added a pull request for the issue with the variable expansion to has=
hdeep as well.
> >=20
> > Please send this to openembedded-devel@lists.openembedded.org
> >=20
> >=20
>=20
> Did I understand this right, that I should send the whole patch to
> OE-Devel ML? Or should I've sent anything else?

Whole patch as it was sent and picked by patchwork:
http://patchwork.openembedded.org/patch/78901/

it was merged in master-next few days ago.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP/PmkACgkQN1Ujt2V2gBytiQCfUzbkMsu52bsOW4EdLARAjf7g
1/EAnR2GiXXCPorJ2q0vYDTB/SfidbAz
=pjmR
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
