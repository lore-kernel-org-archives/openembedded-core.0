Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 54BA46079F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:13:58 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h12-v6so10005856pfk.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=BcV+13Ckg0yNmd24lhYdE2B7gVeek7tTfl2Fg4MNWr4=;
	b=TbFhLgz5pKxfpMS8dt9OrHdlZAyvrtLpnifxclDeQWf1xWFjzdgqMZArGc1k6aVhCF
	RXY4rK9FIvIx0gAoduZs0Kc1ylfkRNzwEqK5uF/dzJm3Oq0nm0MpPOiFrVkg6k4rrrVk
	kd6Png/FGbbVUtHPZKS8rkjNmk/99cTKyfTE5LyN+5h9bGE/A+Y9VwOfcty/Y3e1q7tj
	9o0GlOHY1dAJKxtA+t9Lk4IOlWlCLuVfvvqqvgzbU+hh1VB4XU6EJL7pbFCghqtRf9/E
	1Bvg/n+NGHy3bYVv8XiBjrbTvlptz4nmq3DubHFFqWJnRA3Zuj41P3/rjjCAj3DlHMrQ
	6FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=BcV+13Ckg0yNmd24lhYdE2B7gVeek7tTfl2Fg4MNWr4=;
	b=I10odDNozMRr+/7UqoEAVQhRehB7zx3k8Iv0Bmsik9y1F7pqf9weNnIhMGLtMOEckx
	STYNZBU25cihlIvI8P6S0c7g5O9bUX7E2lkqOrr7vtyh30WVGkjeCFH0sGBaR6lm/O7t
	GgHTkfnxKwM7GjWKYcpu9jVTqpAztN2AtrfCC/a5iPHaAxWp/i6X/2EGMM92VF3FeZjW
	xxm3473B0lJAthA+Zlw0GfYlK+hXBCFyHgTMj2OmrRXOcTspEhxKx58Qqm5WyYXOLWwM
	ul0n6me4Qzru/MlXWXkJMzKXRhN9xbALhGRJBSXEFShYhvLZs7MOWnR5YynveNEJAY90
	noDQ==
X-Gm-Message-State: APt69E2qbGVcE0xR1nkcROBx8ChgBO3CGebSu9td/zkpP+o/xc1c9GpR
	hQrE2SxygBeBON3+IAINCbQhFA==
