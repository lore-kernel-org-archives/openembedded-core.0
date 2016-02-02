Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id DE4AA7716C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:47:55 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id cy9so92671694pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 18:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7aDNE64PQB7yX6kgttnhPKti7ERjDPeZeQ3rCWMIJ8E=;
	b=tzIoq4zdXs3w43FTt3W5QWM4Zk1Q6Uj3Vz6K6TfYMNdTt/ADcEZgdcVklmpoueZx20
	wcc3IGQIuEyeVCwleOh4tgonnE40UfZeGAmHaXkEBLFhSXugdP7Qt3pvoKhtK7YDJsuY
	n8aS+ROhyHEgi2n/C+coLcBbJLbA/uujBcf0cY3IMzmVuKNBb/WfCGMtXK87+e9yM+6+
	GXiSzqlAgq+TxSJv2ZmkY0Ozu8Ul1TiCJcWOx1Pb/WOzH+iFO4Dn/+C/cOT7NYp4JUJb
	/o7lUo0LrLJ9G4qriNpWzdGiWCzR1K0BjrLFDRd4wPscjmu4j80Ck0LPUg+qZhrY3KPA
	8iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=7aDNE64PQB7yX6kgttnhPKti7ERjDPeZeQ3rCWMIJ8E=;
	b=A5pum3qCGlXtqvObwlN4V1EGjzapTcb5tps9PI5DAtLXkex3tqM0cittxfkepzinNB
	E9i7+UvdErazFiiZtls7VD26eSlGrfa0ayG3ASHezTiVZ9rXeiq48l2UWNiDWFGTSHA9
	04c8xADUapxVw/ksjmDjl2B0s8s7V83KQ9H4gVKbShUoGm5w9pkeqQ/xqKLLqvH95uFT
	VwLt+0d4wSiob5VJreIwTBAEIof+A6foVSWqj0AdR3Gr/FO/9UflyvBLN+O3B+Rk5f2U
	zbiAiFA8FSw6W+lpUTHBORhXXw02+t35W/oEJr0y0wGzd1udDikD08oNokt6Z87ndOl3
	fIqw==
X-Gm-Message-State: AG10YORiY/87f7IFdzsxTmCAS0fWfAVKDGijGb/dGycE2+SprLBR/BzgRxEknR//cfnZ9w==
X-Received: by 10.66.227.196 with SMTP id sc4mr42722806pac.6.1454381276262;
	Mon, 01 Feb 2016 18:47:56 -0800 (PST)
Received: from [10.236.67.153] ([50.141.33.17])
	by smtp.gmail.com with ESMTPSA id 1sm17692473pfm.10.2016.02.01.18.47.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Feb 2016 18:47:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VMCnwns4grN6rWFg0z2oR7ifeSbo4Pf2o0te1ZOk2fOA@mail.gmail.com>
Date: Mon, 1 Feb 2016 18:47:50 -0800
Message-Id: <F583CDF2-1357-463D-AC7F-48C93A9C2436@gmail.com>
References: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqRtdCtm0jtGwMtPWJ3cUYmRB5FYZ9m7xmjq8+0q_pTGQ@mail.gmail.com>
	<CAJ86T=VMCnwns4grN6rWFg0z2oR7ifeSbo4Pf2o0te1ZOk2fOA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: drop --enable-target-optspace from configure
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
X-List-Received-Date: Tue, 02 Feb 2016 02:47:58 -0000
X-Groupsio-MsgNum: 77236
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F92C7EC9-586A-40DE-968B-18CAF39D263F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F92C7EC9-586A-40DE-968B-18CAF39D263F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 1, 2016, at 6:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Mon, Feb 1, 2016 at 4:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> What is the size increase in gcc runtime when u do this
>=20
> No significant changes.
>=20
> Binaries which link statically with libgcc all grow a little
> (somewhere between 10 and 50 bytes).
>=20
> libgcc_s.so.1 itself grows by approx 1%:
>=20
>   text       data        bss        dec        hex    filename
> 114896        516         56     115468      1c30c    libgcc_s.so.1 =
(-Os)
> 116148        516         56     116720      1c7f0    libgcc_s.so.1 =
(-O2)

