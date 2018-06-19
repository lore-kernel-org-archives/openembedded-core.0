Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id F33D875494
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:58:20 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id c6-v6so18038687oiy.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8+Sb/PgFUNIrQq+0o3bOxTCP0snpq68er+4PKUT9IyI=;
	b=djmACN4M+G6+xV97j6nT0spqrVZLrgXy0irGzz7N0OHmjT4E5rT8Wa0pyPojYgMVv9
	RR9527WOgh70Gsr/B7WvkZ+2f1RrPAF5sdG8B+vVKT2laQM4URWZDVBB2vpYw5VhtYIt
	fpmNnSFkN0J5ztAxheA1YfcA9BzTfBCEfxMhlAtMv4etEY/KzkCBMt4mU937ZzqG0Jxn
	/vZEqjGkWg3pkDLs7UNpYqaoz4TAhjX7W++9Bl8aCW94WOyrYX39iRccKRMsfl16nUYA
	39CaPZj4WMT0IR0kI1bXsMSPh513VyQ7ip8XJYU21AWt16zjUUjtfAIZ3VBfw/2Osal1
	BjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8+Sb/PgFUNIrQq+0o3bOxTCP0snpq68er+4PKUT9IyI=;
	b=ZWlEFC3oyhA0uFHR9f3IqdKplcFgdQ2uoc+9pq5absb5hDeStgyiQiY+2Km8ZVINK6
	0RTeGtasr1NlQ1Qrz0TcW9X/7BY+247Y3ZEiTZx3RmPyslHTRY+vYT+VZWeQJG3h3mbO
	PsjeEMPw3lOCR2ZKoioxKMymeGfOMPuf4sfmjmkZ2g0CHgbnAl+TWsD2xF7YROux8rGW
	7QFgPQn0RUyQ9EqDnydnQi2fMHXbR9xsTVXfb2utdRsbPLyumDSH74CuMRmFTipQ8ftA
	9DV077tlmsQx3HCt3WMfSpBgo0Dmvu/zQ7SLqHescpEd5xfAfQ8Zc84Bsd57nyS8ETy+
	fvNg==
X-Gm-Message-State: APt69E08x05r53KlgHisEhG1LJEfJvvCpcyq/xFwUK1wvcwDjl086Cgp
	muA024wK9/TCiGlEo9eEQaNP7G6e90T9itDFGdwTvA==
X-Google-Smtp-Source: ADUXVKIafSt5YXn8/vXIqMiAq2bXWuE/qHsfQrsRvbqlHmJ5s6oljF6RrOZBaOWpJ2WdVT4EMRmmn9XtQzrAo5IzNw0=
X-Received: by 2002:aca:5406:: with SMTP id
	i6-v6mr9813738oib.115.1529413101762; 
	Tue, 19 Jun 2018 05:58:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 05:58:00
	-0700 (PDT)
In-Reply-To: <CAJTo0LZC5jksFKf9E3vxZbQr9EEdE_gK9wC=v84z6Q9jgQgSTw@mail.gmail.com>
References: <1529328356-10653-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LZC5jksFKf9E3vxZbQr9EEdE_gK9wC=v84z6Q9jgQgSTw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jun 2018 13:58:00 +0100
Message-ID: <CAJTo0LbRnv-rBa2C03hbdgeqcXt7bTZY36sqZMuk9UzLwrG+9Q@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
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
X-List-Received-Date: Tue, 19 Jun 2018 12:58:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also adding python3 to PACKAGECONFIG just adds a python3-bind package
with some dnssec binaries in.  Is this intentional?  What happened to
the isc module that was built in 9.10?

Ross

