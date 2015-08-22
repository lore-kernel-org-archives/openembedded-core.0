Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 398C1737F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 01:36:53 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so18131041pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 18:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Pd+GT6CGd5DE2pzwELvwjkNhM4TdO0nJXo3/b0/iieI=;
	b=MaSPRPERcQ30Su4BZfoxvwEiCoR3nC4EiINaw4qT7Ku24Vt2lkRmojMFBtW1BNAgXG
	yZb4YTFrcM8tkOdbxsQ7ieng3Jl5kfqXPsOtZT5/0YxMnrr0W8iTCuqSPtLvQpckm4Ra
	FInSEdiptopOIcE72lV3xjD1gLArL5oEuv5PPWfycBZdmyMOGgD0KluFAgYyzNmd85yb
	KXODbmVkKSzcyo9bVuGE2h3TlPjOXiyKdFAtp4yszNp3MXFpxjoqjpJbNucKpS4oQ3Dv
	8ABIo203aRnkXbyQXOFlYvpQUaQuWxO+k3cvleqr45kKC4mG0dCqnUVqRvKVn/h2qZ1N
	WYug==
X-Received: by 10.68.195.231 with SMTP id ih7mr23165757pbc.26.1440207413618;
	Fri, 21 Aug 2015 18:36:53 -0700 (PDT)
Received: from ?IPv6:2600:100f:b000:423a:1d1f:712f:c87:19a6?
	([2600:100f:b000:423a:1d1f:712f:c87:19a6])
	by smtp.gmail.com with ESMTPSA id
	bf14sm9202960pdb.28.2015.08.21.18.36.51
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Aug 2015 18:36:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55D7C86A.1080700@windriver.com>
Date: Fri, 21 Aug 2015 18:36:46 -0700
Message-Id: <5F12A3B5-FE4C-432E-B4A6-C323B2790E1D@gmail.com>
References: <cover.1440126018.git.wenzong.fan@windriver.com>
	<c22d818de805fde488bce9e0263d573c51cee5c9.1440126018.git.wenzong.fan@windriver.com>
	<CAMKF1srnPDL=yzcu7_niSfwuxa8a-93bBQLN0ba-Roru4DRHhw@mail.gmail.com>
	<55D7C86A.1080700@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2 v2] libcap-ng: add package 0.7.7
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
X-List-Received-Date: Sat, 22 Aug 2015 01:36:55 -0000
X-Groupsio-MsgNum: 69846
Content-Type: multipart/signed;
	boundary="Apple-Mail=_97F921A6-5910-4F49-B086-36D0157E2AD9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_97F921A6-5910-4F49-B086-36D0157E2AD9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Aug 21, 2015, at 5:55 PM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
>=20
> On 2015-08-21 03:25 AM, Khem Raj wrote:
>> On Thu, Aug 20, 2015 at 10:38 PM,  <wenzong.fan@windriver.com> wrote:
>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>=20
>>> Pull package from meta-oe to oe-core:
>>> meta-oe commit: bce4dba5546480c8e43c6442959ac7d0a4ef32f6
>>>=20
>>> The libcap-ng library is intended to make programming with posix
>>> capabilities much easier than the traditional libcap library.
>>>=20
>>> It's not a replacement to libcap, it provides different library
>>> (libcap-ng.so) while packages explicitly look for libcap.so. It
>>> could be used by qemu, util-linux, libvirt, audit ...
>>>=20
>>> With adding it to oe-core, the copies from following layers could
>>> be removed:
>>>=20
>>> * meta-oe, meta-selinux, meta-security-framework ...
>>=20
>> I am afraid that we  are setting a pretext for moving all recipes =
that
>> are in multiple layers to be eligible for OE-core now.
>> meta-oe is common layer for extended recipes, so may be other layers
>> should have been a bit more vigilant and made sure
>> there requirements were met with whats in meta-oe.
>=20
> Meta-oe has far to many recipes for some people to want
> to include the entire layer:
>   meta-oe.git $ find meta-oe/ -name "*bb" | wc -l
>   618
> We can certainly use the new whitelist layer filtering to
> get to a smaller collection of recipes but I'd like to suggest we
> need to document and maybe design the layer structure
> a bit more. There are lots of different opinions about
> how to split collections of packages in to different layers so
> unless someone has a dependency-based analysis of all
> pacakges in all layers, I don't see much point in a long
> discussion on this topic.