X-Google-Smtp-Source: ADUXVKJdoNFHs3rnURm/q6pE+5rorMYc+oRxYMOQy72COKJ3sQUF0tH/kByhey+s93zTuPO9A2FgLA==
X-Received: by 2002:aa7:8004:: with SMTP id
	j4-v6mr18236028pfi.174.1529417639137; 
	Tue, 19 Jun 2018 07:13:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:59dc:e6d2:872c:4e7f?
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	z82-v6sm40380811pfk.30.2018.06.19.07.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 07:13:58 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1529328356-10653-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LZC5jksFKf9E3vxZbQr9EEdE_gK9wC=v84z6Q9jgQgSTw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <40e0cab0-c1ce-a165-9dc6-f8d6f3275ef4@gmail.com>
Date: Tue, 19 Jun 2018 07:13:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZC5jksFKf9E3vxZbQr9EEdE_gK9wC=v84z6Q9jgQgSTw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V5][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Tue, 19 Jun 2018 14:13:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/19/2018 05:51 AM, Burton, Ross wrote:
> This still puts /usr/bin/mdig in bind whereas /usr/bin/dig is in
> bind-utils, which doesn't seem right.
ah, so that is what you meant before.

let me check.

- armin
>
> Ross
>
> On 18 June 2018 at 14:25, Armin Kuster <akuster808@gmail.com> wrote:
>> LIC_FILES_CHKSUM changed do to updated year
>>
>> removed:
>> dont-test-on-host.patch, no longer implemented
>> drop use-python3-and-fix-install-lib-path.patch, they added the ability to pass in lib dir loctions
>> drop bind-confgen-build-unix.o-once.patch, fix included in update
>>
>> Refresh other patches:
>> add python3 flag for PACKAGECONFIG to pull in python
>> add new config option --with-eddsa=
>>
>> [v2]
>> Remove python3 in default PACKACKECONFIG
>> include https://patchwork.openembedded.org/patch/148257/
>> Because of the newly added dependency on meta-python, the python(3)
>> packageconfig is no longer "default-on".
>>
>> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
>>
>> [v3]
>> Made formating and spelling changes per Martin
>>
>> [v4]
>> Minor typo fixes
>> cleanup python3 support
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> Acked-by: Martin Hundebøll <mnhu@prevas.dk>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 ----------------------
>>  ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>>  .../bind/bind/dont-test-on-host.patch              | 17 --------
>>  .../use-python3-and-fix-install-lib-path.patch     | 36 ----------------
>>  .../bind/{bind_9.10.6.bb => bind_9.12.1.bb}        | 41 ++++++++++--------
>>  8 files changed, 44 insertions(+), 150 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.12.1.bb} (75%)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
>> index 1e23c0f..6d73e18 100644
>> --- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
>> +++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
>> @@ -15,11 +15,11 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>   configure.in | 23 +++--------------------
>>   1 file changed, 3 insertions(+), 20 deletions(-)
>>
>> -diff --git a/configure.in b/configure.in
>> -index 4da73a4..6f2a754 100644
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -2282,26 +2282,9 @@ case "$use_libxml2" in
>> +Index: bind-9.12.1/configure.in
>> +===================================================================
>> +--- bind-9.12.1.orig/configure.in
>> ++++ bind-9.12.1/configure.in
>> +@@ -2569,26 +2569,9 @@ case "$use_libxml2" in
>>                 DST_LIBXML2_INC=""
>>                 ;;
>>         auto|yes)
>> @@ -49,6 +49,3 @@ index 4da73a4..6f2a754 100644
>>                 fi
>>                 ;;
>>   esac
>> ---
>> -2.1.4
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
>> index 1215093..9d87303 100644
>> --- a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
>> +++ b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
>> @@ -7,11 +7,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   lib/dns/gen.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> -diff --git a/lib/dns/gen.c b/lib/dns/gen.c
>> -index 7a7dafb..51a0435 100644
>> ---- a/lib/dns/gen.c
>> -+++ b/lib/dns/gen.c
>> -@@ -148,7 +148,7 @@ static const char copyright[] =
>> +Index: bind-9.12.1/lib/dns/gen.c
>> +===================================================================
>> +--- bind-9.12.1.orig/lib/dns/gen.c
>> ++++ bind-9.12.1/lib/dns/gen.c
>> +@@ -130,7 +130,7 @@ static const char copyright[] =
>>   #define TYPECLASSBUF (TYPECLASSLEN + 1)
>>   #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
>>   #define ATTRIBUTESIZE 256
>> @@ -20,6 +20,3 @@ index 7a7dafb..51a0435 100644
>>
>>   static struct cc {
>>         struct cc *next;
>> ---
>> -1.9.1
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
>> index 1ed858c..1e34746 100644
>> --- a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
>> +++ b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
>> @@ -13,11 +13,11 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>   lib/dns/gen.c |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> -diff --git a/lib/dns/gen.c b/lib/dns/gen.c
>> -index 51a0435..3d7214f 100644
>> ---- a/lib/dns/gen.c
>> -+++ b/lib/dns/gen.c
>> -@@ -148,7 +148,11 @@ static const char copyright[] =
>> +Index: bind-9.12.1/lib/dns/gen.c
>> +===================================================================
>> +--- bind-9.12.1.orig/lib/dns/gen.c
>> ++++ bind-9.12.1/lib/dns/gen.c
>> +@@ -130,7 +130,11 @@ static const char copyright[] =
>>   #define TYPECLASSBUF (TYPECLASSLEN + 1)
>>   #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
>>   #define ATTRIBUTESIZE 256
>> @@ -29,6 +29,3 @@ index 51a0435..3d7214f 100644
>>
>>   static struct cc {
>>         struct cc *next;
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>> deleted file mode 100644
>> index 8bc4ea3..0000000
>> --- a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>> +++ /dev/null
>> @@ -1,48 +0,0 @@
>> -From 9b40619ff6fddfef2758ba797789f8487f412df3 Mon Sep 17 00:00:00 2001
>> -From: Robert Yang <liezhi.yang@windriver.com>
>> -Date: Mon, 16 Feb 2015 00:50:01 -0800
>> -Subject: [PATCH] confgen: don't build unix.o twice
>> -
>> -Fixed:
>> -unix/os.o: file not recognized: File truncated
>> -collect2: error: ld returned 1 exit status
>> -
>> -This is because os.o was built twice:
>> -* The implicity rule (depends on unix/os.o)
>> -* The "make all" in unix subdir (depends on unix/os.o)
>> -
>> -Depend on subdirs which is unix only rather than unix/os.o will fix the
>> -problem.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> -
>> -Update context(trailing whitespace) for version 9.10.5-P3.
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> - bin/confgen/Makefile.in |    4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/bin/confgen/Makefile.in b/bin/confgen/Makefile.in
>> -index dca272f..02becce 100644
>> ---- a/bin/confgen/Makefile.in
>> -+++ b/bin/confgen/Makefile.in
>> -@@ -74,11 +74,11 @@ rndc-confgen.@O@: rndc-confgen.c
>> - ddns-confgen.@O@: ddns-confgen.c
>> -       ${LIBTOOL_MODE_COMPILE} ${CC} ${ALL_CFLAGS} -c ${srcdir}/ddns-confgen.c
>> -
>> --rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS}
>> -+rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
>> -       export BASEOBJS="rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
>> -       ${FINALBUILDCMD}
>> -
>> --ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS}
>> -+ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
>> -       export BASEOBJS="ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
>> -       ${FINALBUILDCMD}
>> -
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
>> index 13df3bb..55ed504 100644
>> --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
>> +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
>> @@ -31,11 +31,11 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>   configure.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> -diff --git a/configure.in b/configure.in
>> -index c9ef3a601343..17a1f613e9ac 100644
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -2139,7 +2139,7 @@ case "$use_libjson" in
>> +Index: bind-9.12.1/configure.in
>> +===================================================================
>> +--- bind-9.12.1.orig/configure.in
>> ++++ bind-9.12.1/configure.in
>> +@@ -2610,7 +2610,7 @@ case "$use_libjson" in
>>                 libjson_libs=""
>>                 ;;
>>         auto|yes)
>> @@ -44,6 +44,3 @@ index c9ef3a601343..17a1f613e9ac 100644
>>                 do
>>                         if test -f "${d}/include/json/json.h"
>>                         then
>> ---
>> -2.4.2
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>> deleted file mode 100644
>> index b02ecb1..0000000
>> --- a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> -
>> -Index: bind-9.9.5/bin/Makefile.in
>> -===================================================================
>> ---- bind-9.9.5.orig/bin/Makefile.in
>> -+++ bind-9.9.5/bin/Makefile.in
>> -@@ -19,7 +19,7 @@ srcdir =     @srcdir@
>> - VPATH =               @srcdir@
>> - top_srcdir =  @top_srcdir@
>> -
>> --SUBDIRS =     named rndc dig delv dnssec tools tests nsupdate \
>> -+SUBDIRS =     named rndc dig delv dnssec tools nsupdate \
>> -               check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
>> - TARGETS =
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch b/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>> deleted file mode 100644
>> index 9829f15..0000000
>> --- a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -Use python3 rather default python which maybe links to python2 for oe. And add
>> -option for setup.py to install files to right directory.
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> -diff --git a/bin/python/Makefile.in b/bin/python/Makefile.in
>> -index a43a3c1..2e727f2 100644
>> ---- a/bin/python/Makefile.in
>> -+++ b/bin/python/Makefile.in
>> -@@ -55,9 +55,9 @@ install:: ${TARGETS} installdirs
>> -       ${INSTALL_DATA} ${srcdir}/dnssec-coverage.8 ${DESTDIR}${mandir}/man8
>> -       if test -n "${PYTHON}" ; then \
>> -               if test -n "${DESTDIR}" ; then \
>> --                      ${PYTHON} ${srcdir}/setup.py install --root=${DESTDIR} --prefix=${prefix} ; \
>> -+                      ${PYTHON} ${srcdir}/setup.py install --root=${DESTDIR} --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR} ; \
>> -               else \
>> --                      ${PYTHON} ${srcdir}/setup.py install --prefix=${prefix} ; \
>> -+                      ${PYTHON} ${srcdir}/setup.py install --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR} ; \
>> -               fi \
>> -       fi
>> -
>> -diff --git a/configure.in b/configure.in
>> -index 314bb90..867923e 100644
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -227,7 +227,7 @@ AC_ARG_WITH(python,
>> - [  --with-python=PATH      specify path to python interpreter],
>> -     use_python="$withval", use_python="unspec")
>> -
>> --python="python python3 python3.5 python3.4 python3.3 python3.2 python2 python2.7"
>> -+python="python3 python3.5 python3.4 python3.3 python3.2 python2 python2.7"
>> -
>> - testargparse='try: import argparse
>> - except: exit(1)'
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.12.1.bb
>> similarity index 75%
>> rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
>> rename to meta/recipes-connectivity/bind/bind_9.12.1.bb
>> index 20c8d7b..567e843 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.12.1.bb
>> @@ -3,42 +3,38 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
>>  SECTION = "console/network"
>>
>>  LICENSE = "ISC & BSD"
>> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
>>
>> -DEPENDS = "openssl libcap"
>> +DEPENDS = "openssl libcap zlib"
>>
>>  SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>>             file://conf.patch \
>>             file://make-etc-initd-bind-stop-work.patch \
>> -           file://dont-test-on-host.patch \
>>             file://generate-rndc-key.sh \
>>             file://named.service \
>>             file://bind9 \
>>             file://init.d-add-support-for-read-only-rootfs.patch \
>> -           file://bind-confgen-build-unix.o-once.patch \
>>             file://0001-build-use-pkg-config-to-find-libxml2.patch \
>>             file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
>>             file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>> -           file://use-python3-and-fix-install-lib-path.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
>> -SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
>> +SRC_URI[md5sum] = "ec20f2d6aff50651296fad962d19ccfa"
>> +SRC_URI[sha256sum] = "16e446425c35e48b651ddf1171d2115ebf32b07670b652e1030a174038937510"
>>
>>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>>  UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>>
>> -
>>  ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
>>  EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>>                   --disable-devpoll --enable-epoll --with-gost=no \
>> -                 --with-gssapi=no --with-ecdsa=yes \
>> +                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \
>>                   --sysconfdir=${sysconfdir}/bind \
>>                   --with-openssl=${STAGING_DIR_HOST}${prefix} \
>>                 "
>>
>> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
>> +inherit autotools update-rc.d systemd useradd pkgconfig
>>
>>  export PYTHON_SITEPACKAGES_DIR
>>
>> @@ -48,6 +44,9 @@ PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
>>  PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>>  PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>>  PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
>> +PACKAGECONFIG[python3] = "--with-python=${PYTHON} --with-python-install-dir=${sbindr} , --without-python, python3-ply-native, python3"
>> +
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
>>
>>  USERADD_PACKAGES = "${PN}"
>>  USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
>> @@ -60,17 +59,22 @@ SYSTEMD_SERVICE_${PN} = "named.service"
>>
>>  PARALLEL_MAKE = ""
>>
>> -RDEPENDS_${PN} = "python3-core"
>>  RDEPENDS_${PN}-dev = ""
>>
>>  PACKAGE_BEFORE_PN += "${PN}-utils"
>>  FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>>  FILES_${PN}-dev += "${bindir}/isc-config.h"
>> -FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
>> +FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
>>
>>  PACKAGE_BEFORE_PN += "${PN}-libs"
>>  FILES_${PN}-libs = "${libdir}/*.so*"
>>
>> +PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind ', '', d)}"
>> +FILES_python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
>> +                ${sbindir}/dnssec-keymgr"
>> +RDEPENDS_python3-bind = "python3-core"
>> +
>> +
>>  do_install_prepend() {
>>         # clean host path in isc-config.sh before the hardlink created
>>         # by "make install":
>> @@ -88,16 +92,21 @@ do_install_append() {
>>         install -d "${D}${sysconfdir}/init.d"
>>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>> -       sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
>>
>> +       if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
>> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>> +               ${D}${sbindir}/dnssec-coverage \
>> +               ${D}${sbindir}/dnssec-checkds \
>> +               ${D}${sbindir}/dnssec-keymgr
>> +       fi
>>         # Install systemd related files
>>         install -d ${D}${sbindir}
>>         install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
>>         install -d ${D}${systemd_unitdir}/system
>>         install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
>>         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>> -              -e 's,@SBINDIR@,${sbindir},g' \
>> -              ${D}${systemd_unitdir}/system/named.service
>> +               -e 's,@SBINDIR@,${sbindir},g' \
>> +               ${D}${systemd_unitdir}/system/named.service
>>
>>         install -d ${D}${sysconfdir}/default
>>         install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
>> @@ -106,8 +115,6 @@ do_install_append() {
>>                 install -d ${D}${sysconfdir}/tmpfiles.d
>>                 echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
>>         fi
>> -
>> -    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/isc/*.pyc
>>  }
>>
>>  CONFFILES_${PN} = " \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