On 19 June 2018 at 13:51, Burton, Ross <ross.burton@intel.com> wrote:
> This still puts /usr/bin/mdig in bind whereas /usr/bin/dig is in
> bind-utils, which doesn't seem right.
>
> Ross
>
> On 18 June 2018 at 14:25, Armin Kuster <akuster808@gmail.com> wrote:
>> LIC_FILES_CHKSUM changed do to updated year
>>
>> removed:
>> dont-test-on-host.patch, no longer implemented
>> drop use-python3-and-fix-install-lib-path.patch, they added the ability =
to pass in lib dir loctions
>> drop bind-confgen-build-unix.o-once.patch, fix included in update
>>
>> Refresh other patches:
>> add python3 flag for PACKAGECONFIG to pull in python
>> add new config option --with-eddsa=3D
>>
>> [v2]
>> Remove python3 in default PACKACKECONFIG
>> include https://patchwork.openembedded.org/patch/148257/
>> Because of the newly added dependency on meta-python, the python(3)
>> packageconfig is no longer "default-on".
>>
>> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>>
>> [v3]
>> Made formating and spelling changes per Martin
>>
>> [v4]
>> Minor typo fixes
>> cleanup python3 support
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> Acked-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 ---------------=
-------
>>  ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>>  .../bind/bind/dont-test-on-host.patch              | 17 --------
>>  .../use-python3-and-fix-install-lib-path.patch     | 36 ---------------=
-
>>  .../bind/{bind_9.10.6.bb =3D> bind_9.12.1.bb}        | 41 ++++++++++---=
-----
>>  8 files changed, 44 insertions(+), 150 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-bui=
ld-unix.o-once.patch
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-hos=
t.patch
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-=
fix-install-lib-path.patch
>>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb =3D> bind_9.12.1.=
bb} (75%)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-conf=
ig-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-u=
se-pkg-config-to-find-libxml2.patch
>> index 1e23c0f..6d73e18 100644
>> --- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-f=
ind-libxml2.patch
>> +++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-f=
ind-libxml2.patch
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
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- bind-9.12.1.orig/configure.in
>> ++++ bind-9.12.1/configure.in
>> +@@ -2569,26 +2569,9 @@ case "$use_libxml2" in
>>                 DST_LIBXML2_INC=3D""
>>                 ;;
>>         auto|yes)
>> @@ -49,6 +49,3 @@ index 4da73a4..6f2a754 100644
>>                 fi
>>                 ;;
>>   esac
>> ---
>> -2.1.4
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNA=
MESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-gen=
.c-extend-DIRNAMESIZE-from-256-to-512.patch
>> index 1215093..9d87303 100644
>> --- a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-=
from-256-to-512.patch
>> +++ b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-=
from-256-to-512.patch
>> @@ -7,11 +7,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   lib/dns/gen.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> -diff --git a/lib/dns/gen.c b/lib/dns/gen.c
>> -index 7a7dafb..51a0435 100644
>> ---- a/lib/dns/gen.c
>> -+++ b/lib/dns/gen.c
>> -@@ -148,7 +148,7 @@ static const char copyright[] =3D
>> +Index: bind-9.12.1/lib/dns/gen.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- bind-9.12.1.orig/lib/dns/gen.c
>> ++++ bind-9.12.1/lib/dns/gen.c
>> +@@ -130,7 +130,7 @@ static const char copyright[] =3D
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
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-=
too-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen=
.c-fix-too-long-error.patch
>> index 1ed858c..1e34746 100644
>> --- a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-lon=
g-error.patch
>> +++ b/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-lon=
g-error.patch
>> @@ -13,11 +13,11 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.co=
m>
>>   lib/dns/gen.c |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> -diff --git a/lib/dns/gen.c b/lib/dns/gen.c
>> -index 51a0435..3d7214f 100644
>> ---- a/lib/dns/gen.c
>> -+++ b/lib/dns/gen.c
>> -@@ -148,7 +148,11 @@ static const char copyright[] =3D
>> +Index: bind-9.12.1/lib/dns/gen.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- bind-9.12.1.orig/lib/dns/gen.c
>> ++++ bind-9.12.1/lib/dns/gen.c
>> +@@ -130,7 +130,11 @@ static const char copyright[] =3D
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
>> diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix=
.o-once.patch b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix=
.o-once.patch
>> deleted file mode 100644
>> index 8bc4ea3..0000000
>> --- a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once=
.patch
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
>> -       ${LIBTOOL_MODE_COMPILE} ${CC} ${ALL_CFLAGS} -c ${srcdir}/ddns-co=
nfgen.c
>> -
>> --rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${=
CONFDEPLIBS}
>> -+rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLI=
BS} $(SUBDIRS)
>> -       export BASEOBJS=3D"rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}=
"; \
>> -       ${FINALBUILDCMD}
>> -
>> --ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${=
CONFDEPLIBS}
>> -+ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLI=
BS} $(SUBDIRS)
>> -       export BASEOBJS=3D"ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}=
"; \
>> -       ${FINALBUILDCMD}
>> -
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-f=
or-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/b=
ind-ensure-searching-for-json-headers-searches-sysr.patch
>> index 13df3bb..55ed504 100644
>> --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json=
-headers-searches-sysr.patch
>> +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json=
-headers-searches-sysr.patch
>> @@ -31,11 +31,11 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windri=
ver.com>
>>   configure.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> -diff --git a/configure.in b/configure.in
>> -index c9ef3a601343..17a1f613e9ac 100644
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -2139,7 +2139,7 @@ case "$use_libjson" in
>> +Index: bind-9.12.1/configure.in
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- bind-9.12.1.orig/configure.in
>> ++++ bind-9.12.1/configure.in
>> +@@ -2610,7 +2610,7 @@ case "$use_libjson" in
>>                 libjson_libs=3D""
>>                 ;;
>>         auto|yes)
>> @@ -44,6 +44,3 @@ index c9ef3a601343..17a1f613e9ac 100644
>>                 do
>>                         if test -f "${d}/include/json/json.h"
>>                         then
>> ---
>> -2.4.2
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch=
 b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
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
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- bind-9.9.5.orig/bin/Makefile.in
>> -+++ bind-9.9.5/bin/Makefile.in
>> -@@ -19,7 +19,7 @@ srcdir =3D     @srcdir@
>> - VPATH =3D               @srcdir@
>> - top_srcdir =3D  @top_srcdir@
>> -
>> --SUBDIRS =3D     named rndc dig delv dnssec tools tests nsupdate \
>> -+SUBDIRS =3D     named rndc dig delv dnssec tools nsupdate \
>> -               check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
>> - TARGETS =3D
>> -
>> diff --git a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-ins=
tall-lib-path.patch b/meta/recipes-connectivity/bind/bind/use-python3-and-f=
ix-install-lib-path.patch
>> deleted file mode 100644
>> index 9829f15..0000000
>> --- a/meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-li=
b-path.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -Use python3 rather default python which maybe links to python2 for oe. =
And add
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
>> -       ${INSTALL_DATA} ${srcdir}/dnssec-coverage.8 ${DESTDIR}${mandir}/=
man8
>> -       if test -n "${PYTHON}" ; then \
>> -               if test -n "${DESTDIR}" ; then \
>> --                      ${PYTHON} ${srcdir}/setup.py install --root=3D${=
DESTDIR} --prefix=3D${prefix} ; \
>> -+                      ${PYTHON} ${srcdir}/setup.py install --root=3D${=
DESTDIR} --prefix=3D${prefix} --install-lib=3D${PYTHON_SITEPACKAGES_DIR} ; =
\
>> -               else \
>> --                      ${PYTHON} ${srcdir}/setup.py install --prefix=3D=
${prefix} ; \
>> -+                      ${PYTHON} ${srcdir}/setup.py install --prefix=3D=
${prefix} --install-lib=3D${PYTHON_SITEPACKAGES_DIR} ; \
>> -               fi \
>> -       fi
>> -
>> -diff --git a/configure.in b/configure.in
>> -index 314bb90..867923e 100644
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -227,7 +227,7 @@ AC_ARG_WITH(python,
>> - [  --with-python=3DPATH      specify path to python interpreter],
>> -     use_python=3D"$withval", use_python=3D"unspec")
>> -
>> --python=3D"python python3 python3.5 python3.4 python3.3 python3.2 pytho=
n2 python2.7"
>> -+python=3D"python3 python3.5 python3.4 python3.3 python3.2 python2 pyth=
on2.7"
>> -
>> - testargparse=3D'try: import argparse
>> - except: exit(1)'
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipe=
s-connectivity/bind/bind_9.12.1.bb
>> similarity index 75%
>> rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
>> rename to meta/recipes-connectivity/bind/bind_9.12.1.bb
>> index 20c8d7b..567e843 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.12.1.bb
>> @@ -3,42 +3,38 @@ HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>>  SECTION =3D "console/network"
>>
>>  LICENSE =3D "ISC & BSD"
>> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Ddba46507446198119bcde32a4f=
eaab43"
>> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D6ba7c9fe0c888a943c79c93e6d=
e744fb"
>>
>> -DEPENDS =3D "openssl libcap"
>> +DEPENDS =3D "openssl libcap zlib"
>>
>>  SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>>             file://conf.patch \
>>             file://make-etc-initd-bind-stop-work.patch \
>> -           file://dont-test-on-host.patch \
>>             file://generate-rndc-key.sh \
>>             file://named.service \
>>             file://bind9 \
>>             file://init.d-add-support-for-read-only-rootfs.patch \
>> -           file://bind-confgen-build-unix.o-once.patch \
>>             file://0001-build-use-pkg-config-to-find-libxml2.patch \
>>             file://bind-ensure-searching-for-json-headers-searches-sysr.=
patch \
>>             file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>> -           file://use-python3-and-fix-install-lib-path.patch \
>>             "
>>
>> -SRC_URI[md5sum] =3D "84e663284b17aee0df1ce6f248b137d7"
>> -SRC_URI[sha256sum] =3D "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073=
d1e0d050fdf47e69d"
>> +SRC_URI[md5sum] =3D "ec20f2d6aff50651296fad962d19ccfa"
>> +SRC_URI[sha256sum] =3D "16e446425c35e48b651ddf1171d2115ebf32b07670b652e=
1030a174038937510"
>>
>>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>>
>> -
>>  ENABLE_IPV6 =3D "--enable-ipv6=3D${@bb.utils.contains('DISTRO_FEATURES'=
, 'ipv6', 'yes', 'no', d)}"
>>  EXTRA_OECONF =3D " ${ENABLE_IPV6} --with-libtool --enable-threads \
>>                   --disable-devpoll --enable-epoll --with-gost=3Dno \
>> -                 --with-gssapi=3Dno --with-ecdsa=3Dyes \
>> +                 --with-gssapi=3Dno --with-ecdsa=3Dyes --with-eddsa=3Dn=
o \
>>                   --sysconfdir=3D${sysconfdir}/bind \
>>                   --with-openssl=3D${STAGING_DIR_HOST}${prefix} \
>>                 "
>>
>> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
>> +inherit autotools update-rc.d systemd useradd pkgconfig
>>
>>  export PYTHON_SITEPACKAGES_DIR
>>
>> @@ -48,6 +44,9 @@ PACKAGECONFIG[httpstats] =3D "--with-libxml2,--without=
-libxml2,libxml2"
>>  PACKAGECONFIG[readline] =3D "--with-readline=3D-lreadline,,readline"
>>  PACKAGECONFIG[libedit] =3D "--with-readline=3D-ledit,,libedit"
>>  PACKAGECONFIG[urandom] =3D "--with-randomdev=3D/dev/urandom,--with-rand=
omdev=3D/dev/random,,"
>> +PACKAGECONFIG[python3] =3D "--with-python=3D${PYTHON} --with-python-ins=
tall-dir=3D${sbindr} , --without-python, python3-ply-native, python3"
>> +
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native=
', '', d)}
>>
>>  USERADD_PACKAGES =3D "${PN}"
>>  USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/cache/bind --=
no-create-home \
>> @@ -60,17 +59,22 @@ SYSTEMD_SERVICE_${PN} =3D "named.service"
>>
>>  PARALLEL_MAKE =3D ""
>>
>> -RDEPENDS_${PN} =3D "python3-core"
>>  RDEPENDS_${PN}-dev =3D ""
>>
>>  PACKAGE_BEFORE_PN +=3D "${PN}-utils"
>>  FILES_${PN}-utils =3D "${bindir}/host ${bindir}/dig"
>>  FILES_${PN}-dev +=3D "${bindir}/isc-config.h"
>> -FILES_${PN} +=3D "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES=
_DIR}"
>> +FILES_${PN} +=3D "${sbindir}/generate-rndc-key.sh"
>>
>>  PACKAGE_BEFORE_PN +=3D "${PN}-libs"
>>  FILES_${PN}-libs =3D "${libdir}/*.so*"
>>
>> +PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python=
3-bind ', '', d)}"
>> +FILES_python3-bind =3D "${sbindir}/dnssec-coverage ${sbindir}/dnssec-ch=
eckds \
>> +                ${sbindir}/dnssec-keymgr"
>> +RDEPENDS_python3-bind =3D "python3-core"
>> +
>> +
>>  do_install_prepend() {
>>         # clean host path in isc-config.sh before the hardlink created
>>         # by "make install":
>> @@ -88,16 +92,21 @@ do_install_append() {
>>         install -d "${D}${sysconfdir}/init.d"
>>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>> -       sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/d=
nssec-coverage ${D}${sbindir}/dnssec-checkds
>>
>> +       if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'fal=
se', d)}; then
>> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>> +               ${D}${sbindir}/dnssec-coverage \
>> +               ${D}${sbindir}/dnssec-checkds \
>> +               ${D}${sbindir}/dnssec-keymgr
>> +       fi
>>         # Install systemd related files
>>         install -d ${D}${sbindir}
>>         install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
>>         install -d ${D}${systemd_unitdir}/system
>>         install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/=
system
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
>>                 echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdi=
r}/tmpfiles.d/bind.conf
>>         fi
>> -
>> -    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/isc/*.pyc
>>  }
>>
>>  CONFFILES_${PN} =3D " \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

