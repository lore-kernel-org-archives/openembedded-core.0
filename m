Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2C16B1C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 08:36:48 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so852630ead.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=czQOK3IIWZYQOTZ7Z9j2ShSCvp2QYCsBDTocI+SN2x0=;
	b=pFVQnD8VByxTkhR44IOW/P3tgZ9MIFx8rpjnb1pmn7b/h5j1wfO0JlXy9vbo26OGqM
	ZTq2f05kThZ59QQ+Gj2NoJMvZ6cY1HzgHqPuXtUXCz8iwFME9C7bimd5Xi9I/Ajj1rZ3
	/UK6ZWZXXwRt4ZdgQ/W5nnuAkcx4tMLXzg6A/5Jc98AlaoZgqE1qeG2P4dsGwVY8hZRJ
	rb0Vff7fULn+vnwqaLAroXO3eilxa7iT92+OYG/314dMHoHBUjxT0kQrplhCCjTKNLC6
	/YX8rQKMt56c8Y/roW9f/CGeMc7+ihdQAi3bm23Z0hMVzi6TbxjKLFrYqAElxbTJ/VKY
	l0zg==
X-Received: by 10.14.225.72 with SMTP id y48mr373228eep.131.1375346208732;
	Thu, 01 Aug 2013 01:36:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm2545361eeh.15.2013.08.01.01.36.47 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 01:36:48 -0700 (PDT)
Date: Thu, 1 Aug 2013 10:37:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130801083723.GJ3280@jama>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
	<435e5b32a36fbc1e2eabda8d9ed1eff7273673c5.1375275560.git.laurentiu.palcu@intel.com>
	<51F990E4.3060505@linux.intel.com>
	<CAPhnLPDcJDAQF=_PiZ2A87unB=ZEOW5atSgHvhu=x1H9c0LmhA@mail.gmail.com>
	<CAJTo0LbxoCY20u1T-Z3Y2EFBOQfNW_jcf71E-QkLiK8qNzT9yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbxoCY20u1T-Z3Y2EFBOQfNW_jcf71E-QkLiK8qNzT9yA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] subversion: upgrade to 1.8.1
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
X-List-Received-Date: Thu, 01 Aug 2013 08:36:49 -0000
X-Groupsio-MsgNum: 42793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline

--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 07:30:25AM +0100, Burton, Ross wrote:
> On 1 August 2013 00:59, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
> > If we do update this I'd like to also get this backported to earlier
> > and remove all older versions of subversion to keep from mixing and
> > matching with svn.
> >
> > They made changes in 1.8 that requires an upgrade to the working copy
> > of a checkout. Once upgraded I don't believe you can go back to an
> > earlier version. If people try to utilize an svn 1.8 oe-core and an
> > svn 1.7 oe-core, this could destroy the svn working copies in DL_DIR.
> > Which would be bad for those of us who maintain source mirrors.
>=20
> Again? Urgh.  Sounds like an excellent reason to not move to 1.8 as
> this bit us one already.

Does this
http://git.openembedded.org/bitbake/commit/?id=3Debd3ecdb5f3c6d3fe1fad27cbe=
d4d80f4277e92e
work for 1.7 -> 1.8 transition?

It looks like it should from
http://subversion.apache.org/docs/release-notes/1.8.html
but someone should test it before builders will start distributing
downloads directory to PREMIRRORs with working copy format already
upgraded.

Good that we removed subversion-native from ASSUME_PROVIDED :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6HkMACgkQN1Ujt2V2gBwlFgCgqM4/gF8garrj3BWpV8H4xmi4
n5YAoKZSzxSFa/+oxBKxenm25jXz2hUm
=X59k
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--