if someone wants to ignore certain recipes use BBMASK, I do not think
this whitelisting is a good idea, it does not help in maintaining layer
quality, and its much better that we maintained layers in good quality =
collectively
may be with some extra recipes in it instead of cannibalizing few =
recipes from it
into private layers or other layer which one happens to use. It =
seriously dents
the layers user base and quality. If meta-oe hosts certain layers that =
could be
a fit in another middleware or topic layer, lets move it to that layer =
but lets
not encourage the behavior of duplicating the recipes or severely =
crippling the layer
before using it.

>=20
> Has the idea of creating a new meta-openembedded layer
> for widely-used, OS interface libraries been proposed?
> These 80 recipes could be considered for inclusion:
>   $ find  meta-oe -name "lib*bb" | wc -l
>   80
> but more consideration is probably needed.
>=20
> In the short term (oe-core-1.9 (now 2.0), I guess we leave
> things as they are. Sigh=85

number of layers is a delicate balance too. The more you divide them =
more smaller the userbase will become
and complex becomes the distros.

>=20
> ../Randy
>=20
>=20
> While I'm at it, for reference of layer size:
>=20
> $ for i in `ls -d meta-*`; do echo -n $i": "; find $i -name "*bb" | wc =
-l; done
> meta-efl: 57
> meta-filesystems: 16
> meta-gnome: 82
> meta-gpe: 5
> meta-initramfs: 14
> meta-multimedia: 51
> meta-networking: 115
> meta-oe: 618
> meta-perl: 30
> meta-python: 74
> meta-ruby: 4
> meta-systemd: 1
> meta-webserver: 13
> meta-xfce: 67
>=20
> -----------------------------------------
>=20
>=20
>> we should ask what core feature does it enable for reference images
>> and machines.
>>=20
>>>=20
>>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>> ---
>>>  .../libcap-ng/libcap-ng/python.patch               | 58 =
++++++++++++++++++++++
>>>  meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  | 39 =
+++++++++++++++
>>>  2 files changed, 97 insertions(+)
>>>  create mode 100644 =
meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>>  create mode 100644 =
meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>>=20
>>> diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch =
b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>> new file mode 100644
>>> index 0000000..59591eb
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>> @@ -0,0 +1,58 @@
>>> +=46rom b01bb2694f66cd981e6d61523433dc3eb5ed32f2 Mon Sep 17 00:00:00 =
2001
>>> +From: Li xin <lixin.fnst@cn.fujitsu.com>
>>> +Date: Sat, 18 Jul 2015 23:03:30 +0900
>>> +Subject: [PATCH] configure.ac - Avoid an incorrect check for =
python.
>>> + Makefile.am - avoid hard coded host include paths.
>>> +
>>> +Upstream-Status: pending
>>> +
>>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>>> +---
>>> + bindings/python/Makefile.am |  3 ++-
>>> + configure.ac                | 15 ++-------------
>>> + 2 files changed, 4 insertions(+), 14 deletions(-)
>>> +
>>> +diff --git a/bindings/python/Makefile.am =
b/bindings/python/Makefile.am
>>> +index 82b9bb8..f9fe7a8 100644
>>> +--- a/bindings/python/Makefile.am
>>> ++++ b/bindings/python/Makefile.am
>>> +@@ -23,7 +23,8 @@ SUBDIRS =3D test
>>> + CONFIG_CLEAN_FILES =3D *.loT *.rej *.orig
>>> + AM_CFLAGS =3D -fPIC -DPIC
>>> + PYLIBVER ?=3D python$(PYTHON_VERSION)
>>> +-AM_CPPFLAGS =3D -I. -I$(top_builddir) -I@PYINCLUDEDIR@
>>> ++PYINC ?=3D /usr/include/$(PYLIBVER)
>>> ++AM_CPPFLAGS =3D -I. -I$(top_builddir) -I$(PYINC)
>>> + LIBS =3D $(top_builddir)/src/libcap-ng.la
>>> + SWIG_FLAGS =3D -python
>>> + SWIG_INCLUDES =3D ${AM_CPPFLAGS}
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 1d777d5..9d90f64 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -123,19 +123,8 @@ if test x$use_python =3D xno ; then
>>> + else
>>> + AC_MSG_RESULT(testing)
>>> + AM_PATH_PYTHON
>>> +-PYINCLUDEDIR=3D`python${am_cv_python_version} -c "from distutils =
import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"`
>>> +-if test -f ${PYINCLUDEDIR}/Python.h ; then
>>> +-      python_found=3D"yes"
>>> +-      AC_SUBST(PYINCLUDEDIR)
>>> +-      AC_MSG_NOTICE(Python bindings will be built)
>>> +-else
>>> +-      python_found=3D"no"
>>> +-      if test x$use_python =3D xyes ; then
>>> +-              AC_MSG_ERROR([Python explicitly required and python =
headers found])
>>> +-      else
>>> +-              AC_MSG_WARN("Python headers not found - python =
bindings will not be made")
>>> +-      fi
>>> +-fi
>>> ++python_found=3D"yes"
>>> ++AC_MSG_NOTICE(Python bindings will be built)
>>> + fi
>>> + AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} =3D "yes")
>>> +
>>> +--
>>> +1.8.4.2
>>> +
>>> diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb =
b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>> new file mode 100644
>>> index 0000000..a31d5dc
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>> @@ -0,0 +1,39 @@
>>> +SUMMARY =3D "An alternate posix capabilities library"
>>> +DESCRIPTION =3D "The libcap-ng library is intended to make =
programming \
>>> +with POSIX capabilities much easier than the traditional libcap =
library."
>>> +HOMEPAGE =3D "http://freecode.com/projects/libcap-ng"
>>> +SECTION =3D "base"
>>> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>>> +                   =
file://COPYING.LIB;md5=3De3eda01d9815f8d24aae2dbd89b68b06"
>>> +
>>> +SRC_URI =3D =
"http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
>>> +           file://python.patch"
>>> +
>>> +inherit lib_package autotools pythonnative
>>> +
>>> +SRC_URI[md5sum] =3D "3d7d126b29e2869a0257c17c8b0d9b2e"
>>> +SRC_URI[sha256sum] =3D =
"615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b"
>>> +
>>> +DEPENDS +=3D "swig-native python"
>>> +
>>> +EXTRA_OECONF +=3D "--without-python3"
>>> +
>>> +EXTRA_OEMAKE +=3D "PYLIBVER=3D'python${PYTHON_BASEVERSION}' =
PYINC=3D'${STAGING_INCDIR}/${PYLIBVER}'"
>>> +
>>> +PACKAGES +=3D "${PN}-python"
>>> +
>>> +FILES_${PN}-dbg +=3D =
"${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
>>> +FILES_${PN}-python =3D "${libdir}/python${PYTHON_BASEVERSION}"
>>> +
>>> +BBCLASSEXTEND =3D "native"
>>> +
>>> +do_install_append() {
>>> +       # Moving libcap-ng to base_libdir
>>> +       if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>>> +               mkdir -p ${D}/${base_libdir}/
>>> +               mv -f ${D}${libdir}/libcap-ng.so.* =
${D}${base_libdir}/
>>> +               relpath=3D${@os.path.relpath("${base_libdir}", =
"${libdir}")}
>>> +               ln -sf ${relpath}/libcap-ng.so.0.0.0 =
${D}${libdir}/libcap-ng.so
>>> +       fi
>>> +}
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, =
Canada, K2K 2W5


--Apple-Mail=_97F921A6-5910-4F49-B086-36D0157E2AD9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXX0jIACgkQuwUzVZGdMxTpigCdGee8Nja4YwKFGTXiGyArFsSV
NWoAnRyTaun5mW78yPw/uyXtQemYa/DW
=J5g9
-----END PGP SIGNATURE-----

--Apple-Mail=_97F921A6-5910-4F49-B086-36D0157E2AD9--
