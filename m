Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SCUNF-0003YQ-P0; Tue, 27 Mar 2012 13:15:37 +0200
Received: by wibhj13 with SMTP id hj13so4868280wib.6
	for <multiple recipients>; Tue, 27 Mar 2012 04:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ad4+qFgmOfitlV7ecRNGX3v/DPPKc/NqgjFQdEIGYS0=;
	b=uCB7sZBbNfZL1Yx1he9y1o/95VU50iYiD+agrh2g1+VhqacUm0vP0E9L2yf4D3CW8L
	jC1xce8sUhZhTvtJToCIJrtnbLD55vcuf+O7VgjlvPbGY/uZPoZFN+fSOA++m3rDaJyi
	umn+NJVwMq6v/M6zcYOnzkC2ytEGF0RvVA0Mvqg3juxcEBSH4GWwfuK45VLM9CXuL/oy
	tHGF93vr/WGUwAiN6GSz33IAVGVFl519VNPEfSzLRRr4SZyAHtwrk++HFKKx96o7jlr6
	T0OTee6+Hsd8evtHZIEDRCg1mRZzSlVjeuh/0Q6+Xi2aJNggM1wEQE8CFmSpfg7yFPs7
	q81Q==
Received: by 10.180.100.2 with SMTP id eu2mr26664082wib.1.1332846396974;
	Tue, 27 Mar 2012 04:06:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm79923650wid.2.2012.03.27.04.06.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 04:06:35 -0700 (PDT)
Date: Tue, 27 Mar 2012 13:06:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120327110632.GA3969@jama.jama.net>
References: <20120224000137.466F310330@opal>
MIME-Version: 1.0
In-Reply-To: <20120224000137.466F310330@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : A script to clean obsolete sstate cache files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 11:15:37 -0000
X-Groupsio-MsgNum: 19809
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 12:01:37AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 7c99ef6d2173b14e1109a540ee5ae47b56d707e7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D7c99ef6d2173b14e1109a540ee5ae47b56d707e7
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Wed Feb 22 20:38:30 2012 +0800
>=20
> A script to clean obsolete sstate cache files
>=20

> +# Use the "_" to substitute "-", e.g., x86-64 to x86_64
> +all_archs=3D`grep -r DEFAULTTUNE $tunedir | \
> +    sed -e 's/.*\"\(.*\)\"/\1/' -e 's/-/_/g' | sort -u`
> +# Add the qemu archs
> +all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc"

This doesn't list any thumb variants, current list is:

arm1136jfs arm920t arm926ejs arm9tdmi armv4 armv5 armv6 armv7 armv7a
core2 cortexa8_neon cortexa9_neon cortexm1 cortexm3 cortexr4 ep9312 i586
iwmmxt mips mips32 powerpc powerpc64 ppc603e ppce300c2 ppce500 ppce500mc
ppce500v2 ppce5500 strongarm x86 x86_64 xscale

so thumb versions (e.g. armv4t) are not found in

> +for arch in $all_archs; do
> +    ls | grep -q -w $arch
> +    [ $? -eq 0 ] && ava_archs=3D"$ava_archs $arch"
> +done

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9xnzcACgkQN1Ujt2V2gBwZ7wCfYuGNQxukzyC0komn7e68QGp6
YHYAmwUCgw5hzOuv02YFj7/vKnWCuhrY
=1ZC+
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
