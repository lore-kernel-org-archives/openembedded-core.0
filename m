Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id BFE2E78944
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 00:57:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 17:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,337,1517904000"; d="scan'208";a="213405482"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2018 17:57:15 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.51]) with mapi id
	14.03.0319.002; Wed, 21 Mar 2018 08:57:15 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Openembedded-core Digest, Vol 86, Issue 203
Thread-Index: AQHTwDmrs8bM34aYsEuS5VKlO0wB96PZ3D+g
Date: Wed, 21 Mar 2018 00:57:14 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335DF9A7B@PGSMSX109.gar.corp.intel.com>
References: <mailman.18076.1521543183.1653.openembedded-core@lists.openembedded.org>
In-Reply-To: <mailman.18076.1521543183.1653.openembedded-core@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGE0YTIwZjgtZmNiZi00OTVkLThhZTgtNWU2MzIxZTZmZjQxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkRDY0ZTMkZwRVV4RWZ4bVgyVTRyYkhPZnBsUWdlYVB0RzJsVDhkbzlvQXM9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: Openembedded-core Digest, Vol 86, Issue 203
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
X-List-Received-Date: Wed, 21 Mar 2018 00:57:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex

Can this be rewritten as a runtime test case to be used with testimage?=20
	- Initially, the first attempt was to use testimage, but was facing challe=
nging situation where both testimage and crosstap script both required exec=
ution of bitbake (this test case required executing crosstap script, where =
crosstap script internally will execute bitbake for getting environment var=
iables). Thus the alternative was to develop this crosstap testcase as oe-s=
elftest. =20
 =20
It seems like the code duplicates much of what testimage.bbclass does, and =
we generally try to avoid adding test cases that build and boot images in o=
e-selftest, as it adds to already large running time for it.=20
The acceptable exception is when an image needs a really custom configurati=
on, but this is not the case here - you can take core-image-sato-sdk for ex=
ample, which comes pre-packaged with tools-profile and ssh server.
	- Totally agreed with the point of avoid duplicate and adding more running=
 time for oe-selftest, but due to the use case of this testcase testing cro=
sstap script where crosstap script internally will execute bitbake for gett=
ing environment variables, the current alternative was to use oe-selftest. =
 Please suggest other alternative if available.=20

Thank you very much for your attention & advice!=20

Ee Peng

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of openembedded-core-reques=
t@lists.openembedded.org
Sent: Tuesday, March 20, 2018 6:53 PM
To: openembedded-core@lists.openembedded.org
Subject: Openembedded-core Digest, Vol 86, Issue 203

Send Openembedded-core mailing list submissions to
	openembedded-core@lists.openembedded.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.openembedded.org/mailman/listinfo/openembedded-core
or, via email, send a message with subject or body 'help' to
	openembedded-core-request@lists.openembedded.org

You can reach the person managing the list at
	openembedded-core-owner@lists.openembedded.org

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of Openembedded-core digest..."


Today's Topics:

   1. Re: [PATCH] oe-selftest: crosstap: add tests for crosstap
      script (Alexander Kanavin)
   2. Re: [yocto]  Yocto Project Status WW12?18 (Alexander Kanavin)
   3. Re: [PATCHv3] iputils: add PACKAGECONFIG for libidn and
      disable it by default (Martin Jansa)
   4. [PATCH v2] libsolv: refresh the patch (Maxin B. John)
   5. Re: [yocto]  Yocto Project Status WW12?18 (Burton, Ross)


----------------------------------------------------------------------

Message: 1
Date: Tue, 20 Mar 2018 11:58:04 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [OE-core] [PATCH] oe-selftest: crosstap: add tests for
	crosstap script
Message-ID: <2bff16f4-31a7-2541-79e6-f9a73d1abd89@linux.intel.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 03/20/2018 01:59 AM, Yeoh Ee Peng wrote:
> QA team were testing crosstap script  manually. Add automated tests=20
> and systemtap file to test that crosstap script will instructs=20
> SystemTap to print hello world in qemu. This test will first built=20
> core-image-minimal image with tools-profile & ssh-server-openssh=20
> features and build systemtap-native on the host machine. Finally this=20
> test will boot the image with qemu and then execute crosstap script to=20
> print hello world on qemu.

