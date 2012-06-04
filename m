Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SbgCd-0001UI-IQ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:56:47 +0200
Received: by yhjj56 with SMTP id j56so3426061yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9pKjJnkFn6MklYz8QTxDM4dMU69XqoOkl5CR373zFtE=;
	b=iLnK6XDDJNi5hfMvz15KReo5J1gzMGQYrjLsWt8V3vOpRgepThpWIOVKthS0xXUmnM
	yUV/1JxBLQbkv5ADJYDezt6Z5rTzylLNXBegB7SmmTy/kA1sI4zC2HvS8YgbfBtLyZly
	439D7xNX68bOc1q14KSbhXB7Z3U4RwgREKwrlwNxTjx04oEc8U30nWO/DdXgCiJSIseu
	j2KRwhzOFXe44b/iEirgqbkJyyucictdRmpol0EdXNHnVZq1441QGJ3c8tw5zgFn70KS
	P2rsRYUpFk/PEa6Q+iOSP9y66XtTtyuTmLGQIbSrjhnCemYaaWsC+WAU4Zq7D420iovr
	fF8g==
MIME-Version: 1.0
Received: by 10.42.38.83 with SMTP id b19mr8530319ice.10.1338849981593; Mon,
	04 Jun 2012 15:46:21 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Mon, 4 Jun 2012 15:46:21 -0700 (PDT)
In-Reply-To: <1338819642.28421.26.camel@elmorro>
References: <CALbNGRQ_9XmHOQyPZUoT4rUKmjzH_vxBidYp_eJ0vsLAZNe1rw@mail.gmail.com>
	<1338819642.28421.26.camel@elmorro>
Date: Tue, 5 Jun 2012 00:46:21 +0200
Message-ID: <CALbNGRTsiiOGGhP+b=G85w-enK+LsDbY4Qp-8w6U3w=R9Z=GHA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemtap build fails
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
X-List-Received-Date: Mon, 04 Jun 2012 22:56:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 4:20 PM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Fri, 2012-06-01 at 01:18 +0200, Andreas M=FCller wrote:
>> Hi,
>>
>> I pulled today, started a build from scratch and ran into trouble with
>> systemtap:
>> ...
>> | In file included from csclient.h:12:0,
>> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from main.cxx:24:
>> | cscommon.h:8:17: fatal error: ssl.h: No such file or directory
>> | compilation terminated.
>> | In file included from csclient.h:12:0,
>> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from session.cxx:18:
>> | cscommon.h:8:17: fatal error: ssl.h: No such file or directory
>> | compilation terminated.
>> | make[2]: *** [stap-session.o] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>> | make[2]: *** [stap-main.o] Error 1
>> | make[2]: Leaving directory
>> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/s=
ystemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r4/git'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/s=
ystemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r4/git'
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> ...
>>
>> I added --without-nss to EXTRA_OECONF and rebuild. Now stap-main.o and
>> stap-session.o were build but now I get
>> ...
>> | modverify.c:28:21: fatal error: pk11pub.h: No such file or directory
>> | compilation terminated.
>> | make[3]: *** [staprun-modverify.o] Error 1
>> | make[3]: *** Waiting for unfinished jobs....
>> | ../../nsscommon.cxx:37:17: fatal error: ssl.h: No such file or directo=
ry
>> | compilation terminated.
>> | make[3]: *** [staprun-nsscommon.o] Error 1
>> | make[3]: Leaving directory
>> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/s=
ystemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git/runtime/s=
taprun'
>> | make[2]: *** [all] Error 2
>> | make[2]: Leaving directory
>> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/s=
ystemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git/runtime/s=
taprun'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/s=
ystemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git'
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> ...
>>
>> In config.log I find
>> ...
>> HAVE_NSS_TRUE=3D'#'
>> ...
>>
>> This is strange: In runtime/staprun/Makefile.am the failed files
>> should be excluded from build
>> ...
>> if HAVE_NSS
>> staprun_SOURCES +=3D modverify.c ../../nsscommon.cxx
>> staprun_CFLAGS +=3D $(nss_CFLAGS)
>> staprun_CXXFLAGS +=3D $(nss_CFLAGS)
>> staprun_LDADD +=3D $(nss_LIBS)
>> endif
>> ...
>>
>> Seems HAVE_NSS_TRUE=3D'#' has not reached runtime/staprun
>>
>> Any thoughts?
>>
>
> Looks like systemtap changed some configuration that the recipe was
> relying on. =A0Could you try this patch and see if it fixes things?
>
> Thanks,
>
> Tom
>
> [PATCH] systemtap: disable some optional features
>
> Version 1.7 changed the way some of the configuration works,
> specifically, it removed some of the header checks for nss and avahi
> that the recipe was relying on and replaced them with a couple new
> config options.
>
> We'll also disable the server, which was the component making use of
> nss in the first place, and the grapher, which isn't core
> functionality either.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> =A0meta/recipes-kernel/systemtap/systemtap_git.bb | =A0 10 +++-------
> =A01 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
> index 4d340fc..3b727b8 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -6,19 +6,15 @@ DEPENDS =3D "elfutils sqlite3 systemtap-native"
> =A0DEPENDS_virtclass-native =3D "elfutils-native sqlite3-native gettext-n=
ative"
> =A0DEPENDS_virtclass-nativesdk =3D "elfutils-nativesdk sqlite3-nativesdk =
gettext-nativesdk"
>
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0export CC_FOR_BUILD =3D "${BUILD_CC}"
> =A0export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
> =A0export LDFLAGS_FOR_BUILD =3D "${BUILD_LDFLAGS}"
>
> =A0EXTRA_OECONF +=3D "--with-libelf=3D${STAGING_DIR_TARGET} --without-rpm=
 \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nss=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nss3=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nspr=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nspr4=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_avahi_client=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_avahi_common=3Dno "
> + =A0 =A0 =A0 =A0 =A0 =A0--without-nss --without-avahi \
> + =A0 =A0 =A0 =A0 =A0 =A0--disable-server --disable-grapher "
>
> =A0STAP_DOCS ?=3D "--disable-docs --disable-publican --disable-refdocs"
>
> --
> 1.7.0.4
Thanks for taking care but since your patch does basically the same as
I written, the error situation remains the same in the second part of
first mail.

I see two solutions:

1. In runtime/staprun/Makefile.am remove
...
if HAVE_NSS
staprun_SOURCES +=3D modverify.c ../../nsscommon.cxx
staprun_CFLAGS +=3D $(nss_CFLAGS)
staprun_CXXFLAGS +=3D $(nss_CFLAGS)
staprun_LDADD +=3D $(nss_LIBS)
endif
...

2. Change some autotool magic so that
...
HAVE_NSS_TRUE=3D'#'
...
from configure finds its way into runtime/staprun (see also
runtime/staprun/Makefile.in).

Since 1. is a hack, I would prefer 2. but did not yet find where
HAVE_NSS - properly detected by configure - gets lost...

Andreas


