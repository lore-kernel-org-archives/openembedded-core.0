Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A7D43771EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:16:48 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g62so193349350wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XJjIpY7XV5hyBSyV77U88YL0HcQg3sEiFj9D23dubxs=;
	b=bxlvFro4c1C4tsYn+VoC2tLQ3vuNoNOYZvGWkyJ3nDqyKcGVAAsKABGQ7VBOlKSB96
	tnaRNxs+7FkRkzopxze1YfWsewT+chiwVzVC0lOgGXJi3jAfUObXiOOQYb1Ca2mLaH2r
	M40FwT3QxO4mjJxL5/8fT67HV7Q6wg+Eq/mtMhrhscjqQPB/Sm/sjzrTv9LcCixA+Wkw
	elu2tDqpPdxdFEq+i0dSzqoE6uRKw5cpDQRZfHpBnzoOlyqKjbFbEMq1jrt8LdPdT6MN
	KEgEOampsUurzlbOCQtYvY38WJLEe9KSoWawz86c5rgqLoOOcKBSV1iqPkygLbmMboHK
	i62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XJjIpY7XV5hyBSyV77U88YL0HcQg3sEiFj9D23dubxs=;
	b=cMT8wmAW3G5VlJwpnwFn6a+UEHNnIHGaH3zuy3R8Ocr1G5DOfnxdJHluB9RmARhl1C
	1uwUxYUyoytKAJDKQwV4HJjdMtzm72SOzwLckvM0XoiOFPTKb7HcUgbLmdggOL52/kU0
	cCL5ipAnaDVQ7BQCJFpKxGolzmVjAL/9IH0t0R2mMI+9yYre7JsdIccDhZ7LxQKVtLvw
	VZgSng6AyWkIjve7PUBf01GiY4CB7feSQUIRGlSdBCrPBWM4OQhcNX12FVHf7HM6J9uk
	3tZ6cYZdMpH3eCclGI4ID/IzpHothUaNN+S2AawBUBWPHi+DRIaGPr1KmpzWmu/PPEzY
	z95A==
X-Gm-Message-State: AG10YOS8NlhNLa3HerF02nur/zx0ATCiVMC/ioAqEniYaV63lkL7NXT3IfncGljw9wEfhg==
X-Received: by 10.28.218.145 with SMTP id r139mr15848464wmg.52.1456175808760; 
	Mon, 22 Feb 2016 13:16:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cb2sm26488845wjc.16.2016.02.22.13.16.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 13:16:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 22:17:40 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20160222211740.GG6329@jama>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetcher broken?
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
X-List-Received-Date: Mon, 22 Feb 2016 21:16:49 -0000
X-Groupsio-MsgNum: 78502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline

--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 10:06:10PM +0100, Andreas M=FCller wrote:
> Hi,
>=20
> after all these scary changes in master oe-core I wanted to see what's
> left over working since jethro for my images.
>=20
> On thing noticed immediately: I see
>=20
> WARNING: flex-native-2.6.0-r0 do_fetch: Checksum failure encountered
> with download of
> http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2 - will
> attempt other sources if available
> WARNING: flex-native-2.6.0-r0 do_fetch: Renaming
> /home/superandy/data/download/flex-2.6.0.tar.bz2 to
> /home/superandy/data/download/flex-2.6.0.tar.bz2_bad-checksum_0103b909e19=
ca9c6497a7ae696c16480
>=20
> but flex-native is build happily. Same for freetype-2.6.3. Are the
> messages wrong positives or does oe build sources with wrong
> checksums?

Did the following re-try download it with different (correct)
checksum? Then it would be correct behavior if you had some
e.g. incomplete flex-2.6.0.tar.bz2 tarball laying around in downloads
directory.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbLevQACgkQN1Ujt2V2gBwtCQCfUyVIcaJWyYwOiNvGgqDy2fAI
ciQAoI4gJ4eMLgiRc8Zs/RkVFCD0em1q
=pmRy
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