Can this be rewritten as a runtime test case to be used with testimage?=20
It seems like the code duplicates much of what testimage.bbclass does, and =
we generally try to avoid adding test cases that build and boot images in o=
e-selftest, as it adds to already large running time for it.=20
The acceptable exception is when an image needs a really custom configurati=
on, but this is not the case here - you can take core-image-sato-sdk for ex=
ample, which comes pre-packaged with tools-profile and ssh server.

Alex


------------------------------

Message: 2
Date: Tue, 20 Mar 2018 12:07:32 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, akuster808
	<akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto]  Yocto Project Status WW12?18
Message-ID: <833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 03/19/2018 10:07 PM, Burton, Ross wrote:
>     Do we have a place identified for new changes (2.6) while 2.5
>     stabilizes.
>=20
>=20
> A formal place, no.? I tend to queue stuff in a branch if master isn't=20
> taking all of my energy, otherwise the patches will sit on the list=20
> until 2.5 releases.? Typically master and sumo branches won't diverge=20
> until post-release.

Which brings me to a question: what is a good schedule and cadence for=20
AUH runs? Currently it's run on the 15th of every odd-numbered month (so=20
January, March, and so on), but I thought of shifting it one month=20
forward, so it doesn't land right in the middle of a feature freeze.=20
Thoughts?

Alex


------------------------------

Message: 3
Date: Tue, 20 Mar 2018 11:19:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv3] iputils: add PACKAGECONFIG for libidn
	and disable it by default
Message-ID:
	<CA+chaQdVBZTfp+jSuCwYufQQz2izdt-Z3OoafdRvAUmrtuP=3DLw@mail.gmail.com>
Content-Type: text/plain; charset=3D"utf-8"

And v1 just got merged to master, I'll send v2 with change of the default
if other agree.

I don't have strong opinion, yes it might be broken, but it was enabled
since the update to 20161105 and nobody was complaining and adding
PACKAGECONFIG usually shouldn't change the options currently used (I've
meant to disable it by default, just because Khem's request).

On Tue, Mar 20, 2018 at 12:32 AM, Andre McCurdy <armccurdy@gmail.com> wrote=
:

