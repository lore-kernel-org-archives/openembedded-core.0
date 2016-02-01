Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id AF77677060
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:29:11 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id x125so87577855pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=nbyAZZoQhAIRoxsVVOiDMg0UF6Rw2Dy+nfC7ql5Ruhw=;
	b=Kma5VRq3IST4QPi0A6eGaM9mtZjqfqfJvU6GSBAzSPMpRdnEFN+KlAjkUAuIRVoQxb
	YJk8CqF9yDg1MwELWz5jmRJKPCnXLl8r29I8jgaok5r+/vWztMU9O/27aq2Z7I6SO3tj
	Tm5CamtkHN/ch8lCla/WkiVfpyqy5UoZYzeDv5vGA98A1fwDUquGv/i2xjBBQ4IKkQDE
	R3LhUDJROURpGLoKCft6fymQs9w4gxyD8D7rNHCDQol6b91c5ZczGb93a7eIvW81gRph
	HK5T4SHlM9o0BYZzTecaS65IGQsTAa7dAsMCZG1urP1AwP/P1ggnDL1W4/61zU7NYz7O
	kNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=nbyAZZoQhAIRoxsVVOiDMg0UF6Rw2Dy+nfC7ql5Ruhw=;
	b=RCaspMIP6v+mkCM12ghxbnD0X51FwiAUd82l1j/nLcLA8zWfjoC8R1t7TjByRx/Cf+
	9lYixqbv1aF1DoPDGJG1hL09mo0ni+XrYFHfT3RuGiITqZof9b2kqFy8VTy/pb+v3Kmc
	SK2d2Nf/JKXZIg1dmVsvuhbNdNaHaT7i0q1zY+V3V9GhS/oiLiOMxaSlCmUPoQ4atmuO
	gS9tE+yFoxDvaunc7tjXWFagkEGk8ux/xwhjs9t7RrGozgZTUTU668eZ/JcTnDPRBcXz
	JGXcwmUQvkBd97lUEU3EGg8K5MsK21FRQnHqWz7Ja0B+zbo5qY1IPTVWydVTGX0re9RE
	rATA==
X-Gm-Message-State: AG10YORaUYQOwRalae2y2EjjDDPDXgMVpDUr83ic4nzj2B7YCp3NFu8o41fdO1QrS5WH6A==
X-Received: by 10.98.31.84 with SMTP id f81mr39785934pff.98.1454347752097;
	Mon, 01 Feb 2016 09:29:12 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:74e3:8760:72f:db60?
	([2601:646:8802:5d5c:74e3:8760:72f:db60])
	by smtp.gmail.com with ESMTPSA id
	z67sm11347929pfa.71.2016.02.01.09.29.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Feb 2016 09:29:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <daa108339dadf287835946b39af7a149919eed84.1454303080.git.raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 09:29:05 -0800