Thanks, I am ok with this change. Can you also report a qemuppc build =
with this
change and make sure it boots ?

>=20
> libssp, libstdc++, libgomp and libatomic all ignore the
> --enable-target-optspace configure option, so are not affected.
>=20
> (Results from an armv7ve build).
>=20
>> On Feb 1, 2016 2:01 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>>=20
>>> Configuring gcc with --enable-target-optspace (which causes gcc to
>>> append "-g -Os" to the default CFLAGS_FOR_TARGET and so force libgcc
>>> etc target libraries to always be optimised for size) dates back to
>>> the very first commit in oe-core git in 2005 (for gcc 3.4.3).
>>>=20
>>> Configuring gcc with --enable-target-optspace is not done widely
>>> elsewhere (it's not used for Ubuntu or Fedora host gcc, the Linaro
>>> binary toolchain or in Buildroot since early 2015). Sometime around
>>> gcc 4.5.x it caused problems for powerpc and so was disabled for =
that
>>> architecture:
>>>=20
>>>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D43810
>>>=20
>>> This patch removes --enable-target-optspace completely (ie powerpc =
is
>>> no longer a special case) and allows optimisation of libgcc etc to =
be
>>> controlled directly by the flags present in TARGET_CFLAGS.
>>>=20
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------
>>> meta/recipes-devtools/gcc/gcc-cross-initial.inc    | 1 -
>>> 2 files changed, 9 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> index 85e69db..f4f76bd 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> @@ -14,13 +14,6 @@ JAVA_sh3 ?=3D ""
>>> # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect =
'fortran'
>>> FORTRAN ?=3D ",f77"
>>> LANGUAGES ?=3D "c,c++${FORTRAN}${JAVA}"
>>> -# disable --enable-target-optspace for powerpc SPE
>>> -# at -Os libgcc.so.1 creates references into
>>> -# hidden symbols in libgcc.a which linker complains
>>> -# when linking shared libraries further in the build like (gnutls)
>>> -
>>> -SPECIAL_ARCH_LIST =3D "powerpc"
>>> -OPTSPACE =3D '${@bb.utils.contains("SPECIAL_ARCH_LIST", =
"${TARGET_ARCH}",
>>> "", "--enable-target-optspace",d)}'
>>>=20
>>> EXTRA_OECONF_BASE ?=3D ""
>>> EXTRA_OECONF_PATHS ?=3D ""
>>> @@ -42,7 +35,6 @@ EXTRA_OECONF =3D "\
>>>     --enable-libstdcxx-pch \
>>>     --program-prefix=3D${TARGET_PREFIX} \
>>>     --without-local-prefix \
>>> -    ${OPTSPACE} \
>>>     ${EXTRA_OECONF_BASE} \
>>>     ${EXTRA_OECONF_GCC_FLOAT} \
>>>     ${EXTRA_OECONF_PATHS} \
>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>> b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>> index 910f2ef..048b530 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>>> @@ -22,7 +22,6 @@ EXTRA_OECONF =3D "\
>>>     --disable-multilib \
>>>     --disable-__cxa_atexit \
>>>     --enable-languages=3Dc \
>>> -    ${OPTSPACE} \
>>>     --program-prefix=3D${TARGET_PREFIX} \
>>>     --with-sysroot=3D/not/exist \
>>>     --with-build-sysroot=3D${GCCCROSS_BUILDSYSROOT} \
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_F92C7EC9-586A-40DE-968B-18CAF39D263F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlawGNkACgkQuwUzVZGdMxRFzQCgkwA8PhwxGZfnX4zmAPJxaFP2
+qAAmwYCW7bnEdmDF3hK8bqSlRF5AHUv
=RKTB
-----END PGP SIGNATURE-----

--Apple-Mail=_F92C7EC9-586A-40DE-968B-18CAF39D263F--