> On Sat, Mar 17, 2018 at 4:26 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * it got enabled by default, but without the dependency on libidn in:
> >   commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
> >   Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> >   AuthorDate: Thu Feb 1 20:02:08 2018 +0200
> >   Subject: iputils: update to 20161105
> >
> > * https://github.com/iputils/iputils/blob/master/RELNOTES.old
> >   mentiones that IDN was enabled by default in:
> >   [s20160308] and surprisingly the same in [s20150815]
> >   but there are no release notes for s20151218 version we were using
> until
> >   now, don't know how it really relates to [s20150815].
> >
> > * but there are some issues with libidn as described in:
> >   https://github.com/iputils/iputils/commit/
> f3a461603ef4fb7512ade3bdb73fe1824e294547
> >   so disable it by default.
> >
> > * fails with:
> >   | In file included from ping_common.c:1:0:
> >   | ping.h:39:10: fatal error: idna.h: No such file or directory
> >   |  #include <idna.h>
> >   |           ^~~~~~~~
> >
> > * Easiest way to reproduce this failure is to remove libidn from gnutls
> >   PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFI=
G
> >   at all (like the one in meta-gplv2).
> >
> > * First it leads to following QA issue:
> >   http://errors.yoctoproject.org/Errors/Build/53212/
> >   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping
> rdepends on libidn, but it isn't a build dependency, missing libidn in
> DEPENDS or PACKAGECONFIG? [build-deps]
> >   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue:
> iputils-traceroute6 rdepends on libidn, but it isn't a build dependency,
> missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
> >   ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
> >   Please consider fixing them.
> >   ERROR: iputils-s20161105-r0 do_package_qa: Function failed:
> >   do_package_qa
> >   ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/
> work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
> >   ERROR: Task (/OE/build/oe-core/openembedded-core/meta/
> recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) failed with
> exit code '1'
> >
> > * But if you cleansstate iputils as well (after removing libidn from
> >   gnutls PACKAGECONFIG) to empty iputils RSS, then you get the error
> about
> >   missing idna.h:
> >   http://errors.yoctoproject.org/Errors/Build/53213/
> >
> > * Adding the libidn dependency explicitly in iputils recipe fixes the
> >   issue.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-extended/iputils/iputils_s20161105.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb
> b/meta/recipes-extended/iputils/iputils_s20161105.bb
> > index ad7dbc4d4a..0125739b03 100644
> > --- a/meta/recipes-extended/iputils/iputils_s20161105.bb
> > +++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
> > @@ -23,8 +23,11 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>s\d+)"
> >
> >  EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> >
> > +PACKAGECONFIG ?=3D ""
>
> It looks like mut (and now master-next) have picked up v1 of this
> patch, where libidn is enabled by default.
>
> > +PACKAGECONFIG[libidn] =3D "USE_IDN=3Dyes,USE_IDN=3Dno,libidn"
> > +
> >  do_compile () {
> > -       oe_runmake 'CC=3D${CC} -D_GNU_SOURCE' VPATH=3D"${STAGING_LIBDIR=
}:${
> STAGING_DIR_HOST}/${base_libdir}" all
> > +       oe_runmake 'CC=3D${CC} -D_GNU_SOURCE' VPATH=3D"${STAGING_LIBDIR=
}:${
> STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
> >  }
> >
> >  do_install () {
> > --
> > 2.15.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.openembedded.org/pipermail/openembedded-core/attachments=
/20180320/dc4e3bfe/attachment-0001.html>

------------------------------

Message: 4
Date: Tue, 20 Mar 2018 12:51:04 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2] libsolv: refresh the patch
Message-ID: <1521543064-27661-1-git-send-email-maxin.john@intel.com>

fixes:

WARNING: libsolv-0.6.33-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

devtool modify <recipe>
devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675=
.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
Details:
Applying patch
0001-Add-fallback-fopencookie-implementation.patch
patching file ext/CMakeLists.txt
patching file ext/solv_xfopen.c
Hunk #1 succeeded at 12 with fuzz 1 (offset -1 lines).
Hunk #2 succeeded at 25 (offset -18 lines).
Hunk #3 succeeded at 34 (offset -18 lines).
Hunk #4 succeeded at 46 (offset -18 lines).
patching file ext/solv_xfopen_fallback_fopencookie.c
patching file ext/solv_xfopen_fallback_fopencookie.h

Now at patch 0001-Add-fallback-fopencookie-implementation.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...0001-Add-fallback-fopencookie-implementation.patch | 19 ++++++++++-----=
----
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopenc=
ookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add=
-fallback-fopencookie-implementation.patch
index a575d0e..ef0dd82 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-i=
mplementation.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-i=
mplementation.patch
@@ -1,4 +1,4 @@
-From 4d9b6ec30b78d00ead0a22eb5d047dcdba37e99c Mon Sep 17 00:00:00 2001
+From 6224f087120c9ca41b302ac85d611a7280edda33 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Neal=3D20Gompa=3D20=3D28=3DE3=3D83=3D8B=3DE3=3D83=3DBC=
=3DE3=3D83=3DAB=3DE3=3D83=3DBB?=3D
  =3D?UTF-8?q?=3DE3=3D82=3DB3=3DE3=3D82=3D99=3DE3=3D83=3DB3=3DE3=3D83=3D8F=
=3DE3=3D82=3D9A=3D29?=3D
  <ngompa13@gmail.com>