Message-Id: <725AD7AC-E625-4985-871F-34D9A2340990@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
	<cover.1454303080.git.raj.khem@gmail.com>
	<daa108339dadf287835946b39af7a149919eed84.1454303080.git.raj.khem@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH 5/8] libtool-cross: Unset pre|post dep objects
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
X-List-Received-Date: Mon, 01 Feb 2016 17:29:12 -0000
X-Groupsio-MsgNum: 77203
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8F83AE70-0233-4F4E-9596-18B7480F38D1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8F83AE70-0233-4F4E-9596-18B7480F38D1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 31, 2016, at 9:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> predep_objects and postdep_objects are specifying the duplicate =
objects
> which are better computed by gcc/g++ driver, since we want to generate
> PIE, PIC and non-PIC combinations, let gcc decide on this, since it
> knows best about linker options to use in each of these situations.
> When we defer the linker options to driver, we also need to remove
> -nostdlib from linker commandline options.
>=20
> Remove duplicate directory creation for ${D}${bindir_crossscripts}/
>=20
> This fixes a frequent problem we see during -fpie links e.g.
>=20
> |
> =
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64=
/usr/include/c++/5.3.0/iostream:74:
> undefined reference to `__dso_handle'
> |
> =
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/x86_64-lin=
ux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld:
> .libs/cxx_channel.o: relocation R_X86_64_PC32 against undefined hidden
> symbol `__dso_handle' can not be used when making a shared object
> |
> =
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/x86_64-lin=
ux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld:
> final link failed: Bad value
>=20
> After this change libtool gets changed as below
>=20
> old_archive_from_expsyms_cmds=3D""
>=20
> # Commands used to build a shared archive.
> -archive_cmds=3D"\$CC \$pic_flag -shared -nostdlib \$predep_objects
> \$libobjs \$deplibs \$postdep_objects \$compiler_flags \$wl-soname
> \$wl\$soname -o \$lib"
> -archive_expsym_cmds=3D"\$CC \$pic_flag -shared -nostdlib =
\$predep_objects
> \$libobjs \$deplibs \$postdep_objects \$compiler_flags \$wl-soname
> \$wl\$soname \$wl-retain-symbols-file \$wl\$export_symbols -o \$lib"
> +archive_cmds=3D"\$CC \$pic_flag -shared  \$predep_objects \$libobjs
> \$deplibs \$postdep_objects \$compiler_flags \$wl-soname \$wl\$soname =
-o
> \$lib"
> +archive_expsym_cmds=3D"\$CC \$pic_flag -shared  \$predep_objects
> \$libobjs \$deplibs \$postdep_objects \$compiler_flags \$wl-soname
> \$wl\$soname \$wl-retain-symbols-file \$wl\$export_symbols -o \$lib"
>=20
> # Commands used to build a loadable module if different from building
> # a shared archive.
> @@ -11908,8 +11908,8 @@
>=20
> # Dependencies to place before and after the objects being linked to
> # create a shared library.
> =
-predep_objects=3D"/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/=
sysroots/qemux86-64/usr/lib/../lib/Scrt1.o
> =
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64=
/usr/lib/../lib/crti.o
> =
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64=
/usr/lib/../lib/x86_64-oe-linux/5.3.0/crtbeginS.o"
> =
-postdep_objects=3D"/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc=
/sysroots/qemux86-64/usr/lib/../lib/x86_64-oe-linux/5.3.0/crtendS.o
> =
/home/ubuntu/work/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86-64=
/usr/lib/../lib/crtn.o"
> +predep_objects=3D""
> +postdep_objects=3D""
> predeps=3D""
> postdeps=3D"-lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc"
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb =
b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> index 8478802..432f010 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> @@ -16,7 +16,11 @@ do_configure_prepend () {
> do_install () {
> 	install -d ${D}${bindir_crossscripts}/
> 	install -m 0755 ${HOST_SYS}-libtool =
${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> -	install -d ${D}${bindir_crossscripts}/
> +	sed -e 's@^\(predep_objects=3D"\).*@\1"@' \
> +	    -e 's@^\(postdep_objects=3D"\).*@\1"@' \
> +	    -i ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +	sed -i '/^archive_cmds=3D/s/\-nostdlib//g' =
${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +	sed -i '@^archive_expsym_cmds=3D@s@-nostdlib@@g' =
${D}${bindir_crossscripts}/${HOST_SYS}-libtool

a self review after strong tea revealed that I did not commit my local =
change on top of this so this patch was wrong
I have not squashed the local remaining change into this and updated the =
kraj/pu branch.

> 	GREP=3D'/bin/grep' SED=3D'sed' ${S}/build-aux/inline-source =
libtoolize > ${D}${bindir_crossscripts}/libtoolize
> 	chmod 0755 ${D}${bindir_crossscripts}/libtoolize
> 	install -d ${D}${target_datadir}/libtool/build-aux/
> --
> 2.7.0
>=20


--Apple-Mail=_8F83AE70-0233-4F4E-9596-18B7480F38D1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlavleYACgkQuwUzVZGdMxSJOQCeJ3kQmwRnwC+hSzD319MPrEmJ
ipwAn2GInR85mkCTHJsh5OFxroZNvUQR
=fGHV
-----END PGP SIGNATURE-----

--Apple-Mail=_8F83AE70-0233-4F4E-9596-18B7480F38D1--
