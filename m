Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 34BE0731BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 14:38:07 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id u188so100927445wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HiySVYPr2S/+HFOgCx2sZi37Cxxw2wqz9OHmWiUrlk4=;
	b=ctTDgfmQFhMkmvEkeWi5X1zBHtfiuisDX6Eg9yFjgc1tEe7HA+GnVLJ9zd4N8HMpVX
	IaxuwmVNpesG41EkIyFSx62hRxv3cbfKvv+dr24ypgyF87f+ku6a1h6zop6VQ29HhjxO
	Ga7xGuBH/Jy2XoXpdomzvmLoAEzyRfrrbiBczhZBqsHmeiUO43+JF99xoQzOQQbhoTFq
	O+Kmeoq5zHs8gUSKzXAsALv7vvnMJPQ3tdGhA0i+bW7CGsxVzNXbAVzv7Iog3PfEXW+z
	jHmFVy3duiK/4eVR5WKaoph3VUTrXLHHHjb1drVlmBb/bH4QxYZk2z67/f4WTCUapceD
	9yDw==
X-Received: by 10.28.215.136 with SMTP id o130mr13836012wmg.33.1452177488056; 
	Thu, 07 Jan 2016 06:38:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ql10sm101456571wjc.23.2016.01.07.06.38.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 06:38:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 15:38:31 +0100
To: Marek Vasut <marex@denx.de>
Message-ID: <20160107143831.GE2512@jama>
References: <1448983859-6096-1-git-send-email-marex@denx.de>
	<201512011642.38085.marex@denx.de>
	<CAJTo0LZYZ4GYKdMK7SGQxtd1o3PyO1zberj6nn0QXmAfhr8fDw@mail.gmail.com>
	<201512011701.12802.marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <201512011701.12802.marex@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: Upgrade to 0.8.0
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
X-List-Received-Date: Thu, 07 Jan 2016 14:38:09 -0000
X-Groupsio-MsgNum: 75568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gDGSpKKIBgtShtf+"
Content-Disposition: inline

--gDGSpKKIBgtShtf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 05:01:12PM +0100, Marek Vasut wrote:
> On Tuesday, December 01, 2015 at 04:46:57 PM, Burton, Ross wrote:
> > On 1 December 2015 at 15:42, Marek Vasut <marex@denx.de> wrote:
> > > Looks like it depends on OpenSSL, so adding "DEPENDS =3D "openssl"" t=
o the
> > > recipe would be the solution, right ?
> >=20
> > Assuming it's a hard dependency, yes.
>=20
> I was wrong, I just looked into the upstream git of libbsd and there's the
> solution:
>=20
> http://cgit.freedesktop.org/libbsd/commit/?id=3D8493c7f27da2dcd2de71e9c77=
82c3d020d89c2a2

This upgrade breaks lldpd and possibly other libbsd users as well:

| In file included from /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/lldp=
d/0.7.19-r0/lldpd-0.7.19/src/compat/compat.h:46:0,
|                  from /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/lldp=
d/0.7.19-r0/lldpd-0.7.19/src/lldpd-structs.h:41,
|                  from /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/lldp=
d/0.7.19-r0/lldpd-0.7.19/src/lldpd-structs.c:21:
| /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/bsd/unistd.h: In=
 function 'setproctitle':
| /OE/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/bsd/unistd.h:64:=
2: error: expected declaration specifiers before '__printflike'
|   __printflike(1, 2);
|   ^
| compilation terminated due to -Wfatal-errors.
| Makefile:493: recipe for target 'lldpd-structs.lo' failed
| make[2]: *** [lldpd-structs.lo] Error 1

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D807730

Luckily it's fixed in 0.8.1, I'll send patch for that soon.

Regards,

>=20
> Best regards,
> Marek Vasut
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gDGSpKKIBgtShtf+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaOeGcACgkQN1Ujt2V2gBxRJwCfXzwnR0PdBcLYsEEoUXm2MNnv
RMQAn0xC/J0ca45A/e0SiBndIpO2R38x
=weMP
-----END PGP SIGNATURE-----

--gDGSpKKIBgtShtf+--
