Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C4B9B607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 11:06:02 +0000 (UTC)
Received: by wgck11 with SMTP id k11so246577422wgc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jno9PTNtboGRFJjusMbDTTcSrhQXZBcSLF8ImxdrMdA=;
	b=FDhnri0SpgNd6K/u4+b5RLY3d9GyK04FdkTy1yvJhODN7G3Lq/rg27Z/SpK1QCMl72
	cr+MORUS9NeTNutejFYGqMevj8+eWt1DZovVnVu5jRuGVfLSllsl6EQt4JhoNbBuqeHL
	8Z/PpdEpBmXaWkaVNe/Qs0iidXy0XVmDkIjvuA0lN4EkHRt9mCp7FmfHQNsCOd5XIuEx
	jGtyEP4XJarD9JEzo/SVzSr/a5N5pXujIaVD83Y2xz8eJLXxAIwuTLOGrjISuozUW569
	1YUIwLpiklcMOzXvAf9KZMmvz9eJ74Hzta2AFLtB793BlCr5fClkSLeGmA/Nv0PnTOqL
	nx1A==
X-Received: by 10.180.99.168 with SMTP id er8mr5109809wib.86.1436526362120;
	Fri, 10 Jul 2015 04:06:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q4sm13086466wju.14.2015.07.10.04.06.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jul 2015 04:06:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Jul 2015 13:06:22 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150710110622.GC2397@jama>
References: <1433765628-15931-1-git-send-email-Martin.Jansa@gmail.com>
	<20150701132300.GI2409@jama> <559F92B3.8040407@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <559F92B3.8040407@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] squashfs-tools: upgrade to newer revision from git
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
X-List-Received-Date: Fri, 10 Jul 2015 11:06:03 -0000
X-Groupsio-MsgNum: 67803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline

--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2015 at 12:38:59PM +0300, Alexander Kanavin wrote:
> On 07/01/2015 04:23 PM, Martin Jansa wrote:
> > On Mon, Jun 08, 2015 at 02:13:48PM +0200, Martin Jansa wrote:
> >> * 4.3 release has nasty hard to reproduce bug in LZO compression
> >>    which in few cases results in one of these 2 errors:
>  >> ....
> >>    the official repo is:
> >>    https://git.kernel.org/cgit/fs/squashfs/squashfs-tools.git
> >>    but author's github is kept in sync so we can use just that
> >
> > Ping
>=20
> The author doesn't provide version tags in either of his repositories,=20
> which make upstream version check impossible.
>=20
> When a new version with this fix is released we should revert back to=20
> tarballs. If the patch didn't already appear in poky, I would suggest=20
> you cherry-pick those fixes instead.

He said that there won't be any new release in near future if ever.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWfpy0ACgkQN1Ujt2V2gBzizQCgi5GmYGFaKYFJq2PPufSmkKLG
RWAAn05b768ALPbvarTf0mlaxSgiDdf7
=GWLV
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
