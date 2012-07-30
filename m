Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svqph-0007ZP-S7
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 16:20:53 +0200
Received: by yenl13 with SMTP id l13so4320975yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BZApB68Jo0Na7JeuXoWHNYuYyp1TNV2bKZGSshRkZZw=;
	b=sLaAsalG8YF9aZUNz7VWhK30gDfrXQ6Gtexrkq52tnbLix8zUw44kjeNQOPouzdrxd
	5Nn+/ZhaLfybbw+TCqEtUcZpkkSpvYGRxh09237bvHnqyfDf0NmY3qiEqFB9A0xcBSJW
	RSnTcbqIEhxeWfzjj47W76Xn4cnizVsF/zCNlQ/pd6eVG94WQQRwp9k+2Bf9JPkIdK+c
	FqeIJgFVA9RQOa7BJGM4RjSZ0Et8Hpt31h0wmmuy8fQPE/tvY9Zxpbb/yYI1RereND/8
	i2aQ2f2Ulx3SpAs/18uhoZQAjDNn2UiBtjlbKjteEhQ4GDw7BaKR9aXCffEh8ajM9O+U
	2nCw==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr11134700igc.5.1343657333208; Mon,
	30 Jul 2012 07:08:53 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 07:08:53 -0700 (PDT)
In-Reply-To: <CALbNGRQdsaP8JOc91DJxD2wtvSV9KaL2LX4f-6ff2jubdGWgYQ@mail.gmail.com>
References: <20120722104353.A204B1032B@opal>
	<CALbNGRTJjTZZG=ysG3m+gnv0YqfaBhUEZkLF5WUJxg7-hSLGDg@mail.gmail.com>
	<CALbNGRQdsaP8JOc91DJxD2wtvSV9KaL2LX4f-6ff2jubdGWgYQ@mail.gmail.com>
Date: Mon, 30 Jul 2012 16:08:53 +0200
Message-ID: <CALbNGRQCETb5Q9WpoJDzmGwmUB7YPYhgjD21ZUUOmjwkBNGC8g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python-native: Put binaries in seperate directory
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
X-List-Received-Date: Mon, 30 Jul 2012 14:21:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2012 at 4:02 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Jul 22, 2012 at 12:43 PM,  <git@git.openembedded.org> wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: a2e554f731437545e9483a7a73e6847c03f6f48a
>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommi=
t;h=3Da2e554f731437545e9483a7a73e6847c03f6f48a
>>
>> Author: Morgan Little <morgan.little@windriver.com>
>> Date:   Thu Jul 19 13:46:06 2012 -0400
>>
>> python-native: Put binaries in seperate directory
>>
>> Update python-native to install the binaries in the python-native direct=
ory,
>> add pythonnative.bbclass to let recipes that need python-native use the
>> binaries and update disutils access the new binaries. Update distutils-b=
ase
>> to inherit pythonnative.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>  meta/classes/distutils-base.bbclass                |    2 +-
>>  meta/classes/distutils.bbclass                     |    8 ++++----
>>  meta/classes/pythonnative.bbclass                  |    3 +++
>>  .../recipes-devtools/python/python-native_2.7.3.bb |   10 ++++++----
>>  4 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutil=
s-base.bbclass
>> index 6d18e08..c761b36 100644
>> --- a/meta/classes/distutils-base.bbclass
>> +++ b/meta/classes/distutils-base.bbclass
>> @@ -1,5 +1,5 @@
>>  DEPENDS  +=3D "${@["python-native python", ""][(d.getVar('PACKAGES', Tr=
ue) =3D=3D '')]}"
>>  RDEPENDS_${PN} +=3D "${@['', 'python-core']['${PN}' =3D=3D '${BPN}']}"
>>
>> -inherit distutils-common-base
>> +inherit distutils-common-base pythonnative
>>
>> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbc=
lass
>> index bcddf8d..690df73 100644
>> --- a/meta/classes/distutils.bbclass
>> +++ b/meta/classes/distutils.bbclass
>> @@ -11,14 +11,14 @@ distutils_do_compile() {
>>           STAGING_INCDIR=3D${STAGING_INCDIR} \
>>           STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>>           BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> -         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUI=
LD_ARGS} || \
>> +         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build $=
{DISTUTILS_BUILD_ARGS} || \
>>           bbfatal "python setup.py build_ext execution failed."
>>  }
>>
>>  distutils_stage_headers() {
>>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> -        ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DIST=
UTILS_STAGE_HEADERS_ARGS} || \
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_=
headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
>>          bbfatal "python setup.py install_headers execution failed."
>>  }
>>
>> @@ -28,7 +28,7 @@ distutils_stage_all() {
>>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>>          PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_ST=
AGE_ALL_ARGS} || \
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
${DISTUTILS_STAGE_ALL_ARGS} || \
>>          bbfatal "python setup.py install (stage) execution failed."
>>  }
>>
>> @@ -38,7 +38,7 @@ distutils_do_install() {
>>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>>          PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> -        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_IN=
STALL_ARGS} || \
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
${DISTUTILS_INSTALL_ARGS} || \
>>          bbfatal "python setup.py install execution failed."
>>
>>          for i in `find ${D} -name "*.py"` ; do \
>> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnati=
ve.bbclass
>> new file mode 100644
>> index 0000000..bc346da
>> --- /dev/null
>> +++ b/meta/classes/pythonnative.bbclass
>> @@ -0,0 +1,3 @@
>> +PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python"
>> +PATH_prepend =3D "${STAGING_BINDIR_NATIVE}/python-native:"
>> +DEPENDS +=3D " python-native "
>> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/=
recipes-devtools/python/python-native_2.7.3.bb
>> index 50bf894..bfdcd12 100644
>> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
>> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
>> @@ -1,6 +1,6 @@
>>  require python.inc
>>  DEPENDS =3D "openssl-native bzip2-full-native zlib-native readline-nati=
ve sqlite3-native"
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>>
>>  SRC_URI +=3D "file://04-default-is-optimized.patch \
>>             file://05-enable-ctypes-cross-build.patch \
>> @@ -20,6 +20,8 @@ inherit native
>>
>>  RPROVIDES +=3D "python-distutils-native python-compression-native pytho=
n-textutils-native python-core-native"
>>
>> +EXTRA_OECONF +=3D " --bindir=3D${bindir}/${PN}"
>> +
>>  EXTRA_OEMAKE =3D '\
>>    BUILD_SYS=3D"" \
>>    HOST_SYS=3D"" \
>> @@ -34,11 +36,11 @@ do_configure_prepend() {
>>
>>  do_install() {
>>         oe_runmake 'DESTDIR=3D${D}' install
>> -       install -d ${D}${bindir}/
>> -       install -m 0755 Parser/pgen ${D}${bindir}/
>> +       install -d ${D}${bindir}/${PN}
>> +       install -m 0755 Parser/pgen ${D}${bindir}/${PN}
>>
>>         # Make sure we use /usr/bin/env python
>> -       for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
>> +       for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir=
}/${PN}`; do
>>                 sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
>>         done
>>  }
>>
>>
> Could somebody enlighten me please: What is the benefit in moving
> python-native into a subdirectory and causing tons of recipe changes?
> The commit message does not help me much.
> To me it is just another build breaker after gobject-introspection &
> gtk-doc. Please tell me how many further weeks we have to suffer for
> innovations like this so I can come back then.
>
I forgot webkit-gtk PARALLEL_MAKE in my list

Andreas


