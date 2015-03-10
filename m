Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 32FF573A15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:33:36 +0000 (UTC)
Received: by wiwh11 with SMTP id h11so19848488wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k7+eeFF77rn61i4bNHrK96mVmEyFf/Kq90SR2MCyIEg=;
	b=UNrXCMRnuOqT/TKflG0Sa3pD/jvJkO4qPF2ZK54pirWNzWVpE9j6IHCG2jZ6bf+yar
	mQq5r4/b/OjRRLloOtc4+NUtrvmV3u9nwExVl71ExqwtjJqSgx0310VQCht5Fs21PhIi
	UFOS1BTOTTEzzjnKkb/wpHznfeixyd+JNTcB5v8AfQsNiTzXi+YiKBu3mtpkLNJq20xR
	2xncsPe2uSwGHefOtdTBzw9tPpYwCdozd34InO8lKB/Y27SY6nUiZuX93G3csePa5xXo
	tiHk+2nFTA+hpkmd2+f6hUGogzT+1Yk81/+gX2PxWk+h40izBXttV22LZ5v/yuyqmTD8
	HwTA==
X-Received: by 10.181.8.75 with SMTP id di11mr113626958wid.26.1425994418020;
	Tue, 10 Mar 2015 06:33:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nb4sm933317wjc.20.2015.03.10.06.33.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 06:33:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Mar 2015 14:34:08 +0100
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150310133408.GB2340@jama>
References: <1425919096-19919-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKpbN_n-hHqN6iVzkfCf6282y3os757=q2SxpdAeDxyc8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpbN_n-hHqN6iVzkfCf6282y3os757=q2SxpdAeDxyc8A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] liberation-fonts: inherit allarch as fonts are arch-independent
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
X-List-Received-Date: Tue, 10 Mar 2015 13:33:37 -0000
X-Groupsio-MsgNum: 63161
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 01:42:14PM -0300, Otavio Salvador wrote:
> On Mon, Mar 9, 2015 at 1:38 PM, Ross Burton <ross.burton@intel.com> wrote:
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

It fontcache adds dependency on TUNE_PKGARCH fontconfig-utils so
technically they aren't independent (from sstate signatures point of
view).

> Once this is merged, please backport it to Dizzy as well

Please don't, especially with issues when recipes are moved between
PACKAGE_ARCHs https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT+8tAACgkQN1Ujt2V2gBzH1QCgoWKw4tCKSNmo86489qewpWYy
d3cAoKRC9nP2UC1HEwVkkaGkaHrCE4SR
=WJcS
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
