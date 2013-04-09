Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UPZjW-0004Oo-B4
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:41:30 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so3825834pab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=GPLD8vbitXrNISTQ3rw8ux/Gj4GM9cRm4qMg0bGBUmw=;
	b=TpqOOfg+Fb0K0HfOWeysmDcVpxkBUo6J3v1y3qu5l82FnZcBq1vEov0OepynjmLqcS
	3CTqjFuZAVqjpb2ZIEplC34qUY9t3ckW2hJO3R3nqfGv3UsBOJwsWVoVK4PHMnJQeqH+
	bw7AS1QkhIk8c4U/HUDB6NDlGHs4TTwiAInTO8qIWh1KytFTe+S1gOqHz8YMYxL0TkQS
	8emGGP6l7kAn2XxNH+pOuJ/PJZGSamp+0TbP4Uaqnep5o4KpxnaIbxaeVDy7GaGuYgar
	n1LmnNFx1zR6TbjaEcmgnR1qPJpUSwZRQ3Q7quotVAl6f4m9tQrutNyHQBhzj/YIPJGK
	inVg==
X-Received: by 10.66.233.9 with SMTP id ts9mr44968038pac.15.1365517433597;
	Tue, 09 Apr 2013 07:23:53 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id qq3sm73592pbb.31.2013.04.09.07.23.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:23:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51628545.6050106@communistcode.co.uk>
Date: Tue, 9 Apr 2013 07:23:52 -0700
Message-Id: <EF672930-BF0E-43CD-8550-9857BF4561B7@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
	<51628545.6050106@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-initial Failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 14:41:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 8, 2013, at 1:52 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:

> On 05/04/13 18:03, Khem Raj wrote:
>> On Apr 5, 2013, at 9:36 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:
>>=20
>>> I build for the beaglebone and I changed them in line with your =
default beaglebone build patch you posted a week or so ago. I think it =
moved it form soft to hard float possibly...
>> yes do a clean build if possible
>=20
> Hi Khem,
>=20
> Clean build results in the same failure.


hmmm I can't reproduce it locally here, systemd-image/angstrom-next =
builds and boots ok here.
>=20
> Host GCC:
>=20
> Using built-in specs.
> COLLECT_GCC=3Dgcc
> =
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.0/lto-wrap=
per
> Target: x86_64-unknown-linux-gnu
> Configured with: /build/src/gcc-4.8.0/configure --prefix=3D/usr =
--libdir=3D/usr/lib --libexecdir=3D/usr/lib --mandir=3D/usr/share/man =
--infodir=3D/usr/share/info --with-bugurl=3Dhttps://bugs.archlinux.org/ =
--enable-languages=3Dc,c++,ada,fortran,go,lto,objc,obj-c++ =
--enable-shared --enable-threads=3Dposix --with-system-zlib =
--enable-__cxa_atexit --disable-libunwind-exceptions =
--enable-clocale=3Dgnu --disable-libstdcxx-pch =
--enable-gnu-unique-object --enable-linker-build-id =
--enable-cloog-backend=3Disl --disable-cloog-version-check --enable-lto =
--enable-gold --enable-ld=3Ddefault --enable-plugin =
--with-plugin-ld=3Dld.gold --with-linker-hash-style=3Dgnu =
--disable-install-libiberty --disable-multilib --disable-libssp =
--disable-werror --enable-checking=3Drelease
> Thread model: posix
> gcc version 4.8.0 (GCC)
>=20
>=20
> Tune:
>=20
> DEFAULTTUNE_beaglebone =3D "cortexa8hf-neon"
>=20
> Cheers,
>=20
> --=20
>=20
>  Jack Mitchell (jack@embed.me.uk)
>  Embedded Systems Engineer
>  http://www.embed.me.uk
>=20
> --
>=20



