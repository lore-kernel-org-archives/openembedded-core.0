Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B96A36C397
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 07:56:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t17so6741482wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uPTnbp21xtf41uurQq8eXGDLxD1dWZdvPZ6TUF+gs3M=;
	b=Mjstev7I6Tq+BMb6f+xScEHBwTYP6xi4jJyA9TLLMd34sd+/i7MeBpw/jnb+OX4DOo
	iuTRvRDUdVuNiXMZc5wMtUbBAUxNolcE4LjU9vuES2VaAxs3SgT6OB3a8egZw6AU0kun
	hTA9YP87wUaTsnqhYFy8mST62BLiMa+jWyBHeZxqC8dvzzYmt/+pq52uGVRG4VzAfbxG
	r0FRC2tjA0KqEkRMrPmButyw1whbRoAWCbpULdUZySGefI0FRr15HaCebLV28rgPMA2n
	fh8DbTDxGu6aolQZHbYcl6CC0w2Da7uopQjIgDC9l6wjw9YyUP4mz6JhTnCeU6fTKu7V
	vQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uPTnbp21xtf41uurQq8eXGDLxD1dWZdvPZ6TUF+gs3M=;
	b=OIGBpBSoxQVLM6HGrpt+M+XVSjA902VR7ECNOZ0QgV0bH6krTGbtjtuvjTV4v2kaAc
	qsrB/1Qwj2qjABT8J8aOKyJhYLAovUtaQShuk6J13Sss1RyyZEIR5yWuMYeHgWw4x2zp
	7ojSJoOXQWRprKtdpBy3lVdLUIxWSNZufLVrpNpoLJlAHWWUzGuBnHKlOgxB5lTdRRbO
	olsvXBd0o0FjPWX7ZdJksIuPN8IL52xv/n77uwUTK7aBThUthbP+DJ0/N39Lb643GtQ4
	G9PyDxKyxA3rsLWs+YMF5ff0sV7zPn7XTotSdibzZVQYsPnRw5cnsw40aQMGI/aJE46w
	3neg==
X-Gm-Message-State: APjAAAVOocIgxo7YMsDm17ymcYV33Rn6w0+rhOptUZ7LAcap6sg5npFi
	EzgmMgkYgEH6kABgPFlglw0zbHaXmaCab5lDMdcexw==
X-Google-Smtp-Source: APXvYqxq3rC6ZQSzr6JpvW2c4wX1rdV6ay8H9d07UVPcIGg1ZDUYu2PJXOUgWrHE7HjFDC0Ixv9hnMNPF6ej53Sdy5k=
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr7277178wru.104.1554451019251; 
	Fri, 05 Apr 2019 00:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190403053702.10672-1-nathan@nathanrossi.com>
	<355BE46A91031048906B695426A8D8E62EA2ECD4@DENBGAT9EL2MSX.ww902.siemens.net>
	<CAMKF1spfUupA_BL1s7Aim+UsBK4anGFPpdsnQhyH18CVdmo-pw@mail.gmail.com>
	<CA+aJhH3narCCOSiWCPPLvoxF3P5pCkCGo--tc2s6n2hyXrrPMQ@mail.gmail.com>
	<CAMKF1sqpzE5DMM-M3qbDG+Z9C=_bZm23++d9MLWsUPm9k+0SbQ@mail.gmail.com>
	<CA+aJhH0x40-RNdF61G-i+dY9kMA3w=sr9AnBEFhhARB8uYfdSw@mail.gmail.com>
	<CAMKF1sqcDjd_qhwsSpSrb5AZjzEj47hTOsk1gBWfBiMunnU6Vw@mail.gmail.com>