@@ -13,6 +13,7 @@ Alex Kanavin: rebased CMakeLists.txt change to apply to l=
atest upstream code.
=20
 Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  ext/CMakeLists.txt                     |   7 ++
  ext/solv_xfopen.c                      |  10 +--
@@ -23,7 +24,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
=20
 diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index 586eda8..477a2ef 100644
+index b8917a2..fac6c32 100644
 --- a/ext/CMakeLists.txt
 +++ b/ext/CMakeLists.txt
 @@ -4,6 +4,13 @@ SET (libsolvext_SRCS
@@ -41,11 +42,11 @@ index 586eda8..477a2ef 100644
      SET (libsolvext_SRCS ${libsolvext_SRCS}
          pool_fileconflicts.c repo_rpmdb.c)
 diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
-index b0421bf..31345dd 100644
+index 2c64bb6..eb3a3ad 100644
 --- a/ext/solv_xfopen.c
 +++ b/ext/solv_xfopen.c
-@@ -13,6 +13,10 @@
- #include <zlib.h>
+@@ -12,6 +12,10 @@
+ #include <string.h>
  #include <fcntl.h>
 =20
 +#if !defined(HAVE_FUNOPEN) && !defined(HAVE_FOPENCOOKIE)
@@ -55,7 +56,7 @@ index b0421bf..31345dd 100644
  #include "solv_xfopen.h"
  #include "util.h"
 =20
-@@ -39,7 +43,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
+@@ -21,7 +25,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
  	ssize_t (*cwrite)(void *, const char *, size_t),
  	int (*cclose)(void *))
  {
@@ -64,7 +65,7 @@ index b0421bf..31345dd 100644
    if (!cookie)
      return 0;
    return funopen(cookie,
-@@ -48,7 +52,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
+@@ -30,7 +34,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
        (fpos_t (*)(void *, fpos_t, int))NULL,					/* seekfn */
        cclose
        );
@@ -73,7 +74,7 @@ index b0421bf..31345dd 100644
    cookie_io_functions_t cio;
 =20
    if (!cookie)
-@@ -60,8 +64,6 @@ static FILE *cookieopen(void *cookie, const char *mode,
+@@ -42,8 +46,6 @@ static FILE *cookieopen(void *cookie, const char *mode,
      cio.write =3D cwrite;
    cio.close =3D cclose;
    return  fopencookie(cookie, *mode =3D=3D 'w' ? "w" : "r", cio);
@@ -246,5 +247,5 @@ index 0000000..6a7bfee
 +
 +#endif
 --=20
-2.11.0
+2.4.0
=20
--=20
2.4.0



------------------------------

Message: 5
Date: Tue, 20 Mar 2018 10:52:43 +0000
From: "Burton, Ross" <ross.burton@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto]  Yocto Project Status WW12?18
Message-ID:
	<CAJTo0LadpoW1BCCbfhsEac7PBV2qNxuiWrnRk6MZeV2DVWiDEA@mail.gmail.com>
Content-Type: text/plain; charset=3D"utf-8"

On 20 March 2018 at 10:07, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/19/2018 10:07 PM, Burton, Ross wrote:
>
>>     Do we have a place identified for new changes (2.6) while 2.5
>>     stabilizes.
>>
>>
>> A formal place, no.  I tend to queue stuff in a branch if master isn't
>> taking all of my energy, otherwise the patches will sit on the list unti=
l
>> 2.5 releases.  Typically master and sumo branches won't diverge until
>> post-release.
>>
>
> Which brings me to a question: what is a good schedule and cadence for AU=
H
> runs? Currently it's run on the 15th of every odd-numbered month (so
> January, March, and so on), but I thought of shifting it one month forwar=
d,
> so it doesn't land right in the middle of a feature freeze. Thoughts?
>

How long does a single run take, and why not run it every month?

Ross
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.openembedded.org/pipermail/openembedded-core/attachments=
/20180320/7f228bdd/attachment.html>

------------------------------

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


End of Openembedded-core Digest, Vol 86, Issue 203
**************************************************

