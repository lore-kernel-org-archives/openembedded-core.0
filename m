Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 889EC6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 15:12:13 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id d10-v6so2916697plo.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=AsDtNCXUpWlmpZ/D/lmBgb2HNEaL3jXWk95bpVZPYNg=;
	b=m7Kq755k9v46mVeXO5Eptmdok/NyCjTI0tI8LgWwJ1HN7saJDqZ0jzapemIhFaRetJ
	t9oKRCaIHzSLFandlOcz6t/VhOEO7Ke+TUEcBDt2q5IKS2TXKt3jOLcojDoo5Cn6p48r
	KJyt7O6VnHyht3YbT6m5IvmQkfOhcSY0RyBK4/GAKi4noN7xS+cNPAh3a4RnEaD3tJHQ
	BFhSePE0rNu6BfeWpjQ46CsJ5VnlY6ge/Kfiamv/YWWZfB2aAbd7gTuIFlLrceogKI+F
	1VKhSi2k1fhOwidKzdAHCgA6tn07NOrzRQtNJ0JvX3+1a+ofcjzev0jPVmpccR3a4sux
	XzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=AsDtNCXUpWlmpZ/D/lmBgb2HNEaL3jXWk95bpVZPYNg=;
	b=davyrNlW/F0qRNvgZkTI+FofKajMPziBVx7/whQi5w/YS6UJiLQao27xQb0c0MDLz5
	HcS+t3Tbz1jj/TsR7fdmWxyZ2PWONmxOtbShExeQ+bQQMRSk8qc+ark3zP7Nmnw26qnX
	pVix29QkAVmDMEFLhulqvG1ekzPLor9JYTYGwQLUmIOZJAJH+V8M76wK3A6DbfNqFA9D
	kq3+pHXR96ZYQbsD5hSOgWPIFLGYENg0HymwdUJZOVxf1y1oVtYJvj/b59c9FHz0K7rc
	K11rUhBiua2wd3yHIP/kYxvMdVMC59kJjUOnrVj2G+5NHLP2A0eKy2+0KbaOWMfJXS0W
	E3ag==
X-Gm-Message-State: APt69E3xbintHFqc2dI78CX7ytk7fDSQ0Fqq1XvKbx3464DcImHjZr9s
	CnPkwvaqG9YmZ6+YuMG9+xQ=
X-Google-Smtp-Source: ADUXVKKMnH8C2z9/KDwEaKyf6ZX1AaXfUKpROOHQrOp6qpQf92T27So68hs72jk09A5jjx4Or8sllQ==
X-Received: by 2002:a17:902:9a08:: with SMTP id
	v8-v6mr10982531plp.148.1530198734559; 
	Thu, 28 Jun 2018 08:12:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d981:fc82:1d49:d690?
	([2601:202:4000:1184:d981:fc82:1d49:d690])
	by smtp.gmail.com with ESMTPSA id
	u8-v6sm18424026pfa.74.2018.06.28.08.12.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 08:12:13 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1529865706-12937-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LZDbEZtbc4HmbQWGzq2X5VGaJ48399cTxWxeubX--rppQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d6c728f3-2608-ee17-2d8e-c317145da6d9@gmail.com>
Date: Thu, 28 Jun 2018 08:12:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZDbEZtbc4HmbQWGzq2X5VGaJ48399cTxWxeubX--rppQ@mail.gmail.com>
Cc: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V5][PATCH] bind: update to ESV version 9.11.3
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
X-List-Received-Date: Thu, 28 Jun 2018 15:12:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/27/2018 04:50 AM, Burton, Ross wrote:
> +FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
> +FILES_python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
> +                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
>
> I think you meant to remove PYTHON_SITEPACKAGES_DIR from FILES_${PN}.
yep.

>
> +PACKAGECONFIG[python3] = "--with-python=${PYTHON}
> --with-python-install-dir=${D}/${PYTHON_SITEPACKAGES_DIR} ,
> --without-python, python3-ply-native, python3-ply"
>
> The Python module needs ply at runtime too? 
correct.
>  Also, if this is the
> case, surely you want the dependency to be on python3-bind and not
> ${PN}?
correct.