In-Reply-To: <CAMKF1sqcDjd_qhwsSpSrb5AZjzEj47hTOsk1gBWfBiMunnU6Vw@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 5 Apr 2019 17:56:47 +1000
Message-ID: <CA+aJhH0K+N0xGge2130S6GmJnV1aD4t6xMZ2zBM4HixfJTeAZA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] cmake-native: Enable ccmake by default and depend on ncurses
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
X-List-Received-Date: Fri, 05 Apr 2019 07:56:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Apr 2019 at 02:31, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Wed, Apr 3, 2019 at 9:36 PM Nathan Rossi <nathan@nathanrossi.com> wrot=
e:
>>
>> On Thu, 4 Apr 2019 at 13:48, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Wed, Apr 3, 2019 at 8:28 PM Nathan Rossi <nathan@nathanrossi.com> w=
rote:
>> > >
>> > > On Thu, 4 Apr 2019 at 03:02, Khem Raj <raj.khem@gmail.com> wrote:
>> > > >
>> > > > On Wed, Apr 3, 2019 at 2:26 AM Bach, Pascal <pascal.bach@siemens.c=
om> wrote:
>> > > > >
>> > > > > >
>> > > > > > Enable the building of the curses based ui for cmake. This dep=
ends on
>> > > > > > ncurses.
>> > > > >
>> > > > > I think this is acceptable. It might also be useful for people w=
anting to use ccmake inside an SDK.
>> > >
>> > > Just to be clear, this change only affects cmake-native, the recipe
>> > > for target/nativesdk is unchanged. Although interestingly the cmake
>> > > (target/nativesdk) recipe already depends on ncurses (despite
>> > > disabling ccmake).
>> > >
>> > > > >
>> > > >
>> > > > Adding dependencies do serialize builds and might have penalty on
>> > > > build time, better is to turn this into a packageconfig
>> > > > option and keep it disabled by default.
>> > >
>> > > I can rework this patch to make it a PACKAGECONFIG option. However t=
he
>> > > reason for enabling ccmake by default is due to the addition of the
>> > > ccmake bbclass in this series, which relies on having ccmake availab=
le
>> > > in the native sysroot. Having to override PACKAGECONFIG to use the
>> > > ccmake class seemed broken (since it is not particularly a distro
>> > > config).
>> > >
>> > > I could not find a good example of this sort of requirement for
>> > > configuration for any other bbclass except for maybe
>> > > gobject-introspection (which relies on qemu-native configured
>> > > correctly to have linux-user for the target).
>> > >
>> > > Another approach I considered to have this working without requiring
>> > > the user to setup PACKAGECONFIG would be to have a "ccmake-native"
>> > > recipe which built the ccmake binary. But this seemed like it would =
be
>> > > extra maintenance burden compared to this patch which has minimal
>> > > build time overhead.
>> > >
>> >
>> > this seems fine, if the number of recipes needing this bbclass are far=
 less than
>> > one the needing cmake bbclass.
>>
>> Just to clarify, are you suggesting that making a ccmake-native recipe
>> would be fine? Or that requiring the PACKAGECONFIG setup would be
>> acceptable/preferred?
>
>
> I don=E2=80=99t have enough of data to lean on either way
> Are we adding this to every cmake using recipes benefit or is it only a h=
andful

At the moment there is no intention to enable the ccmake bbclass in
any general or board sense. Mainly leaving it as a per recipe opt in
for recipes where user configuration is desired.

Thanks,
Nathan

>>
>>
>>
>> Thanks,
>> Nathan
>>
>> >
>> > > Regards,
>> > > Nathan
>> > >
>> > > >
>> > > > > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>> > > > > > ---
>> > > > > > This patch suggests enabling this in the cmake-native recipe, =
however this
>> > > > > > might be undesirable for bootstrapping reasons. Whilst ccmake =
is not used
>> > > > > > normally the added dependency on ncurses is likely required fo=
r other parts
>> > > > > > of the build so impact on build ordering and time should be re=
latively
>> > > > > > minimal.
>> > > > > >
>> > > > > > Changes in v2:
>> > > > > > - None
>> > > > > > ---
>> > > > > >  meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
>> > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
>> > > > > >
>> > > > > > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.b=
b
>> > > > > > b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
>> > > > > > index fedcf3d4bd..b2952ee5f5 100644
>> > > > > > --- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
>> > > > > > +++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
>> > > > > > @@ -1,7 +1,7 @@
>> > > > > >  require cmake.inc
>> > > > > >  inherit native
>> > > > > >
>> > > > > > -DEPENDS +=3D "bzip2-replacement-native expat-native xz-native=
 zlib-native
>> > > > > > curl-native"
>> > > > > > +DEPENDS +=3D "bzip2-replacement-native expat-native xz-native=
 zlib-native
>> > > > > > curl-native ncurses-native"
>> > > > > >
>> > > > > >  SRC_URI +=3D "file://OEToolchainConfig.cmake \
>> > > > > >              file://environment.d-cmake.sh \ @@ -13,10 +13,9 @=
@ SRC_URI +=3D
>> > > > > > "file://OEToolchainConfig.cmake \  B =3D "${WORKDIR}/build"
>> > > > > >  do_configure[cleandirs] =3D "${B}"
>> > > > > >
>> > > > > > -# Disable ccmake since we don't depend on ncurses  CMAKE_EXTR=
ACONF =3D
>> > > > > > "\
>> > > > > >      -DCMAKE_LIBRARY_PATH=3D${STAGING_LIBDIR_NATIVE} \
>> > > > > > -    -DBUILD_CursesDialog=3D0 \
>> > > > > > +    -DBUILD_CursesDialog=3D1 \
>> > > > > >      -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
>> > > > > >      -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
>> > > > > >      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
>> > > > > > ---
>> > > > > > 2.20.1
>> > > > > > --
>> > > > > > _______________________________________________
>> > > > > > Openembedded-core mailing list
>> > > > > > Openembedded-core@lists.openembedded.org
>> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re
>> > > > > --
>> > > > > _______________________________________________
>> > > > > Openembedded-core mailing list
>> > > > > Openembedded-core@lists.openembedded.org
>> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

