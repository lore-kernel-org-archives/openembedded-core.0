Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8C98D610F5;
	Mon, 18 Aug 2014 18:14:27 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id l4so4526231lbv.1
	for <multiple recipients>; Mon, 18 Aug 2014 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wIGYCv1Zyu+BEOslUNsKr9lUvQpfiCbV+OFuGrVBiQE=;
	b=wzlwrRoePPCK8McgdZoLpB9syv3d5aT/0ToTVaXvF5+ITCksiSnzUpD+StXZm3IY1k
	ZpJSTwMRv//gzzh9Dgl2vGKd0QZx9q/HCuJoqLuw37Ar/2l37hxdspANjIGP7QyVrKDA
	moEYFLoBa1FihHiBPKFLlz6iRYx7EGWZiY+nxOQ+X50PTK5C5jgu3JHql50vE79kNhCo
	VmT2kaykr5H0ilh0kL4qm+A5hoJZNZYSuMxNMThK81H6EcGZ9ytmAWINP8t4G2R9uybX
	BacKEV4lQVkQFnUZw2T4S0QIKtpUPd+AyVZek8zSngUm9WhqspZ4hzLa2uqDmOQ1gr+8
	NqDw==
X-Received: by 10.152.115.137 with SMTP id jo9mr21383159lab.63.1408385668172; 
	Mon, 18 Aug 2014 11:14:28 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id ao9sm4458669lac.28.2014.08.18.11.14.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 11:14:27 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 18 Aug 2014 18:14:24 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140818181424.GG12992@gmail.com>
References: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, musl@lists.openwall.com,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Mon, 18 Aug 2014 18:14:33 -0000
X-Groupsio-MsgNum: 56700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline

--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2014 at 05:50:38PM -0700, Khem Raj wrote:
> Hello All
>=20
> musl <http://www.musl-libc.org/> is a newer implementation licensed
> under MIT licence
> A layer to support musl to supply your system C library as an
> alternative to uclibc and eglibc/glibc  is now available at
>=20
> https://github.com/kraj/meta-musl
>=20
> README describes way to get going with it.
>=20
> Few things to note
>=20
> * Supports gcc 4.9 in OE not 4.8
> * Current musl recipe is 1.1.4 based
> * You need latest master of OE-Core
> (106305227003761c3fc562c21bb859a5256f2b36) or          newer and
> bitbake
> * Its only able to build core-image-minimal
> * core-image-minimal boots on qemuarm, qemuppc, qemumips, qemux86, qemux8=
6-64
>=20
> I will send a request to add it to layerindex soon and then you should
> be able to find it using
> layerindex.opernembedded.org as well
>=20
> If you try it out on your hardware and/or have feedback I am
> interested. Fork it from github, file bugs
> send patches ....
>=20
> Happy hacking
>=20

core-image-minimal works with my configuration on qemuarm. It also successf=
ully
builds what will soon be released as opkg-0.2.3 and the recipe for toybox-0=
=2E4.9
which I've recently created.

I tried building core-image-full-cmdline as I think that would be good next=
 step
=66rom core-image-minimal. I'm seeing failures in:

  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb, do_compile
  meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_compile
  meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb, do_compile
  meta/recipes-extended/iptables/iptables_1.4.21.bb, do_compile
  meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_compile
  meta/recipes-devtools/perl/perl_5.20.0.bb, do_compile
  meta/recipes-extended/sysklogd/sysklogd_1.5.bb, do_compile
  meta/recipes-extended/ethtool/ethtool_3.14.bb, do_compile
  meta/recipes-extended/psmisc/psmisc_22.21.bb, do_compile
  meta/recipes-extended/pax/pax_3.4.bb, do_compile
  meta/recipes-extended/procps/procps_3.2.8.bb, do_compile
  meta/recipes-extended/net-tools/net-tools_1.60-25.bb, do_compile
  meta/recipes-extended/findutils/findutils_4.4.2.bb, do_compile
  meta/recipes-extended/logrotate/logrotate_3.8.7.bb, do_compile
  meta/recipes-extended/cronie/cronie_1.4.11.bb, do_compile
  meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_compile
  meta/recipes-extended/at/at_3.1.14.bb, do_compile
  meta/recipes-extended/iputils/iputils_s20121221.bb, do_compile
  meta/recipes-extended/gzip/gzip_1.6.bb, do_compile
  meta/recipes-extended/sudo/sudo_1.8.10p3.bb, do_compile
  meta/recipes-extended/mc/mc_4.8.12.bb, do_compile

I can share detailed logs if anyone wants them. I'll have a look and see if=
 I
can find some low hanging fruit amongst these which are easy to fix.=20

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJT8kKAAAoJEBwoJlo7UPQDKbYH/1Zc1IUBI9Z6aAP1F8WjMCWN
kiJQFP/MadEtDMricUSYID6/RzBV4giw7ItvcTUYfLPiHkV7fzCzt9yC9ZGHvxny
akH8j2j/Gcxj+YXG3JNuZNw51kPSXH8TzY46wnATp4G+w8vl7rAMAhFafpwf5j/E
u5/4Maw/aDUjjjheGdZyr4gi00I1+U3MJMLHwkmOyHH/ufzWUl/ESJ6OHiQYEgYS
en7fKiaVtwSiLWkS8fcdJrbs2g8B/srMjtN1ZA9IkitkPiiqDe7iy//E5memxjtw
29xYwGX7xMGthtVf0hvZWAy5/kKSZRcZN9UUh320JDY8jLjY+vSypG1gZJ2XEts=
=qj/R
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
