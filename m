Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QezCv-0003v8-K1
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 02:46:13 +0200
Received: by vws2 with SMTP id 2so1279882vws.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=wUq0NB5a7sGhgsK8mKWjejF3+X9WFrIgvxIa7RWl1Q4=;
	b=EyK251UuiqRzQg3vHuexewOATbQ1LpcDxsGtMcp4jGrPnl+N3YXVc0/ftCiKfFUZsG
	jdmTPkPb7vFjYuddhmH83Q4P0OCY/RY9Xb1Y+YMwISDdy9UOxkDQk6lD5UywbgopYFqy
	3d/MIYu0XwpDAwNNuprUNtl4YBS5AScScCGXk=
Received: by 10.52.177.1 with SMTP id cm1mr1839546vdc.295.1310085740740;
	Thu, 07 Jul 2011 17:42:20 -0700 (PDT)
Received: from [192.168.30.25] (ns-visitor-nsrp.juniper.net [208.223.208.242])
	by mx.google.com with ESMTPS id p1sm2210567vby.12.2011.07.07.17.42.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 17:42:19 -0700 (PDT)
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
	<629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<CAMKF1srHWhp36iNaMPKBbkBNBQSSWCb7fbULP9efAsg3r29J=A@mail.gmail.com>
	<1310080368.20015.855.camel@rex>
In-Reply-To: <1310080368.20015.855.camel@rex>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <A64F9A3E-6359-4C99-B332-378FFE4F644C@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 17:42:47 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] binutils: upgrade from 2.21 to 2.21.1
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
X-List-Received-Date: Fri, 08 Jul 2011 00:46:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 7, 2011, at 4:12 PM, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:

> On Thu, 2011-07-07 at 14:39 -0700, Khem Raj wrote:
>> On Thu, Jul 7, 2011 at 1:25 PM,  <nitin.a.kamble@intel.com> wrote:
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>=20
>>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> ---
>>> ...n_2.21.bb =3D> binutils-cross-canadian_2.21.1.bb} |    0
>>> ...tils-cross_2.21.bb =3D> binutils-cross_2.21.1.bb} |    0
>>> ...rosssdk_2.21.bb =3D> binutils-crosssdk_2.21.1.bb} |    0
>>> .../110-arm-eabi-conf.patch                        |    0
>>> .../binutils-2.19.1-ld-sysroot.patch               |    0
>>> .../binutils-poison.patch                          |    0
>>> .../binutils-pr12366.patch                         |    0
>>> .../binutils-uclibc-100-uclibc-conf.patch          |    0
>>> ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
>>> ...binutils-uclibc-300-006_better_file_error.patch |    0
>>> ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
>>> .../binutils-uclibc-gas-needs-libm.patch           |    0
>>> .../binutils-x86_64_i386_biarch.patch              |    0
>>> .../libiberty_path_fix.patch                       |    0
>>> .../libtool-2.4-update.patch                       | 1725 ++++++++++----=
------
>>> .../libtool-rpath-fix.patch                        |    0
>>> .../{binutils_2.21.bb =3D> binutils_2.21.1.bb}       |    7 +-
>>> 17 files changed, 871 insertions(+), 861 deletions(-)
>>> rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.bb =3D=
> binutils-cross-canadian_2.21.1.bb} (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-cross_2.21.bb =3D> binut=
ils-cross_2.21.1.bb} (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.bb =3D> bi=
nutils-crosssdk_2.21.1.bb} (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/110-=
arm-eabi-conf.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-2.19.1-ld-sysroot.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-poison.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-pr12366.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-uclibc-100-uclibc-conf.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-uclibc-300-001_ld_makefile_patch.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-uclibc-300-006_better_file_error.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-uclibc-300-012_check_ldrunpath_length.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-uclibc-gas-needs-libm.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/binu=
tils-x86_64_i386_biarch.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/libi=
berty_path_fix.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/libt=
ool-2.4-update.patch (94%)
>>> rename meta/recipes-devtools/binutils/{binutils-2.21 =3D> binutils}/libt=
ool-rpath-fix.patch (100%)
>>> rename meta/recipes-devtools/binutils/{binutils_2.21.bb =3D> binutils_2.=
21.1.bb} (87%)
>>>=20
>>=20
>> How about changing the recipe to fetch from binutils-2_21-branch and
>> call it binutils 2.21 as it is
>=20
> I don't really see the benefits in fetching this from the SCM?

Not much yes however

Releases happen not so frequently but bug fixes go into the branch and it ma=
kes it easier to upgrade may be same as adding patches to metadata but we do=
n't need to keep them local in metadata

It will match the process we do for other toolchain components



>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