thanks for catching these.
-armin
>
> Ross
>
> On 24 June 2018 at 19:41, Armin Kuster <akuster808@gmail.com> wrote:
>> LIC_FILES_CHKSUM changed do to updated year
>>
>> removed:
>> dont-test-on-host.patch, no longer implemented
>> drop use-python3-and-fix-install-lib-path.patch, they added the ability to pass in lib dir loctions
>> drop bind-confgen-build-unix.o-once.patch, fix included in update
>>
>> Refresh other patches:
>> add python3 flag for PACKAGECONFIG to pull in python
>> add new config option --with-eddsa=no (needs openssl support not released)
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
>> [v5]
>> swtich to 9.11.3 ESV version
>> fix isc python install
>> keep *.la for dhcp
>> update config options
>> move mdig to same location as dig
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> Acked-by: Martin Hundebøll <mnhu@prevas.dk>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 ++--
>>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 ++--
>>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 -------------
>>  ...-searching-for-json-headers-searches-sysr.patch | 13 ++--
>>  .../bind/bind/dont-test-on-host.patch              | 17 -----
>>  .../use-python3-and-fix-install-lib-path.patch     | 36 ----------
>>  .../bind/{bind_9.10.6.bb => bind_9.11.3.bb}        | 81 ++++++++++++----------
>>  7 files changed, 59 insertions(+), 162 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>>  delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.11.3.bb} (70%)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
>> index 1215093..a8d601d 100644
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
>> +Index: bind-9.11.3/lib/dns/gen.c
>> +===================================================================
>> +--- bind-9.11.3.orig/lib/dns/gen.c
>> ++++ bind-9.11.3/lib/dns/gen.c
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
>> index 1ed858c..01874a4 100644
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
>> +Index: bind-9.11.3/lib/dns/gen.c
>> +===================================================================
>> +--- bind-9.11.3.orig/lib/dns/gen.c
>> ++++ bind-9.11.3/lib/dns/gen.c
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
>> index 13df3bb..37e210e 100644
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
>> +Index: bind-9.11.3/configure.in
>> +===================================================================
>> +--- bind-9.11.3.orig/configure.in
>> ++++ bind-9.11.3/configure.in
>> +@@ -2574,7 +2574,7 @@ case "$use_libjson" in
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
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.11.3.bb
>> similarity index 70%
>> rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
>> rename to meta/recipes-connectivity/bind/bind_9.11.3.bb
>> index 20c8d7b..a4fe749 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.11.3.bb
>> @@ -3,51 +3,50 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
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
>> -           file://make-etc-initd-bind-stop-work.patch \
>> -           file://dont-test-on-host.patch \
>> -           file://generate-rndc-key.sh \
>>             file://named.service \
>>             file://bind9 \
>> +           file://generate-rndc-key.sh \
>> +           file://make-etc-initd-bind-stop-work.patch \
>>             file://init.d-add-support-for-read-only-rootfs.patch \
>> -           file://bind-confgen-build-unix.o-once.patch \
>> -           file://0001-build-use-pkg-config-to-find-libxml2.patch \
>>             file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
>>             file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>> -           file://use-python3-and-fix-install-lib-path.patch \
>> -           "
>> +"
>>
>> -SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
>> -SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
>> +SRC_URI[md5sum] = "4ed2a3f235595eadbd763b7ecb687ca0"
>> +SRC_URI[sha256sum] = "0d9dde14b2ec7f9cdc3b69f19540c7a2e4eee7b6c727965dfae48810965876f5"
>>
>>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>>  UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>>
>> +inherit autotools update-rc.d systemd useradd pkgconfig
>> +
>> +# PACKAGECONFIGs readline and libedit should NOT be set at same time
>> +PACKAGECONFIG ?= "readline"
>> +PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
>> +PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>> +PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>> +PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
>> +PACKAGECONFIG[python3] = "--with-python=${PYTHON} --with-python-install-dir=${D}/${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native, python3-ply"
>>
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
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native distutils3-base', '', d)}
>>
>> -export PYTHON_SITEPACKAGES_DIR
>> -
>> -# PACKAGECONFIGs readline and libedit should NOT be set at same time
>> -PACKAGECONFIG ?= "readline"
>> -PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
>> -PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>> -PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>> -PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
>> +# dhcp needs .la so keep them
>> +REMOVE_LIBTOOL_LA = "0"
>>
>>  USERADD_PACKAGES = "${PN}"
>>  USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
>> @@ -58,19 +57,6 @@ INITSCRIPT_PARAMS = "defaults"
>>
>>  SYSTEMD_SERVICE_${PN} = "named.service"
>>
>> -PARALLEL_MAKE = ""
>> -
>> -RDEPENDS_${PN} = "python3-core"
>> -RDEPENDS_${PN}-dev = ""
>> -
>> -PACKAGE_BEFORE_PN += "${PN}-utils"
>> -FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>> -FILES_${PN}-dev += "${bindir}/isc-config.h"
>> -FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
>> -
>> -PACKAGE_BEFORE_PN += "${PN}-libs"
>> -FILES_${PN}-libs = "${libdir}/*.so*"
>> -
>>  do_install_prepend() {
>>         # clean host path in isc-config.sh before the hardlink created
>>         # by "make install":
>> @@ -79,6 +65,7 @@ do_install_prepend() {
>>  }
>>
>>  do_install_append() {
>> +
>>         rm "${D}${bindir}/nslookup"
>>         rm "${D}${mandir}/man1/nslookup.1"
>>         rmdir "${D}${localstatedir}/run"
>> @@ -88,7 +75,12 @@ do_install_append() {
>>         install -d "${D}${sysconfdir}/init.d"
>>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>> -       sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
>> +        if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
>> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>> +               ${D}${sbindir}/dnssec-coverage \
>> +               ${D}${sbindir}/dnssec-checkds \
>> +               ${D}${sbindir}/dnssec-keymgr
>> +       fi
>>
>>         # Install systemd related files
>>         install -d ${D}${sbindir}
>> @@ -106,8 +98,6 @@ do_install_append() {
>>                 install -d ${D}${sysconfdir}/tmpfiles.d
>>                 echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
>>         fi
>> -
>> -    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/isc/*.pyc
>>  }
>>
>>  CONFFILES_${PN} = " \
>> @@ -121,3 +111,20 @@ CONFFILES_${PN} = " \
>>         ${sysconfdir}/bind/db.root \
>>         "
>>
>> +PACKAGE_BEFORE_PN += "${PN}-utils"
>> +FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig"
>> +FILES_${PN}-dev += "${bindir}/isc-config.h"
>> +FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
>> +
>> +PACKAGE_BEFORE_PN += "${PN}-libs"
>> +FILES_${PN}-libs = "${libdir}/*.so*"
>> +FILES_${PN}-staticdev += "${libdir}/*.la"
>> +
>> +PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
>> +FILES_python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
>> +                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
>> +
>> +RDEPENDS_${PN} = "bash"
>> +RDEPENDS_${PN}-utils = "bash"
>> +RDEPENDS_${PN}-dev = ""
>> +RDEPENDS_python3-bind = "python3-core"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


