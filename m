Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E1F4F716CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 12:44:56 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2695558wib.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 04:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qGDYm4Cw5yTy80F+b3GWh/NR/nKR1gGwRFA6nUqyHRE=;
	b=us8c0vu9DC50RBrk2Fw3TCpScife0gF9kKRvrS2+naNnexCP/uDjWhqJ3m1N1j7ETU
	LAc7Q6lhPMxt7um4+Dec8zwbmR1eww/x2EAOs/eMvfpkJzWI67rFtToyEFRbSvkNOBYR
	C/XwIPBrjxl4Wd4+vTPbba+8Up3MgaDah9qitGFR9CiOTXDKDK5HhIpTRJJPbhYe+BOU
	QvAuZf4UjDwoq3Ax+NhSsRy1/3lCDJHIkZmIgfB2WLrsmsq3/35zM/PExbEiaSkVXiX8
	RlR7V2kdpm9kkR2gYpfv9xv06bN8Uzl6KR5f5u66+4khJ3dUeFl1uPKfxacFH49m5h7j
	z3pQ==
X-Received: by 10.194.22.6 with SMTP id z6mr17936633wje.146.1424436297747;
	Fri, 20 Feb 2015 04:44:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id k6sm2255115wia.6.2015.02.20.04.44.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 04:44:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Feb 2015 13:45:01 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150220124501.GB2322@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
	<87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 20 Feb 2015 12:44:57 -0000
X-Groupsio-MsgNum: 62591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2015 at 04:02:36PM +0000, Burton, Ross wrote:
> On 3 February 2015 at 01:05, Richard Tollerton <rich.tollerton@ni.com>
> wrote:
>=20
> > Done (and sent), and my apologies, because this exercise has made clear
> > that I was wrong in several of the details here: None of the three
> > patches were committed; I was confusing one of them with 89a29a3a, which
> > was from a separate email. The confusion originated in 89a29a3a having
> > been committed after I had already withdrawn it, which I forgot about
> > over the holidays.
> >
>=20
> That's probably my fault, sorry.  Thanks for following up and resolving
> this properly.

Can you please merge those fixes before 1.8 is closed? Or at least
revert the original patch which shouldn't be merged, until your comment
for 1/3 is resolved.

FWIW I haven't noticed v4 to resolve:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg61=
018.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTnLE0ACgkQN1Ujt2V2gBylWQCeKVFVtjr077GmfkV0OlL2MLbW
ZgsAn3Kxr60Is+LiSWdso/vpRQDMtkAl
=yk/k
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
