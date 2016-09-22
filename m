Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 37F6D60603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 17:45:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 133so15295723wmq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JMPLCj+omVDNssg+r+SqKm+kxzV6OB2dxYZboqnoBu0=;
	b=ExDkOJSjLqstSkwJ0w6gQfok6vSg+Gi73yET3ZG0qx71K+11xKBgCHkNKgRFe7iUsM
	L+xN9MNcFN1t0ABY3QkokGKhIWeqE8aNxBMowjAVYKoJ9MmfbHOxTJKuhLD/iZuBi5Da
	rKp4WURxWvmY1yp8yz1DY/hZdKP4msc0XYDCl1SUxSeyFqsHWUHGM2ZCkh6fhpO8Grp9
	2DwuMyMuVXn8KfEssJ9BSrsrujv0GwzZIzy8i40oPioSIEJ2gZ3rR/DihqQJiv/kClmo
	5YH6MkXPa+m7327SEdqgnLVk4psaWJM++b0goaQWWoTCQOzEmcEYicKh+6EsP3zoJuez
	j3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JMPLCj+omVDNssg+r+SqKm+kxzV6OB2dxYZboqnoBu0=;
	b=NUjeAwxl6BhpFUlWOu8TZDIrT6EgvldwyimUcvDevPUjGDic9c4SQJQE8GORhfaPJN
	6ONyOGsMgWDazs6ZjDq1cxuVY3Gj3SQmEMNbaeCSkoeGggRhuSCN0WgKVKZFekKJYi/I
	fzx4oU8lwIN7gEjhp55sL6Fnm64uDJoywKi9Y/sNiPk1kGWFQZv/SYtyk5A1jZexAgbO
	Jv3VdAOSqWCaE35KKmq2PwIPe8SMvu8NeY6dZkdY59LLD/MOqQRkt3FmIkEticGsKV0c
	8CP8RR+Q1aRHJ+mxQKQdKaLNQLEcUW/V7EdRqTNy3BOJlqKlqY9oHOzmDslZcIIJJ7Om
	917g==
X-Gm-Message-State: AA6/9Rl2HEQZr5cbILSW/fap3np6HEQ1A5tzSLfyGeC8IPNl+Vzz9SgrzcjcqR56xUBP+g==
X-Received: by 10.28.170.197 with SMTP id t188mr3848469wme.42.1474566357970;
	Thu, 22 Sep 2016 10:45:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id l3sm3169180wjp.17.2016.09.22.10.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Sep 2016 10:45:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Sep 2016 19:45:58 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20160922174558.GA2630@jama>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libunwind: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Thu, 22 Sep 2016 17:45:58 -0000
X-Groupsio-MsgNum: 87428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 07:30:43AM +0200, Andreas M=FCller wrote:
> works around:
> <native-sysroot>/ld: error: Gperf-simple.o: cannot make copy relocation f=
or protected symbol '_Uarm_local_addr_space', defined in ../src/.libs/libun=
wind-arm.so
> collect2: error: ld returned 1 exit status
> Makefile:1038: recipe for target 'Gperf-simple' failed
> make[1]: *** [Gperf-simple] Error 1
> make[1]: *** Waiting for unfinished jobs....
> <...>
> <native-sysroot>/ld: error: Lperf-simple.o: cannot make copy relocation f=
or protected symbol '_ULarm_local_addr_space', defined in ../src/.libs/libu=
nwind.so
> collect2: error: ld returned 1 exit status
> Makefile:1094: recipe for target 'Lperf-simple' failed
> make[1]: *** [Lperf-simple] Error 1
> <...>
> ERROR: oe_runmake failed
> <native-sysroot>/ld: error: Gperf-trace.o: cannot make copy relocation fo=
r protected symbol '_Uarm_local_addr_space', defined in ../src/.libs/libunw=
ind-arm.so
> collect2: error: ld returned 1 exit status
> Makefile:1042: recipe for target 'Gperf-trace' failed
> make[1]: *** [Gperf-trace] Error 1
> <native-sysroot>/ld: error: Lperf-trace.o: cannot make copy relocation fo=
r protected symbol '_ULarm_local_addr_space', defined in ../src/.libs/libun=
wind.so
> collect2: error: ld returned 1 exit status
> Makefile:1098: recipe for target 'Lperf-trace' failed
> make[1]: *** [Lperf-trace] Error 1
> <...>
> <native-sysroot>/ld: error: test-coredump-unwind.o: cannot make copy relo=
cation for protected symbol '_UCD_accessors', defined in ../src/.libs/libun=
wind-coredump.so
> collect2: error: ld returned 1 exit status
> Makefile:1186: recipe for target 'test-coredump-unwind' failed

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

I've verified that this fixes the issue I was reporting in "bitbake
wordl status" e-mails since last binutils upgrade to 2.27

It's basically complement to this oe-core change which went in together
with binutils:

commit 0092a076adb11cac411c86389af84bb96169730f
Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Aug 8 15:51:01 2016 -0700

    libunwind: Do not use gold for linking

Which only stopped gold being used when bfd is the default linker, but
which left libunwind broken for people with ld-is-gold in
DISTRO_FEATURES to use gold by default.

Thanks!

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-support/libunwind/libunwind_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recip=
es-support/libunwind/libunwind_git.bb
> index cd4cb89..4249430 100644
> --- a/meta/recipes-support/libunwind/libunwind_git.bb
> +++ b/meta/recipes-support/libunwind/libunwind_git.bb
> @@ -26,3 +26,4 @@ SECURITY_CFLAGS_append_aarch64 =3D " -fPIE"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> +LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfkFYQACgkQN1Ujt2V2gBzEzQCgoHVTXTgwxqEt3fZRK+sC3wIY
PGcAoKIPoc7tTpLlfs6j35KKvuE1AwSz
=Wgw9
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
