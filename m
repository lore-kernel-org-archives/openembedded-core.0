Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8A139774F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 14:54:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 06:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="831487764"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Mar 2017 06:54:50 -0800
Message-ID: <1488812533.3261.3.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>
Date: Mon, 06 Mar 2017 09:02:13 -0600
In-Reply-To: <1488770446-37731-2-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1488770446-37731-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1488770446-37731-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro][PATCH] openssl: upgrade 1.0.2h -> 1.0.2k
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
X-List-Received-Date: Mon, 06 Mar 2017 14:54:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


For the moment, patchtest is not sending its results, but this is what
it reported for the series sent:



* Issue             Added patch file is missing Upstream-Status in the
header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-connectivity/openssl/openssl/debian/version-script.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-connectivity/openssl/openssl/debian/version-script.patch)




On Mon, 2017-03-06 at 11:20 +0800, Rebecca Chang Swee Fun wrote:
> From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
> 
> This upgrade fixes several security CVEs:
> * Carry propagating bug in Montgomery multiplication (CVE-2016-7055)
> * Truncated packet could crash via OOB read (CVE-2017-3731p1)
> * BN_mod_exp may produce incorrect results on x86_64 (CVE-2017-3732)
> 
> Backported 0002-CVE-2017-3731.patch for CVE-2017-3731p2 from:
> OE-Core rev: 1fe1cb3e6e03b4f7f0d30b2b67edc8809a18fe70
> 
> This upgrade includes several bug fixes from OE-Core master:
> * openssl: Add Shell-Script based c_rehash utility
>   (From OE-Core rev: cb6150f1a779e356f120d5e45c91fda75789970a)
> * openssl: use subdir= instead of moving files in do_configure_prepend()
>   (From OE-Core rev: a960b6024f1b17994b0f4683a4e70fd2a079bd90)
> * openssl: enable parallel make
>   (From OE-Core rev: ea89857f17a374b6095371ebe2422d2e83735cee)
> * openssl: fix ptest issues
>   (From OE-Core rev: 928adfc807d3c812fcd748e2cf65f392eebd852c)
> * openssl.inc: avoid random ptest failures
>   (From OE-Core rev: 101e2a5e0b7822ca3de3d3a73369405c05ab3c5b)
> * openssl: Add support for many MIPS configurations
>   (From OE-Core rev: cd1f6fbf9a2113cf510c25de2eb3895468e79149)
> * openssl: fix mips64 configure support
>   (From OE-Core rev: 245113ca1075bc3f0c47952e80b437229f855080)
> * openssl: Use linux-aarch64 target for aarch64
>   (From OE-Core rev: 13e9a692510151383bc3243c3917154896b0e049)
> * openssl: Ensure SSL certificates are stored on sysconfdir
>   (From OE-Core rev: 50d63fa346bbb05dafffc0cb55e21e1092272d95)
> * openssl.inc: minor packaging cleanup
>   (From OE-Core rev: 3f81b516e2f23683ce6129bb79bcc08263cb7fe1)
> * openssl: don't move libcrypto to base_libdir
>   (From OE-Core rev: 0be2ab32f690a2fcba0e821abe11460958bbc6dc)
> * openssl: fix add missing dependencies building for test directory
>   (From OE-Core rev: 030142d0410bec85aeacfff6be27d5fed41ce808)
> * openssl: fix add missing `make depend` command before `make` library
>   (From OE-Core rev: e3c251427a305780d3257a011260bd978de273d5)
> 
> The following CVEs has been fixed in 1.0.2k.
> Hence, removing the patchset from this layer.
> * CVE-2016-2177, CVE-2016-2178, CVE-2016-2179,
> * CVE-2016-2180, CVE-2016-2181, CVE-2016-2182,
> * CVE-2016-6302, CVE-2016-6303, CVE-2016-6304,
> * CVE-2016-6306, CVE-2016-8610
> 
> Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc      |  104 +-
>  .../openssl/openssl/0002-CVE-2017-3731.patch       |   53 +
>  .../openssl/openssl/CVE-2016-2177.patch            |  286 --
>  .../openssl/openssl/CVE-2016-2178.patch            |   51 -
>  .../openssl/openssl/CVE-2016-2179.patch            |  255 --
>  .../openssl/openssl/CVE-2016-2180.patch            |   44 -
>  .../openssl/openssl/CVE-2016-2181_p1.patch         |   91 -
>  .../openssl/openssl/CVE-2016-2181_p2.patch         |  239 -
>  .../openssl/openssl/CVE-2016-2181_p3.patch         |   30 -
>  .../openssl/openssl/CVE-2016-2182.patch            |   70 -
>  .../openssl/openssl/CVE-2016-6302.patch            |   53 -
>  .../openssl/openssl/CVE-2016-6303.patch            |   36 -
>  .../openssl/openssl/CVE-2016-6304.patch            |   75 -
>  .../openssl/openssl/CVE-2016-6306.patch            |   71 -
>  .../openssl/openssl/CVE-2016-8610.patch            |  124 -
>  .../Use-SHA256-not-MD5-as-default-digest.patch     |   69 +
>  .../openssl/crypto_use_bigint_in_x86-64_perl.patch |   33 -
>  .../openssl/openssl/debian/ca.patch                |    2 +-
>  .../openssl/openssl/debian/version-script.patch    | 4663 ++++++++++++++++++++
>  .../openssl/debian1.0.2/version-script.patch       |   31 +-
>  .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |    2 +-
>  .../openssl/openssl/openssl-c_rehash.sh            |  222 +
>  .../openssl/openssl-util-perlpath.pl-cwd.patch     |   34 +
>  .../openssl/openssl/openssl_fix_for_x32.patch      |    4 +-
>  .../openssl/openssl/parallel.patch                 |   17 +-
>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   82 -
>  .../recipes-connectivity/openssl/openssl_1.0.2k.bb |   64 +
>  27 files changed, 5200 insertions(+), 1605 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>  create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 8af423f..c728272 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -8,7 +8,7 @@ SECTION = "libs/network"
>  LICENSE = "openssl"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>  
> -DEPENDS = "perl-native-runtime"
> +DEPENDS = "makedepend-native perl-native-runtime"
>  DEPENDS_append_class-target = " openssl-native"
>  
>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> @@ -18,35 +18,31 @@ S = "${WORKDIR}/openssl-${PV}"
>  PACKAGECONFIG[perl] = ",,,"
>  
>  AR_append = " r"
> -# Avoid binaries being marked as requiring an executable stack since it 
> +# Avoid binaries being marked as requiring an executable stack since it
>  # doesn't(which causes and this causes issues with SELinux
>  CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
> -	-DTERMIO ${CFLAGS} -Wall -Wa,--noexecstack"
> -
> -# -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
> -CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
> -CFLAG_mtx-2 := "${@'${CFLAG}'.replace('-O2', '')}"
> +	 -DTERMIO ${CFLAGS} -Wall -Wa,--noexecstack"
>  
>  export DIRS = "crypto ssl apps"
>  export EX_LIBS = "-lgcc -ldl"
>  export AS = "${CC} -c"
> +EXTRA_OEMAKE = "-e MAKEFLAGS="
>  
>  inherit pkgconfig siteinfo multilib_header ptest
>  
>  PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
> -FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
> -FILES_libssl = "${libdir}/libssl.so.*"
> +FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
> +FILES_libssl = "${libdir}/libssl${SOLIBS}"
>  FILES_${PN} =+ " ${libdir}/ssl/*"
> -FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
> +FILES_${PN}-misc = "${libdir}/ssl/misc"
>  RDEPENDS_${PN}-misc = "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
> -FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
>  
>  # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
>  # package RRECOMMENDS on this package.  This will enable the configuration
>  # file to be installed for both the base openssl package and the libcrypto
>  # package since the base openssl package depends on the libcrypto package.
> -FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
> -CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
> +FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
> +CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>  RRECOMMENDS_libcrypto += "openssl-conf"
>  RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
>  
> @@ -86,7 +82,7 @@ do_configure () {
>  		target=linux-elf-armeb
>  		;;
>  	linux-aarch64*)
> -		target=linux-generic64
> +		target=linux-aarch64
>  		;;
>  	linux-sh3)
>  		target=debian-sh3
> @@ -109,15 +105,24 @@ do_configure () {
>  	linux-gnu64-x86_64)
>  		target=linux-x86_64
>  		;;
> -	linux-mips)
> -		target=debian-mips
> +	linux-gnun32-mips*el)
> +		target=debian-mipsn32el
> +		;;
> +	linux-gnun32-mips*)
> +		target=debian-mipsn32
>  		;;
> -	linux-mipsel)
> +	linux-mips*64*el)
> +		target=debian-mips64el
> +		;;
> +	linux-mips*64*)
> +		target=debian-mips64
> +		;;
> +	linux-mips*el)
>  		target=debian-mipsel
>  		;;
> -        linux-*-mips64)
> -               target=linux-mips
> -                ;;
> +	linux-mips*)
> +		target=debian-mips
> +		;;
>  	linux-microblaze*|linux-nios2*)
>  		target=linux-generic32
>  		;;
> @@ -142,7 +147,7 @@ do_configure () {
>          useprefix=${prefix}
>          if [ "x$useprefix" = "x" ]; then
>                  useprefix=/
> -        fi        
> +        fi
>  	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=`basename ${libdir}` $target
>  }
>  
> @@ -151,10 +156,14 @@ do_compile_prepend_class-target () {
>  }
>  
>  do_compile () {
> +	oe_runmake depend
>  	oe_runmake
>  }
>  
>  do_compile_ptest () {
> +	# build dependencies for test directory too
> +	export DIRS="$DIRS test"
> +	oe_runmake depend
>  	oe_runmake buildtest
>  }
>  
> @@ -167,40 +176,63 @@ do_install () {
>  	oe_libinstall -so libcrypto ${D}${libdir}
>  	oe_libinstall -so libssl ${D}${libdir}
>  
> -	# Moving libcrypto to /lib
> -	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> -		mkdir -p ${D}/${base_libdir}/
> -		mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
> -		sed -i s#libdir=\$\{exec_prefix\}\/lib#libdir=${base_libdir}# ${D}/${libdir}/pkgconfig/libcrypto.pc
> -	fi
> -
>  	install -d ${D}${includedir}
>  	cp --dereference -R include/openssl ${D}${includedir}
>  
> +	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
> +	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
> +
>  	oe_multilib_header openssl/opensslconf.h
>  	if [ "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" = "perl" ]; then
> -		install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
> -		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/c_rehash
>  		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
>  		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
> -		# The c_rehash utility isn't installed by the normal installation process.
>  	else
> -		rm -f ${D}${bindir}/c_rehash
>  		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
>  	fi
> +
> +	# Create SSL structure
> +	install -d ${D}${sysconfdir}/ssl/
> +	mv ${D}${libdir}/ssl/openssl.cnf \
> +	   ${D}${libdir}/ssl/certs \
> +	   ${D}${libdir}/ssl/private \
> +	   \
> +	   ${D}${sysconfdir}/ssl/
> +	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
> +	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
> +	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
>  }
>  
>  do_install_ptest () {
> -	cp -r Makefile test ${D}${PTEST_PATH}
> +	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
> +	cp Configure config e_os.h ${D}${PTEST_PATH}
> +	cp -r -L include ${D}${PTEST_PATH}
> +	ln -sf ${libdir}/libcrypto.a ${D}${PTEST_PATH}
> +	ln -sf ${libdir}/libssl.a ${D}${PTEST_PATH}
> +	mkdir -p ${D}${PTEST_PATH}/crypto
> +	cp crypto/constant_time_locl.h ${D}${PTEST_PATH}/crypto
>  	cp -r certs ${D}${PTEST_PATH}
>  	mkdir -p ${D}${PTEST_PATH}/apps
> -	ln -sf /usr/lib/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
> -	ln -sf /usr/lib/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
> -	ln -sf /usr/bin/openssl         ${D}${PTEST_PATH}/apps
> +	ln -sf ${libdir}/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
> +	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
> +	ln -sf ${bindir}/openssl         ${D}${PTEST_PATH}/apps
> +	cp apps/server.pem              ${D}${PTEST_PATH}/apps
>  	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
>  	mkdir -p ${D}${PTEST_PATH}/util
>  	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
>  	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
> +	# Time stamps are relevant for "make alltests", otherwise
> +	# make may try to recompile binaries. Not only must the
> +	# binary files be newer than the sources, they also must
> +	# be more recent than the header files in /usr/include.
> +	#
> +	# Using "cp -a" is not sufficient, because do_install
> +	# does not preserve the original time stamps.
> +	#
> +	# So instead of using the original file stamps, we set
> +	# the current time for all files. Binaries will get
> +	# modified again later when stripping them, but that's okay.
> +	touch ${D}${PTEST_PATH}
> +	find ${D}${PTEST_PATH} -type f -print0 | xargs --verbose -0 touch -r ${D}${PTEST_PATH}
>  }
>  
>  do_install_append_class-native() {
> diff --git a/meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch b/meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
> new file mode 100644
> index 0000000..b56b2d5
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
> @@ -0,0 +1,53 @@
> +From 6427f1accc54b515bb899370f1a662bfcb1caa52 Mon Sep 17 00:00:00 2001
> +From: Alexandru Moise <alexandru.moise@windriver.com>
> +Date: Tue, 7 Feb 2017 11:16:13 +0200
> +Subject: [PATCH 2/2] crypto/evp: harden AEAD ciphers.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Originally a crash in 32-bit build was reported CHACHA20-POLY1305
> +cipher. The crash is triggered by truncated packet and is result
> +of excessive hashing to the edge of accessible memory. Since hash
> +operation is read-only it is not considered to be exploitable
> +beyond a DoS condition. Other ciphers were hardened.
> +
> +Thanks to Robert Święcki for report.
> +
> +CVE-2017-3731
> +
> +Backported from upstream commit:
> +2198b3a55de681e1f3c23edb0586afe13f438051
> +
> +Upstream-Status: Backport
> +
> +Reviewed-by: Rich Salz <rsalz@openssl.org>
> +Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> +---
> + crypto/evp/e_aes.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/crypto/evp/e_aes.c b/crypto/evp/e_aes.c
> +index 1734a82..16dcd10 100644
> +--- a/crypto/evp/e_aes.c
> ++++ b/crypto/evp/e_aes.c
> +@@ -1235,10 +1235,15 @@ static int aes_gcm_ctrl(EVP_CIPHER_CTX *c, int type, int arg, void *ptr)
> +         {
> +             unsigned int len = c->buf[arg - 2] << 8 | c->buf[arg - 1];
> +             /* Correct length for explicit IV */
> ++	    if (len < EVP_GCM_TLS_EXPLICIT_IV_LEN)
> ++	        return 0;
> +             len -= EVP_GCM_TLS_EXPLICIT_IV_LEN;
> +             /* If decrypting correct for tag too */
> +-            if (!c->encrypt)
> ++            if (!c->encrypt) {
> ++		if (len < EVP_GCM_TLS_TAG_LEN)
> ++		    return 0;
> +                 len -= EVP_GCM_TLS_TAG_LEN;
> ++	    }
> +             c->buf[arg - 2] = len >> 8;
> +             c->buf[arg - 1] = len & 0xff;
> +         }
> +-- 
> +2.10.2
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
> deleted file mode 100644
> index df36d5f..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
> +++ /dev/null
> @@ -1,286 +0,0 @@
> -From a004e72b95835136d3f1ea90517f706c24c03da7 Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Thu, 5 May 2016 11:10:26 +0100
> -Subject: [PATCH] Avoid some undefined pointer arithmetic
> -
> -A common idiom in the codebase is:
> -
> -if (p + len > limit)
> -{
> -    return; /* Too long */
> -}
> -
> -Where "p" points to some malloc'd data of SIZE bytes and
> -limit == p + SIZE
> -
> -"len" here could be from some externally supplied data (e.g. from a TLS
> -message).
> -
> -The rules of C pointer arithmetic are such that "p + len" is only well
> -defined where len <= SIZE. Therefore the above idiom is actually
> -undefined behaviour.
> -
> -For example this could cause problems if some malloc implementation
> -provides an address for "p" such that "p + len" actually overflows for
> -values of len that are too big and therefore p + len < limit!
> -
> -Issue reported by Guido Vranken.
> -
> -CVE-2016-2177
> -
> -Reviewed-by: Rich Salz <rsalz@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2177
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> -
> ----
> - ssl/s3_srvr.c  | 14 +++++++-------
> - ssl/ssl_sess.c |  2 +-
> - ssl/t1_lib.c   | 56 ++++++++++++++++++++++++++++++--------------------------
> - 3 files changed, 38 insertions(+), 34 deletions(-)
> -
> -diff --git a/ssl/s3_srvr.c b/ssl/s3_srvr.c
> -index ab28702..ab7f690 100644
> ---- a/ssl/s3_srvr.c
> -+++ b/ssl/s3_srvr.c
> -@@ -980,7 +980,7 @@ int ssl3_get_client_hello(SSL *s)
> - 
> -         session_length = *(p + SSL3_RANDOM_SIZE);
> - 
> --        if (p + SSL3_RANDOM_SIZE + session_length + 1 >= d + n) {
> -+        if (SSL3_RANDOM_SIZE + session_length + 1 >= (d + n) - p) {
> -             al = SSL_AD_DECODE_ERROR;
> -             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> -             goto f_err;
> -@@ -998,7 +998,7 @@ int ssl3_get_client_hello(SSL *s)
> -     /* get the session-id */
> -     j = *(p++);
> - 
> --    if (p + j > d + n) {
> -+    if ((d + n) - p < j) {
> -         al = SSL_AD_DECODE_ERROR;
> -         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> -         goto f_err;
> -@@ -1054,14 +1054,14 @@ int ssl3_get_client_hello(SSL *s)
> - 
> -     if (SSL_IS_DTLS(s)) {
> -         /* cookie stuff */
> --        if (p + 1 > d + n) {
> -+        if ((d + n) - p < 1) {
> -             al = SSL_AD_DECODE_ERROR;
> -             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> -             goto f_err;
> -         }
> -         cookie_len = *(p++);
> - 
> --        if (p + cookie_len > d + n) {
> -+        if ((d + n ) - p < cookie_len) {
> -             al = SSL_AD_DECODE_ERROR;
> -             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> -             goto f_err;
> -@@ -1131,7 +1131,7 @@ int ssl3_get_client_hello(SSL *s)
> -         }
> -     }
> - 
> --    if (p + 2 > d + n) {
> -+    if ((d + n ) - p < 2) {
> -         al = SSL_AD_DECODE_ERROR;
> -         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> -         goto f_err;
> -@@ -1145,7 +1145,7 @@ int ssl3_get_client_hello(SSL *s)
> -     }
> - 
> -     /* i bytes of cipher data + 1 byte for compression length later */
> --    if ((p + i + 1) > (d + n)) {
> -+    if ((d + n) - p < i + 1) {
> -         /* not enough data */
> -         al = SSL_AD_DECODE_ERROR;
> -         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
> -@@ -1211,7 +1211,7 @@ int ssl3_get_client_hello(SSL *s)
> - 
> -     /* compression */
> -     i = *(p++);
> --    if ((p + i) > (d + n)) {
> -+    if ((d + n) - p < i) {
> -         /* not enough data */
> -         al = SSL_AD_DECODE_ERROR;
> -         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
> -diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
> -index b182998..54ee783 100644
> ---- a/ssl/ssl_sess.c
> -+++ b/ssl/ssl_sess.c
> -@@ -573,7 +573,7 @@ int ssl_get_prev_session(SSL *s, unsigned char *session_id, int len,
> -     int r;
> - #endif
> - 
> --    if (session_id + len > limit) {
> -+    if (limit - session_id < len) {
> -         fatal = 1;
> -         goto err;
> -     }
> -diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
> -index fb64607..cdac011 100644
> ---- a/ssl/t1_lib.c
> -+++ b/ssl/t1_lib.c
> -@@ -1867,11 +1867,11 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
> -         0x02, 0x03,             /* SHA-1/ECDSA */
> -     };
> - 
> --    if (data >= (limit - 2))
> -+    if (limit - data <= 2)
> -         return;
> -     data += 2;
> - 
> --    if (data > (limit - 4))
> -+    if (limit - data < 4)
> -         return;
> -     n2s(data, type);
> -     n2s(data, size);
> -@@ -1879,7 +1879,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
> -     if (type != TLSEXT_TYPE_server_name)
> -         return;
> - 
> --    if (data + size > limit)
> -+    if (limit - data < size)
> -         return;
> -     data += size;
> - 
> -@@ -1887,7 +1887,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
> -         const size_t len1 = sizeof(kSafariExtensionsBlock);
> -         const size_t len2 = sizeof(kSafariTLS12ExtensionsBlock);
> - 
> --        if (data + len1 + len2 != limit)
> -+        if (limit - data != (int)(len1 + len2))
> -             return;
> -         if (memcmp(data, kSafariExtensionsBlock, len1) != 0)
> -             return;
> -@@ -1896,7 +1896,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
> -     } else {
> -         const size_t len = sizeof(kSafariExtensionsBlock);
> - 
> --        if (data + len != limit)
> -+        if (limit - data != (int)(len))
> -             return;
> -         if (memcmp(data, kSafariExtensionsBlock, len) != 0)
> -             return;
> -@@ -2053,19 +2053,19 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
> -     if (data == limit)
> -         goto ri_check;
> - 
> --    if (data > (limit - 2))
> -+    if (limit - data < 2)
> -         goto err;
> - 
> -     n2s(data, len);
> - 
> --    if (data + len != limit)
> -+    if (limit - data != len)
> -         goto err;
> - 
> --    while (data <= (limit - 4)) {
> -+    while (limit - data >= 4) {
> -         n2s(data, type);
> -         n2s(data, size);
> - 
> --        if (data + size > (limit))
> -+        if (limit - data < size)
> -             goto err;
> - # if 0
> -         fprintf(stderr, "Received extension type %d size %d\n", type, size);
> -@@ -2472,18 +2472,18 @@ static int ssl_scan_clienthello_custom_tlsext(SSL *s,
> -     if (s->hit || s->cert->srv_ext.meths_count == 0)
> -         return 1;
> - 
> --    if (data >= limit - 2)
> -+    if (limit - data <= 2)
> -         return 1;
> -     n2s(data, len);
> - 
> --    if (data > limit - len)
> -+    if (limit - data < len)
> -         return 1;
> - 
> --    while (data <= limit - 4) {
> -+    while (limit - data >= 4) {
> -         n2s(data, type);
> -         n2s(data, size);
> - 
> --        if (data + size > limit)
> -+        if (limit - data < size)
> -             return 1;
> -         if (custom_ext_parse(s, 1 /* server */ , type, data, size, al) <= 0)
> -             return 0;
> -@@ -2569,20 +2569,20 @@ static int ssl_scan_serverhello_tlsext(SSL *s, unsigned char **p,
> -                              SSL_TLSEXT_HB_DONT_SEND_REQUESTS);
> - # endif
> - 
> --    if (data >= (d + n - 2))
> -+    if ((d + n) - data <= 2)
> -         goto ri_check;
> - 
> -     n2s(data, length);
> --    if (data + length != d + n) {
> -+    if ((d + n) - data != length) {
> -         *al = SSL_AD_DECODE_ERROR;
> -         return 0;
> -     }
> - 
> --    while (data <= (d + n - 4)) {
> -+    while ((d + n) - data >= 4) {
> -         n2s(data, type);
> -         n2s(data, size);
> - 
> --        if (data + size > (d + n))
> -+        if ((d + n) - data < size)
> -             goto ri_check;
> - 
> -         if (s->tlsext_debug_cb)
> -@@ -3307,29 +3307,33 @@ int tls1_process_ticket(SSL *s, unsigned char *session_id, int len,
> -     /* Skip past DTLS cookie */
> -     if (SSL_IS_DTLS(s)) {
> -         i = *(p++);
> --        p += i;
> --        if (p >= limit)
> -+
> -+        if (limit - p <= i)
> -             return -1;
> -+
> -+        p += i;
> -     }
> -     /* Skip past cipher list */
> -     n2s(p, i);
> --    p += i;
> --    if (p >= limit)
> -+    if (limit - p <= i)
> -         return -1;
> -+    p += i;
> -+
> -     /* Skip past compression algorithm list */
> -     i = *(p++);
> --    p += i;
> --    if (p > limit)
> -+    if (limit - p < i)
> -         return -1;
> -+    p += i;
> -+
> -     /* Now at start of extensions */
> --    if ((p + 2) >= limit)
> -+    if (limit - p <= 2)
> -         return 0;
> -     n2s(p, i);
> --    while ((p + 4) <= limit) {
> -+    while (limit - p >= 4) {
> -         unsigned short type, size;
> -         n2s(p, type);
> -         n2s(p, size);
> --        if (p + size > limit)
> -+        if (limit - p < size)
> -             return 0;
> -         if (type == TLSEXT_TYPE_session_ticket) {
> -             int r;
> --- 
> -2.3.5
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
> deleted file mode 100644
> index 27ade4e..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 399944622df7bd81af62e67ea967c470534090e2 Mon Sep 17 00:00:00 2001
> -From: Cesar Pereida <cesar.pereida@aalto.fi>
> -Date: Mon, 23 May 2016 12:45:25 +0300
> -Subject: [PATCH] Fix DSA, preserve BN_FLG_CONSTTIME
> -
> -Operations in the DSA signing algorithm should run in constant time in
> -order to avoid side channel attacks. A flaw in the OpenSSL DSA
> -implementation means that a non-constant time codepath is followed for
> -certain operations. This has been demonstrated through a cache-timing
> -attack to be sufficient for an attacker to recover the private DSA key.
> -
> -CVE-2016-2178
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2178
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - crypto/dsa/dsa_ossl.c | 9 +++++----
> - 1 file changed, 5 insertions(+), 4 deletions(-)
> -
> -Index: openssl-1.0.2h/crypto/dsa/dsa_ossl.c
> -===================================================================
> ---- openssl-1.0.2h.orig/crypto/dsa/dsa_ossl.c
> -+++ openssl-1.0.2h/crypto/dsa/dsa_ossl.c
> -@@ -248,9 +248,6 @@ static int dsa_sign_setup(DSA *dsa, BN_C
> -         if (!BN_rand_range(&k, dsa->q))
> -             goto err;
> -     while (BN_is_zero(&k)) ;
> --    if ((dsa->flags & DSA_FLAG_NO_EXP_CONSTTIME) == 0) {
> --        BN_set_flags(&k, BN_FLG_CONSTTIME);
> --    }
> - 
> -     if (dsa->flags & DSA_FLAG_CACHE_MONT_P) {
> -         if (!BN_MONT_CTX_set_locked(&dsa->method_mont_p,
> -@@ -282,6 +279,11 @@ static int dsa_sign_setup(DSA *dsa, BN_C
> -     } else {
> -         K = &k;
> -     }
> -+
> -+    if ((dsa->flags & DSA_FLAG_NO_EXP_CONSTTIME) == 0) {
> -+        BN_set_flags(K, BN_FLG_CONSTTIME);
> -+    }
> -+
> -     DSA_BN_MOD_EXP(goto err, dsa, r, dsa->g, K, dsa->p, ctx,
> -                    dsa->method_mont_p);
> -     if (!BN_mod(r, r, dsa->q, ctx))
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
> deleted file mode 100644
> index d1cf7f8..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
> +++ /dev/null
> @@ -1,255 +0,0 @@
> -From 00a4c1421407b6ac796688871b0a49a179c694d9 Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Thu, 30 Jun 2016 13:17:08 +0100
> -Subject: [PATCH] Fix DTLS buffered message DoS attack
> -
> -DTLS can handle out of order record delivery. Additionally since
> -handshake messages can be bigger than will fit into a single packet, the
> -messages can be fragmented across multiple records (as with normal TLS).
> -That means that the messages can arrive mixed up, and we have to
> -reassemble them. We keep a queue of buffered messages that are "from the
> -future", i.e. messages we're not ready to deal with yet but have arrived
> -early. The messages held there may not be full yet - they could be one
> -or more fragments that are still in the process of being reassembled.
> -
> -The code assumes that we will eventually complete the reassembly and
> -when that occurs the complete message is removed from the queue at the
> -point that we need to use it.
> -
> -However, DTLS is also tolerant of packet loss. To get around that DTLS
> -messages can be retransmitted. If we receive a full (non-fragmented)
> -message from the peer after previously having received a fragment of
> -that message, then we ignore the message in the queue and just use the
> -non-fragmented version. At that point the queued message will never get
> -removed.
> -
> -Additionally the peer could send "future" messages that we never get to
> -in order to complete the handshake. Each message has a sequence number
> -(starting from 0). We will accept a message fragment for the current
> -message sequence number, or for any sequence up to 10 into the future.
> -However if the Finished message has a sequence number of 2, anything
> -greater than that in the queue is just left there.
> -
> -So, in those two ways we can end up with "orphaned" data in the queue
> -that will never get removed - except when the connection is closed. At
> -that point all the queues are flushed.
> -
> -An attacker could seek to exploit this by filling up the queues with
> -lots of large messages that are never going to be used in order to
> -attempt a DoS by memory exhaustion.
> -
> -I will assume that we are only concerned with servers here. It does not
> -seem reasonable to be concerned about a memory exhaustion attack on a
> -client. They are unlikely to process enough connections for this to be
> -an issue.
> -
> -A "long" handshake with many messages might be 5 messages long (in the
> -incoming direction), e.g. ClientHello, Certificate, ClientKeyExchange,
> -CertificateVerify, Finished. So this would be message sequence numbers 0
> -to 4. Additionally we can buffer up to 10 messages in the future.
> -Therefore the maximum number of messages that an attacker could send
> -that could get orphaned would typically be 15.
> -
> -The maximum size that a DTLS message is allowed to be is defined by
> -max_cert_list, which by default is 100k. Therefore the maximum amount of
> -"orphaned" memory per connection is 1500k.
> -
> -Message sequence numbers get reset after the Finished message, so
> -renegotiation will not extend the maximum number of messages that can be
> -orphaned per connection.
> -
> -As noted above, the queues do get cleared when the connection is closed.
> -Therefore in order to mount an effective attack, an attacker would have
> -to open many simultaneous connections.
> -
> -Issue reported by Quan Luo.
> -
> -CVE-2016-2179
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2106-2179
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/d1_both.c  | 32 ++++++++++++++++----------------
> - ssl/d1_clnt.c  |  1 +
> - ssl/d1_lib.c   | 37 ++++++++++++++++++++++++++-----------
> - ssl/d1_srvr.c  |  3 ++-
> - ssl/ssl_locl.h |  3 ++-
> - 5 files changed, 47 insertions(+), 29 deletions(-)
> -
> -Index: openssl-1.0.2h/ssl/d1_both.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/d1_both.c
> -+++ openssl-1.0.2h/ssl/d1_both.c
> -@@ -618,11 +618,23 @@ static int dtls1_retrieve_buffered_fragm
> -     int al;
> - 
> -     *ok = 0;
> --    item = pqueue_peek(s->d1->buffered_messages);
> --    if (item == NULL)
> --        return 0;
> -+    do {
> -+        item = pqueue_peek(s->d1->buffered_messages);
> -+        if (item == NULL)
> -+            return 0;
> -+
> -+        frag = (hm_fragment *)item->data;
> -+
> -+        if (frag->msg_header.seq < s->d1->handshake_read_seq) {
> -+            /* This is a stale message that has been buffered so clear it */
> -+            pqueue_pop(s->d1->buffered_messages);
> -+            dtls1_hm_fragment_free(frag);
> -+            pitem_free(item);
> -+            item = NULL;
> -+            frag = NULL;
> -+        }
> -+    } while (item == NULL);
> - 
> --    frag = (hm_fragment *)item->data;
> - 
> -     /* Don't return if reassembly still in progress */
> -     if (frag->reassembly != NULL)
> -@@ -1296,18 +1308,6 @@ dtls1_retransmit_message(SSL *s, unsigne
> -     return ret;
> - }
> - 
> --/* call this function when the buffered messages are no longer needed */
> --void dtls1_clear_record_buffer(SSL *s)
> --{
> --    pitem *item;
> --
> --    for (item = pqueue_pop(s->d1->sent_messages);
> --         item != NULL; item = pqueue_pop(s->d1->sent_messages)) {
> --        dtls1_hm_fragment_free((hm_fragment *)item->data);
> --        pitem_free(item);
> --    }
> --}
> --
> - unsigned char *dtls1_set_message_header(SSL *s, unsigned char *p,
> -                                         unsigned char mt, unsigned long len,
> -                                         unsigned long frag_off,
> -Index: openssl-1.0.2h/ssl/d1_clnt.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/d1_clnt.c
> -+++ openssl-1.0.2h/ssl/d1_clnt.c
> -@@ -769,6 +769,7 @@ int dtls1_connect(SSL *s)
> -             /* done with handshaking */
> -             s->d1->handshake_read_seq = 0;
> -             s->d1->next_handshake_write_seq = 0;
> -+            dtls1_clear_received_buffer(s);
> -             goto end;
> -             /* break; */
> - 
> -Index: openssl-1.0.2h/ssl/d1_lib.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/d1_lib.c
> -+++ openssl-1.0.2h/ssl/d1_lib.c
> -@@ -170,7 +170,6 @@ int dtls1_new(SSL *s)
> - static void dtls1_clear_queues(SSL *s)
> - {
> -     pitem *item = NULL;
> --    hm_fragment *frag = NULL;
> -     DTLS1_RECORD_DATA *rdata;
> - 
> -     while ((item = pqueue_pop(s->d1->unprocessed_rcds.q)) != NULL) {
> -@@ -191,28 +190,44 @@ static void dtls1_clear_queues(SSL *s)
> -         pitem_free(item);
> -     }
> - 
> -+    while ((item = pqueue_pop(s->d1->buffered_app_data.q)) != NULL) {
> -+        rdata = (DTLS1_RECORD_DATA *)item->data;
> -+        if (rdata->rbuf.buf) {
> -+            OPENSSL_free(rdata->rbuf.buf);
> -+        }
> -+        OPENSSL_free(item->data);
> -+        pitem_free(item);
> -+    }
> -+
> -+    dtls1_clear_received_buffer(s);
> -+    dtls1_clear_sent_buffer(s);
> -+}
> -+
> -+void dtls1_clear_received_buffer(SSL *s)
> -+{
> -+    pitem *item = NULL;
> -+    hm_fragment *frag = NULL;
> -+
> -     while ((item = pqueue_pop(s->d1->buffered_messages)) != NULL) {
> -         frag = (hm_fragment *)item->data;
> -         dtls1_hm_fragment_free(frag);
> -         pitem_free(item);
> -     }
> -+}
> -+
> -+void dtls1_clear_sent_buffer(SSL *s)
> -+{
> -+    pitem *item = NULL;
> -+    hm_fragment *frag = NULL;
> - 
> -     while ((item = pqueue_pop(s->d1->sent_messages)) != NULL) {
> -         frag = (hm_fragment *)item->data;
> -         dtls1_hm_fragment_free(frag);
> -         pitem_free(item);
> -     }
> --
> --    while ((item = pqueue_pop(s->d1->buffered_app_data.q)) != NULL) {
> --        rdata = (DTLS1_RECORD_DATA *)item->data;
> --        if (rdata->rbuf.buf) {
> --            OPENSSL_free(rdata->rbuf.buf);
> --        }
> --        OPENSSL_free(item->data);
> --        pitem_free(item);
> --    }
> - }
> - 
> -+
> - void dtls1_free(SSL *s)
> - {
> -     ssl3_free(s);
> -@@ -456,7 +471,7 @@ void dtls1_stop_timer(SSL *s)
> -     BIO_ctrl(SSL_get_rbio(s), BIO_CTRL_DGRAM_SET_NEXT_TIMEOUT, 0,
> -              &(s->d1->next_timeout));
> -     /* Clear retransmission buffer */
> --    dtls1_clear_record_buffer(s);
> -+    dtls1_clear_sent_buffer(s);
> - }
> - 
> - int dtls1_check_timeout_num(SSL *s)
> -Index: openssl-1.0.2h/ssl/d1_srvr.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/d1_srvr.c
> -+++ openssl-1.0.2h/ssl/d1_srvr.c
> -@@ -313,7 +313,7 @@ int dtls1_accept(SSL *s)
> -         case SSL3_ST_SW_HELLO_REQ_B:
> - 
> -             s->shutdown = 0;
> --            dtls1_clear_record_buffer(s);
> -+            dtls1_clear_sent_buffer(s);
> -             dtls1_start_timer(s);
> -             ret = ssl3_send_hello_request(s);
> -             if (ret <= 0)
> -@@ -894,6 +894,7 @@ int dtls1_accept(SSL *s)
> -             /* next message is server hello */
> -             s->d1->handshake_write_seq = 0;
> -             s->d1->next_handshake_write_seq = 0;
> -+            dtls1_clear_received_buffer(s);
> -             goto end;
> -             /* break; */
> - 
> -Index: openssl-1.0.2h/ssl/ssl_locl.h
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/ssl_locl.h
> -+++ openssl-1.0.2h/ssl/ssl_locl.h
> -@@ -1242,7 +1242,8 @@ int dtls1_retransmit_message(SSL *s, uns
> -                              unsigned long frag_off, int *found);
> - int dtls1_get_queue_priority(unsigned short seq, int is_ccs);
> - int dtls1_retransmit_buffered_messages(SSL *s);
> --void dtls1_clear_record_buffer(SSL *s);
> -+void dtls1_clear_received_buffer(SSL *s);
> -+void dtls1_clear_sent_buffer(SSL *s);
> - void dtls1_get_message_header(unsigned char *data,
> -                               struct hm_header_st *msg_hdr);
> - void dtls1_get_ccs_header(unsigned char *data, struct ccs_header_st *ccs_hdr);
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
> deleted file mode 100644
> index c71aaa5..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From b746aa3fe05b5b5f7126df247ac3eceeb995e2a0 Mon Sep 17 00:00:00 2001
> -From: "Dr. Stephen Henson" <steve@openssl.org>
> -Date: Thu, 21 Jul 2016 15:24:16 +0100
> -Subject: [PATCH] Fix OOB read in TS_OBJ_print_bio().
> -
> -TS_OBJ_print_bio() misuses OBJ_txt2obj: it should print the result
> -as a null terminated buffer. The length value returned is the total
> -length the complete text reprsentation would need not the amount of
> -data written.
> -
> -CVE-2016-2180
> -
> -Thanks to Shi Lei for reporting this bug.
> -
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -(cherry picked from commit 0ed26acce328ec16a3aa635f1ca37365e8c7403a)
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2180
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - crypto/ts/ts_lib.c | 5 ++---
> - 1 file changed, 2 insertions(+), 3 deletions(-)
> -
> -diff --git a/crypto/ts/ts_lib.c b/crypto/ts/ts_lib.c
> -index c51538a..e0f1063 100644
> ---- a/crypto/ts/ts_lib.c
> -+++ b/crypto/ts/ts_lib.c
> -@@ -90,9 +90,8 @@ int TS_OBJ_print_bio(BIO *bio, const ASN1_OBJECT *obj)
> - {
> -     char obj_txt[128];
> - 
> --    int len = OBJ_obj2txt(obj_txt, sizeof(obj_txt), obj, 0);
> --    BIO_write(bio, obj_txt, len);
> --    BIO_write(bio, "\n", 1);
> -+    OBJ_obj2txt(obj_txt, sizeof(obj_txt), obj, 0);
> -+    BIO_printf(bio, "%s\n", obj_txt);
> - 
> -     return 1;
> - }
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
> deleted file mode 100644
> index 9149dbe..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From 20744f6b40b5ded059a848f66d6ba922f2a62eb3 Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Tue, 5 Jul 2016 11:46:26 +0100
> -Subject: [PATCH] Fix DTLS unprocessed records bug
> -
> -During a DTLS handshake we may get records destined for the next epoch
> -arrive before we have processed the CCS. In that case we can't decrypt or
> -verify the record yet, so we buffer it for later use. When we do receive
> -the CCS we work through the queue of unprocessed records and process them.
> -
> -Unfortunately the act of processing wipes out any existing packet data
> -that we were still working through. This includes any records from the new
> -epoch that were in the same packet as the CCS. We should only process the
> -buffered records if we've not got any data left.
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2180 patch 1
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/d1_pkt.c | 23 +++++++++++++++++++++--
> - 1 file changed, 21 insertions(+), 2 deletions(-)
> -
> -diff --git a/ssl/d1_pkt.c b/ssl/d1_pkt.c
> -index fe30ec7..1fb119d 100644
> ---- a/ssl/d1_pkt.c
> -+++ b/ssl/d1_pkt.c
> -@@ -319,6 +319,7 @@ static int dtls1_retrieve_buffered_record(SSL *s, record_pqueue *queue)
> - static int dtls1_process_buffered_records(SSL *s)
> - {
> -     pitem *item;
> -+    SSL3_BUFFER *rb;
> - 
> -     item = pqueue_peek(s->d1->unprocessed_rcds.q);
> -     if (item) {
> -@@ -326,6 +327,19 @@ static int dtls1_process_buffered_records(SSL *s)
> -         if (s->d1->unprocessed_rcds.epoch != s->d1->r_epoch)
> -             return (1);         /* Nothing to do. */
> - 
> -+        rb = &s->s3->rbuf;
> -+
> -+        if (rb->left > 0) {
> -+            /*
> -+             * We've still got data from the current packet to read. There could
> -+             * be a record from the new epoch in it - so don't overwrite it
> -+             * with the unprocessed records yet (we'll do it when we've
> -+             * finished reading the current packet).
> -+             */
> -+            return 1;
> -+        }
> -+
> -+
> -         /* Process all the records. */
> -         while (pqueue_peek(s->d1->unprocessed_rcds.q)) {
> -             dtls1_get_unprocessed_record(s);
> -@@ -581,6 +595,7 @@ int dtls1_get_record(SSL *s)
> - 
> -     rr = &(s->s3->rrec);
> - 
> -+ again:
> -     /*
> -      * The epoch may have changed.  If so, process all the pending records.
> -      * This is a non-blocking operation.
> -@@ -593,7 +608,6 @@ int dtls1_get_record(SSL *s)
> -         return 1;
> - 
> -     /* get something from the wire */
> -- again:
> -     /* check if we have the header */
> -     if ((s->rstate != SSL_ST_READ_BODY) ||
> -         (s->packet_length < DTLS1_RT_HEADER_LENGTH)) {
> -@@ -1830,8 +1844,13 @@ static DTLS1_BITMAP *dtls1_get_bitmap(SSL *s, SSL3_RECORD *rr,
> -     if (rr->epoch == s->d1->r_epoch)
> -         return &s->d1->bitmap;
> - 
> --    /* Only HM and ALERT messages can be from the next epoch */
> -+    /*
> -+     * Only HM and ALERT messages can be from the next epoch and only if we
> -+     * have already processed all of the unprocessed records from the last
> -+     * epoch
> -+     */
> -     else if (rr->epoch == (unsigned long)(s->d1->r_epoch + 1) &&
> -+             s->d1->unprocessed_rcds.epoch != s->d1->r_epoch &&
> -              (rr->type == SSL3_RT_HANDSHAKE || rr->type == SSL3_RT_ALERT)) {
> -         *is_next_epoch = 1;
> -         return &s->d1->next_bitmap;
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
> deleted file mode 100644
> index ecf138a..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
> +++ /dev/null
> @@ -1,239 +0,0 @@
> -From 3884b47b7c255c2e94d9b387ee83c7e8bb981258 Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Tue, 5 Jul 2016 12:04:37 +0100
> -Subject: [PATCH] Fix DTLS replay protection
> -
> -The DTLS implementation provides some protection against replay attacks
> -in accordance with RFC6347 section 4.1.2.6.
> -
> -A sliding "window" of valid record sequence numbers is maintained with
> -the "right" hand edge of the window set to the highest sequence number we
> -have received so far. Records that arrive that are off the "left" hand
> -edge of the window are rejected. Records within the window are checked
> -against a list of records received so far. If we already received it then
> -we also reject the new record.
> -
> -If we have not already received the record, or the sequence number is off
> -the right hand edge of the window then we verify the MAC of the record.
> -If MAC verification fails then we discard the record. Otherwise we mark
> -the record as received. If the sequence number was off the right hand edge
> -of the window, then we slide the window along so that the right hand edge
> -is in line with the newly received sequence number.
> -
> -Records may arrive for future epochs, i.e. a record from after a CCS being
> -sent, can arrive before the CCS does if the packets get re-ordered. As we
> -have not yet received the CCS we are not yet in a position to decrypt or
> -validate the MAC of those records. OpenSSL places those records on an
> -unprocessed records queue. It additionally updates the window immediately,
> -even though we have not yet verified the MAC. This will only occur if
> -currently in a handshake/renegotiation.
> -
> -This could be exploited by an attacker by sending a record for the next
> -epoch (which does not have to decrypt or have a valid MAC), with a very
> -large sequence number. This means the right hand edge of the window is
> -moved very far to the right, and all subsequent legitimate packets are
> -dropped causing a denial of service.
> -
> -A similar effect can be achieved during the initial handshake. In this
> -case there is no MAC key negotiated yet. Therefore an attacker can send a
> -message for the current epoch with a very large sequence number. The code
> -will process the record as normal. If the hanshake message sequence number
> -(as opposed to the record sequence number that we have been talking about
> -so far) is in the future then the injected message is bufferred to be
> -handled later, but the window is still updated. Therefore all subsequent
> -legitimate handshake records are dropped. This aspect is not considered a
> -security issue because there are many ways for an attacker to disrupt the
> -initial handshake and prevent it from completing successfully (e.g.
> -injection of a handshake message will cause the Finished MAC to fail and
> -the handshake to be aborted). This issue comes about as a result of trying
> -to do replay protection, but having no integrity mechanism in place yet.
> -Does it even make sense to have replay protection in epoch 0? That
> -issue isn't addressed here though.
> -
> -This addressed an OCAP Audit issue.
> -
> -CVE-2016-2181
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2181 patch2
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> ----
> - ssl/d1_pkt.c  | 60 +++++++++++++++++++++++++++++++++++++++++++++++------------
> - ssl/ssl.h     |  1 +
> - ssl/ssl_err.c |  4 +++-
> - 3 files changed, 52 insertions(+), 13 deletions(-)
> -
> -Index: openssl-1.0.2h/ssl/d1_pkt.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/d1_pkt.c
> -+++ openssl-1.0.2h/ssl/d1_pkt.c
> -@@ -194,7 +194,7 @@ static int dtls1_record_needs_buffering(
> - #endif
> - static int dtls1_buffer_record(SSL *s, record_pqueue *q,
> -                                unsigned char *priority);
> --static int dtls1_process_record(SSL *s);
> -+static int dtls1_process_record(SSL *s, DTLS1_BITMAP *bitmap);
> - 
> - /* copy buffered record into SSL structure */
> - static int dtls1_copy_record(SSL *s, pitem *item)
> -@@ -320,13 +320,18 @@ static int dtls1_process_buffered_record
> - {
> -     pitem *item;
> -     SSL3_BUFFER *rb;
> -+    SSL3_RECORD *rr;
> -+    DTLS1_BITMAP *bitmap;
> -+    unsigned int is_next_epoch;
> -+    int replayok = 1;
> - 
> -     item = pqueue_peek(s->d1->unprocessed_rcds.q);
> -     if (item) {
> -         /* Check if epoch is current. */
> -         if (s->d1->unprocessed_rcds.epoch != s->d1->r_epoch)
> --            return (1);         /* Nothing to do. */
> -+            return 1;         /* Nothing to do. */
> - 
> -+        rr = &s->s3->rrec;
> -         rb = &s->s3->rbuf;
> - 
> -         if (rb->left > 0) {
> -@@ -343,11 +348,41 @@ static int dtls1_process_buffered_record
> -         /* Process all the records. */
> -         while (pqueue_peek(s->d1->unprocessed_rcds.q)) {
> -             dtls1_get_unprocessed_record(s);
> --            if (!dtls1_process_record(s))
> --                return (0);
> -+            bitmap = dtls1_get_bitmap(s, rr, &is_next_epoch);
> -+            if (bitmap == NULL) {
> -+                /*
> -+                 * Should not happen. This will only ever be NULL when the
> -+                 * current record is from a different epoch. But that cannot
> -+                 * be the case because we already checked the epoch above
> -+                 */
> -+                 SSLerr(SSL_F_DTLS1_PROCESS_BUFFERED_RECORDS,
> -+                        ERR_R_INTERNAL_ERROR);
> -+                 return 0;
> -+            }
> -+#ifndef OPENSSL_NO_SCTP
> -+            /* Only do replay check if no SCTP bio */
> -+            if (!BIO_dgram_is_sctp(SSL_get_rbio(s)))
> -+#endif
> -+            {
> -+                /*
> -+                 * Check whether this is a repeat, or aged record. We did this
> -+                 * check once already when we first received the record - but
> -+                 * we might have updated the window since then due to
> -+                 * records we subsequently processed.
> -+                 */
> -+                replayok = dtls1_record_replay_check(s, bitmap);
> -+            }
> -+
> -+            if (!replayok || !dtls1_process_record(s, bitmap)) {
> -+                /* dump this record */
> -+                rr->length = 0;
> -+                s->packet_length = 0;
> -+                continue;
> -+            }
> -+
> -             if (dtls1_buffer_record(s, &(s->d1->processed_rcds),
> -                                     s->s3->rrec.seq_num) < 0)
> --                return -1;
> -+                return 0;
> -         }
> -     }
> - 
> -@@ -358,7 +393,7 @@ static int dtls1_process_buffered_record
> -     s->d1->processed_rcds.epoch = s->d1->r_epoch;
> -     s->d1->unprocessed_rcds.epoch = s->d1->r_epoch + 1;
> - 
> --    return (1);
> -+    return 1;
> - }
> - 
> - #if 0
> -@@ -405,7 +440,7 @@ static int dtls1_get_buffered_record(SSL
> - 
> - #endif
> - 
> --static int dtls1_process_record(SSL *s)
> -+static int dtls1_process_record(SSL *s, DTLS1_BITMAP *bitmap)
> - {
> -     int i, al;
> -     int enc_err;
> -@@ -565,6 +600,10 @@ static int dtls1_process_record(SSL *s)
> - 
> -     /* we have pulled in a full packet so zero things */
> -     s->packet_length = 0;
> -+
> -+    /* Mark receipt of record. */
> -+    dtls1_record_bitmap_update(s, bitmap);
> -+
> -     return (1);
> - 
> -  f_err:
> -@@ -600,7 +639,7 @@ int dtls1_get_record(SSL *s)
> -      * The epoch may have changed.  If so, process all the pending records.
> -      * This is a non-blocking operation.
> -      */
> --    if (dtls1_process_buffered_records(s) < 0)
> -+    if (!dtls1_process_buffered_records(s))
> -         return -1;
> - 
> -     /* if we're renegotiating, then there may be buffered records */
> -@@ -735,20 +774,17 @@ int dtls1_get_record(SSL *s)
> -             if (dtls1_buffer_record
> -                 (s, &(s->d1->unprocessed_rcds), rr->seq_num) < 0)
> -                 return -1;
> --            /* Mark receipt of record. */
> --            dtls1_record_bitmap_update(s, bitmap);
> -         }
> -         rr->length = 0;
> -         s->packet_length = 0;
> -         goto again;
> -     }
> - 
> --    if (!dtls1_process_record(s)) {
> -+    if (!dtls1_process_record(s, bitmap)) {
> -         rr->length = 0;
> -         s->packet_length = 0;   /* dump this record */
> -         goto again;             /* get another record */
> -     }
> --    dtls1_record_bitmap_update(s, bitmap); /* Mark receipt of record. */
> - 
> -     return (1);
> - 
> -Index: openssl-1.0.2h/ssl/ssl.h
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/ssl.h
> -+++ openssl-1.0.2h/ssl/ssl.h
> -@@ -2623,6 +2623,7 @@ void ERR_load_SSL_strings(void);
> - # define SSL_F_DTLS1_HEARTBEAT                            305
> - # define SSL_F_DTLS1_OUTPUT_CERT_CHAIN                    255
> - # define SSL_F_DTLS1_PREPROCESS_FRAGMENT                  288
> -+# define SSL_F_DTLS1_PROCESS_BUFFERED_RECORDS             404
> - # define SSL_F_DTLS1_PROCESS_OUT_OF_SEQ_MESSAGE           256
> - # define SSL_F_DTLS1_PROCESS_RECORD                       257
> - # define SSL_F_DTLS1_READ_BYTES                           258
> -Index: openssl-1.0.2h/ssl/ssl_err.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/ssl_err.c
> -+++ openssl-1.0.2h/ssl/ssl_err.c
> -@@ -1,6 +1,6 @@
> - /* ssl/ssl_err.c */
> - /* ====================================================================
> -- * Copyright (c) 1999-2015 The OpenSSL Project.  All rights reserved.
> -+ * Copyright (c) 1999-2016 The OpenSSL Project.  All rights reserved.
> -  *
> -  * Redistribution and use in source and binary forms, with or without
> -  * modification, are permitted provided that the following conditions
> -@@ -93,6 +93,8 @@ static ERR_STRING_DATA SSL_str_functs[]
> -     {ERR_FUNC(SSL_F_DTLS1_HEARTBEAT), "dtls1_heartbeat"},
> -     {ERR_FUNC(SSL_F_DTLS1_OUTPUT_CERT_CHAIN), "dtls1_output_cert_chain"},
> -     {ERR_FUNC(SSL_F_DTLS1_PREPROCESS_FRAGMENT), "DTLS1_PREPROCESS_FRAGMENT"},
> -+    {ERR_FUNC(SSL_F_DTLS1_PROCESS_BUFFERED_RECORDS),
> -+     "DTLS1_PROCESS_BUFFERED_RECORDS"},
> -     {ERR_FUNC(SSL_F_DTLS1_PROCESS_OUT_OF_SEQ_MESSAGE),
> -      "DTLS1_PROCESS_OUT_OF_SEQ_MESSAGE"},
> -     {ERR_FUNC(SSL_F_DTLS1_PROCESS_RECORD), "DTLS1_PROCESS_RECORD"},
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
> deleted file mode 100644
> index a752f89..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 26aebca74e38ae09f673c2045cc8e2ef762d265a Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Wed, 17 Aug 2016 17:55:36 +0100
> -Subject: [PATCH] Update function error code
> -
> -A function error code needed updating due to merge issues.
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2181 patch 3
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/ssl.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: openssl-1.0.2h/ssl/ssl.h
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/ssl.h
> -+++ openssl-1.0.2h/ssl/ssl.h
> -@@ -2623,7 +2623,7 @@ void ERR_load_SSL_strings(void);
> - # define SSL_F_DTLS1_HEARTBEAT                            305
> - # define SSL_F_DTLS1_OUTPUT_CERT_CHAIN                    255
> - # define SSL_F_DTLS1_PREPROCESS_FRAGMENT                  288
> --# define SSL_F_DTLS1_PROCESS_BUFFERED_RECORDS             404
> -+# define SSL_F_DTLS1_PROCESS_BUFFERED_RECORDS             424
> - # define SSL_F_DTLS1_PROCESS_OUT_OF_SEQ_MESSAGE           256
> - # define SSL_F_DTLS1_PROCESS_RECORD                       257
> - # define SSL_F_DTLS1_READ_BYTES                           258
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
> deleted file mode 100644
> index 5995cbe..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From e36f27ddb80a48e579783bc29fb3758988342b71 Mon Sep 17 00:00:00 2001
> -From: "Dr. Stephen Henson" <steve@openssl.org>
> -Date: Fri, 5 Aug 2016 14:26:03 +0100
> -Subject: [PATCH] Check for errors in BN_bn2dec()
> -
> -If an oversize BIGNUM is presented to BN_bn2dec() it can cause
> -BN_div_word() to fail and not reduce the value of 't' resulting
> -in OOB writes to the bn_data buffer and eventually crashing.
> -
> -Fix by checking return value of BN_div_word() and checking writes
> -don't overflow buffer.
> -
> -Thanks to Shi Lei for reporting this bug.
> -
> -CVE-2016-2182
> -
> -Reviewed-by: Tim Hudson <tjh@openssl.org>
> -(cherry picked from commit 07bed46f332fce8c1d157689a2cdf915a982ae34)
> -
> -Conflicts:
> -	crypto/bn/bn_print.c
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2182
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - crypto/bn/bn_print.c | 11 ++++++++---
> - 1 file changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/crypto/bn/bn_print.c b/crypto/bn/bn_print.c
> -index bfa31ef..b44403e 100644
> ---- a/crypto/bn/bn_print.c
> -+++ b/crypto/bn/bn_print.c
> -@@ -111,6 +111,7 @@ char *BN_bn2dec(const BIGNUM *a)
> -     char *p;
> -     BIGNUM *t = NULL;
> -     BN_ULONG *bn_data = NULL, *lp;
> -+    int bn_data_num;
> - 
> -     /*-
> -      * get an upper bound for the length of the decimal integer
> -@@ -120,9 +121,9 @@ char *BN_bn2dec(const BIGNUM *a)
> -      */
> -     i = BN_num_bits(a) * 3;
> -     num = (i / 10 + i / 1000 + 1) + 1;
> --    bn_data =
> --        (BN_ULONG *)OPENSSL_malloc((num / BN_DEC_NUM + 1) * sizeof(BN_ULONG));
> --    buf = (char *)OPENSSL_malloc(num + 3);
> -+    bn_data_num = num / BN_DEC_NUM + 1;
> -+    bn_data = OPENSSL_malloc(bn_data_num * sizeof(BN_ULONG));
> -+    buf = OPENSSL_malloc(num + 3);
> -     if ((buf == NULL) || (bn_data == NULL)) {
> -         BNerr(BN_F_BN_BN2DEC, ERR_R_MALLOC_FAILURE);
> -         goto err;
> -@@ -143,7 +144,11 @@ char *BN_bn2dec(const BIGNUM *a)
> -         i = 0;
> -         while (!BN_is_zero(t)) {
> -             *lp = BN_div_word(t, BN_DEC_CONV);
> -+            if (*lp == (BN_ULONG)-1)
> -+                goto err;
> -             lp++;
> -+            if (lp - bn_data >= bn_data_num)
> -+                goto err;
> -         }
> -         lp--;
> -         /*
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
> deleted file mode 100644
> index a72ee70..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From baaabfd8fdcec04a691695fad9a664bea43202b6 Mon Sep 17 00:00:00 2001
> -From: "Dr. Stephen Henson" <steve@openssl.org>
> -Date: Tue, 23 Aug 2016 18:14:54 +0100
> -Subject: [PATCH] Sanity check ticket length.
> -
> -If a ticket callback changes the HMAC digest to SHA512 the existing
> -sanity checks are not sufficient and an attacker could perform a DoS
> -attack with a malformed ticket. Add additional checks based on
> -HMAC size.
> -
> -Thanks to Shi Lei for reporting this bug.
> -
> -CVE-2016-6302
> -
> -Reviewed-by: Rich Salz <rsalz@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-6302
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/t1_lib.c | 11 ++++++++---
> - 1 file changed, 8 insertions(+), 3 deletions(-)
> -
> -Index: openssl-1.0.2h/ssl/t1_lib.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/t1_lib.c
> -+++ openssl-1.0.2h/ssl/t1_lib.c
> -@@ -3397,9 +3397,7 @@ static int tls_decrypt_ticket(SSL *s, co
> -     HMAC_CTX hctx;
> -     EVP_CIPHER_CTX ctx;
> -     SSL_CTX *tctx = s->initial_ctx;
> --    /* Need at least keyname + iv + some encrypted data */
> --    if (eticklen < 48)
> --        return 2;
> -+
> -     /* Initialize session ticket encryption and HMAC contexts */
> -     HMAC_CTX_init(&hctx);
> -     EVP_CIPHER_CTX_init(&ctx);
> -@@ -3433,6 +3431,13 @@ static int tls_decrypt_ticket(SSL *s, co
> -     if (mlen < 0) {
> -         goto err;
> -     }
> -+    /* Sanity check ticket length: must exceed keyname + IV + HMAC */
> -+    if (eticklen <= 16 + EVP_CIPHER_CTX_iv_length(&ctx) + mlen) {
> -+        HMAC_CTX_cleanup(&hctx);
> -+        EVP_CIPHER_CTX_cleanup(&ctx);
> -+        return 2;
> -+    }
> -+
> -     eticklen -= mlen;
> -     /* Check HMAC of encrypted ticket */
> -     if (HMAC_Update(&hctx, etick, eticklen) <= 0
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
> deleted file mode 100644
> index 95bdec4..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 1027ad4f34c30b8585592764b9a670ba36888269 Mon Sep 17 00:00:00 2001
> -From: "Dr. Stephen Henson" <steve@openssl.org>
> -Date: Fri, 19 Aug 2016 23:28:29 +0100
> -Subject: [PATCH] Avoid overflow in MDC2_Update()
> -
> -Thanks to Shi Lei for reporting this issue.
> -
> -CVE-2016-6303
> -
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -(cherry picked from commit 55d83bf7c10c7b205fffa23fa7c3977491e56c07)
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-6303
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - crypto/mdc2/mdc2dgst.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/crypto/mdc2/mdc2dgst.c b/crypto/mdc2/mdc2dgst.c
> -index 6615cf8..2dce493 100644
> ---- a/crypto/mdc2/mdc2dgst.c
> -+++ b/crypto/mdc2/mdc2dgst.c
> -@@ -91,7 +91,7 @@ int MDC2_Update(MDC2_CTX *c, const unsigned char *in, size_t len)
> - 
> -     i = c->num;
> -     if (i != 0) {
> --        if (i + len < MDC2_BLOCK) {
> -+        if (len < MDC2_BLOCK - i) {
> -             /* partial block */
> -             memcpy(&(c->data[i]), in, len);
> -             c->num += (int)len;
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
> deleted file mode 100644
> index 64508b5..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From ea39b16b71e4e72a228a4535bd6d6a02c5edbc1f Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Fri, 9 Sep 2016 10:08:45 +0100
> -Subject: [PATCH] Fix OCSP Status Request extension unbounded memory growth
> -
> -A malicious client can send an excessively large OCSP Status Request
> -extension. If that client continually requests renegotiation,
> -sending a large OCSP Status Request extension each time, then there will
> -be unbounded memory growth on the server. This will eventually lead to a
> -Denial Of Service attack through memory exhaustion. Servers with a
> -default configuration are vulnerable even if they do not support OCSP.
> -Builds using the "no-ocsp" build time option are not affected.
> -
> -I have also checked other extensions to see if they suffer from a similar
> -problem but I could not find any other issues.
> -
> -CVE-2016-6304
> -
> -Issue reported by Shi Lei.
> -
> -Reviewed-by: Rich Salz <rsalz@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-6304
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/t1_lib.c | 24 +++++++++++++++++-------
> - 1 file changed, 17 insertions(+), 7 deletions(-)
> -
> -diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
> -index fbcf2e6..e4b4e27 100644
> ---- a/ssl/t1_lib.c
> -+++ b/ssl/t1_lib.c
> -@@ -2316,6 +2316,23 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
> -                 size -= 2;
> -                 if (dsize > size)
> -                     goto err;
> -+
> -+                /*
> -+                 * We remove any OCSP_RESPIDs from a previous handshake
> -+                 * to prevent unbounded memory growth - CVE-2016-6304
> -+                 */
> -+                sk_OCSP_RESPID_pop_free(s->tlsext_ocsp_ids,
> -+                                        OCSP_RESPID_free);
> -+                if (dsize > 0) {
> -+                    s->tlsext_ocsp_ids = sk_OCSP_RESPID_new_null();
> -+                    if (s->tlsext_ocsp_ids == NULL) {
> -+                        *al = SSL_AD_INTERNAL_ERROR;
> -+                        return 0;
> -+                    }
> -+                } else {
> -+                    s->tlsext_ocsp_ids = NULL;
> -+                }
> -+
> -                 while (dsize > 0) {
> -                     OCSP_RESPID *id;
> -                     int idsize;
> -@@ -2335,13 +2352,6 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
> -                         OCSP_RESPID_free(id);
> -                         goto err;
> -                     }
> --                    if (!s->tlsext_ocsp_ids
> --                        && !(s->tlsext_ocsp_ids =
> --                             sk_OCSP_RESPID_new_null())) {
> --                        OCSP_RESPID_free(id);
> --                        *al = SSL_AD_INTERNAL_ERROR;
> --                        return 0;
> --                    }
> -                     if (!sk_OCSP_RESPID_push(s->tlsext_ocsp_ids, id)) {
> -                         OCSP_RESPID_free(id);
> -                         *al = SSL_AD_INTERNAL_ERROR;
> --- 
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
> deleted file mode 100644
> index 9e7d576..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From ff553f837172ecb2b5c8eca257ec3c5619a4b299 Mon Sep 17 00:00:00 2001
> -From: "Dr. Stephen Henson" <steve@openssl.org>
> -Date: Sat, 17 Sep 2016 12:36:58 +0100
> -Subject: [PATCH] Fix small OOB reads.
> -
> -In ssl3_get_client_certificate, ssl3_get_server_certificate and
> -ssl3_get_certificate_request check we have enough room
> -before reading a length.
> -
> -Thanks to Shi Lei (Gear Team, Qihoo 360 Inc.) for reporting these bugs.
> -
> -CVE-2016-6306
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-6306
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/s3_clnt.c | 11 +++++++++++
> - ssl/s3_srvr.c |  6 ++++++
> - 2 files changed, 17 insertions(+)
> -
> -Index: openssl-1.0.2h/ssl/s3_clnt.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/s3_clnt.c
> -+++ openssl-1.0.2h/ssl/s3_clnt.c
> -@@ -1216,6 +1216,12 @@ int ssl3_get_server_certificate(SSL *s)
> -         goto f_err;
> -     }
> -     for (nc = 0; nc < llen;) {
> -+        if (nc + 3 > llen) {
> -+            al = SSL_AD_DECODE_ERROR;
> -+            SSLerr(SSL_F_SSL3_GET_SERVER_CERTIFICATE,
> -+                   SSL_R_CERT_LENGTH_MISMATCH);
> -+            goto f_err;
> -+        }
> -         n2l3(p, l);
> -         if ((l + nc + 3) > llen) {
> -             al = SSL_AD_DECODE_ERROR;
> -@@ -2167,6 +2173,11 @@ int ssl3_get_certificate_request(SSL *s)
> -     }
> - 
> -     for (nc = 0; nc < llen;) {
> -+        if (nc + 2 > llen) {
> -+            ssl3_send_alert(s, SSL3_AL_FATAL, SSL_AD_DECODE_ERROR);
> -+            SSLerr(SSL_F_SSL3_GET_CERTIFICATE_REQUEST, SSL_R_CA_DN_TOO_LONG);
> -+            goto err;
> -+        }
> -         n2s(p, l);
> -         if ((l + nc + 2) > llen) {
> -             if ((s->options & SSL_OP_NETSCAPE_CA_DN_BUG))
> -Index: openssl-1.0.2h/ssl/s3_srvr.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/s3_srvr.c
> -+++ openssl-1.0.2h/ssl/s3_srvr.c
> -@@ -3213,6 +3213,12 @@ int ssl3_get_client_certificate(SSL *s)
> -         goto f_err;
> -     }
> -     for (nc = 0; nc < llen;) {
> -+        if (nc + 3 > llen) {
> -+            al = SSL_AD_DECODE_ERROR;
> -+            SSLerr(SSL_F_SSL3_GET_CLIENT_CERTIFICATE,
> -+                   SSL_R_CERT_LENGTH_MISMATCH);
> -+            goto f_err;
> -+        }
> -         n2l3(p, l);
> -         if ((l + nc + 3) > llen) {
> -             al = SSL_AD_DECODE_ERROR;
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
> deleted file mode 100644
> index c2af589..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 22646a075e75991b4e8f5d67171e45a6aead5b48 Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Wed, 21 Sep 2016 14:48:16 +0100
> -Subject: [PATCH] Don't allow too many consecutive warning alerts
> -
> -Certain warning alerts are ignored if they are received. This can mean that
> -no progress will be made if one peer continually sends those warning alerts.
> -Implement a count so that we abort the connection if we receive too many.
> -
> -Issue reported by Shi Lei.
> -
> -Reviewed-by: Rich Salz <rsalz@openssl.org>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-8610
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - ssl/d1_pkt.c   | 15 +++++++++++++++
> - ssl/s3_pkt.c   | 15 +++++++++++++++
> - ssl/ssl.h      |  1 +
> - ssl/ssl_locl.h |  4 ++++
> - 4 files changed, 35 insertions(+)
> -
> -Index: openssl-1.0.2h/ssl/d1_pkt.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/d1_pkt.c
> -+++ openssl-1.0.2h/ssl/d1_pkt.c
> -@@ -928,6 +928,13 @@ int dtls1_read_bytes(SSL *s, int type, u
> -         goto start;
> -     }
> - 
> -+    /*
> -+     * Reset the count of consecutive warning alerts if we've got a non-empty
> -+     * record that isn't an alert.
> -+     */
> -+    if (rr->type != SSL3_RT_ALERT && rr->length != 0)
> -+        s->cert->alert_count = 0;
> -+
> -     /* we now have a packet which can be read and processed */
> - 
> -     if (s->s3->change_cipher_spec /* set when we receive ChangeCipherSpec,
> -@@ -1194,6 +1201,14 @@ int dtls1_read_bytes(SSL *s, int type, u
> - 
> -         if (alert_level == SSL3_AL_WARNING) {
> -             s->s3->warn_alert = alert_descr;
> -+
> -+            s->cert->alert_count++;
> -+            if (s->cert->alert_count == MAX_WARN_ALERT_COUNT) {
> -+                al = SSL_AD_UNEXPECTED_MESSAGE;
> -+                SSLerr(SSL_F_DTLS1_READ_BYTES, SSL_R_TOO_MANY_WARN_ALERTS);
> -+                goto f_err;
> -+            }
> -+
> -             if (alert_descr == SSL_AD_CLOSE_NOTIFY) {
> - #ifndef OPENSSL_NO_SCTP
> -                 /*
> -Index: openssl-1.0.2h/ssl/s3_pkt.c
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/s3_pkt.c
> -+++ openssl-1.0.2h/ssl/s3_pkt.c
> -@@ -1229,6 +1229,13 @@ int ssl3_read_bytes(SSL *s, int type, un
> -             return (ret);
> -     }
> - 
> -+    /*
> -+     * Reset the count of consecutive warning alerts if we've got a non-empty
> -+     * record that isn't an alert.
> -+     */
> -+    if (rr->type != SSL3_RT_ALERT && rr->length != 0)
> -+        s->cert->alert_count = 0;
> -+
> -     /* we now have a packet which can be read and processed */
> - 
> -     if (s->s3->change_cipher_spec /* set when we receive ChangeCipherSpec,
> -@@ -1443,6 +1450,14 @@ int ssl3_read_bytes(SSL *s, int type, un
> - 
> -         if (alert_level == SSL3_AL_WARNING) {
> -             s->s3->warn_alert = alert_descr;
> -+
> -+            s->cert->alert_count++;
> -+            if (s->cert->alert_count == MAX_WARN_ALERT_COUNT) {
> -+                al = SSL_AD_UNEXPECTED_MESSAGE;
> -+                SSLerr(SSL_F_SSL3_READ_BYTES, SSL_R_TOO_MANY_WARN_ALERTS);
> -+                goto f_err;
> -+            }
> -+
> -             if (alert_descr == SSL_AD_CLOSE_NOTIFY) {
> -                 s->shutdown |= SSL_RECEIVED_SHUTDOWN;
> -                 return (0);
> -Index: openssl-1.0.2h/ssl/ssl.h
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/ssl.h
> -+++ openssl-1.0.2h/ssl/ssl.h
> -@@ -3115,6 +3115,7 @@ void ERR_load_SSL_strings(void);
> - # define SSL_R_TLS_INVALID_ECPOINTFORMAT_LIST             157
> - # define SSL_R_TLS_PEER_DID_NOT_RESPOND_WITH_CERTIFICATE_LIST 233
> - # define SSL_R_TLS_RSA_ENCRYPTED_VALUE_LENGTH_IS_WRONG    234
> -+# define SSL_R_TOO_MANY_WARN_ALERTS                       409
> - # define SSL_R_TRIED_TO_USE_UNSUPPORTED_CIPHER            235
> - # define SSL_R_UNABLE_TO_DECODE_DH_CERTS                  236
> - # define SSL_R_UNABLE_TO_DECODE_ECDH_CERTS                313
> -Index: openssl-1.0.2h/ssl/ssl_locl.h
> -===================================================================
> ---- openssl-1.0.2h.orig/ssl/ssl_locl.h
> -+++ openssl-1.0.2h/ssl/ssl_locl.h
> -@@ -585,6 +585,8 @@ typedef struct {
> -  */
> - # define SSL_EXT_FLAG_SENT       0x2
> - 
> -+# define MAX_WARN_ALERT_COUNT    5
> -+
> - typedef struct {
> -     custom_ext_method *meths;
> -     size_t meths_count;
> -@@ -692,6 +694,8 @@ typedef struct cert_st {
> -     unsigned char *alpn_proposed;   /* server */
> -     unsigned int alpn_proposed_len;
> -     int alpn_sent;                  /* client */
> -+    /* Count of the number of consecutive warning alerts received */
> -+    unsigned int alert_count;
> - } CERT;
> - 
> - typedef struct sess_cert_st {
> diff --git a/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
> new file mode 100644
> index 0000000..58c9ee7
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
> @@ -0,0 +1,69 @@
> +From d795f5f20a29adecf92c09459a3ee07ffac01a99 Mon Sep 17 00:00:00 2001
> +From: Rich Salz <rsalz@akamai.com>
> +Date: Sat, 13 Jun 2015 17:03:39 -0400
> +Subject: [PATCH] Use SHA256 not MD5 as default digest.
> +
> +Commit f8547f62c212837dbf44fb7e2755e5774a59a57b upstream.
> +
> +Upstream-Status: Backport
> +Backport from OpenSSL 2.0 to OpenSSL 1.0.2
> +Commit f8547f62c212837dbf44fb7e2755e5774a59a57b   
> +
> +CVE: CVE-2004-2761
> +
> +    The MD5 Message-Digest Algorithm is not collision resistant,
> +    which makes it easier for context-dependent attackers to            
> +    conduct spoofing attacks, as demonstrated by attacks on the     
> +    use of MD5 in the signature algorithm of an X.509 certificate.     
> +
> +Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
> +Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>     
> +Signed-off-by: T.O. Radzy Radzykewycz <radzy@windriver.com> 
> +---
> + apps/ca.c   | 2 +-
> + apps/dgst.c | 2 +-
> + apps/enc.c  | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/apps/ca.c b/apps/ca.c
> +index 3b7336c..8f3a84b 100644
> +--- a/apps/ca.c
> ++++ b/apps/ca.c
> +@@ -1612,7 +1612,7 @@ static int certify_cert(X509 **xret, char *infile, EVP_PKEY *pkey, X509 *x509,
> +     } else
> +         BIO_printf(bio_err, "Signature ok\n");
> + 
> +-    if ((rreq = X509_to_X509_REQ(req, NULL, EVP_md5())) == NULL)
> ++    if ((rreq = X509_to_X509_REQ(req, NULL, NULL)) == NULL)
> +         goto err;
> + 
> +     ok = do_body(xret, pkey, x509, dgst, sigopts, policy, db, serial, subj,
> +diff --git a/apps/dgst.c b/apps/dgst.c
> +index 95e5fa3..0d1529f 100644
> +--- a/apps/dgst.c
> ++++ b/apps/dgst.c
> +@@ -442,7 +442,7 @@ int MAIN(int argc, char **argv)
> +             goto end;
> +         }
> +         if (md == NULL)
> +-            md = EVP_md5();
> ++            md = EVP_sha256();
> +         if (!EVP_DigestInit_ex(mctx, md, impl)) {
> +             BIO_printf(bio_err, "Error setting digest %s\n", pname);
> +             ERR_print_errors(bio_err);
> +diff --git a/apps/enc.c b/apps/enc.c
> +index 7b7c70b..a7d944c 100644
> +--- a/apps/enc.c
> ++++ b/apps/enc.c
> +@@ -344,7 +344,7 @@ int MAIN(int argc, char **argv)
> +     }
> + 
> +     if (dgst == NULL) {
> +-        dgst = EVP_md5();
> ++        dgst = EVP_sha256();
> +     }
> + 
> +     if (bufsize != NULL) {
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch b/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
> deleted file mode 100644
> index 7ba9eab..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upsteram Status: Backport
> -
> -When building on x32 systems where the default type is 32bit, make sure
> -we can transparently represent 64bit integers.  Otherwise we end up with
> -build errors like:
> -/usr/bin/perl asm/ghash-x86_64.pl elf > ghash-x86_64.s
> -Integer overflow in hexadecimal number at asm/../../perlasm/x86_64-xlate.pl line 201, <> line 890.
> -...
> -ghash-x86_64.s: Assembler messages:
> -ghash-x86_64.s:890: Error: junk '.15473355479995e+19' after expression
> -
> -We don't enable this globally as there are some cases where we'd get
> -32bit values interpreted as unsigned when we need them as signed.
> -
> -Reported-by: Bertrand Jacquin <bertrand@jacquin.bzh>
> -URL: https://bugs.gentoo.org/542618
> -
> -Signed-off-By: Armin Kuster <akuster@mvista.com>
> -
> -diff --git a/crypto/perlasm/x86_64-xlate.pl b/crypto/perlasm/x86_64-xlate.pl
> ---- a/crypto/perlasm/x86_64-xlate.pl
> -+++ b/crypto/perlasm/x86_64-xlate.pl
> -@@ -196,6 +196,10 @@ my %globals;
> -     	my $self = shift;
> - 
> - 	$self->{value} =~ s/\b(0b[0-1]+)/oct($1)/eig;
> -+	# When building on x32 ABIs, the expanded hex value might be too
> -+	# big to fit into 32bits. Enable transparent 64bit support here
> -+	# so we can safely print it out.
> -+	use bigint;
> - 	if ($gas) {
> - 	    # Solaris /usr/ccs/bin/as can't handle multiplications
> - 	    # in $self->{value}
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
> index aba4d42..fb745e4 100644
> --- a/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/debian/ca.patch
> @@ -7,7 +7,7 @@ Index: openssl-0.9.8m/apps/CA.pl.in
>  @@ -65,6 +65,7 @@
>   foreach (@ARGV) {
>   	if ( /^(-\?|-h|-help)$/ ) {
> - 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
> + 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-signcert|-verify\n";
>  +	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
>   	    exit 0;
>   	} elsif (/^-newcert$/) {
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
> new file mode 100644
> index 0000000..a249180
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
> @@ -0,0 +1,4663 @@
> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure
> +===================================================================
> +--- openssl-1.0.2~beta1.obsolete.0.0498436515490575.orig/Configure	2014-02-24 21:02:30.000000000 +0100
> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure	2014-02-24 21:02:30.000000000 +0100
> +@@ -1651,6 +1651,8 @@
> + 		}
> + 	}
> + 
> ++$shared_ldflag .= " -Wl,--version-script=openssl.ld";
> ++
> + open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
> + unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
> + open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
> +===================================================================
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld	2014-02-24 22:19:08.601827266 +0100
> +@@ -0,0 +1,4615 @@
> ++OPENSSL_1.0.0 {
> ++	global:
> ++		BIO_f_ssl;
> ++		BIO_new_buffer_ssl_connect;
> ++		BIO_new_ssl;
> ++		BIO_new_ssl_connect;
> ++		BIO_proxy_ssl_copy_session_id;
> ++		BIO_ssl_copy_session_id;
> ++		BIO_ssl_shutdown;
> ++		d2i_SSL_SESSION;
> ++		DTLSv1_client_method;
> ++		DTLSv1_method;
> ++		DTLSv1_server_method;
> ++		ERR_load_SSL_strings;
> ++		i2d_SSL_SESSION;
> ++		kssl_build_principal_2;
> ++		kssl_cget_tkt;
> ++		kssl_check_authent;
> ++		kssl_ctx_free;
> ++		kssl_ctx_new;
> ++		kssl_ctx_setkey;
> ++		kssl_ctx_setprinc;
> ++		kssl_ctx_setstring;
> ++		kssl_ctx_show;
> ++		kssl_err_set;
> ++		kssl_krb5_free_data_contents;
> ++		kssl_sget_tkt;
> ++		kssl_skip_confound;
> ++		kssl_validate_times;
> ++		PEM_read_bio_SSL_SESSION;
> ++		PEM_read_SSL_SESSION;
> ++		PEM_write_bio_SSL_SESSION;
> ++		PEM_write_SSL_SESSION;
> ++		SSL_accept;
> ++		SSL_add_client_CA;
> ++		SSL_add_dir_cert_subjects_to_stack;
> ++		SSL_add_dir_cert_subjs_to_stk;
> ++		SSL_add_file_cert_subjects_to_stack;
> ++		SSL_add_file_cert_subjs_to_stk;
> ++		SSL_alert_desc_string;
> ++		SSL_alert_desc_string_long;
> ++		SSL_alert_type_string;
> ++		SSL_alert_type_string_long;
> ++		SSL_callback_ctrl;
> ++		SSL_check_private_key;
> ++		SSL_CIPHER_description;
> ++		SSL_CIPHER_get_bits;
> ++		SSL_CIPHER_get_name;
> ++		SSL_CIPHER_get_version;
> ++		SSL_clear;
> ++		SSL_COMP_add_compression_method;
> ++		SSL_COMP_get_compression_methods;
> ++		SSL_COMP_get_compress_methods;
> ++		SSL_COMP_get_name;
> ++		SSL_connect;
> ++		SSL_copy_session_id;
> ++		SSL_ctrl;
> ++		SSL_CTX_add_client_CA;
> ++		SSL_CTX_add_session;
> ++		SSL_CTX_callback_ctrl;
> ++		SSL_CTX_check_private_key;
> ++		SSL_CTX_ctrl;
> ++		SSL_CTX_flush_sessions;
> ++		SSL_CTX_free;
> ++		SSL_CTX_get_cert_store;
> ++		SSL_CTX_get_client_CA_list;
> ++		SSL_CTX_get_client_cert_cb;
> ++		SSL_CTX_get_ex_data;
> ++		SSL_CTX_get_ex_new_index;
> ++		SSL_CTX_get_info_callback;
> ++		SSL_CTX_get_quiet_shutdown;
> ++		SSL_CTX_get_timeout;
> ++		SSL_CTX_get_verify_callback;
> ++		SSL_CTX_get_verify_depth;
> ++		SSL_CTX_get_verify_mode;
> ++		SSL_CTX_load_verify_locations;
> ++		SSL_CTX_new;
> ++		SSL_CTX_remove_session;
> ++		SSL_CTX_sess_get_get_cb;
> ++		SSL_CTX_sess_get_new_cb;
> ++		SSL_CTX_sess_get_remove_cb;
> ++		SSL_CTX_sessions;
> ++		SSL_CTX_sess_set_get_cb;
> ++		SSL_CTX_sess_set_new_cb;
> ++		SSL_CTX_sess_set_remove_cb;
> ++		SSL_CTX_set1_param;
> ++		SSL_CTX_set_cert_store;
> ++		SSL_CTX_set_cert_verify_callback;
> ++		SSL_CTX_set_cert_verify_cb;
> ++		SSL_CTX_set_cipher_list;
> ++		SSL_CTX_set_client_CA_list;
> ++		SSL_CTX_set_client_cert_cb;
> ++		SSL_CTX_set_client_cert_engine;
> ++		SSL_CTX_set_cookie_generate_cb;
> ++		SSL_CTX_set_cookie_verify_cb;
> ++		SSL_CTX_set_default_passwd_cb;
> ++		SSL_CTX_set_default_passwd_cb_userdata;
> ++		SSL_CTX_set_default_verify_paths;
> ++		SSL_CTX_set_def_passwd_cb_ud;
> ++		SSL_CTX_set_def_verify_paths;
> ++		SSL_CTX_set_ex_data;
> ++		SSL_CTX_set_generate_session_id;
> ++		SSL_CTX_set_info_callback;
> ++		SSL_CTX_set_msg_callback;
> ++		SSL_CTX_set_psk_client_callback;
> ++		SSL_CTX_set_psk_server_callback;
> ++		SSL_CTX_set_purpose;
> ++		SSL_CTX_set_quiet_shutdown;
> ++		SSL_CTX_set_session_id_context;
> ++		SSL_CTX_set_ssl_version;
> ++		SSL_CTX_set_timeout;
> ++		SSL_CTX_set_tmp_dh_callback;
> ++		SSL_CTX_set_tmp_ecdh_callback;
> ++		SSL_CTX_set_tmp_rsa_callback;
> ++		SSL_CTX_set_trust;
> ++		SSL_CTX_set_verify;
> ++		SSL_CTX_set_verify_depth;
> ++		SSL_CTX_use_cert_chain_file;
> ++		SSL_CTX_use_certificate;
> ++		SSL_CTX_use_certificate_ASN1;
> ++		SSL_CTX_use_certificate_chain_file;
> ++		SSL_CTX_use_certificate_file;
> ++		SSL_CTX_use_PrivateKey;
> ++		SSL_CTX_use_PrivateKey_ASN1;
> ++		SSL_CTX_use_PrivateKey_file;
> ++		SSL_CTX_use_psk_identity_hint;
> ++		SSL_CTX_use_RSAPrivateKey;
> ++		SSL_CTX_use_RSAPrivateKey_ASN1;
> ++		SSL_CTX_use_RSAPrivateKey_file;
> ++		SSL_do_handshake;
> ++		SSL_dup;
> ++		SSL_dup_CA_list;
> ++		SSLeay_add_ssl_algorithms;
> ++		SSL_free;
> ++		SSL_get1_session;
> ++		SSL_get_certificate;
> ++		SSL_get_cipher_list;
> ++		SSL_get_ciphers;
> ++		SSL_get_client_CA_list;
> ++		SSL_get_current_cipher;
> ++		SSL_get_current_compression;
> ++		SSL_get_current_expansion;
> ++		SSL_get_default_timeout;
> ++		SSL_get_error;
> ++		SSL_get_ex_data;
> ++		SSL_get_ex_data_X509_STORE_CTX_idx;
> ++		SSL_get_ex_d_X509_STORE_CTX_idx;
> ++		SSL_get_ex_new_index;
> ++		SSL_get_fd;
> ++		SSL_get_finished;
> ++		SSL_get_info_callback;
> ++		SSL_get_peer_cert_chain;
> ++		SSL_get_peer_certificate;
> ++		SSL_get_peer_finished;
> ++		SSL_get_privatekey;
> ++		SSL_get_psk_identity;
> ++		SSL_get_psk_identity_hint;
> ++		SSL_get_quiet_shutdown;
> ++		SSL_get_rbio;
> ++		SSL_get_read_ahead;
> ++		SSL_get_rfd;
> ++		SSL_get_servername;
> ++		SSL_get_servername_type;
> ++		SSL_get_session;
> ++		SSL_get_shared_ciphers;
> ++		SSL_get_shutdown;
> ++		SSL_get_SSL_CTX;
> ++		SSL_get_ssl_method;
> ++		SSL_get_verify_callback;
> ++		SSL_get_verify_depth;
> ++		SSL_get_verify_mode;
> ++		SSL_get_verify_result;
> ++		SSL_get_version;
> ++		SSL_get_wbio;
> ++		SSL_get_wfd;
> ++		SSL_has_matching_session_id;
> ++		SSL_library_init;
> ++		SSL_load_client_CA_file;
> ++		SSL_load_error_strings;
> ++		SSL_new;
> ++		SSL_peek;
> ++		SSL_pending;
> ++		SSL_read;
> ++		SSL_renegotiate;
> ++		SSL_renegotiate_pending;
> ++		SSL_rstate_string;
> ++		SSL_rstate_string_long;
> ++		SSL_SESSION_cmp;
> ++		SSL_SESSION_free;
> ++		SSL_SESSION_get_ex_data;
> ++		SSL_SESSION_get_ex_new_index;
> ++		SSL_SESSION_get_id;
> ++		SSL_SESSION_get_time;
> ++		SSL_SESSION_get_timeout;
> ++		SSL_SESSION_hash;
> ++		SSL_SESSION_new;
> ++		SSL_SESSION_print;
> ++		SSL_SESSION_print_fp;
> ++		SSL_SESSION_set_ex_data;
> ++		SSL_SESSION_set_time;
> ++		SSL_SESSION_set_timeout;
> ++		SSL_set1_param;
> ++		SSL_set_accept_state;
> ++		SSL_set_bio;
> ++		SSL_set_cipher_list;
> ++		SSL_set_client_CA_list;
> ++		SSL_set_connect_state;
> ++		SSL_set_ex_data;
> ++		SSL_set_fd;
> ++		SSL_set_generate_session_id;
> ++		SSL_set_info_callback;
> ++		SSL_set_msg_callback;
> ++		SSL_set_psk_client_callback;
> ++		SSL_set_psk_server_callback;
> ++		SSL_set_purpose;
> ++		SSL_set_quiet_shutdown;
> ++		SSL_set_read_ahead;
> ++		SSL_set_rfd;
> ++		SSL_set_session;
> ++		SSL_set_session_id_context;
> ++		SSL_set_session_secret_cb;
> ++		SSL_set_session_ticket_ext;
> ++		SSL_set_session_ticket_ext_cb;
> ++		SSL_set_shutdown;
> ++		SSL_set_SSL_CTX;
> ++		SSL_set_ssl_method;
> ++		SSL_set_tmp_dh_callback;
> ++		SSL_set_tmp_ecdh_callback;
> ++		SSL_set_tmp_rsa_callback;
> ++		SSL_set_trust;
> ++		SSL_set_verify;
> ++		SSL_set_verify_depth;
> ++		SSL_set_verify_result;
> ++		SSL_set_wfd;
> ++		SSL_shutdown;
> ++		SSL_state;
> ++		SSL_state_string;
> ++		SSL_state_string_long;
> ++		SSL_use_certificate;
> ++		SSL_use_certificate_ASN1;
> ++		SSL_use_certificate_file;
> ++		SSL_use_PrivateKey;
> ++		SSL_use_PrivateKey_ASN1;
> ++		SSL_use_PrivateKey_file;
> ++		SSL_use_psk_identity_hint;
> ++		SSL_use_RSAPrivateKey;
> ++		SSL_use_RSAPrivateKey_ASN1;
> ++		SSL_use_RSAPrivateKey_file;
> ++		SSLv23_client_method;
> ++		SSLv23_method;
> ++		SSLv23_server_method;
> ++		SSLv2_client_method;
> ++		SSLv2_method;
> ++		SSLv2_server_method;
> ++		SSLv3_client_method;
> ++		SSLv3_method;
> ++		SSLv3_server_method;
> ++		SSL_version;
> ++		SSL_want;
> ++		SSL_write;
> ++		TLSv1_client_method;
> ++		TLSv1_method;
> ++		TLSv1_server_method;
> ++
> ++
> ++		SSLeay;
> ++		SSLeay_version;
> ++		ASN1_BIT_STRING_asn1_meth;
> ++		ASN1_HEADER_free;
> ++		ASN1_HEADER_new;
> ++		ASN1_IA5STRING_asn1_meth;
> ++		ASN1_INTEGER_get;
> ++		ASN1_INTEGER_set;
> ++		ASN1_INTEGER_to_BN;
> ++		ASN1_OBJECT_create;
> ++		ASN1_OBJECT_free;
> ++		ASN1_OBJECT_new;
> ++		ASN1_PRINTABLE_type;
> ++		ASN1_STRING_cmp;
> ++		ASN1_STRING_dup;
> ++		ASN1_STRING_free;
> ++		ASN1_STRING_new;
> ++		ASN1_STRING_print;
> ++		ASN1_STRING_set;
> ++		ASN1_STRING_type_new;
> ++		ASN1_TYPE_free;
> ++		ASN1_TYPE_new;
> ++		ASN1_UNIVERSALSTRING_to_string;
> ++		ASN1_UTCTIME_check;
> ++		ASN1_UTCTIME_print;
> ++		ASN1_UTCTIME_set;
> ++		ASN1_check_infinite_end;
> ++		ASN1_d2i_bio;
> ++		ASN1_d2i_fp;
> ++		ASN1_digest;
> ++		ASN1_dup;
> ++		ASN1_get_object;
> ++		ASN1_i2d_bio;
> ++		ASN1_i2d_fp;
> ++		ASN1_object_size;
> ++		ASN1_parse;
> ++		ASN1_put_object;
> ++		ASN1_sign;
> ++		ASN1_verify;
> ++		BF_cbc_encrypt;
> ++		BF_cfb64_encrypt;
> ++		BF_ecb_encrypt;
> ++		BF_encrypt;
> ++		BF_ofb64_encrypt;
> ++		BF_options;
> ++		BF_set_key;
> ++		BIO_CONNECT_free;
> ++		BIO_CONNECT_new;
> ++		BIO_accept;
> ++		BIO_ctrl;
> ++		BIO_int_ctrl;
> ++		BIO_debug_callback;
> ++		BIO_dump;
> ++		BIO_dup_chain;
> ++		BIO_f_base64;
> ++		BIO_f_buffer;
> ++		BIO_f_cipher;
> ++		BIO_f_md;
> ++		BIO_f_null;
> ++		BIO_f_proxy_server;
> ++		BIO_fd_non_fatal_error;
> ++		BIO_fd_should_retry;
> ++		BIO_find_type;
> ++		BIO_free;
> ++		BIO_free_all;
> ++		BIO_get_accept_socket;
> ++		BIO_get_filter_bio;
> ++		BIO_get_host_ip;
> ++		BIO_get_port;
> ++		BIO_get_retry_BIO;
> ++		BIO_get_retry_reason;
> ++		BIO_gethostbyname;
> ++		BIO_gets;
> ++		BIO_new;
> ++		BIO_new_accept;
> ++		BIO_new_connect;
> ++		BIO_new_fd;
> ++		BIO_new_file;
> ++		BIO_new_fp;
> ++		BIO_new_socket;
> ++		BIO_pop;
> ++		BIO_printf;
> ++		BIO_push;
> ++		BIO_puts;
> ++		BIO_read;
> ++		BIO_s_accept;
> ++		BIO_s_connect;
> ++		BIO_s_fd;
> ++		BIO_s_file;
> ++		BIO_s_mem;
> ++		BIO_s_null;
> ++		BIO_s_proxy_client;
> ++		BIO_s_socket;
> ++		BIO_set;
> ++		BIO_set_cipher;
> ++		BIO_set_tcp_ndelay;
> ++		BIO_sock_cleanup;
> ++		BIO_sock_error;
> ++		BIO_sock_init;
> ++		BIO_sock_non_fatal_error;
> ++		BIO_sock_should_retry;
> ++		BIO_socket_ioctl;
> ++		BIO_write;
> ++		BN_CTX_free;
> ++		BN_CTX_new;
> ++		BN_MONT_CTX_free;
> ++		BN_MONT_CTX_new;
> ++		BN_MONT_CTX_set;
> ++		BN_add;
> ++		BN_add_word;
> ++		BN_hex2bn;
> ++		BN_bin2bn;
> ++		BN_bn2hex;
> ++		BN_bn2bin;
> ++		BN_clear;
> ++		BN_clear_bit;
> ++		BN_clear_free;
> ++		BN_cmp;
> ++		BN_copy;
> ++		BN_div;
> ++		BN_div_word;
> ++		BN_dup;
> ++		BN_free;
> ++		BN_from_montgomery;
> ++		BN_gcd;
> ++		BN_generate_prime;
> ++		BN_get_word;
> ++		BN_is_bit_set;
> ++		BN_is_prime;
> ++		BN_lshift;
> ++		BN_lshift1;
> ++		BN_mask_bits;
> ++		BN_mod;
> ++		BN_mod_exp;
> ++		BN_mod_exp_mont;
> ++		BN_mod_exp_simple;
> ++		BN_mod_inverse;
> ++		BN_mod_mul;
> ++		BN_mod_mul_montgomery;
> ++		BN_mod_word;
> ++		BN_mul;
> ++		BN_new;
> ++		BN_num_bits;
> ++		BN_num_bits_word;
> ++		BN_options;
> ++		BN_print;
> ++		BN_print_fp;
> ++		BN_rand;
> ++		BN_reciprocal;
> ++		BN_rshift;
> ++		BN_rshift1;
> ++		BN_set_bit;
> ++		BN_set_word;
> ++		BN_sqr;
> ++		BN_sub;
> ++		BN_to_ASN1_INTEGER;
> ++		BN_ucmp;
> ++		BN_value_one;
> ++		BUF_MEM_free;
> ++		BUF_MEM_grow;
> ++		BUF_MEM_new;
> ++		BUF_strdup;
> ++		CONF_free;
> ++		CONF_get_number;
> ++		CONF_get_section;
> ++		CONF_get_string;
> ++		CONF_load;
> ++		CRYPTO_add_lock;
> ++		CRYPTO_dbg_free;
> ++		CRYPTO_dbg_malloc;
> ++		CRYPTO_dbg_realloc;
> ++		CRYPTO_dbg_remalloc;
> ++		CRYPTO_free;
> ++		CRYPTO_get_add_lock_callback;
> ++		CRYPTO_get_id_callback;
> ++		CRYPTO_get_lock_name;
> ++		CRYPTO_get_locking_callback;
> ++		CRYPTO_get_mem_functions;
> ++		CRYPTO_lock;
> ++		CRYPTO_malloc;
> ++		CRYPTO_mem_ctrl;
> ++		CRYPTO_mem_leaks;
> ++		CRYPTO_mem_leaks_cb;
> ++		CRYPTO_mem_leaks_fp;
> ++		CRYPTO_realloc;
> ++		CRYPTO_remalloc;
> ++		CRYPTO_set_add_lock_callback;
> ++		CRYPTO_set_id_callback;
> ++		CRYPTO_set_locking_callback;
> ++		CRYPTO_set_mem_functions;
> ++		CRYPTO_thread_id;
> ++		DH_check;
> ++		DH_compute_key;
> ++		DH_free;
> ++		DH_generate_key;
> ++		DH_generate_parameters;
> ++		DH_new;
> ++		DH_size;
> ++		DHparams_print;
> ++		DHparams_print_fp;
> ++		DSA_free;
> ++		DSA_generate_key;
> ++		DSA_generate_parameters;
> ++		DSA_is_prime;
> ++		DSA_new;
> ++		DSA_print;
> ++		DSA_print_fp;
> ++		DSA_sign;
> ++		DSA_sign_setup;
> ++		DSA_size;
> ++		DSA_verify;
> ++		DSAparams_print;
> ++		DSAparams_print_fp;
> ++		ERR_clear_error;
> ++		ERR_error_string;
> ++		ERR_free_strings;
> ++		ERR_func_error_string;
> ++		ERR_get_err_state_table;
> ++		ERR_get_error;
> ++		ERR_get_error_line;
> ++		ERR_get_state;
> ++		ERR_get_string_table;
> ++		ERR_lib_error_string;
> ++		ERR_load_ASN1_strings;
> ++		ERR_load_BIO_strings;
> ++		ERR_load_BN_strings;
> ++		ERR_load_BUF_strings;
> ++		ERR_load_CONF_strings;
> ++		ERR_load_DH_strings;
> ++		ERR_load_DSA_strings;
> ++		ERR_load_ERR_strings;
> ++		ERR_load_EVP_strings;
> ++		ERR_load_OBJ_strings;
> ++		ERR_load_PEM_strings;
> ++		ERR_load_PROXY_strings;
> ++		ERR_load_RSA_strings;
> ++		ERR_load_X509_strings;
> ++		ERR_load_crypto_strings;
> ++		ERR_load_strings;
> ++		ERR_peek_error;
> ++		ERR_peek_error_line;
> ++		ERR_print_errors;
> ++		ERR_print_errors_fp;
> ++		ERR_put_error;
> ++		ERR_reason_error_string;
> ++		ERR_remove_state;
> ++		EVP_BytesToKey;
> ++		EVP_CIPHER_CTX_cleanup;
> ++		EVP_CipherFinal;
> ++		EVP_CipherInit;
> ++		EVP_CipherUpdate;
> ++		EVP_DecodeBlock;
> ++		EVP_DecodeFinal;
> ++		EVP_DecodeInit;
> ++		EVP_DecodeUpdate;
> ++		EVP_DecryptFinal;
> ++		EVP_DecryptInit;
> ++		EVP_DecryptUpdate;
> ++		EVP_DigestFinal;
> ++		EVP_DigestInit;
> ++		EVP_DigestUpdate;
> ++		EVP_EncodeBlock;
> ++		EVP_EncodeFinal;
> ++		EVP_EncodeInit;
> ++		EVP_EncodeUpdate;
> ++		EVP_EncryptFinal;
> ++		EVP_EncryptInit;
> ++		EVP_EncryptUpdate;
> ++		EVP_OpenFinal;
> ++		EVP_OpenInit;
> ++		EVP_PKEY_assign;
> ++		EVP_PKEY_copy_parameters;
> ++		EVP_PKEY_free;
> ++		EVP_PKEY_missing_parameters;
> ++		EVP_PKEY_new;
> ++		EVP_PKEY_save_parameters;
> ++		EVP_PKEY_size;
> ++		EVP_PKEY_type;
> ++		EVP_SealFinal;
> ++		EVP_SealInit;
> ++		EVP_SignFinal;
> ++		EVP_VerifyFinal;
> ++		EVP_add_alias;
> ++		EVP_add_cipher;
> ++		EVP_add_digest;
> ++		EVP_bf_cbc;
> ++		EVP_bf_cfb64;
> ++		EVP_bf_ecb;
> ++		EVP_bf_ofb;
> ++		EVP_cleanup;
> ++		EVP_des_cbc;
> ++		EVP_des_cfb64;
> ++		EVP_des_ecb;
> ++		EVP_des_ede;
> ++		EVP_des_ede3;
> ++		EVP_des_ede3_cbc;
> ++		EVP_des_ede3_cfb64;
> ++		EVP_des_ede3_ofb;
> ++		EVP_des_ede_cbc;
> ++		EVP_des_ede_cfb64;
> ++		EVP_des_ede_ofb;
> ++		EVP_des_ofb;
> ++		EVP_desx_cbc;
> ++		EVP_dss;
> ++		EVP_dss1;
> ++		EVP_enc_null;
> ++		EVP_get_cipherbyname;
> ++		EVP_get_digestbyname;
> ++		EVP_get_pw_prompt;
> ++		EVP_idea_cbc;
> ++		EVP_idea_cfb64;
> ++		EVP_idea_ecb;
> ++		EVP_idea_ofb;
> ++		EVP_md2;
> ++		EVP_md5;
> ++		EVP_md_null;
> ++		EVP_rc2_cbc;
> ++		EVP_rc2_cfb64;
> ++		EVP_rc2_ecb;
> ++		EVP_rc2_ofb;
> ++		EVP_rc4;
> ++		EVP_read_pw_string;
> ++		EVP_set_pw_prompt;
> ++		EVP_sha;
> ++		EVP_sha1;
> ++		MD2;
> ++		MD2_Final;
> ++		MD2_Init;
> ++		MD2_Update;
> ++		MD2_options;
> ++		MD5;
> ++		MD5_Final;
> ++		MD5_Init;
> ++		MD5_Update;
> ++		MDC2;
> ++		MDC2_Final;
> ++		MDC2_Init;
> ++		MDC2_Update;
> ++		NETSCAPE_SPKAC_free;
> ++		NETSCAPE_SPKAC_new;
> ++		NETSCAPE_SPKI_free;
> ++		NETSCAPE_SPKI_new;
> ++		NETSCAPE_SPKI_sign;
> ++		NETSCAPE_SPKI_verify;
> ++		OBJ_add_object;
> ++		OBJ_bsearch;
> ++		OBJ_cleanup;
> ++		OBJ_cmp;
> ++		OBJ_create;
> ++		OBJ_dup;
> ++		OBJ_ln2nid;
> ++		OBJ_new_nid;
> ++		OBJ_nid2ln;
> ++		OBJ_nid2obj;
> ++		OBJ_nid2sn;
> ++		OBJ_obj2nid;
> ++		OBJ_sn2nid;
> ++		OBJ_txt2nid;
> ++		PEM_ASN1_read;
> ++		PEM_ASN1_read_bio;
> ++		PEM_ASN1_write;
> ++		PEM_ASN1_write_bio;
> ++		PEM_SealFinal;
> ++		PEM_SealInit;
> ++		PEM_SealUpdate;
> ++		PEM_SignFinal;
> ++		PEM_SignInit;
> ++		PEM_SignUpdate;
> ++		PEM_X509_INFO_read;
> ++		PEM_X509_INFO_read_bio;
> ++		PEM_X509_INFO_write_bio;
> ++		PEM_dek_info;
> ++		PEM_do_header;
> ++		PEM_get_EVP_CIPHER_INFO;
> ++		PEM_proc_type;
> ++		PEM_read;
> ++		PEM_read_DHparams;
> ++		PEM_read_DSAPrivateKey;
> ++		PEM_read_DSAparams;
> ++		PEM_read_PKCS7;
> ++		PEM_read_PrivateKey;
> ++		PEM_read_RSAPrivateKey;
> ++		PEM_read_X509;
> ++		PEM_read_X509_CRL;
> ++		PEM_read_X509_REQ;
> ++		PEM_read_bio;
> ++		PEM_read_bio_DHparams;
> ++		PEM_read_bio_DSAPrivateKey;
> ++		PEM_read_bio_DSAparams;
> ++		PEM_read_bio_PKCS7;
> ++		PEM_read_bio_PrivateKey;
> ++		PEM_read_bio_RSAPrivateKey;
> ++		PEM_read_bio_X509;
> ++		PEM_read_bio_X509_CRL;
> ++		PEM_read_bio_X509_REQ;
> ++		PEM_write;
> ++		PEM_write_DHparams;
> ++		PEM_write_DSAPrivateKey;
> ++		PEM_write_DSAparams;
> ++		PEM_write_PKCS7;
> ++		PEM_write_PrivateKey;
> ++		PEM_write_RSAPrivateKey;
> ++		PEM_write_X509;
> ++		PEM_write_X509_CRL;
> ++		PEM_write_X509_REQ;
> ++		PEM_write_bio;
> ++		PEM_write_bio_DHparams;
> ++		PEM_write_bio_DSAPrivateKey;
> ++		PEM_write_bio_DSAparams;
> ++		PEM_write_bio_PKCS7;
> ++		PEM_write_bio_PrivateKey;
> ++		PEM_write_bio_RSAPrivateKey;
> ++		PEM_write_bio_X509;
> ++		PEM_write_bio_X509_CRL;
> ++		PEM_write_bio_X509_REQ;
> ++		PKCS7_DIGEST_free;
> ++		PKCS7_DIGEST_new;
> ++		PKCS7_ENCRYPT_free;
> ++		PKCS7_ENCRYPT_new;
> ++		PKCS7_ENC_CONTENT_free;
> ++		PKCS7_ENC_CONTENT_new;
> ++		PKCS7_ENVELOPE_free;
> ++		PKCS7_ENVELOPE_new;
> ++		PKCS7_ISSUER_AND_SERIAL_digest;
> ++		PKCS7_ISSUER_AND_SERIAL_free;
> ++		PKCS7_ISSUER_AND_SERIAL_new;
> ++		PKCS7_RECIP_INFO_free;
> ++		PKCS7_RECIP_INFO_new;
> ++		PKCS7_SIGNED_free;
> ++		PKCS7_SIGNED_new;
> ++		PKCS7_SIGNER_INFO_free;
> ++		PKCS7_SIGNER_INFO_new;
> ++		PKCS7_SIGN_ENVELOPE_free;
> ++		PKCS7_SIGN_ENVELOPE_new;
> ++		PKCS7_dup;
> ++		PKCS7_free;
> ++		PKCS7_new;
> ++		PROXY_ENTRY_add_noproxy;
> ++		PROXY_ENTRY_clear_noproxy;
> ++		PROXY_ENTRY_free;
> ++		PROXY_ENTRY_get_noproxy;
> ++		PROXY_ENTRY_new;
> ++		PROXY_ENTRY_set_server;
> ++		PROXY_add_noproxy;
> ++		PROXY_add_server;
> ++		PROXY_check_by_host;
> ++		PROXY_check_url;
> ++		PROXY_clear_noproxy;
> ++		PROXY_free;
> ++		PROXY_get_noproxy;
> ++		PROXY_get_proxies;
> ++		PROXY_get_proxy_entry;
> ++		PROXY_load_conf;
> ++		PROXY_new;
> ++		PROXY_print;
> ++		RAND_bytes;
> ++		RAND_cleanup;
> ++		RAND_file_name;
> ++		RAND_load_file;
> ++		RAND_screen;
> ++		RAND_seed;
> ++		RAND_write_file;
> ++		RC2_cbc_encrypt;
> ++		RC2_cfb64_encrypt;
> ++		RC2_ecb_encrypt;
> ++		RC2_encrypt;
> ++		RC2_ofb64_encrypt;
> ++		RC2_set_key;
> ++		RC4;
> ++		RC4_options;
> ++		RC4_set_key;
> ++		RSAPrivateKey_asn1_meth;
> ++		RSAPrivateKey_dup;
> ++		RSAPublicKey_dup;
> ++		RSA_PKCS1_SSLeay;
> ++		RSA_free;
> ++		RSA_generate_key;
> ++		RSA_new;
> ++		RSA_new_method;
> ++		RSA_print;
> ++		RSA_print_fp;
> ++		RSA_private_decrypt;
> ++		RSA_private_encrypt;
> ++		RSA_public_decrypt;
> ++		RSA_public_encrypt;
> ++		RSA_set_default_method;
> ++		RSA_sign;
> ++		RSA_sign_ASN1_OCTET_STRING;
> ++		RSA_size;
> ++		RSA_verify;
> ++		RSA_verify_ASN1_OCTET_STRING;
> ++		SHA;
> ++		SHA1;
> ++		SHA1_Final;
> ++		SHA1_Init;
> ++		SHA1_Update;
> ++		SHA_Final;
> ++		SHA_Init;
> ++		SHA_Update;
> ++		OpenSSL_add_all_algorithms;
> ++		OpenSSL_add_all_ciphers;
> ++		OpenSSL_add_all_digests;
> ++		TXT_DB_create_index;
> ++		TXT_DB_free;
> ++		TXT_DB_get_by_index;
> ++		TXT_DB_insert;
> ++		TXT_DB_read;
> ++		TXT_DB_write;
> ++		X509_ALGOR_free;
> ++		X509_ALGOR_new;
> ++		X509_ATTRIBUTE_free;
> ++		X509_ATTRIBUTE_new;
> ++		X509_CINF_free;
> ++		X509_CINF_new;
> ++		X509_CRL_INFO_free;
> ++		X509_CRL_INFO_new;
> ++		X509_CRL_add_ext;
> ++		X509_CRL_cmp;
> ++		X509_CRL_delete_ext;
> ++		X509_CRL_dup;
> ++		X509_CRL_free;
> ++		X509_CRL_get_ext;
> ++		X509_CRL_get_ext_by_NID;
> ++		X509_CRL_get_ext_by_OBJ;
> ++		X509_CRL_get_ext_by_critical;
> ++		X509_CRL_get_ext_count;
> ++		X509_CRL_new;
> ++		X509_CRL_sign;
> ++		X509_CRL_verify;
> ++		X509_EXTENSION_create_by_NID;
> ++		X509_EXTENSION_create_by_OBJ;
> ++		X509_EXTENSION_dup;
> ++		X509_EXTENSION_free;
> ++		X509_EXTENSION_get_critical;
> ++		X509_EXTENSION_get_data;
> ++		X509_EXTENSION_get_object;
> ++		X509_EXTENSION_new;
> ++		X509_EXTENSION_set_critical;
> ++		X509_EXTENSION_set_data;
> ++		X509_EXTENSION_set_object;
> ++		X509_INFO_free;
> ++		X509_INFO_new;
> ++		X509_LOOKUP_by_alias;
> ++		X509_LOOKUP_by_fingerprint;
> ++		X509_LOOKUP_by_issuer_serial;
> ++		X509_LOOKUP_by_subject;
> ++		X509_LOOKUP_ctrl;
> ++		X509_LOOKUP_file;
> ++		X509_LOOKUP_free;
> ++		X509_LOOKUP_hash_dir;
> ++		X509_LOOKUP_init;
> ++		X509_LOOKUP_new;
> ++		X509_LOOKUP_shutdown;
> ++		X509_NAME_ENTRY_create_by_NID;
> ++		X509_NAME_ENTRY_create_by_OBJ;
> ++		X509_NAME_ENTRY_dup;
> ++		X509_NAME_ENTRY_free;
> ++		X509_NAME_ENTRY_get_data;
> ++		X509_NAME_ENTRY_get_object;
> ++		X509_NAME_ENTRY_new;
> ++		X509_NAME_ENTRY_set_data;
> ++		X509_NAME_ENTRY_set_object;
> ++		X509_NAME_add_entry;
> ++		X509_NAME_cmp;
> ++		X509_NAME_delete_entry;
> ++		X509_NAME_digest;
> ++		X509_NAME_dup;
> ++		X509_NAME_entry_count;
> ++		X509_NAME_free;
> ++		X509_NAME_get_entry;
> ++		X509_NAME_get_index_by_NID;
> ++		X509_NAME_get_index_by_OBJ;
> ++		X509_NAME_get_text_by_NID;
> ++		X509_NAME_get_text_by_OBJ;
> ++		X509_NAME_hash;
> ++		X509_NAME_new;
> ++		X509_NAME_oneline;
> ++		X509_NAME_print;
> ++		X509_NAME_set;
> ++		X509_OBJECT_free_contents;
> ++		X509_OBJECT_retrieve_by_subject;
> ++		X509_OBJECT_up_ref_count;
> ++		X509_PKEY_free;
> ++		X509_PKEY_new;
> ++		X509_PUBKEY_free;
> ++		X509_PUBKEY_get;
> ++		X509_PUBKEY_new;
> ++		X509_PUBKEY_set;
> ++		X509_REQ_INFO_free;
> ++		X509_REQ_INFO_new;
> ++		X509_REQ_dup;
> ++		X509_REQ_free;
> ++		X509_REQ_get_pubkey;
> ++		X509_REQ_new;
> ++		X509_REQ_print;
> ++		X509_REQ_print_fp;
> ++		X509_REQ_set_pubkey;
> ++		X509_REQ_set_subject_name;
> ++		X509_REQ_set_version;
> ++		X509_REQ_sign;
> ++		X509_REQ_to_X509;
> ++		X509_REQ_verify;
> ++		X509_REVOKED_add_ext;
> ++		X509_REVOKED_delete_ext;
> ++		X509_REVOKED_free;
> ++		X509_REVOKED_get_ext;
> ++		X509_REVOKED_get_ext_by_NID;
> ++		X509_REVOKED_get_ext_by_OBJ;
> ++		X509_REVOKED_get_ext_by_critical;
> ++		X509_REVOKED_get_ext_by_critic;
> ++		X509_REVOKED_get_ext_count;
> ++		X509_REVOKED_new;
> ++		X509_SIG_free;
> ++		X509_SIG_new;
> ++		X509_STORE_CTX_cleanup;
> ++		X509_STORE_CTX_init;
> ++		X509_STORE_add_cert;
> ++		X509_STORE_add_lookup;
> ++		X509_STORE_free;
> ++		X509_STORE_get_by_subject;
> ++		X509_STORE_load_locations;
> ++		X509_STORE_new;
> ++		X509_STORE_set_default_paths;
> ++		X509_VAL_free;
> ++		X509_VAL_new;
> ++		X509_add_ext;
> ++		X509_asn1_meth;
> ++		X509_certificate_type;
> ++		X509_check_private_key;
> ++		X509_cmp_current_time;
> ++		X509_delete_ext;
> ++		X509_digest;
> ++		X509_dup;
> ++		X509_free;
> ++		X509_get_default_cert_area;
> ++		X509_get_default_cert_dir;
> ++		X509_get_default_cert_dir_env;
> ++		X509_get_default_cert_file;
> ++		X509_get_default_cert_file_env;
> ++		X509_get_default_private_dir;
> ++		X509_get_ext;
> ++		X509_get_ext_by_NID;
> ++		X509_get_ext_by_OBJ;
> ++		X509_get_ext_by_critical;
> ++		X509_get_ext_count;
> ++		X509_get_issuer_name;
> ++		X509_get_pubkey;
> ++		X509_get_pubkey_parameters;
> ++		X509_get_serialNumber;
> ++		X509_get_subject_name;
> ++		X509_gmtime_adj;
> ++		X509_issuer_and_serial_cmp;
> ++		X509_issuer_and_serial_hash;
> ++		X509_issuer_name_cmp;
> ++		X509_issuer_name_hash;
> ++		X509_load_cert_file;
> ++		X509_new;
> ++		X509_print;
> ++		X509_print_fp;
> ++		X509_set_issuer_name;
> ++		X509_set_notAfter;
> ++		X509_set_notBefore;
> ++		X509_set_pubkey;
> ++		X509_set_serialNumber;
> ++		X509_set_subject_name;
> ++		X509_set_version;
> ++		X509_sign;
> ++		X509_subject_name_cmp;
> ++		X509_subject_name_hash;
> ++		X509_to_X509_REQ;
> ++		X509_verify;
> ++		X509_verify_cert;
> ++		X509_verify_cert_error_string;
> ++		X509v3_add_ext;
> ++		X509v3_add_extension;
> ++		X509v3_add_netscape_extensions;
> ++		X509v3_add_standard_extensions;
> ++		X509v3_cleanup_extensions;
> ++		X509v3_data_type_by_NID;
> ++		X509v3_data_type_by_OBJ;
> ++		X509v3_delete_ext;
> ++		X509v3_get_ext;
> ++		X509v3_get_ext_by_NID;
> ++		X509v3_get_ext_by_OBJ;
> ++		X509v3_get_ext_by_critical;
> ++		X509v3_get_ext_count;
> ++		X509v3_pack_string;
> ++		X509v3_pack_type_by_NID;
> ++		X509v3_pack_type_by_OBJ;
> ++		X509v3_unpack_string;
> ++		_des_crypt;
> ++		a2d_ASN1_OBJECT;
> ++		a2i_ASN1_INTEGER;
> ++		a2i_ASN1_STRING;
> ++		asn1_Finish;
> ++		asn1_GetSequence;
> ++		bn_div_words;
> ++		bn_expand2;
> ++		bn_mul_add_words;
> ++		bn_mul_words;
> ++		BN_uadd;
> ++		BN_usub;
> ++		bn_sqr_words;
> ++		_ossl_old_crypt;
> ++		d2i_ASN1_BIT_STRING;
> ++		d2i_ASN1_BOOLEAN;
> ++		d2i_ASN1_HEADER;
> ++		d2i_ASN1_IA5STRING;
> ++		d2i_ASN1_INTEGER;
> ++		d2i_ASN1_OBJECT;
> ++		d2i_ASN1_OCTET_STRING;
> ++		d2i_ASN1_PRINTABLE;
> ++		d2i_ASN1_PRINTABLESTRING;
> ++		d2i_ASN1_SET;
> ++		d2i_ASN1_T61STRING;
> ++		d2i_ASN1_TYPE;
> ++		d2i_ASN1_UTCTIME;
> ++		d2i_ASN1_bytes;
> ++		d2i_ASN1_type_bytes;
> ++		d2i_DHparams;
> ++		d2i_DSAPrivateKey;
> ++		d2i_DSAPrivateKey_bio;
> ++		d2i_DSAPrivateKey_fp;
> ++		d2i_DSAPublicKey;
> ++		d2i_DSAparams;
> ++		d2i_NETSCAPE_SPKAC;
> ++		d2i_NETSCAPE_SPKI;
> ++		d2i_Netscape_RSA;
> ++		d2i_PKCS7;
> ++		d2i_PKCS7_DIGEST;
> ++		d2i_PKCS7_ENCRYPT;
> ++		d2i_PKCS7_ENC_CONTENT;
> ++		d2i_PKCS7_ENVELOPE;
> ++		d2i_PKCS7_ISSUER_AND_SERIAL;
> ++		d2i_PKCS7_RECIP_INFO;
> ++		d2i_PKCS7_SIGNED;
> ++		d2i_PKCS7_SIGNER_INFO;
> ++		d2i_PKCS7_SIGN_ENVELOPE;
> ++		d2i_PKCS7_bio;
> ++		d2i_PKCS7_fp;
> ++		d2i_PrivateKey;
> ++		d2i_PublicKey;
> ++		d2i_RSAPrivateKey;
> ++		d2i_RSAPrivateKey_bio;
> ++		d2i_RSAPrivateKey_fp;
> ++		d2i_RSAPublicKey;
> ++		d2i_X509;
> ++		d2i_X509_ALGOR;
> ++		d2i_X509_ATTRIBUTE;
> ++		d2i_X509_CINF;
> ++		d2i_X509_CRL;
> ++		d2i_X509_CRL_INFO;
> ++		d2i_X509_CRL_bio;
> ++		d2i_X509_CRL_fp;
> ++		d2i_X509_EXTENSION;
> ++		d2i_X509_NAME;
> ++		d2i_X509_NAME_ENTRY;
> ++		d2i_X509_PKEY;
> ++		d2i_X509_PUBKEY;
> ++		d2i_X509_REQ;
> ++		d2i_X509_REQ_INFO;
> ++		d2i_X509_REQ_bio;
> ++		d2i_X509_REQ_fp;
> ++		d2i_X509_REVOKED;
> ++		d2i_X509_SIG;
> ++		d2i_X509_VAL;
> ++		d2i_X509_bio;
> ++		d2i_X509_fp;
> ++		DES_cbc_cksum;
> ++		DES_cbc_encrypt;
> ++		DES_cblock_print_file;
> ++		DES_cfb64_encrypt;
> ++		DES_cfb_encrypt;
> ++		DES_decrypt3;
> ++		DES_ecb3_encrypt;
> ++		DES_ecb_encrypt;
> ++		DES_ede3_cbc_encrypt;
> ++		DES_ede3_cfb64_encrypt;
> ++		DES_ede3_ofb64_encrypt;
> ++		DES_enc_read;
> ++		DES_enc_write;
> ++		DES_encrypt1;
> ++		DES_encrypt2;
> ++		DES_encrypt3;
> ++		DES_fcrypt;
> ++		DES_is_weak_key;
> ++		DES_key_sched;
> ++		DES_ncbc_encrypt;
> ++		DES_ofb64_encrypt;
> ++		DES_ofb_encrypt;
> ++		DES_options;
> ++		DES_pcbc_encrypt;
> ++		DES_quad_cksum;
> ++		DES_random_key;
> ++		_ossl_old_des_random_seed;
> ++		_ossl_old_des_read_2passwords;
> ++		_ossl_old_des_read_password;
> ++		_ossl_old_des_read_pw;
> ++		_ossl_old_des_read_pw_string;
> ++		DES_set_key;
> ++		DES_set_odd_parity;
> ++		DES_string_to_2keys;
> ++		DES_string_to_key;
> ++		DES_xcbc_encrypt;
> ++		DES_xwhite_in2out;
> ++		fcrypt_body;
> ++		i2a_ASN1_INTEGER;
> ++		i2a_ASN1_OBJECT;
> ++		i2a_ASN1_STRING;
> ++		i2d_ASN1_BIT_STRING;
> ++		i2d_ASN1_BOOLEAN;
> ++		i2d_ASN1_HEADER;
> ++		i2d_ASN1_IA5STRING;
> ++		i2d_ASN1_INTEGER;
> ++		i2d_ASN1_OBJECT;
> ++		i2d_ASN1_OCTET_STRING;
> ++		i2d_ASN1_PRINTABLE;
> ++		i2d_ASN1_SET;
> ++		i2d_ASN1_TYPE;
> ++		i2d_ASN1_UTCTIME;
> ++		i2d_ASN1_bytes;
> ++		i2d_DHparams;
> ++		i2d_DSAPrivateKey;
> ++		i2d_DSAPrivateKey_bio;
> ++		i2d_DSAPrivateKey_fp;
> ++		i2d_DSAPublicKey;
> ++		i2d_DSAparams;
> ++		i2d_NETSCAPE_SPKAC;
> ++		i2d_NETSCAPE_SPKI;
> ++		i2d_Netscape_RSA;
> ++		i2d_PKCS7;
> ++		i2d_PKCS7_DIGEST;
> ++		i2d_PKCS7_ENCRYPT;
> ++		i2d_PKCS7_ENC_CONTENT;
> ++		i2d_PKCS7_ENVELOPE;
> ++		i2d_PKCS7_ISSUER_AND_SERIAL;
> ++		i2d_PKCS7_RECIP_INFO;
> ++		i2d_PKCS7_SIGNED;
> ++		i2d_PKCS7_SIGNER_INFO;
> ++		i2d_PKCS7_SIGN_ENVELOPE;
> ++		i2d_PKCS7_bio;
> ++		i2d_PKCS7_fp;
> ++		i2d_PrivateKey;
> ++		i2d_PublicKey;
> ++		i2d_RSAPrivateKey;
> ++		i2d_RSAPrivateKey_bio;
> ++		i2d_RSAPrivateKey_fp;
> ++		i2d_RSAPublicKey;
> ++		i2d_X509;
> ++		i2d_X509_ALGOR;
> ++		i2d_X509_ATTRIBUTE;
> ++		i2d_X509_CINF;
> ++		i2d_X509_CRL;
> ++		i2d_X509_CRL_INFO;
> ++		i2d_X509_CRL_bio;
> ++		i2d_X509_CRL_fp;
> ++		i2d_X509_EXTENSION;
> ++		i2d_X509_NAME;
> ++		i2d_X509_NAME_ENTRY;
> ++		i2d_X509_PKEY;
> ++		i2d_X509_PUBKEY;
> ++		i2d_X509_REQ;
> ++		i2d_X509_REQ_INFO;
> ++		i2d_X509_REQ_bio;
> ++		i2d_X509_REQ_fp;
> ++		i2d_X509_REVOKED;
> ++		i2d_X509_SIG;
> ++		i2d_X509_VAL;
> ++		i2d_X509_bio;
> ++		i2d_X509_fp;
> ++		idea_cbc_encrypt;
> ++		idea_cfb64_encrypt;
> ++		idea_ecb_encrypt;
> ++		idea_encrypt;
> ++		idea_ofb64_encrypt;
> ++		idea_options;
> ++		idea_set_decrypt_key;
> ++		idea_set_encrypt_key;
> ++		lh_delete;
> ++		lh_doall;
> ++		lh_doall_arg;
> ++		lh_free;
> ++		lh_insert;
> ++		lh_new;
> ++		lh_node_stats;
> ++		lh_node_stats_bio;
> ++		lh_node_usage_stats;
> ++		lh_node_usage_stats_bio;
> ++		lh_retrieve;
> ++		lh_stats;
> ++		lh_stats_bio;
> ++		lh_strhash;
> ++		sk_delete;
> ++		sk_delete_ptr;
> ++		sk_dup;
> ++		sk_find;
> ++		sk_free;
> ++		sk_insert;
> ++		sk_new;
> ++		sk_pop;
> ++		sk_pop_free;
> ++		sk_push;
> ++		sk_set_cmp_func;
> ++		sk_shift;
> ++		sk_unshift;
> ++		sk_zero;
> ++		BIO_f_nbio_test;
> ++		ASN1_TYPE_get;
> ++		ASN1_TYPE_set;
> ++		PKCS7_content_free;
> ++		ERR_load_PKCS7_strings;
> ++		X509_find_by_issuer_and_serial;
> ++		X509_find_by_subject;
> ++		PKCS7_ctrl;
> ++		PKCS7_set_type;
> ++		PKCS7_set_content;
> ++		PKCS7_SIGNER_INFO_set;
> ++		PKCS7_add_signer;
> ++		PKCS7_add_certificate;
> ++		PKCS7_add_crl;
> ++		PKCS7_content_new;
> ++		PKCS7_dataSign;
> ++		PKCS7_dataVerify;
> ++		PKCS7_dataInit;
> ++		PKCS7_add_signature;
> ++		PKCS7_cert_from_signer_info;
> ++		PKCS7_get_signer_info;
> ++		EVP_delete_alias;
> ++		EVP_mdc2;
> ++		PEM_read_bio_RSAPublicKey;
> ++		PEM_write_bio_RSAPublicKey;
> ++		d2i_RSAPublicKey_bio;
> ++		i2d_RSAPublicKey_bio;
> ++		PEM_read_RSAPublicKey;
> ++		PEM_write_RSAPublicKey;
> ++		d2i_RSAPublicKey_fp;
> ++		i2d_RSAPublicKey_fp;
> ++		BIO_copy_next_retry;
> ++		RSA_flags;
> ++		X509_STORE_add_crl;
> ++		X509_load_crl_file;
> ++		EVP_rc2_40_cbc;
> ++		EVP_rc4_40;
> ++		EVP_CIPHER_CTX_init;
> ++		HMAC;
> ++		HMAC_Init;
> ++		HMAC_Update;
> ++		HMAC_Final;
> ++		ERR_get_next_error_library;
> ++		EVP_PKEY_cmp_parameters;
> ++		HMAC_cleanup;
> ++		BIO_ptr_ctrl;
> ++		BIO_new_file_internal;
> ++		BIO_new_fp_internal;
> ++		BIO_s_file_internal;
> ++		BN_BLINDING_convert;
> ++		BN_BLINDING_invert;
> ++		BN_BLINDING_update;
> ++		RSA_blinding_on;
> ++		RSA_blinding_off;
> ++		i2t_ASN1_OBJECT;
> ++		BN_BLINDING_new;
> ++		BN_BLINDING_free;
> ++		EVP_cast5_cbc;
> ++		EVP_cast5_cfb64;
> ++		EVP_cast5_ecb;
> ++		EVP_cast5_ofb;
> ++		BF_decrypt;
> ++		CAST_set_key;
> ++		CAST_encrypt;
> ++		CAST_decrypt;
> ++		CAST_ecb_encrypt;
> ++		CAST_cbc_encrypt;
> ++		CAST_cfb64_encrypt;
> ++		CAST_ofb64_encrypt;
> ++		RC2_decrypt;
> ++		OBJ_create_objects;
> ++		BN_exp;
> ++		BN_mul_word;
> ++		BN_sub_word;
> ++		BN_dec2bn;
> ++		BN_bn2dec;
> ++		BIO_ghbn_ctrl;
> ++		CRYPTO_free_ex_data;
> ++		CRYPTO_get_ex_data;
> ++		CRYPTO_set_ex_data;
> ++		ERR_load_CRYPTO_strings;
> ++		ERR_load_CRYPTOlib_strings;
> ++		EVP_PKEY_bits;
> ++		MD5_Transform;
> ++		SHA1_Transform;
> ++		SHA_Transform;
> ++		X509_STORE_CTX_get_chain;
> ++		X509_STORE_CTX_get_current_cert;
> ++		X509_STORE_CTX_get_error;
> ++		X509_STORE_CTX_get_error_depth;
> ++		X509_STORE_CTX_get_ex_data;
> ++		X509_STORE_CTX_set_cert;
> ++		X509_STORE_CTX_set_chain;
> ++		X509_STORE_CTX_set_error;
> ++		X509_STORE_CTX_set_ex_data;
> ++		CRYPTO_dup_ex_data;
> ++		CRYPTO_get_new_lockid;
> ++		CRYPTO_new_ex_data;
> ++		RSA_set_ex_data;
> ++		RSA_get_ex_data;
> ++		RSA_get_ex_new_index;
> ++		RSA_padding_add_PKCS1_type_1;
> ++		RSA_padding_add_PKCS1_type_2;
> ++		RSA_padding_add_SSLv23;
> ++		RSA_padding_add_none;
> ++		RSA_padding_check_PKCS1_type_1;
> ++		RSA_padding_check_PKCS1_type_2;
> ++		RSA_padding_check_SSLv23;
> ++		RSA_padding_check_none;
> ++		bn_add_words;
> ++		d2i_Netscape_RSA_2;
> ++		CRYPTO_get_ex_new_index;
> ++		RIPEMD160_Init;
> ++		RIPEMD160_Update;
> ++		RIPEMD160_Final;
> ++		RIPEMD160;
> ++		RIPEMD160_Transform;
> ++		RC5_32_set_key;
> ++		RC5_32_ecb_encrypt;
> ++		RC5_32_encrypt;
> ++		RC5_32_decrypt;
> ++		RC5_32_cbc_encrypt;
> ++		RC5_32_cfb64_encrypt;
> ++		RC5_32_ofb64_encrypt;
> ++		BN_bn2mpi;
> ++		BN_mpi2bn;
> ++		ASN1_BIT_STRING_get_bit;
> ++		ASN1_BIT_STRING_set_bit;
> ++		BIO_get_ex_data;
> ++		BIO_get_ex_new_index;
> ++		BIO_set_ex_data;
> ++		X509v3_get_key_usage;
> ++		X509v3_set_key_usage;
> ++		a2i_X509v3_key_usage;
> ++		i2a_X509v3_key_usage;
> ++		EVP_PKEY_decrypt;
> ++		EVP_PKEY_encrypt;
> ++		PKCS7_RECIP_INFO_set;
> ++		PKCS7_add_recipient;
> ++		PKCS7_add_recipient_info;
> ++		PKCS7_set_cipher;
> ++		ASN1_TYPE_get_int_octetstring;
> ++		ASN1_TYPE_get_octetstring;
> ++		ASN1_TYPE_set_int_octetstring;
> ++		ASN1_TYPE_set_octetstring;
> ++		ASN1_UTCTIME_set_string;
> ++		ERR_add_error_data;
> ++		ERR_set_error_data;
> ++		EVP_CIPHER_asn1_to_param;
> ++		EVP_CIPHER_param_to_asn1;
> ++		EVP_CIPHER_get_asn1_iv;
> ++		EVP_CIPHER_set_asn1_iv;
> ++		EVP_rc5_32_12_16_cbc;
> ++		EVP_rc5_32_12_16_cfb64;
> ++		EVP_rc5_32_12_16_ecb;
> ++		EVP_rc5_32_12_16_ofb;
> ++		asn1_add_error;
> ++		d2i_ASN1_BMPSTRING;
> ++		i2d_ASN1_BMPSTRING;
> ++		BIO_f_ber;
> ++		BN_init;
> ++		COMP_CTX_new;
> ++		COMP_CTX_free;
> ++		COMP_CTX_compress_block;
> ++		COMP_CTX_expand_block;
> ++		X509_STORE_CTX_get_ex_new_index;
> ++		OBJ_NAME_add;
> ++		BIO_socket_nbio;
> ++		EVP_rc2_64_cbc;
> ++		OBJ_NAME_cleanup;
> ++		OBJ_NAME_get;
> ++		OBJ_NAME_init;
> ++		OBJ_NAME_new_index;
> ++		OBJ_NAME_remove;
> ++		BN_MONT_CTX_copy;
> ++		BIO_new_socks4a_connect;
> ++		BIO_s_socks4a_connect;
> ++		PROXY_set_connect_mode;
> ++		RAND_SSLeay;
> ++		RAND_set_rand_method;
> ++		RSA_memory_lock;
> ++		bn_sub_words;
> ++		bn_mul_normal;
> ++		bn_mul_comba8;
> ++		bn_mul_comba4;
> ++		bn_sqr_normal;
> ++		bn_sqr_comba8;
> ++		bn_sqr_comba4;
> ++		bn_cmp_words;
> ++		bn_mul_recursive;
> ++		bn_mul_part_recursive;
> ++		bn_sqr_recursive;
> ++		bn_mul_low_normal;
> ++		BN_RECP_CTX_init;
> ++		BN_RECP_CTX_new;
> ++		BN_RECP_CTX_free;
> ++		BN_RECP_CTX_set;
> ++		BN_mod_mul_reciprocal;
> ++		BN_mod_exp_recp;
> ++		BN_div_recp;
> ++		BN_CTX_init;
> ++		BN_MONT_CTX_init;
> ++		RAND_get_rand_method;
> ++		PKCS7_add_attribute;
> ++		PKCS7_add_signed_attribute;
> ++		PKCS7_digest_from_attributes;
> ++		PKCS7_get_attribute;
> ++		PKCS7_get_issuer_and_serial;
> ++		PKCS7_get_signed_attribute;
> ++		COMP_compress_block;
> ++		COMP_expand_block;
> ++		COMP_rle;
> ++		COMP_zlib;
> ++		ms_time_diff;
> ++		ms_time_new;
> ++		ms_time_free;
> ++		ms_time_cmp;
> ++		ms_time_get;
> ++		PKCS7_set_attributes;
> ++		PKCS7_set_signed_attributes;
> ++		X509_ATTRIBUTE_create;
> ++		X509_ATTRIBUTE_dup;
> ++		ASN1_GENERALIZEDTIME_check;
> ++		ASN1_GENERALIZEDTIME_print;
> ++		ASN1_GENERALIZEDTIME_set;
> ++		ASN1_GENERALIZEDTIME_set_string;
> ++		ASN1_TIME_print;
> ++		BASIC_CONSTRAINTS_free;
> ++		BASIC_CONSTRAINTS_new;
> ++		ERR_load_X509V3_strings;
> ++		NETSCAPE_CERT_SEQUENCE_free;
> ++		NETSCAPE_CERT_SEQUENCE_new;
> ++		OBJ_txt2obj;
> ++		PEM_read_NETSCAPE_CERT_SEQUENCE;
> ++		PEM_read_NS_CERT_SEQ;
> ++		PEM_read_bio_NETSCAPE_CERT_SEQUENCE;
> ++		PEM_read_bio_NS_CERT_SEQ;
> ++		PEM_write_NETSCAPE_CERT_SEQUENCE;
> ++		PEM_write_NS_CERT_SEQ;
> ++		PEM_write_bio_NETSCAPE_CERT_SEQUENCE;
> ++		PEM_write_bio_NS_CERT_SEQ;
> ++		X509V3_EXT_add;
> ++		X509V3_EXT_add_alias;
> ++		X509V3_EXT_add_conf;
> ++		X509V3_EXT_cleanup;
> ++		X509V3_EXT_conf;
> ++		X509V3_EXT_conf_nid;
> ++		X509V3_EXT_get;
> ++		X509V3_EXT_get_nid;
> ++		X509V3_EXT_print;
> ++		X509V3_EXT_print_fp;
> ++		X509V3_add_standard_extensions;
> ++		X509V3_add_value;
> ++		X509V3_add_value_bool;
> ++		X509V3_add_value_int;
> ++		X509V3_conf_free;
> ++		X509V3_get_value_bool;
> ++		X509V3_get_value_int;
> ++		X509V3_parse_list;
> ++		d2i_ASN1_GENERALIZEDTIME;
> ++		d2i_ASN1_TIME;
> ++		d2i_BASIC_CONSTRAINTS;
> ++		d2i_NETSCAPE_CERT_SEQUENCE;
> ++		d2i_ext_ku;
> ++		ext_ku_free;
> ++		ext_ku_new;
> ++		i2d_ASN1_GENERALIZEDTIME;
> ++		i2d_ASN1_TIME;
> ++		i2d_BASIC_CONSTRAINTS;
> ++		i2d_NETSCAPE_CERT_SEQUENCE;
> ++		i2d_ext_ku;
> ++		EVP_MD_CTX_copy;
> ++		i2d_ASN1_ENUMERATED;
> ++		d2i_ASN1_ENUMERATED;
> ++		ASN1_ENUMERATED_set;
> ++		ASN1_ENUMERATED_get;
> ++		BN_to_ASN1_ENUMERATED;
> ++		ASN1_ENUMERATED_to_BN;
> ++		i2a_ASN1_ENUMERATED;
> ++		a2i_ASN1_ENUMERATED;
> ++		i2d_GENERAL_NAME;
> ++		d2i_GENERAL_NAME;
> ++		GENERAL_NAME_new;
> ++		GENERAL_NAME_free;
> ++		GENERAL_NAMES_new;
> ++		GENERAL_NAMES_free;
> ++		d2i_GENERAL_NAMES;
> ++		i2d_GENERAL_NAMES;
> ++		i2v_GENERAL_NAMES;
> ++		i2s_ASN1_OCTET_STRING;
> ++		s2i_ASN1_OCTET_STRING;
> ++		X509V3_EXT_check_conf;
> ++		hex_to_string;
> ++		string_to_hex;
> ++		DES_ede3_cbcm_encrypt;
> ++		RSA_padding_add_PKCS1_OAEP;
> ++		RSA_padding_check_PKCS1_OAEP;
> ++		X509_CRL_print_fp;
> ++		X509_CRL_print;
> ++		i2v_GENERAL_NAME;
> ++		v2i_GENERAL_NAME;
> ++		i2d_PKEY_USAGE_PERIOD;
> ++		d2i_PKEY_USAGE_PERIOD;
> ++		PKEY_USAGE_PERIOD_new;
> ++		PKEY_USAGE_PERIOD_free;
> ++		v2i_GENERAL_NAMES;
> ++		i2s_ASN1_INTEGER;
> ++		X509V3_EXT_d2i;
> ++		name_cmp;
> ++		str_dup;
> ++		i2s_ASN1_ENUMERATED;
> ++		i2s_ASN1_ENUMERATED_TABLE;
> ++		BIO_s_log;
> ++		BIO_f_reliable;
> ++		PKCS7_dataFinal;
> ++		PKCS7_dataDecode;
> ++		X509V3_EXT_CRL_add_conf;
> ++		BN_set_params;
> ++		BN_get_params;
> ++		BIO_get_ex_num;
> ++		BIO_set_ex_free_func;
> ++		EVP_ripemd160;
> ++		ASN1_TIME_set;
> ++		i2d_AUTHORITY_KEYID;
> ++		d2i_AUTHORITY_KEYID;
> ++		AUTHORITY_KEYID_new;
> ++		AUTHORITY_KEYID_free;
> ++		ASN1_seq_unpack;
> ++		ASN1_seq_pack;
> ++		ASN1_unpack_string;
> ++		ASN1_pack_string;
> ++		PKCS12_pack_safebag;
> ++		PKCS12_MAKE_KEYBAG;
> ++		PKCS8_encrypt;
> ++		PKCS12_MAKE_SHKEYBAG;
> ++		PKCS12_pack_p7data;
> ++		PKCS12_pack_p7encdata;
> ++		PKCS12_add_localkeyid;
> ++		PKCS12_add_friendlyname_asc;
> ++		PKCS12_add_friendlyname_uni;
> ++		PKCS12_get_friendlyname;
> ++		PKCS12_pbe_crypt;
> ++		PKCS12_decrypt_d2i;
> ++		PKCS12_i2d_encrypt;
> ++		PKCS12_init;
> ++		PKCS12_key_gen_asc;
> ++		PKCS12_key_gen_uni;
> ++		PKCS12_gen_mac;
> ++		PKCS12_verify_mac;
> ++		PKCS12_set_mac;
> ++		PKCS12_setup_mac;
> ++		OPENSSL_asc2uni;
> ++		OPENSSL_uni2asc;
> ++		i2d_PKCS12_BAGS;
> ++		PKCS12_BAGS_new;
> ++		d2i_PKCS12_BAGS;
> ++		PKCS12_BAGS_free;
> ++		i2d_PKCS12;
> ++		d2i_PKCS12;
> ++		PKCS12_new;
> ++		PKCS12_free;
> ++		i2d_PKCS12_MAC_DATA;
> ++		PKCS12_MAC_DATA_new;
> ++		d2i_PKCS12_MAC_DATA;
> ++		PKCS12_MAC_DATA_free;
> ++		i2d_PKCS12_SAFEBAG;
> ++		PKCS12_SAFEBAG_new;
> ++		d2i_PKCS12_SAFEBAG;
> ++		PKCS12_SAFEBAG_free;
> ++		ERR_load_PKCS12_strings;
> ++		PKCS12_PBE_add;
> ++		PKCS8_add_keyusage;
> ++		PKCS12_get_attr_gen;
> ++		PKCS12_parse;
> ++		PKCS12_create;
> ++		i2d_PKCS12_bio;
> ++		i2d_PKCS12_fp;
> ++		d2i_PKCS12_bio;
> ++		d2i_PKCS12_fp;
> ++		i2d_PBEPARAM;
> ++		PBEPARAM_new;
> ++		d2i_PBEPARAM;
> ++		PBEPARAM_free;
> ++		i2d_PKCS8_PRIV_KEY_INFO;
> ++		PKCS8_PRIV_KEY_INFO_new;
> ++		d2i_PKCS8_PRIV_KEY_INFO;
> ++		PKCS8_PRIV_KEY_INFO_free;
> ++		EVP_PKCS82PKEY;
> ++		EVP_PKEY2PKCS8;
> ++		PKCS8_set_broken;
> ++		EVP_PBE_ALGOR_CipherInit;
> ++		EVP_PBE_alg_add;
> ++		PKCS5_pbe_set;
> ++		EVP_PBE_cleanup;
> ++		i2d_SXNET;
> ++		d2i_SXNET;
> ++		SXNET_new;
> ++		SXNET_free;
> ++		i2d_SXNETID;
> ++		d2i_SXNETID;
> ++		SXNETID_new;
> ++		SXNETID_free;
> ++		DSA_SIG_new;
> ++		DSA_SIG_free;
> ++		DSA_do_sign;
> ++		DSA_do_verify;
> ++		d2i_DSA_SIG;
> ++		i2d_DSA_SIG;
> ++		i2d_ASN1_VISIBLESTRING;
> ++		d2i_ASN1_VISIBLESTRING;
> ++		i2d_ASN1_UTF8STRING;
> ++		d2i_ASN1_UTF8STRING;
> ++		i2d_DIRECTORYSTRING;
> ++		d2i_DIRECTORYSTRING;
> ++		i2d_DISPLAYTEXT;
> ++		d2i_DISPLAYTEXT;
> ++		d2i_ASN1_SET_OF_X509;
> ++		i2d_ASN1_SET_OF_X509;
> ++		i2d_PBKDF2PARAM;
> ++		PBKDF2PARAM_new;
> ++		d2i_PBKDF2PARAM;
> ++		PBKDF2PARAM_free;
> ++		i2d_PBE2PARAM;
> ++		PBE2PARAM_new;
> ++		d2i_PBE2PARAM;
> ++		PBE2PARAM_free;
> ++		d2i_ASN1_SET_OF_GENERAL_NAME;
> ++		i2d_ASN1_SET_OF_GENERAL_NAME;
> ++		d2i_ASN1_SET_OF_SXNETID;
> ++		i2d_ASN1_SET_OF_SXNETID;
> ++		d2i_ASN1_SET_OF_POLICYQUALINFO;
> ++		i2d_ASN1_SET_OF_POLICYQUALINFO;
> ++		d2i_ASN1_SET_OF_POLICYINFO;
> ++		i2d_ASN1_SET_OF_POLICYINFO;
> ++		SXNET_add_id_asc;
> ++		SXNET_add_id_ulong;
> ++		SXNET_add_id_INTEGER;
> ++		SXNET_get_id_asc;
> ++		SXNET_get_id_ulong;
> ++		SXNET_get_id_INTEGER;
> ++		X509V3_set_conf_lhash;
> ++		i2d_CERTIFICATEPOLICIES;
> ++		CERTIFICATEPOLICIES_new;
> ++		CERTIFICATEPOLICIES_free;
> ++		d2i_CERTIFICATEPOLICIES;
> ++		i2d_POLICYINFO;
> ++		POLICYINFO_new;
> ++		d2i_POLICYINFO;
> ++		POLICYINFO_free;
> ++		i2d_POLICYQUALINFO;
> ++		POLICYQUALINFO_new;
> ++		d2i_POLICYQUALINFO;
> ++		POLICYQUALINFO_free;
> ++		i2d_USERNOTICE;
> ++		USERNOTICE_new;
> ++		d2i_USERNOTICE;
> ++		USERNOTICE_free;
> ++		i2d_NOTICEREF;
> ++		NOTICEREF_new;
> ++		d2i_NOTICEREF;
> ++		NOTICEREF_free;
> ++		X509V3_get_string;
> ++		X509V3_get_section;
> ++		X509V3_string_free;
> ++		X509V3_section_free;
> ++		X509V3_set_ctx;
> ++		s2i_ASN1_INTEGER;
> ++		CRYPTO_set_locked_mem_functions;
> ++		CRYPTO_get_locked_mem_functions;
> ++		CRYPTO_malloc_locked;
> ++		CRYPTO_free_locked;
> ++		BN_mod_exp2_mont;
> ++		ERR_get_error_line_data;
> ++		ERR_peek_error_line_data;
> ++		PKCS12_PBE_keyivgen;
> ++		X509_ALGOR_dup;
> ++		d2i_ASN1_SET_OF_DIST_POINT;
> ++		i2d_ASN1_SET_OF_DIST_POINT;
> ++		i2d_CRL_DIST_POINTS;
> ++		CRL_DIST_POINTS_new;
> ++		CRL_DIST_POINTS_free;
> ++		d2i_CRL_DIST_POINTS;
> ++		i2d_DIST_POINT;
> ++		DIST_POINT_new;
> ++		d2i_DIST_POINT;
> ++		DIST_POINT_free;
> ++		i2d_DIST_POINT_NAME;
> ++		DIST_POINT_NAME_new;
> ++		DIST_POINT_NAME_free;
> ++		d2i_DIST_POINT_NAME;
> ++		X509V3_add_value_uchar;
> ++		d2i_ASN1_SET_OF_X509_ATTRIBUTE;
> ++		i2d_ASN1_SET_OF_ASN1_TYPE;
> ++		d2i_ASN1_SET_OF_X509_EXTENSION;
> ++		d2i_ASN1_SET_OF_X509_NAME_ENTRY;
> ++		d2i_ASN1_SET_OF_ASN1_TYPE;
> ++		i2d_ASN1_SET_OF_X509_ATTRIBUTE;
> ++		i2d_ASN1_SET_OF_X509_EXTENSION;
> ++		i2d_ASN1_SET_OF_X509_NAME_ENTRY;
> ++		X509V3_EXT_i2d;
> ++		X509V3_EXT_val_prn;
> ++		X509V3_EXT_add_list;
> ++		EVP_CIPHER_type;
> ++		EVP_PBE_CipherInit;
> ++		X509V3_add_value_bool_nf;
> ++		d2i_ASN1_UINTEGER;
> ++		sk_value;
> ++		sk_num;
> ++		sk_set;
> ++		i2d_ASN1_SET_OF_X509_REVOKED;
> ++		sk_sort;
> ++		d2i_ASN1_SET_OF_X509_REVOKED;
> ++		i2d_ASN1_SET_OF_X509_ALGOR;
> ++		i2d_ASN1_SET_OF_X509_CRL;
> ++		d2i_ASN1_SET_OF_X509_ALGOR;
> ++		d2i_ASN1_SET_OF_X509_CRL;
> ++		i2d_ASN1_SET_OF_PKCS7_SIGNER_INFO;
> ++		i2d_ASN1_SET_OF_PKCS7_RECIP_INFO;
> ++		d2i_ASN1_SET_OF_PKCS7_SIGNER_INFO;
> ++		d2i_ASN1_SET_OF_PKCS7_RECIP_INFO;
> ++		PKCS5_PBE_add;
> ++		PEM_write_bio_PKCS8;
> ++		i2d_PKCS8_fp;
> ++		PEM_read_bio_PKCS8_PRIV_KEY_INFO;
> ++		PEM_read_bio_P8_PRIV_KEY_INFO;
> ++		d2i_PKCS8_bio;
> ++		d2i_PKCS8_PRIV_KEY_INFO_fp;
> ++		PEM_write_bio_PKCS8_PRIV_KEY_INFO;
> ++		PEM_write_bio_P8_PRIV_KEY_INFO;
> ++		PEM_read_PKCS8;
> ++		d2i_PKCS8_PRIV_KEY_INFO_bio;
> ++		d2i_PKCS8_fp;
> ++		PEM_write_PKCS8;
> ++		PEM_read_PKCS8_PRIV_KEY_INFO;
> ++		PEM_read_P8_PRIV_KEY_INFO;
> ++		PEM_read_bio_PKCS8;
> ++		PEM_write_PKCS8_PRIV_KEY_INFO;
> ++		PEM_write_P8_PRIV_KEY_INFO;
> ++		PKCS5_PBE_keyivgen;
> ++		i2d_PKCS8_bio;
> ++		i2d_PKCS8_PRIV_KEY_INFO_fp;
> ++		i2d_PKCS8_PRIV_KEY_INFO_bio;
> ++		BIO_s_bio;
> ++		PKCS5_pbe2_set;
> ++		PKCS5_PBKDF2_HMAC_SHA1;
> ++		PKCS5_v2_PBE_keyivgen;
> ++		PEM_write_bio_PKCS8PrivateKey;
> ++		PEM_write_PKCS8PrivateKey;
> ++		BIO_ctrl_get_read_request;
> ++		BIO_ctrl_pending;
> ++		BIO_ctrl_wpending;
> ++		BIO_new_bio_pair;
> ++		BIO_ctrl_get_write_guarantee;
> ++		CRYPTO_num_locks;
> ++		CONF_load_bio;
> ++		CONF_load_fp;
> ++		i2d_ASN1_SET_OF_ASN1_OBJECT;
> ++		d2i_ASN1_SET_OF_ASN1_OBJECT;
> ++		PKCS7_signatureVerify;
> ++		RSA_set_method;
> ++		RSA_get_method;
> ++		RSA_get_default_method;
> ++		RSA_check_key;
> ++		OBJ_obj2txt;
> ++		DSA_dup_DH;
> ++		X509_REQ_get_extensions;
> ++		X509_REQ_set_extension_nids;
> ++		BIO_nwrite;
> ++		X509_REQ_extension_nid;
> ++		BIO_nread;
> ++		X509_REQ_get_extension_nids;
> ++		BIO_nwrite0;
> ++		X509_REQ_add_extensions_nid;
> ++		BIO_nread0;
> ++		X509_REQ_add_extensions;
> ++		BIO_new_mem_buf;
> ++		DH_set_ex_data;
> ++		DH_set_method;
> ++		DSA_OpenSSL;
> ++		DH_get_ex_data;
> ++		DH_get_ex_new_index;
> ++		DSA_new_method;
> ++		DH_new_method;
> ++		DH_OpenSSL;
> ++		DSA_get_ex_new_index;
> ++		DH_get_default_method;
> ++		DSA_set_ex_data;
> ++		DH_set_default_method;
> ++		DSA_get_ex_data;
> ++		X509V3_EXT_REQ_add_conf;
> ++		NETSCAPE_SPKI_print;
> ++		NETSCAPE_SPKI_set_pubkey;
> ++		NETSCAPE_SPKI_b64_encode;
> ++		NETSCAPE_SPKI_get_pubkey;
> ++		NETSCAPE_SPKI_b64_decode;
> ++		UTF8_putc;
> ++		UTF8_getc;
> ++		RSA_null_method;
> ++		ASN1_tag2str;
> ++		BIO_ctrl_reset_read_request;
> ++		DISPLAYTEXT_new;
> ++		ASN1_GENERALIZEDTIME_free;
> ++		X509_REVOKED_get_ext_d2i;
> ++		X509_set_ex_data;
> ++		X509_reject_set_bit_asc;
> ++		X509_NAME_add_entry_by_txt;
> ++		X509_NAME_add_entry_by_NID;
> ++		X509_PURPOSE_get0;
> ++		PEM_read_X509_AUX;
> ++		d2i_AUTHORITY_INFO_ACCESS;
> ++		PEM_write_PUBKEY;
> ++		ACCESS_DESCRIPTION_new;
> ++		X509_CERT_AUX_free;
> ++		d2i_ACCESS_DESCRIPTION;
> ++		X509_trust_clear;
> ++		X509_TRUST_add;
> ++		ASN1_VISIBLESTRING_new;
> ++		X509_alias_set1;
> ++		ASN1_PRINTABLESTRING_free;
> ++		EVP_PKEY_get1_DSA;
> ++		ASN1_BMPSTRING_new;
> ++		ASN1_mbstring_copy;
> ++		ASN1_UTF8STRING_new;
> ++		DSA_get_default_method;
> ++		i2d_ASN1_SET_OF_ACCESS_DESCRIPTION;
> ++		ASN1_T61STRING_free;
> ++		DSA_set_method;
> ++		X509_get_ex_data;
> ++		ASN1_STRING_type;
> ++		X509_PURPOSE_get_by_sname;
> ++		ASN1_TIME_free;
> ++		ASN1_OCTET_STRING_cmp;
> ++		ASN1_BIT_STRING_new;
> ++		X509_get_ext_d2i;
> ++		PEM_read_bio_X509_AUX;
> ++		ASN1_STRING_set_default_mask_asc;
> ++		ASN1_STRING_set_def_mask_asc;
> ++		PEM_write_bio_RSA_PUBKEY;
> ++		ASN1_INTEGER_cmp;
> ++		d2i_RSA_PUBKEY_fp;
> ++		X509_trust_set_bit_asc;
> ++		PEM_write_bio_DSA_PUBKEY;
> ++		X509_STORE_CTX_free;
> ++		EVP_PKEY_set1_DSA;
> ++		i2d_DSA_PUBKEY_fp;
> ++		X509_load_cert_crl_file;
> ++		ASN1_TIME_new;
> ++		i2d_RSA_PUBKEY;
> ++		X509_STORE_CTX_purpose_inherit;
> ++		PEM_read_RSA_PUBKEY;
> ++		d2i_X509_AUX;
> ++		i2d_DSA_PUBKEY;
> ++		X509_CERT_AUX_print;
> ++		PEM_read_DSA_PUBKEY;
> ++		i2d_RSA_PUBKEY_bio;
> ++		ASN1_BIT_STRING_num_asc;
> ++		i2d_PUBKEY;
> ++		ASN1_UTCTIME_free;
> ++		DSA_set_default_method;
> ++		X509_PURPOSE_get_by_id;
> ++		ACCESS_DESCRIPTION_free;
> ++		PEM_read_bio_PUBKEY;
> ++		ASN1_STRING_set_by_NID;
> ++		X509_PURPOSE_get_id;
> ++		DISPLAYTEXT_free;
> ++		OTHERNAME_new;
> ++		X509_CERT_AUX_new;
> ++		X509_TRUST_cleanup;
> ++		X509_NAME_add_entry_by_OBJ;
> ++		X509_CRL_get_ext_d2i;
> ++		X509_PURPOSE_get0_name;
> ++		PEM_read_PUBKEY;
> ++		i2d_DSA_PUBKEY_bio;
> ++		i2d_OTHERNAME;
> ++		ASN1_OCTET_STRING_free;
> ++		ASN1_BIT_STRING_set_asc;
> ++		X509_get_ex_new_index;
> ++		ASN1_STRING_TABLE_cleanup;
> ++		X509_TRUST_get_by_id;
> ++		X509_PURPOSE_get_trust;
> ++		ASN1_STRING_length;
> ++		d2i_ASN1_SET_OF_ACCESS_DESCRIPTION;
> ++		ASN1_PRINTABLESTRING_new;
> ++		X509V3_get_d2i;
> ++		ASN1_ENUMERATED_free;
> ++		i2d_X509_CERT_AUX;
> ++		X509_STORE_CTX_set_trust;
> ++		ASN1_STRING_set_default_mask;
> ++		X509_STORE_CTX_new;
> ++		EVP_PKEY_get1_RSA;
> ++		DIRECTORYSTRING_free;
> ++		PEM_write_X509_AUX;
> ++		ASN1_OCTET_STRING_set;
> ++		d2i_DSA_PUBKEY_fp;
> ++		d2i_RSA_PUBKEY;
> ++		X509_TRUST_get0_name;
> ++		X509_TRUST_get0;
> ++		AUTHORITY_INFO_ACCESS_free;
> ++		ASN1_IA5STRING_new;
> ++		d2i_DSA_PUBKEY;
> ++		X509_check_purpose;
> ++		ASN1_ENUMERATED_new;
> ++		d2i_RSA_PUBKEY_bio;
> ++		d2i_PUBKEY;
> ++		X509_TRUST_get_trust;
> ++		X509_TRUST_get_flags;
> ++		ASN1_BMPSTRING_free;
> ++		ASN1_T61STRING_new;
> ++		ASN1_UTCTIME_new;
> ++		i2d_AUTHORITY_INFO_ACCESS;
> ++		EVP_PKEY_set1_RSA;
> ++		X509_STORE_CTX_set_purpose;
> ++		ASN1_IA5STRING_free;
> ++		PEM_write_bio_X509_AUX;
> ++		X509_PURPOSE_get_count;
> ++		CRYPTO_add_info;
> ++		X509_NAME_ENTRY_create_by_txt;
> ++		ASN1_STRING_get_default_mask;
> ++		X509_alias_get0;
> ++		ASN1_STRING_data;
> ++		i2d_ACCESS_DESCRIPTION;
> ++		X509_trust_set_bit;
> ++		ASN1_BIT_STRING_free;
> ++		PEM_read_bio_RSA_PUBKEY;
> ++		X509_add1_reject_object;
> ++		X509_check_trust;
> ++		PEM_read_bio_DSA_PUBKEY;
> ++		X509_PURPOSE_add;
> ++		ASN1_STRING_TABLE_get;
> ++		ASN1_UTF8STRING_free;
> ++		d2i_DSA_PUBKEY_bio;
> ++		PEM_write_RSA_PUBKEY;
> ++		d2i_OTHERNAME;
> ++		X509_reject_set_bit;
> ++		PEM_write_DSA_PUBKEY;
> ++		X509_PURPOSE_get0_sname;
> ++		EVP_PKEY_set1_DH;
> ++		ASN1_OCTET_STRING_dup;
> ++		ASN1_BIT_STRING_set;
> ++		X509_TRUST_get_count;
> ++		ASN1_INTEGER_free;
> ++		OTHERNAME_free;
> ++		i2d_RSA_PUBKEY_fp;
> ++		ASN1_INTEGER_dup;
> ++		d2i_X509_CERT_AUX;
> ++		PEM_write_bio_PUBKEY;
> ++		ASN1_VISIBLESTRING_free;
> ++		X509_PURPOSE_cleanup;
> ++		ASN1_mbstring_ncopy;
> ++		ASN1_GENERALIZEDTIME_new;
> ++		EVP_PKEY_get1_DH;
> ++		ASN1_OCTET_STRING_new;
> ++		ASN1_INTEGER_new;
> ++		i2d_X509_AUX;
> ++		ASN1_BIT_STRING_name_print;
> ++		X509_cmp;
> ++		ASN1_STRING_length_set;
> ++		DIRECTORYSTRING_new;
> ++		X509_add1_trust_object;
> ++		PKCS12_newpass;
> ++		SMIME_write_PKCS7;
> ++		SMIME_read_PKCS7;
> ++		DES_set_key_checked;
> ++		PKCS7_verify;
> ++		PKCS7_encrypt;
> ++		DES_set_key_unchecked;
> ++		SMIME_crlf_copy;
> ++		i2d_ASN1_PRINTABLESTRING;
> ++		PKCS7_get0_signers;
> ++		PKCS7_decrypt;
> ++		SMIME_text;
> ++		PKCS7_simple_smimecap;
> ++		PKCS7_get_smimecap;
> ++		PKCS7_sign;
> ++		PKCS7_add_attrib_smimecap;
> ++		CRYPTO_dbg_set_options;
> ++		CRYPTO_remove_all_info;
> ++		CRYPTO_get_mem_debug_functions;
> ++		CRYPTO_is_mem_check_on;
> ++		CRYPTO_set_mem_debug_functions;
> ++		CRYPTO_pop_info;
> ++		CRYPTO_push_info_;
> ++		CRYPTO_set_mem_debug_options;
> ++		PEM_write_PKCS8PrivateKey_nid;
> ++		PEM_write_bio_PKCS8PrivateKey_nid;
> ++		PEM_write_bio_PKCS8PrivKey_nid;
> ++		d2i_PKCS8PrivateKey_bio;
> ++		ASN1_NULL_free;
> ++		d2i_ASN1_NULL;
> ++		ASN1_NULL_new;
> ++		i2d_PKCS8PrivateKey_bio;
> ++		i2d_PKCS8PrivateKey_fp;
> ++		i2d_ASN1_NULL;
> ++		i2d_PKCS8PrivateKey_nid_fp;
> ++		d2i_PKCS8PrivateKey_fp;
> ++		i2d_PKCS8PrivateKey_nid_bio;
> ++		i2d_PKCS8PrivateKeyInfo_fp;
> ++		i2d_PKCS8PrivateKeyInfo_bio;
> ++		PEM_cb;
> ++		i2d_PrivateKey_fp;
> ++		d2i_PrivateKey_bio;
> ++		d2i_PrivateKey_fp;
> ++		i2d_PrivateKey_bio;
> ++		X509_reject_clear;
> ++		X509_TRUST_set_default;
> ++		d2i_AutoPrivateKey;
> ++		X509_ATTRIBUTE_get0_type;
> ++		X509_ATTRIBUTE_set1_data;
> ++		X509at_get_attr;
> ++		X509at_get_attr_count;
> ++		X509_ATTRIBUTE_create_by_NID;
> ++		X509_ATTRIBUTE_set1_object;
> ++		X509_ATTRIBUTE_count;
> ++		X509_ATTRIBUTE_create_by_OBJ;
> ++		X509_ATTRIBUTE_get0_object;
> ++		X509at_get_attr_by_NID;
> ++		X509at_add1_attr;
> ++		X509_ATTRIBUTE_get0_data;
> ++		X509at_delete_attr;
> ++		X509at_get_attr_by_OBJ;
> ++		RAND_add;
> ++		BIO_number_written;
> ++		BIO_number_read;
> ++		X509_STORE_CTX_get1_chain;
> ++		ERR_load_RAND_strings;
> ++		RAND_pseudo_bytes;
> ++		X509_REQ_get_attr_by_NID;
> ++		X509_REQ_get_attr;
> ++		X509_REQ_add1_attr_by_NID;
> ++		X509_REQ_get_attr_by_OBJ;
> ++		X509at_add1_attr_by_NID;
> ++		X509_REQ_add1_attr_by_OBJ;
> ++		X509_REQ_get_attr_count;
> ++		X509_REQ_add1_attr;
> ++		X509_REQ_delete_attr;
> ++		X509at_add1_attr_by_OBJ;
> ++		X509_REQ_add1_attr_by_txt;
> ++		X509_ATTRIBUTE_create_by_txt;
> ++		X509at_add1_attr_by_txt;
> ++		BN_pseudo_rand;
> ++		BN_is_prime_fasttest;
> ++		BN_CTX_end;
> ++		BN_CTX_start;
> ++		BN_CTX_get;
> ++		EVP_PKEY2PKCS8_broken;
> ++		ASN1_STRING_TABLE_add;
> ++		CRYPTO_dbg_get_options;
> ++		AUTHORITY_INFO_ACCESS_new;
> ++		CRYPTO_get_mem_debug_options;
> ++		DES_crypt;
> ++		PEM_write_bio_X509_REQ_NEW;
> ++		PEM_write_X509_REQ_NEW;
> ++		BIO_callback_ctrl;
> ++		RAND_egd;
> ++		RAND_status;
> ++		bn_dump1;
> ++		DES_check_key_parity;
> ++		lh_num_items;
> ++		RAND_event;
> ++		DSO_new;
> ++		DSO_new_method;
> ++		DSO_free;
> ++		DSO_flags;
> ++		DSO_up;
> ++		DSO_set_default_method;
> ++		DSO_get_default_method;
> ++		DSO_get_method;
> ++		DSO_set_method;
> ++		DSO_load;
> ++		DSO_bind_var;
> ++		DSO_METHOD_null;
> ++		DSO_METHOD_openssl;
> ++		DSO_METHOD_dlfcn;
> ++		DSO_METHOD_win32;
> ++		ERR_load_DSO_strings;
> ++		DSO_METHOD_dl;
> ++		NCONF_load;
> ++		NCONF_load_fp;
> ++		NCONF_new;
> ++		NCONF_get_string;
> ++		NCONF_free;
> ++		NCONF_get_number;
> ++		CONF_dump_fp;
> ++		NCONF_load_bio;
> ++		NCONF_dump_fp;
> ++		NCONF_get_section;
> ++		NCONF_dump_bio;
> ++		CONF_dump_bio;
> ++		NCONF_free_data;
> ++		CONF_set_default_method;
> ++		ERR_error_string_n;
> ++		BIO_snprintf;
> ++		DSO_ctrl;
> ++		i2d_ASN1_SET_OF_ASN1_INTEGER;
> ++		i2d_ASN1_SET_OF_PKCS12_SAFEBAG;
> ++		i2d_ASN1_SET_OF_PKCS7;
> ++		BIO_vfree;
> ++		d2i_ASN1_SET_OF_ASN1_INTEGER;
> ++		d2i_ASN1_SET_OF_PKCS12_SAFEBAG;
> ++		ASN1_UTCTIME_get;
> ++		X509_REQ_digest;
> ++		X509_CRL_digest;
> ++		d2i_ASN1_SET_OF_PKCS7;
> ++		EVP_CIPHER_CTX_set_key_length;
> ++		EVP_CIPHER_CTX_ctrl;
> ++		BN_mod_exp_mont_word;
> ++		RAND_egd_bytes;
> ++		X509_REQ_get1_email;
> ++		X509_get1_email;
> ++		X509_email_free;
> ++		i2d_RSA_NET;
> ++		d2i_RSA_NET_2;
> ++		d2i_RSA_NET;
> ++		DSO_bind_func;
> ++		CRYPTO_get_new_dynlockid;
> ++		sk_new_null;
> ++		CRYPTO_set_dynlock_destroy_callback;
> ++		CRYPTO_set_dynlock_destroy_cb;
> ++		CRYPTO_destroy_dynlockid;
> ++		CRYPTO_set_dynlock_size;
> ++		CRYPTO_set_dynlock_create_callback;
> ++		CRYPTO_set_dynlock_create_cb;
> ++		CRYPTO_set_dynlock_lock_callback;
> ++		CRYPTO_set_dynlock_lock_cb;
> ++		CRYPTO_get_dynlock_lock_callback;
> ++		CRYPTO_get_dynlock_lock_cb;
> ++		CRYPTO_get_dynlock_destroy_callback;
> ++		CRYPTO_get_dynlock_destroy_cb;
> ++		CRYPTO_get_dynlock_value;
> ++		CRYPTO_get_dynlock_create_callback;
> ++		CRYPTO_get_dynlock_create_cb;
> ++		c2i_ASN1_BIT_STRING;
> ++		i2c_ASN1_BIT_STRING;
> ++		RAND_poll;
> ++		c2i_ASN1_INTEGER;
> ++		i2c_ASN1_INTEGER;
> ++		BIO_dump_indent;
> ++		ASN1_parse_dump;
> ++		c2i_ASN1_OBJECT;
> ++		X509_NAME_print_ex_fp;
> ++		ASN1_STRING_print_ex_fp;
> ++		X509_NAME_print_ex;
> ++		ASN1_STRING_print_ex;
> ++		MD4;
> ++		MD4_Transform;
> ++		MD4_Final;
> ++		MD4_Update;
> ++		MD4_Init;
> ++		EVP_md4;
> ++		i2d_PUBKEY_bio;
> ++		i2d_PUBKEY_fp;
> ++		d2i_PUBKEY_bio;
> ++		ASN1_STRING_to_UTF8;
> ++		BIO_vprintf;
> ++		BIO_vsnprintf;
> ++		d2i_PUBKEY_fp;
> ++		X509_cmp_time;
> ++		X509_STORE_CTX_set_time;
> ++		X509_STORE_CTX_get1_issuer;
> ++		X509_OBJECT_retrieve_match;
> ++		X509_OBJECT_idx_by_subject;
> ++		X509_STORE_CTX_set_flags;
> ++		X509_STORE_CTX_trusted_stack;
> ++		X509_time_adj;
> ++		X509_check_issued;
> ++		ASN1_UTCTIME_cmp_time_t;
> ++		DES_set_weak_key_flag;
> ++		DES_check_key;
> ++		DES_rw_mode;
> ++		RSA_PKCS1_RSAref;
> ++		X509_keyid_set1;
> ++		BIO_next;
> ++		DSO_METHOD_vms;
> ++		BIO_f_linebuffer;
> ++		BN_bntest_rand;
> ++		OPENSSL_issetugid;
> ++		BN_rand_range;
> ++		ERR_load_ENGINE_strings;
> ++		ENGINE_set_DSA;
> ++		ENGINE_get_finish_function;
> ++		ENGINE_get_default_RSA;
> ++		ENGINE_get_BN_mod_exp;
> ++		DSA_get_default_openssl_method;
> ++		ENGINE_set_DH;
> ++		ENGINE_set_def_BN_mod_exp_crt;
> ++		ENGINE_set_default_BN_mod_exp_crt;
> ++		ENGINE_init;
> ++		DH_get_default_openssl_method;
> ++		RSA_set_default_openssl_method;
> ++		ENGINE_finish;
> ++		ENGINE_load_public_key;
> ++		ENGINE_get_DH;
> ++		ENGINE_ctrl;
> ++		ENGINE_get_init_function;
> ++		ENGINE_set_init_function;
> ++		ENGINE_set_default_DSA;
> ++		ENGINE_get_name;
> ++		ENGINE_get_last;
> ++		ENGINE_get_prev;
> ++		ENGINE_get_default_DH;
> ++		ENGINE_get_RSA;
> ++		ENGINE_set_default;
> ++		ENGINE_get_RAND;
> ++		ENGINE_get_first;
> ++		ENGINE_by_id;
> ++		ENGINE_set_finish_function;
> ++		ENGINE_get_def_BN_mod_exp_crt;
> ++		ENGINE_get_default_BN_mod_exp_crt;
> ++		RSA_get_default_openssl_method;
> ++		ENGINE_set_RSA;
> ++		ENGINE_load_private_key;
> ++		ENGINE_set_default_RAND;
> ++		ENGINE_set_BN_mod_exp;
> ++		ENGINE_remove;
> ++		ENGINE_free;
> ++		ENGINE_get_BN_mod_exp_crt;
> ++		ENGINE_get_next;
> ++		ENGINE_set_name;
> ++		ENGINE_get_default_DSA;
> ++		ENGINE_set_default_BN_mod_exp;
> ++		ENGINE_set_default_RSA;
> ++		ENGINE_get_default_RAND;
> ++		ENGINE_get_default_BN_mod_exp;
> ++		ENGINE_set_RAND;
> ++		ENGINE_set_id;
> ++		ENGINE_set_BN_mod_exp_crt;
> ++		ENGINE_set_default_DH;
> ++		ENGINE_new;
> ++		ENGINE_get_id;
> ++		DSA_set_default_openssl_method;
> ++		ENGINE_add;
> ++		DH_set_default_openssl_method;
> ++		ENGINE_get_DSA;
> ++		ENGINE_get_ctrl_function;
> ++		ENGINE_set_ctrl_function;
> ++		BN_pseudo_rand_range;
> ++		X509_STORE_CTX_set_verify_cb;
> ++		ERR_load_COMP_strings;
> ++		PKCS12_item_decrypt_d2i;
> ++		ASN1_UTF8STRING_it;
> ++		ENGINE_unregister_ciphers;
> ++		ENGINE_get_ciphers;
> ++		d2i_OCSP_BASICRESP;
> ++		KRB5_CHECKSUM_it;
> ++		EC_POINT_add;
> ++		ASN1_item_ex_i2d;
> ++		OCSP_CERTID_it;
> ++		d2i_OCSP_RESPBYTES;
> ++		X509V3_add1_i2d;
> ++		PKCS7_ENVELOPE_it;
> ++		UI_add_input_boolean;
> ++		ENGINE_unregister_RSA;
> ++		X509V3_EXT_nconf;
> ++		ASN1_GENERALSTRING_free;
> ++		d2i_OCSP_CERTSTATUS;
> ++		X509_REVOKED_set_serialNumber;
> ++		X509_print_ex;
> ++		OCSP_ONEREQ_get1_ext_d2i;
> ++		ENGINE_register_all_RAND;
> ++		ENGINE_load_dynamic;
> ++		PBKDF2PARAM_it;
> ++		EXTENDED_KEY_USAGE_new;
> ++		EC_GROUP_clear_free;
> ++		OCSP_sendreq_bio;
> ++		ASN1_item_digest;
> ++		OCSP_BASICRESP_delete_ext;
> ++		OCSP_SIGNATURE_it;
> ++		X509_CRL_it;
> ++		OCSP_BASICRESP_add_ext;
> ++		KRB5_ENCKEY_it;
> ++		UI_method_set_closer;
> ++		X509_STORE_set_purpose;
> ++		i2d_ASN1_GENERALSTRING;
> ++		OCSP_response_status;
> ++		i2d_OCSP_SERVICELOC;
> ++		ENGINE_get_digest_engine;
> ++		EC_GROUP_set_curve_GFp;
> ++		OCSP_REQUEST_get_ext_by_OBJ;
> ++		_ossl_old_des_random_key;
> ++		ASN1_T61STRING_it;
> ++		EC_GROUP_method_of;
> ++		i2d_KRB5_APREQ;
> ++		_ossl_old_des_encrypt;
> ++		ASN1_PRINTABLE_new;
> ++		HMAC_Init_ex;
> ++		d2i_KRB5_AUTHENT;
> ++		OCSP_archive_cutoff_new;
> ++		EC_POINT_set_Jprojective_coordinates_GFp;
> ++		EC_POINT_set_Jproj_coords_GFp;
> ++		_ossl_old_des_is_weak_key;
> ++		OCSP_BASICRESP_get_ext_by_OBJ;
> ++		EC_POINT_oct2point;
> ++		OCSP_SINGLERESP_get_ext_count;
> ++		UI_ctrl;
> ++		_shadow_DES_rw_mode;
> ++		asn1_do_adb;
> ++		ASN1_template_i2d;
> ++		ENGINE_register_DH;
> ++		UI_construct_prompt;
> ++		X509_STORE_set_trust;
> ++		UI_dup_input_string;
> ++		d2i_KRB5_APREQ;
> ++		EVP_MD_CTX_copy_ex;
> ++		OCSP_request_is_signed;
> ++		i2d_OCSP_REQINFO;
> ++		KRB5_ENCKEY_free;
> ++		OCSP_resp_get0;
> ++		GENERAL_NAME_it;
> ++		ASN1_GENERALIZEDTIME_it;
> ++		X509_STORE_set_flags;
> ++		EC_POINT_set_compressed_coordinates_GFp;
> ++		EC_POINT_set_compr_coords_GFp;
> ++		OCSP_response_status_str;
> ++		d2i_OCSP_REVOKEDINFO;
> ++		OCSP_basic_add1_cert;
> ++		ERR_get_implementation;
> ++		EVP_CipherFinal_ex;
> ++		OCSP_CERTSTATUS_new;
> ++		CRYPTO_cleanup_all_ex_data;
> ++		OCSP_resp_find;
> ++		BN_nnmod;
> ++		X509_CRL_sort;
> ++		X509_REVOKED_set_revocationDate;
> ++		ENGINE_register_RAND;
> ++		OCSP_SERVICELOC_new;
> ++		EC_POINT_set_affine_coordinates_GFp;
> ++		EC_POINT_set_affine_coords_GFp;
> ++		_ossl_old_des_options;
> ++		SXNET_it;
> ++		UI_dup_input_boolean;
> ++		PKCS12_add_CSPName_asc;
> ++		EC_POINT_is_at_infinity;
> ++		ENGINE_load_cryptodev;
> ++		DSO_convert_filename;
> ++		POLICYQUALINFO_it;
> ++		ENGINE_register_ciphers;
> ++		BN_mod_lshift_quick;
> ++		DSO_set_filename;
> ++		ASN1_item_free;
> ++		KRB5_TKTBODY_free;
> ++		AUTHORITY_KEYID_it;
> ++		KRB5_APREQBODY_new;
> ++		X509V3_EXT_REQ_add_nconf;
> ++		ENGINE_ctrl_cmd_string;
> ++		i2d_OCSP_RESPDATA;
> ++		EVP_MD_CTX_init;
> ++		EXTENDED_KEY_USAGE_free;
> ++		PKCS7_ATTR_SIGN_it;
> ++		UI_add_error_string;
> ++		KRB5_CHECKSUM_free;
> ++		OCSP_REQUEST_get_ext;
> ++		ENGINE_load_ubsec;
> ++		ENGINE_register_all_digests;
> ++		PKEY_USAGE_PERIOD_it;
> ++		PKCS12_unpack_authsafes;
> ++		ASN1_item_unpack;
> ++		NETSCAPE_SPKAC_it;
> ++		X509_REVOKED_it;
> ++		ASN1_STRING_encode;
> ++		EVP_aes_128_ecb;
> ++		KRB5_AUTHENT_free;
> ++		OCSP_BASICRESP_get_ext_by_critical;
> ++		OCSP_BASICRESP_get_ext_by_crit;
> ++		OCSP_cert_status_str;
> ++		d2i_OCSP_REQUEST;
> ++		UI_dup_info_string;
> ++		_ossl_old_des_xwhite_in2out;
> ++		PKCS12_it;
> ++		OCSP_SINGLERESP_get_ext_by_critical;
> ++		OCSP_SINGLERESP_get_ext_by_crit;
> ++		OCSP_CERTSTATUS_free;
> ++		_ossl_old_des_crypt;
> ++		ASN1_item_i2d;
> ++		EVP_DecryptFinal_ex;
> ++		ENGINE_load_openssl;
> ++		ENGINE_get_cmd_defns;
> ++		ENGINE_set_load_privkey_function;
> ++		ENGINE_set_load_privkey_fn;
> ++		EVP_EncryptFinal_ex;
> ++		ENGINE_set_default_digests;
> ++		X509_get0_pubkey_bitstr;
> ++		asn1_ex_i2c;
> ++		ENGINE_register_RSA;
> ++		ENGINE_unregister_DSA;
> ++		_ossl_old_des_key_sched;
> ++		X509_EXTENSION_it;
> ++		i2d_KRB5_AUTHENT;
> ++		SXNETID_it;
> ++		d2i_OCSP_SINGLERESP;
> ++		EDIPARTYNAME_new;
> ++		PKCS12_certbag2x509;
> ++		_ossl_old_des_ofb64_encrypt;
> ++		d2i_EXTENDED_KEY_USAGE;
> ++		ERR_print_errors_cb;
> ++		ENGINE_set_ciphers;
> ++		d2i_KRB5_APREQBODY;
> ++		UI_method_get_flusher;
> ++		X509_PUBKEY_it;
> ++		_ossl_old_des_enc_read;
> ++		PKCS7_ENCRYPT_it;
> ++		i2d_OCSP_RESPONSE;
> ++		EC_GROUP_get_cofactor;
> ++		PKCS12_unpack_p7data;
> ++		d2i_KRB5_AUTHDATA;
> ++		OCSP_copy_nonce;
> ++		KRB5_AUTHDATA_new;
> ++		OCSP_RESPDATA_new;
> ++		EC_GFp_mont_method;
> ++		OCSP_REVOKEDINFO_free;
> ++		UI_get_ex_data;
> ++		KRB5_APREQBODY_free;
> ++		EC_GROUP_get0_generator;
> ++		UI_get_default_method;
> ++		X509V3_set_nconf;
> ++		PKCS12_item_i2d_encrypt;
> ++		X509_add1_ext_i2d;
> ++		PKCS7_SIGNER_INFO_it;
> ++		KRB5_PRINCNAME_new;
> ++		PKCS12_SAFEBAG_it;
> ++		EC_GROUP_get_order;
> ++		d2i_OCSP_RESPID;
> ++		OCSP_request_verify;
> ++		NCONF_get_number_e;
> ++		_ossl_old_des_decrypt3;
> ++		X509_signature_print;
> ++		OCSP_SINGLERESP_free;
> ++		ENGINE_load_builtin_engines;
> ++		i2d_OCSP_ONEREQ;
> ++		OCSP_REQUEST_add_ext;
> ++		OCSP_RESPBYTES_new;
> ++		EVP_MD_CTX_create;
> ++		OCSP_resp_find_status;
> ++		X509_ALGOR_it;
> ++		ASN1_TIME_it;
> ++		OCSP_request_set1_name;
> ++		OCSP_ONEREQ_get_ext_count;
> ++		UI_get0_result;
> ++		PKCS12_AUTHSAFES_it;
> ++		EVP_aes_256_ecb;
> ++		PKCS12_pack_authsafes;
> ++		ASN1_IA5STRING_it;
> ++		UI_get_input_flags;
> ++		EC_GROUP_set_generator;
> ++		_ossl_old_des_string_to_2keys;
> ++		OCSP_CERTID_free;
> ++		X509_CERT_AUX_it;
> ++		CERTIFICATEPOLICIES_it;
> ++		_ossl_old_des_ede3_cbc_encrypt;
> ++		RAND_set_rand_engine;
> ++		DSO_get_loaded_filename;
> ++		X509_ATTRIBUTE_it;
> ++		OCSP_ONEREQ_get_ext_by_NID;
> ++		PKCS12_decrypt_skey;
> ++		KRB5_AUTHENT_it;
> ++		UI_dup_error_string;
> ++		RSAPublicKey_it;
> ++		i2d_OCSP_REQUEST;
> ++		PKCS12_x509crl2certbag;
> ++		OCSP_SERVICELOC_it;
> ++		ASN1_item_sign;
> ++		X509_CRL_set_issuer_name;
> ++		OBJ_NAME_do_all_sorted;
> ++		i2d_OCSP_BASICRESP;
> ++		i2d_OCSP_RESPBYTES;
> ++		PKCS12_unpack_p7encdata;
> ++		HMAC_CTX_init;
> ++		ENGINE_get_digest;
> ++		OCSP_RESPONSE_print;
> ++		KRB5_TKTBODY_it;
> ++		ACCESS_DESCRIPTION_it;
> ++		PKCS7_ISSUER_AND_SERIAL_it;
> ++		PBE2PARAM_it;
> ++		PKCS12_certbag2x509crl;
> ++		PKCS7_SIGNED_it;
> ++		ENGINE_get_cipher;
> ++		i2d_OCSP_CRLID;
> ++		OCSP_SINGLERESP_new;
> ++		ENGINE_cmd_is_executable;
> ++		RSA_up_ref;
> ++		ASN1_GENERALSTRING_it;
> ++		ENGINE_register_DSA;
> ++		X509V3_EXT_add_nconf_sk;
> ++		ENGINE_set_load_pubkey_function;
> ++		PKCS8_decrypt;
> ++		PEM_bytes_read_bio;
> ++		DIRECTORYSTRING_it;
> ++		d2i_OCSP_CRLID;
> ++		EC_POINT_is_on_curve;
> ++		CRYPTO_set_locked_mem_ex_functions;
> ++		CRYPTO_set_locked_mem_ex_funcs;
> ++		d2i_KRB5_CHECKSUM;
> ++		ASN1_item_dup;
> ++		X509_it;
> ++		BN_mod_add;
> ++		KRB5_AUTHDATA_free;
> ++		_ossl_old_des_cbc_cksum;
> ++		ASN1_item_verify;
> ++		CRYPTO_set_mem_ex_functions;
> ++		EC_POINT_get_Jprojective_coordinates_GFp;
> ++		EC_POINT_get_Jproj_coords_GFp;
> ++		ZLONG_it;
> ++		CRYPTO_get_locked_mem_ex_functions;
> ++		CRYPTO_get_locked_mem_ex_funcs;
> ++		ASN1_TIME_check;
> ++		UI_get0_user_data;
> ++		HMAC_CTX_cleanup;
> ++		DSA_up_ref;
> ++		_ossl_old_des_ede3_cfb64_encrypt;
> ++		_ossl_odes_ede3_cfb64_encrypt;
> ++		ASN1_BMPSTRING_it;
> ++		ASN1_tag2bit;
> ++		UI_method_set_flusher;
> ++		X509_ocspid_print;
> ++		KRB5_ENCDATA_it;
> ++		ENGINE_get_load_pubkey_function;
> ++		UI_add_user_data;
> ++		OCSP_REQUEST_delete_ext;
> ++		UI_get_method;
> ++		OCSP_ONEREQ_free;
> ++		ASN1_PRINTABLESTRING_it;
> ++		X509_CRL_set_nextUpdate;
> ++		OCSP_REQUEST_it;
> ++		OCSP_BASICRESP_it;
> ++		AES_ecb_encrypt;
> ++		BN_mod_sqr;
> ++		NETSCAPE_CERT_SEQUENCE_it;
> ++		GENERAL_NAMES_it;
> ++		AUTHORITY_INFO_ACCESS_it;
> ++		ASN1_FBOOLEAN_it;
> ++		UI_set_ex_data;
> ++		_ossl_old_des_string_to_key;
> ++		ENGINE_register_all_RSA;
> ++		d2i_KRB5_PRINCNAME;
> ++		OCSP_RESPBYTES_it;
> ++		X509_CINF_it;
> ++		ENGINE_unregister_digests;
> ++		d2i_EDIPARTYNAME;
> ++		d2i_OCSP_SERVICELOC;
> ++		ENGINE_get_digests;
> ++		_ossl_old_des_set_odd_parity;
> ++		OCSP_RESPDATA_free;
> ++		d2i_KRB5_TICKET;
> ++		OTHERNAME_it;
> ++		EVP_MD_CTX_cleanup;
> ++		d2i_ASN1_GENERALSTRING;
> ++		X509_CRL_set_version;
> ++		BN_mod_sub;
> ++		OCSP_SINGLERESP_get_ext_by_NID;
> ++		ENGINE_get_ex_new_index;
> ++		OCSP_REQUEST_free;
> ++		OCSP_REQUEST_add1_ext_i2d;
> ++		X509_VAL_it;
> ++		EC_POINTs_make_affine;
> ++		EC_POINT_mul;
> ++		X509V3_EXT_add_nconf;
> ++		X509_TRUST_set;
> ++		X509_CRL_add1_ext_i2d;
> ++		_ossl_old_des_fcrypt;
> ++		DISPLAYTEXT_it;
> ++		X509_CRL_set_lastUpdate;
> ++		OCSP_BASICRESP_free;
> ++		OCSP_BASICRESP_add1_ext_i2d;
> ++		d2i_KRB5_AUTHENTBODY;
> ++		CRYPTO_set_ex_data_implementation;
> ++		CRYPTO_set_ex_data_impl;
> ++		KRB5_ENCDATA_new;
> ++		DSO_up_ref;
> ++		OCSP_crl_reason_str;
> ++		UI_get0_result_string;
> ++		ASN1_GENERALSTRING_new;
> ++		X509_SIG_it;
> ++		ERR_set_implementation;
> ++		ERR_load_EC_strings;
> ++		UI_get0_action_string;
> ++		OCSP_ONEREQ_get_ext;
> ++		EC_POINT_method_of;
> ++		i2d_KRB5_APREQBODY;
> ++		_ossl_old_des_ecb3_encrypt;
> ++		CRYPTO_get_mem_ex_functions;
> ++		ENGINE_get_ex_data;
> ++		UI_destroy_method;
> ++		ASN1_item_i2d_bio;
> ++		OCSP_ONEREQ_get_ext_by_OBJ;
> ++		ASN1_primitive_new;
> ++		ASN1_PRINTABLE_it;
> ++		EVP_aes_192_ecb;
> ++		OCSP_SIGNATURE_new;
> ++		LONG_it;
> ++		ASN1_VISIBLESTRING_it;
> ++		OCSP_SINGLERESP_add1_ext_i2d;
> ++		d2i_OCSP_CERTID;
> ++		ASN1_item_d2i_fp;
> ++		CRL_DIST_POINTS_it;
> ++		GENERAL_NAME_print;
> ++		OCSP_SINGLERESP_delete_ext;
> ++		PKCS12_SAFEBAGS_it;
> ++		d2i_OCSP_SIGNATURE;
> ++		OCSP_request_add1_nonce;
> ++		ENGINE_set_cmd_defns;
> ++		OCSP_SERVICELOC_free;
> ++		EC_GROUP_free;
> ++		ASN1_BIT_STRING_it;
> ++		X509_REQ_it;
> ++		_ossl_old_des_cbc_encrypt;
> ++		ERR_unload_strings;
> ++		PKCS7_SIGN_ENVELOPE_it;
> ++		EDIPARTYNAME_free;
> ++		OCSP_REQINFO_free;
> ++		EC_GROUP_new_curve_GFp;
> ++		OCSP_REQUEST_get1_ext_d2i;
> ++		PKCS12_item_pack_safebag;
> ++		asn1_ex_c2i;
> ++		ENGINE_register_digests;
> ++		i2d_OCSP_REVOKEDINFO;
> ++		asn1_enc_restore;
> ++		UI_free;
> ++		UI_new_method;
> ++		EVP_EncryptInit_ex;
> ++		X509_pubkey_digest;
> ++		EC_POINT_invert;
> ++		OCSP_basic_sign;
> ++		i2d_OCSP_RESPID;
> ++		OCSP_check_nonce;
> ++		ENGINE_ctrl_cmd;
> ++		d2i_KRB5_ENCKEY;
> ++		OCSP_parse_url;
> ++		OCSP_SINGLERESP_get_ext;
> ++		OCSP_CRLID_free;
> ++		OCSP_BASICRESP_get1_ext_d2i;
> ++		RSAPrivateKey_it;
> ++		ENGINE_register_all_DH;
> ++		i2d_EDIPARTYNAME;
> ++		EC_POINT_get_affine_coordinates_GFp;
> ++		EC_POINT_get_affine_coords_GFp;
> ++		OCSP_CRLID_new;
> ++		ENGINE_get_flags;
> ++		OCSP_ONEREQ_it;
> ++		UI_process;
> ++		ASN1_INTEGER_it;
> ++		EVP_CipherInit_ex;
> ++		UI_get_string_type;
> ++		ENGINE_unregister_DH;
> ++		ENGINE_register_all_DSA;
> ++		OCSP_ONEREQ_get_ext_by_critical;
> ++		bn_dup_expand;
> ++		OCSP_cert_id_new;
> ++		BASIC_CONSTRAINTS_it;
> ++		BN_mod_add_quick;
> ++		EC_POINT_new;
> ++		EVP_MD_CTX_destroy;
> ++		OCSP_RESPBYTES_free;
> ++		EVP_aes_128_cbc;
> ++		OCSP_SINGLERESP_get1_ext_d2i;
> ++		EC_POINT_free;
> ++		DH_up_ref;
> ++		X509_NAME_ENTRY_it;
> ++		UI_get_ex_new_index;
> ++		BN_mod_sub_quick;
> ++		OCSP_ONEREQ_add_ext;
> ++		OCSP_request_sign;
> ++		EVP_DigestFinal_ex;
> ++		ENGINE_set_digests;
> ++		OCSP_id_issuer_cmp;
> ++		OBJ_NAME_do_all;
> ++		EC_POINTs_mul;
> ++		ENGINE_register_complete;
> ++		X509V3_EXT_nconf_nid;
> ++		ASN1_SEQUENCE_it;
> ++		UI_set_default_method;
> ++		RAND_query_egd_bytes;
> ++		UI_method_get_writer;
> ++		UI_OpenSSL;
> ++		PEM_def_callback;
> ++		ENGINE_cleanup;
> ++		DIST_POINT_it;
> ++		OCSP_SINGLERESP_it;
> ++		d2i_KRB5_TKTBODY;
> ++		EC_POINT_cmp;
> ++		OCSP_REVOKEDINFO_new;
> ++		i2d_OCSP_CERTSTATUS;
> ++		OCSP_basic_add1_nonce;
> ++		ASN1_item_ex_d2i;
> ++		BN_mod_lshift1_quick;
> ++		UI_set_method;
> ++		OCSP_id_get0_info;
> ++		BN_mod_sqrt;
> ++		EC_GROUP_copy;
> ++		KRB5_ENCDATA_free;
> ++		_ossl_old_des_cfb_encrypt;
> ++		OCSP_SINGLERESP_get_ext_by_OBJ;
> ++		OCSP_cert_to_id;
> ++		OCSP_RESPID_new;
> ++		OCSP_RESPDATA_it;
> ++		d2i_OCSP_RESPDATA;
> ++		ENGINE_register_all_complete;
> ++		OCSP_check_validity;
> ++		PKCS12_BAGS_it;
> ++		OCSP_url_svcloc_new;
> ++		ASN1_template_free;
> ++		OCSP_SINGLERESP_add_ext;
> ++		KRB5_AUTHENTBODY_it;
> ++		X509_supported_extension;
> ++		i2d_KRB5_AUTHDATA;
> ++		UI_method_get_opener;
> ++		ENGINE_set_ex_data;
> ++		OCSP_REQUEST_print;
> ++		CBIGNUM_it;
> ++		KRB5_TICKET_new;
> ++		KRB5_APREQ_new;
> ++		EC_GROUP_get_curve_GFp;
> ++		KRB5_ENCKEY_new;
> ++		ASN1_template_d2i;
> ++		_ossl_old_des_quad_cksum;
> ++		OCSP_single_get0_status;
> ++		BN_swap;
> ++		POLICYINFO_it;
> ++		ENGINE_set_destroy_function;
> ++		asn1_enc_free;
> ++		OCSP_RESPID_it;
> ++		EC_GROUP_new;
> ++		EVP_aes_256_cbc;
> ++		i2d_KRB5_PRINCNAME;
> ++		_ossl_old_des_encrypt2;
> ++		_ossl_old_des_encrypt3;
> ++		PKCS8_PRIV_KEY_INFO_it;
> ++		OCSP_REQINFO_it;
> ++		PBEPARAM_it;
> ++		KRB5_AUTHENTBODY_new;
> ++		X509_CRL_add0_revoked;
> ++		EDIPARTYNAME_it;
> ++		NETSCAPE_SPKI_it;
> ++		UI_get0_test_string;
> ++		ENGINE_get_cipher_engine;
> ++		ENGINE_register_all_ciphers;
> ++		EC_POINT_copy;
> ++		BN_kronecker;
> ++		_ossl_old_des_ede3_ofb64_encrypt;
> ++		_ossl_odes_ede3_ofb64_encrypt;
> ++		UI_method_get_reader;
> ++		OCSP_BASICRESP_get_ext_count;
> ++		ASN1_ENUMERATED_it;
> ++		UI_set_result;
> ++		i2d_KRB5_TICKET;
> ++		X509_print_ex_fp;
> ++		EVP_CIPHER_CTX_set_padding;
> ++		d2i_OCSP_RESPONSE;
> ++		ASN1_UTCTIME_it;
> ++		_ossl_old_des_enc_write;
> ++		OCSP_RESPONSE_new;
> ++		AES_set_encrypt_key;
> ++		OCSP_resp_count;
> ++		KRB5_CHECKSUM_new;
> ++		ENGINE_load_cswift;
> ++		OCSP_onereq_get0_id;
> ++		ENGINE_set_default_ciphers;
> ++		NOTICEREF_it;
> ++		X509V3_EXT_CRL_add_nconf;
> ++		OCSP_REVOKEDINFO_it;
> ++		AES_encrypt;
> ++		OCSP_REQUEST_new;
> ++		ASN1_ANY_it;
> ++		CRYPTO_ex_data_new_class;
> ++		_ossl_old_des_ncbc_encrypt;
> ++		i2d_KRB5_TKTBODY;
> ++		EC_POINT_clear_free;
> ++		AES_decrypt;
> ++		asn1_enc_init;
> ++		UI_get_result_maxsize;
> ++		OCSP_CERTID_new;
> ++		ENGINE_unregister_RAND;
> ++		UI_method_get_closer;
> ++		d2i_KRB5_ENCDATA;
> ++		OCSP_request_onereq_count;
> ++		OCSP_basic_verify;
> ++		KRB5_AUTHENTBODY_free;
> ++		ASN1_item_d2i;
> ++		ASN1_primitive_free;
> ++		i2d_EXTENDED_KEY_USAGE;
> ++		i2d_OCSP_SIGNATURE;
> ++		asn1_enc_save;
> ++		ENGINE_load_nuron;
> ++		_ossl_old_des_pcbc_encrypt;
> ++		PKCS12_MAC_DATA_it;
> ++		OCSP_accept_responses_new;
> ++		asn1_do_lock;
> ++		PKCS7_ATTR_VERIFY_it;
> ++		KRB5_APREQBODY_it;
> ++		i2d_OCSP_SINGLERESP;
> ++		ASN1_item_ex_new;
> ++		UI_add_verify_string;
> ++		_ossl_old_des_set_key;
> ++		KRB5_PRINCNAME_it;
> ++		EVP_DecryptInit_ex;
> ++		i2d_OCSP_CERTID;
> ++		ASN1_item_d2i_bio;
> ++		EC_POINT_dbl;
> ++		asn1_get_choice_selector;
> ++		i2d_KRB5_CHECKSUM;
> ++		ENGINE_set_table_flags;
> ++		AES_options;
> ++		ENGINE_load_chil;
> ++		OCSP_id_cmp;
> ++		OCSP_BASICRESP_new;
> ++		OCSP_REQUEST_get_ext_by_NID;
> ++		KRB5_APREQ_it;
> ++		ENGINE_get_destroy_function;
> ++		CONF_set_nconf;
> ++		ASN1_PRINTABLE_free;
> ++		OCSP_BASICRESP_get_ext_by_NID;
> ++		DIST_POINT_NAME_it;
> ++		X509V3_extensions_print;
> ++		_ossl_old_des_cfb64_encrypt;
> ++		X509_REVOKED_add1_ext_i2d;
> ++		_ossl_old_des_ofb_encrypt;
> ++		KRB5_TKTBODY_new;
> ++		ASN1_OCTET_STRING_it;
> ++		ERR_load_UI_strings;
> ++		i2d_KRB5_ENCKEY;
> ++		ASN1_template_new;
> ++		OCSP_SIGNATURE_free;
> ++		ASN1_item_i2d_fp;
> ++		KRB5_PRINCNAME_free;
> ++		PKCS7_RECIP_INFO_it;
> ++		EXTENDED_KEY_USAGE_it;
> ++		EC_GFp_simple_method;
> ++		EC_GROUP_precompute_mult;
> ++		OCSP_request_onereq_get0;
> ++		UI_method_set_writer;
> ++		KRB5_AUTHENT_new;
> ++		X509_CRL_INFO_it;
> ++		DSO_set_name_converter;
> ++		AES_set_decrypt_key;
> ++		PKCS7_DIGEST_it;
> ++		PKCS12_x5092certbag;
> ++		EVP_DigestInit_ex;
> ++		i2a_ACCESS_DESCRIPTION;
> ++		OCSP_RESPONSE_it;
> ++		PKCS7_ENC_CONTENT_it;
> ++		OCSP_request_add0_id;
> ++		EC_POINT_make_affine;
> ++		DSO_get_filename;
> ++		OCSP_CERTSTATUS_it;
> ++		OCSP_request_add1_cert;
> ++		UI_get0_output_string;
> ++		UI_dup_verify_string;
> ++		BN_mod_lshift;
> ++		KRB5_AUTHDATA_it;
> ++		asn1_set_choice_selector;
> ++		OCSP_basic_add1_status;
> ++		OCSP_RESPID_free;
> ++		asn1_get_field_ptr;
> ++		UI_add_input_string;
> ++		OCSP_CRLID_it;
> ++		i2d_KRB5_AUTHENTBODY;
> ++		OCSP_REQUEST_get_ext_count;
> ++		ENGINE_load_atalla;
> ++		X509_NAME_it;
> ++		USERNOTICE_it;
> ++		OCSP_REQINFO_new;
> ++		OCSP_BASICRESP_get_ext;
> ++		CRYPTO_get_ex_data_implementation;
> ++		CRYPTO_get_ex_data_impl;
> ++		ASN1_item_pack;
> ++		i2d_KRB5_ENCDATA;
> ++		X509_PURPOSE_set;
> ++		X509_REQ_INFO_it;
> ++		UI_method_set_opener;
> ++		ASN1_item_ex_free;
> ++		ASN1_BOOLEAN_it;
> ++		ENGINE_get_table_flags;
> ++		UI_create_method;
> ++		OCSP_ONEREQ_add1_ext_i2d;
> ++		_shadow_DES_check_key;
> ++		d2i_OCSP_REQINFO;
> ++		UI_add_info_string;
> ++		UI_get_result_minsize;
> ++		ASN1_NULL_it;
> ++		BN_mod_lshift1;
> ++		d2i_OCSP_ONEREQ;
> ++		OCSP_ONEREQ_new;
> ++		KRB5_TICKET_it;
> ++		EVP_aes_192_cbc;
> ++		KRB5_TICKET_free;
> ++		UI_new;
> ++		OCSP_response_create;
> ++		_ossl_old_des_xcbc_encrypt;
> ++		PKCS7_it;
> ++		OCSP_REQUEST_get_ext_by_critical;
> ++		OCSP_REQUEST_get_ext_by_crit;
> ++		ENGINE_set_flags;
> ++		_ossl_old_des_ecb_encrypt;
> ++		OCSP_response_get1_basic;
> ++		EVP_Digest;
> ++		OCSP_ONEREQ_delete_ext;
> ++		ASN1_TBOOLEAN_it;
> ++		ASN1_item_new;
> ++		ASN1_TIME_to_generalizedtime;
> ++		BIGNUM_it;
> ++		AES_cbc_encrypt;
> ++		ENGINE_get_load_privkey_function;
> ++		ENGINE_get_load_privkey_fn;
> ++		OCSP_RESPONSE_free;
> ++		UI_method_set_reader;
> ++		i2d_ASN1_T61STRING;
> ++		EC_POINT_set_to_infinity;
> ++		ERR_load_OCSP_strings;
> ++		EC_POINT_point2oct;
> ++		KRB5_APREQ_free;
> ++		ASN1_OBJECT_it;
> ++		OCSP_crlID_new;
> ++		OCSP_crlID2_new;
> ++		CONF_modules_load_file;
> ++		CONF_imodule_set_usr_data;
> ++		ENGINE_set_default_string;
> ++		CONF_module_get_usr_data;
> ++		ASN1_add_oid_module;
> ++		CONF_modules_finish;
> ++		OPENSSL_config;
> ++		CONF_modules_unload;
> ++		CONF_imodule_get_value;
> ++		CONF_module_set_usr_data;
> ++		CONF_parse_list;
> ++		CONF_module_add;
> ++		CONF_get1_default_config_file;
> ++		CONF_imodule_get_flags;
> ++		CONF_imodule_get_module;
> ++		CONF_modules_load;
> ++		CONF_imodule_get_name;
> ++		ERR_peek_top_error;
> ++		CONF_imodule_get_usr_data;
> ++		CONF_imodule_set_flags;
> ++		ENGINE_add_conf_module;
> ++		ERR_peek_last_error_line;
> ++		ERR_peek_last_error_line_data;
> ++		ERR_peek_last_error;
> ++		DES_read_2passwords;
> ++		DES_read_password;
> ++		UI_UTIL_read_pw;
> ++		UI_UTIL_read_pw_string;
> ++		ENGINE_load_aep;
> ++		ENGINE_load_sureware;
> ++		OPENSSL_add_all_algorithms_noconf;
> ++		OPENSSL_add_all_algo_noconf;
> ++		OPENSSL_add_all_algorithms_conf;
> ++		OPENSSL_add_all_algo_conf;
> ++		OPENSSL_load_builtin_modules;
> ++		AES_ofb128_encrypt;
> ++		AES_ctr128_encrypt;
> ++		AES_cfb128_encrypt;
> ++		ENGINE_load_4758cca;
> ++		_ossl_096_des_random_seed;
> ++		EVP_aes_256_ofb;
> ++		EVP_aes_192_ofb;
> ++		EVP_aes_128_cfb128;
> ++		EVP_aes_256_cfb128;
> ++		EVP_aes_128_ofb;
> ++		EVP_aes_192_cfb128;
> ++		CONF_modules_free;
> ++		NCONF_default;
> ++		OPENSSL_no_config;
> ++		NCONF_WIN32;
> ++		ASN1_UNIVERSALSTRING_new;
> ++		EVP_des_ede_ecb;
> ++		i2d_ASN1_UNIVERSALSTRING;
> ++		ASN1_UNIVERSALSTRING_free;
> ++		ASN1_UNIVERSALSTRING_it;
> ++		d2i_ASN1_UNIVERSALSTRING;
> ++		EVP_des_ede3_ecb;
> ++		X509_REQ_print_ex;
> ++		ENGINE_up_ref;
> ++		BUF_MEM_grow_clean;
> ++		CRYPTO_realloc_clean;
> ++		BUF_strlcat;
> ++		BIO_indent;
> ++		BUF_strlcpy;
> ++		OpenSSLDie;
> ++		OPENSSL_cleanse;
> ++		ENGINE_setup_bsd_cryptodev;
> ++		ERR_release_err_state_table;
> ++		EVP_aes_128_cfb8;
> ++		FIPS_corrupt_rsa;
> ++		FIPS_selftest_des;
> ++		EVP_aes_128_cfb1;
> ++		EVP_aes_192_cfb8;
> ++		FIPS_mode_set;
> ++		FIPS_selftest_dsa;
> ++		EVP_aes_256_cfb8;
> ++		FIPS_allow_md5;
> ++		DES_ede3_cfb_encrypt;
> ++		EVP_des_ede3_cfb8;
> ++		FIPS_rand_seeded;
> ++		AES_cfbr_encrypt_block;
> ++		AES_cfb8_encrypt;
> ++		FIPS_rand_seed;
> ++		FIPS_corrupt_des;
> ++		EVP_aes_192_cfb1;
> ++		FIPS_selftest_aes;
> ++		FIPS_set_prng_key;
> ++		EVP_des_cfb8;
> ++		FIPS_corrupt_dsa;
> ++		FIPS_test_mode;
> ++		FIPS_rand_method;
> ++		EVP_aes_256_cfb1;
> ++		ERR_load_FIPS_strings;
> ++		FIPS_corrupt_aes;
> ++		FIPS_selftest_sha1;
> ++		FIPS_selftest_rsa;
> ++		FIPS_corrupt_sha1;
> ++		EVP_des_cfb1;
> ++		FIPS_dsa_check;
> ++		AES_cfb1_encrypt;
> ++		EVP_des_ede3_cfb1;
> ++		FIPS_rand_check;
> ++		FIPS_md5_allowed;
> ++		FIPS_mode;
> ++		FIPS_selftest_failed;
> ++		sk_is_sorted;
> ++		X509_check_ca;
> ++		HMAC_CTX_set_flags;
> ++		d2i_PROXY_CERT_INFO_EXTENSION;
> ++		PROXY_POLICY_it;
> ++		i2d_PROXY_POLICY;
> ++		i2d_PROXY_CERT_INFO_EXTENSION;
> ++		d2i_PROXY_POLICY;
> ++		PROXY_CERT_INFO_EXTENSION_new;
> ++		PROXY_CERT_INFO_EXTENSION_free;
> ++		PROXY_CERT_INFO_EXTENSION_it;
> ++		PROXY_POLICY_free;
> ++		PROXY_POLICY_new;
> ++		BN_MONT_CTX_set_locked;
> ++		FIPS_selftest_rng;
> ++		EVP_sha384;
> ++		EVP_sha512;
> ++		EVP_sha224;
> ++		EVP_sha256;
> ++		FIPS_selftest_hmac;
> ++		FIPS_corrupt_rng;
> ++		BN_mod_exp_mont_consttime;
> ++		RSA_X931_hash_id;
> ++		RSA_padding_check_X931;
> ++		RSA_verify_PKCS1_PSS;
> ++		RSA_padding_add_X931;
> ++		RSA_padding_add_PKCS1_PSS;
> ++		PKCS1_MGF1;
> ++		BN_X931_generate_Xpq;
> ++		RSA_X931_generate_key;
> ++		BN_X931_derive_prime;
> ++		BN_X931_generate_prime;
> ++		RSA_X931_derive;
> ++		BIO_new_dgram;
> ++		BN_get0_nist_prime_384;
> ++		ERR_set_mark;
> ++		X509_STORE_CTX_set0_crls;
> ++		ENGINE_set_STORE;
> ++		ENGINE_register_ECDSA;
> ++		STORE_meth_set_list_start_fn;
> ++		STORE_method_set_list_start_function;
> ++		BN_BLINDING_invert_ex;
> ++		NAME_CONSTRAINTS_free;
> ++		STORE_ATTR_INFO_set_number;
> ++		BN_BLINDING_get_thread_id;
> ++		X509_STORE_CTX_set0_param;
> ++		POLICY_MAPPING_it;
> ++		STORE_parse_attrs_start;
> ++		POLICY_CONSTRAINTS_free;
> ++		EVP_PKEY_add1_attr_by_NID;
> ++		BN_nist_mod_192;
> ++		EC_GROUP_get_trinomial_basis;
> ++		STORE_set_method;
> ++		GENERAL_SUBTREE_free;
> ++		NAME_CONSTRAINTS_it;
> ++		ECDH_get_default_method;
> ++		PKCS12_add_safe;
> ++		EC_KEY_new_by_curve_name;
> ++		STORE_meth_get_update_store_fn;
> ++		STORE_method_get_update_store_function;
> ++		ENGINE_register_ECDH;
> ++		SHA512_Update;
> ++		i2d_ECPrivateKey;
> ++		BN_get0_nist_prime_192;
> ++		STORE_modify_certificate;
> ++		EC_POINT_set_affine_coordinates_GF2m;
> ++		EC_POINT_set_affine_coords_GF2m;
> ++		BN_GF2m_mod_exp_arr;
> ++		STORE_ATTR_INFO_modify_number;
> ++		X509_keyid_get0;
> ++		ENGINE_load_gmp;
> ++		pitem_new;
> ++		BN_GF2m_mod_mul_arr;
> ++		STORE_list_public_key_endp;
> ++		o2i_ECPublicKey;
> ++		EC_KEY_copy;
> ++		BIO_dump_fp;
> ++		X509_policy_node_get0_parent;
> ++		EC_GROUP_check_discriminant;
> ++		i2o_ECPublicKey;
> ++		EC_KEY_precompute_mult;
> ++		a2i_IPADDRESS;
> ++		STORE_meth_set_initialise_fn;
> ++		STORE_method_set_initialise_function;
> ++		X509_STORE_CTX_set_depth;
> ++		X509_VERIFY_PARAM_inherit;
> ++		EC_POINT_point2bn;
> ++		STORE_ATTR_INFO_set_dn;
> ++		X509_policy_tree_get0_policies;
> ++		EC_GROUP_new_curve_GF2m;
> ++		STORE_destroy_method;
> ++		ENGINE_unregister_STORE;
> ++		EVP_PKEY_get1_EC_KEY;
> ++		STORE_ATTR_INFO_get0_number;
> ++		ENGINE_get_default_ECDH;
> ++		EC_KEY_get_conv_form;
> ++		ASN1_OCTET_STRING_NDEF_it;
> ++		STORE_delete_public_key;
> ++		STORE_get_public_key;
> ++		STORE_modify_arbitrary;
> ++		ENGINE_get_static_state;
> ++		pqueue_iterator;
> ++		ECDSA_SIG_new;
> ++		OPENSSL_DIR_end;
> ++		BN_GF2m_mod_sqr;
> ++		EC_POINT_bn2point;
> ++		X509_VERIFY_PARAM_set_depth;
> ++		EC_KEY_set_asn1_flag;
> ++		STORE_get_method;
> ++		EC_KEY_get_key_method_data;
> ++		ECDSA_sign_ex;
> ++		STORE_parse_attrs_end;
> ++		EC_GROUP_get_point_conversion_form;
> ++		EC_GROUP_get_point_conv_form;
> ++		STORE_method_set_store_function;
> ++		STORE_ATTR_INFO_in;
> ++		PEM_read_bio_ECPKParameters;
> ++		EC_GROUP_get_pentanomial_basis;
> ++		EVP_PKEY_add1_attr_by_txt;
> ++		BN_BLINDING_set_flags;
> ++		X509_VERIFY_PARAM_set1_policies;
> ++		X509_VERIFY_PARAM_set1_name;
> ++		X509_VERIFY_PARAM_set_purpose;
> ++		STORE_get_number;
> ++		ECDSA_sign_setup;
> ++		BN_GF2m_mod_solve_quad_arr;
> ++		EC_KEY_up_ref;
> ++		POLICY_MAPPING_free;
> ++		BN_GF2m_mod_div;
> ++		X509_VERIFY_PARAM_set_flags;
> ++		EC_KEY_free;
> ++		STORE_meth_set_list_next_fn;
> ++		STORE_method_set_list_next_function;
> ++		PEM_write_bio_ECPrivateKey;
> ++		d2i_EC_PUBKEY;
> ++		STORE_meth_get_generate_fn;
> ++		STORE_method_get_generate_function;
> ++		STORE_meth_set_list_end_fn;
> ++		STORE_method_set_list_end_function;
> ++		pqueue_print;
> ++		EC_GROUP_have_precompute_mult;
> ++		EC_KEY_print_fp;
> ++		BN_GF2m_mod_arr;
> ++		PEM_write_bio_X509_CERT_PAIR;
> ++		EVP_PKEY_cmp;
> ++		X509_policy_level_node_count;
> ++		STORE_new_engine;
> ++		STORE_list_public_key_start;
> ++		X509_VERIFY_PARAM_new;
> ++		ECDH_get_ex_data;
> ++		EVP_PKEY_get_attr;
> ++		ECDSA_do_sign;
> ++		ENGINE_unregister_ECDH;
> ++		ECDH_OpenSSL;
> ++		EC_KEY_set_conv_form;
> ++		EC_POINT_dup;
> ++		GENERAL_SUBTREE_new;
> ++		STORE_list_crl_endp;
> ++		EC_get_builtin_curves;
> ++		X509_policy_node_get0_qualifiers;
> ++		X509_pcy_node_get0_qualifiers;
> ++		STORE_list_crl_end;
> ++		EVP_PKEY_set1_EC_KEY;
> ++		BN_GF2m_mod_sqrt_arr;
> ++		i2d_ECPrivateKey_bio;
> ++		ECPKParameters_print_fp;
> ++		pqueue_find;
> ++		ECDSA_SIG_free;
> ++		PEM_write_bio_ECPKParameters;
> ++		STORE_method_set_ctrl_function;
> ++		STORE_list_public_key_end;
> ++		EC_KEY_set_private_key;
> ++		pqueue_peek;
> ++		STORE_get_arbitrary;
> ++		STORE_store_crl;
> ++		X509_policy_node_get0_policy;
> ++		PKCS12_add_safes;
> ++		BN_BLINDING_convert_ex;
> ++		X509_policy_tree_free;
> ++		OPENSSL_ia32cap_loc;
> ++		BN_GF2m_poly2arr;
> ++		STORE_ctrl;
> ++		STORE_ATTR_INFO_compare;
> ++		BN_get0_nist_prime_224;
> ++		i2d_ECParameters;
> ++		i2d_ECPKParameters;
> ++		BN_GENCB_call;
> ++		d2i_ECPKParameters;
> ++		STORE_meth_set_generate_fn;
> ++		STORE_method_set_generate_function;
> ++		ENGINE_set_ECDH;
> ++		NAME_CONSTRAINTS_new;
> ++		SHA256_Init;
> ++		EC_KEY_get0_public_key;
> ++		PEM_write_bio_EC_PUBKEY;
> ++		STORE_ATTR_INFO_set_cstr;
> ++		STORE_list_crl_next;
> ++		STORE_ATTR_INFO_in_range;
> ++		ECParameters_print;
> ++		STORE_meth_set_delete_fn;
> ++		STORE_method_set_delete_function;
> ++		STORE_list_certificate_next;
> ++		ASN1_generate_nconf;
> ++		BUF_memdup;
> ++		BN_GF2m_mod_mul;
> ++		STORE_meth_get_list_next_fn;
> ++		STORE_method_get_list_next_function;
> ++		STORE_ATTR_INFO_get0_dn;
> ++		STORE_list_private_key_next;
> ++		EC_GROUP_set_seed;
> ++		X509_VERIFY_PARAM_set_trust;
> ++		STORE_ATTR_INFO_free;
> ++		STORE_get_private_key;
> ++		EVP_PKEY_get_attr_count;
> ++		STORE_ATTR_INFO_new;
> ++		EC_GROUP_get_curve_GF2m;
> ++		STORE_meth_set_revoke_fn;
> ++		STORE_method_set_revoke_function;
> ++		STORE_store_number;
> ++		BN_is_prime_ex;
> ++		STORE_revoke_public_key;
> ++		X509_STORE_CTX_get0_param;
> ++		STORE_delete_arbitrary;
> ++		PEM_read_X509_CERT_PAIR;
> ++		X509_STORE_set_depth;
> ++		ECDSA_get_ex_data;
> ++		SHA224;
> ++		BIO_dump_indent_fp;
> ++		EC_KEY_set_group;
> ++		BUF_strndup;
> ++		STORE_list_certificate_start;
> ++		BN_GF2m_mod;
> ++		X509_REQ_check_private_key;
> ++		EC_GROUP_get_seed_len;
> ++		ERR_load_STORE_strings;
> ++		PEM_read_bio_EC_PUBKEY;
> ++		STORE_list_private_key_end;
> ++		i2d_EC_PUBKEY;
> ++		ECDSA_get_default_method;
> ++		ASN1_put_eoc;
> ++		X509_STORE_CTX_get_explicit_policy;
> ++		X509_STORE_CTX_get_expl_policy;
> ++		X509_VERIFY_PARAM_table_cleanup;
> ++		STORE_modify_private_key;
> ++		X509_VERIFY_PARAM_free;
> ++		EC_METHOD_get_field_type;
> ++		EC_GFp_nist_method;
> ++		STORE_meth_set_modify_fn;
> ++		STORE_method_set_modify_function;
> ++		STORE_parse_attrs_next;
> ++		ENGINE_load_padlock;
> ++		EC_GROUP_set_curve_name;
> ++		X509_CERT_PAIR_it;
> ++		STORE_meth_get_revoke_fn;
> ++		STORE_method_get_revoke_function;
> ++		STORE_method_set_get_function;
> ++		STORE_modify_number;
> ++		STORE_method_get_store_function;
> ++		STORE_store_private_key;
> ++		BN_GF2m_mod_sqr_arr;
> ++		RSA_setup_blinding;
> ++		BIO_s_datagram;
> ++		STORE_Memory;
> ++		sk_find_ex;
> ++		EC_GROUP_set_curve_GF2m;
> ++		ENGINE_set_default_ECDSA;
> ++		POLICY_CONSTRAINTS_new;
> ++		BN_GF2m_mod_sqrt;
> ++		ECDH_set_default_method;
> ++		EC_KEY_generate_key;
> ++		SHA384_Update;
> ++		BN_GF2m_arr2poly;
> ++		STORE_method_get_get_function;
> ++		STORE_meth_set_cleanup_fn;
> ++		STORE_method_set_cleanup_function;
> ++		EC_GROUP_check;
> ++		d2i_ECPrivateKey_bio;
> ++		EC_KEY_insert_key_method_data;
> ++		STORE_meth_get_lock_store_fn;
> ++		STORE_method_get_lock_store_function;
> ++		X509_VERIFY_PARAM_get_depth;
> ++		SHA224_Final;
> ++		STORE_meth_set_update_store_fn;
> ++		STORE_method_set_update_store_function;
> ++		SHA224_Update;
> ++		d2i_ECPrivateKey;
> ++		ASN1_item_ndef_i2d;
> ++		STORE_delete_private_key;
> ++		ERR_pop_to_mark;
> ++		ENGINE_register_all_STORE;
> ++		X509_policy_level_get0_node;
> ++		i2d_PKCS7_NDEF;
> ++		EC_GROUP_get_degree;
> ++		ASN1_generate_v3;
> ++		STORE_ATTR_INFO_modify_cstr;
> ++		X509_policy_tree_level_count;
> ++		BN_GF2m_add;
> ++		EC_KEY_get0_group;
> ++		STORE_generate_crl;
> ++		STORE_store_public_key;
> ++		X509_CERT_PAIR_free;
> ++		STORE_revoke_private_key;
> ++		BN_nist_mod_224;
> ++		SHA512_Final;
> ++		STORE_ATTR_INFO_modify_dn;
> ++		STORE_meth_get_initialise_fn;
> ++		STORE_method_get_initialise_function;
> ++		STORE_delete_number;
> ++		i2d_EC_PUBKEY_bio;
> ++		BIO_dgram_non_fatal_error;
> ++		EC_GROUP_get_asn1_flag;
> ++		STORE_ATTR_INFO_in_ex;
> ++		STORE_list_crl_start;
> ++		ECDH_get_ex_new_index;
> ++		STORE_meth_get_modify_fn;
> ++		STORE_method_get_modify_function;
> ++		v2i_ASN1_BIT_STRING;
> ++		STORE_store_certificate;
> ++		OBJ_bsearch_ex;
> ++		X509_STORE_CTX_set_default;
> ++		STORE_ATTR_INFO_set_sha1str;
> ++		BN_GF2m_mod_inv;
> ++		BN_GF2m_mod_exp;
> ++		STORE_modify_public_key;
> ++		STORE_meth_get_list_start_fn;
> ++		STORE_method_get_list_start_function;
> ++		EC_GROUP_get0_seed;
> ++		STORE_store_arbitrary;
> ++		STORE_meth_set_unlock_store_fn;
> ++		STORE_method_set_unlock_store_function;
> ++		BN_GF2m_mod_div_arr;
> ++		ENGINE_set_ECDSA;
> ++		STORE_create_method;
> ++		ECPKParameters_print;
> ++		EC_KEY_get0_private_key;
> ++		PEM_write_EC_PUBKEY;
> ++		X509_VERIFY_PARAM_set1;
> ++		ECDH_set_method;
> ++		v2i_GENERAL_NAME_ex;
> ++		ECDH_set_ex_data;
> ++		STORE_generate_key;
> ++		BN_nist_mod_521;
> ++		X509_policy_tree_get0_level;
> ++		EC_GROUP_set_point_conversion_form;
> ++		EC_GROUP_set_point_conv_form;
> ++		PEM_read_EC_PUBKEY;
> ++		i2d_ECDSA_SIG;
> ++		ECDSA_OpenSSL;
> ++		STORE_delete_crl;
> ++		EC_KEY_get_enc_flags;
> ++		ASN1_const_check_infinite_end;
> ++		EVP_PKEY_delete_attr;
> ++		ECDSA_set_default_method;
> ++		EC_POINT_set_compressed_coordinates_GF2m;
> ++		EC_POINT_set_compr_coords_GF2m;
> ++		EC_GROUP_cmp;
> ++		STORE_revoke_certificate;
> ++		BN_get0_nist_prime_256;
> ++		STORE_meth_get_delete_fn;
> ++		STORE_method_get_delete_function;
> ++		SHA224_Init;
> ++		PEM_read_ECPrivateKey;
> ++		SHA512_Init;
> ++		STORE_parse_attrs_endp;
> ++		BN_set_negative;
> ++		ERR_load_ECDSA_strings;
> ++		EC_GROUP_get_basis_type;
> ++		STORE_list_public_key_next;
> ++		i2v_ASN1_BIT_STRING;
> ++		STORE_OBJECT_free;
> ++		BN_nist_mod_384;
> ++		i2d_X509_CERT_PAIR;
> ++		PEM_write_ECPKParameters;
> ++		ECDH_compute_key;
> ++		STORE_ATTR_INFO_get0_sha1str;
> ++		ENGINE_register_all_ECDH;
> ++		pqueue_pop;
> ++		STORE_ATTR_INFO_get0_cstr;
> ++		POLICY_CONSTRAINTS_it;
> ++		STORE_get_ex_new_index;
> ++		EVP_PKEY_get_attr_by_OBJ;
> ++		X509_VERIFY_PARAM_add0_policy;
> ++		BN_GF2m_mod_solve_quad;
> ++		SHA256;
> ++		i2d_ECPrivateKey_fp;
> ++		X509_policy_tree_get0_user_policies;
> ++		X509_pcy_tree_get0_usr_policies;
> ++		OPENSSL_DIR_read;
> ++		ENGINE_register_all_ECDSA;
> ++		X509_VERIFY_PARAM_lookup;
> ++		EC_POINT_get_affine_coordinates_GF2m;
> ++		EC_POINT_get_affine_coords_GF2m;
> ++		EC_GROUP_dup;
> ++		ENGINE_get_default_ECDSA;
> ++		EC_KEY_new;
> ++		SHA256_Transform;
> ++		EC_KEY_set_enc_flags;
> ++		ECDSA_verify;
> ++		EC_POINT_point2hex;
> ++		ENGINE_get_STORE;
> ++		SHA512;
> ++		STORE_get_certificate;
> ++		ECDSA_do_sign_ex;
> ++		ECDSA_do_verify;
> ++		d2i_ECPrivateKey_fp;
> ++		STORE_delete_certificate;
> ++		SHA512_Transform;
> ++		X509_STORE_set1_param;
> ++		STORE_method_get_ctrl_function;
> ++		STORE_free;
> ++		PEM_write_ECPrivateKey;
> ++		STORE_meth_get_unlock_store_fn;
> ++		STORE_method_get_unlock_store_function;
> ++		STORE_get_ex_data;
> ++		EC_KEY_set_public_key;
> ++		PEM_read_ECPKParameters;
> ++		X509_CERT_PAIR_new;
> ++		ENGINE_register_STORE;
> ++		RSA_generate_key_ex;
> ++		DSA_generate_parameters_ex;
> ++		ECParameters_print_fp;
> ++		X509V3_NAME_from_section;
> ++		EVP_PKEY_add1_attr;
> ++		STORE_modify_crl;
> ++		STORE_list_private_key_start;
> ++		POLICY_MAPPINGS_it;
> ++		GENERAL_SUBTREE_it;
> ++		EC_GROUP_get_curve_name;
> ++		PEM_write_X509_CERT_PAIR;
> ++		BIO_dump_indent_cb;
> ++		d2i_X509_CERT_PAIR;
> ++		STORE_list_private_key_endp;
> ++		asn1_const_Finish;
> ++		i2d_EC_PUBKEY_fp;
> ++		BN_nist_mod_256;
> ++		X509_VERIFY_PARAM_add0_table;
> ++		pqueue_free;
> ++		BN_BLINDING_create_param;
> ++		ECDSA_size;
> ++		d2i_EC_PUBKEY_bio;
> ++		BN_get0_nist_prime_521;
> ++		STORE_ATTR_INFO_modify_sha1str;
> ++		BN_generate_prime_ex;
> ++		EC_GROUP_new_by_curve_name;
> ++		SHA256_Final;
> ++		DH_generate_parameters_ex;
> ++		PEM_read_bio_ECPrivateKey;
> ++		STORE_meth_get_cleanup_fn;
> ++		STORE_method_get_cleanup_function;
> ++		ENGINE_get_ECDH;
> ++		d2i_ECDSA_SIG;
> ++		BN_is_prime_fasttest_ex;
> ++		ECDSA_sign;
> ++		X509_policy_check;
> ++		EVP_PKEY_get_attr_by_NID;
> ++		STORE_set_ex_data;
> ++		ENGINE_get_ECDSA;
> ++		EVP_ecdsa;
> ++		BN_BLINDING_get_flags;
> ++		PKCS12_add_cert;
> ++		STORE_OBJECT_new;
> ++		ERR_load_ECDH_strings;
> ++		EC_KEY_dup;
> ++		EVP_CIPHER_CTX_rand_key;
> ++		ECDSA_set_method;
> ++		a2i_IPADDRESS_NC;
> ++		d2i_ECParameters;
> ++		STORE_list_certificate_end;
> ++		STORE_get_crl;
> ++		X509_POLICY_NODE_print;
> ++		SHA384_Init;
> ++		EC_GF2m_simple_method;
> ++		ECDSA_set_ex_data;
> ++		SHA384_Final;
> ++		PKCS7_set_digest;
> ++		EC_KEY_print;
> ++		STORE_meth_set_lock_store_fn;
> ++		STORE_method_set_lock_store_function;
> ++		ECDSA_get_ex_new_index;
> ++		SHA384;
> ++		POLICY_MAPPING_new;
> ++		STORE_list_certificate_endp;
> ++		X509_STORE_CTX_get0_policy_tree;
> ++		EC_GROUP_set_asn1_flag;
> ++		EC_KEY_check_key;
> ++		d2i_EC_PUBKEY_fp;
> ++		PKCS7_set0_type_other;
> ++		PEM_read_bio_X509_CERT_PAIR;
> ++		pqueue_next;
> ++		STORE_meth_get_list_end_fn;
> ++		STORE_method_get_list_end_function;
> ++		EVP_PKEY_add1_attr_by_OBJ;
> ++		X509_VERIFY_PARAM_set_time;
> ++		pqueue_new;
> ++		ENGINE_set_default_ECDH;
> ++		STORE_new_method;
> ++		PKCS12_add_key;
> ++		DSO_merge;
> ++		EC_POINT_hex2point;
> ++		BIO_dump_cb;
> ++		SHA256_Update;
> ++		pqueue_insert;
> ++		pitem_free;
> ++		BN_GF2m_mod_inv_arr;
> ++		ENGINE_unregister_ECDSA;
> ++		BN_BLINDING_set_thread_id;
> ++		get_rfc3526_prime_8192;
> ++		X509_VERIFY_PARAM_clear_flags;
> ++		get_rfc2409_prime_1024;
> ++		DH_check_pub_key;
> ++		get_rfc3526_prime_2048;
> ++		get_rfc3526_prime_6144;
> ++		get_rfc3526_prime_1536;
> ++		get_rfc3526_prime_3072;
> ++		get_rfc3526_prime_4096;
> ++		get_rfc2409_prime_768;
> ++		X509_VERIFY_PARAM_get_flags;
> ++		EVP_CIPHER_CTX_new;
> ++		EVP_CIPHER_CTX_free;
> ++		Camellia_cbc_encrypt;
> ++		Camellia_cfb128_encrypt;
> ++		Camellia_cfb1_encrypt;
> ++		Camellia_cfb8_encrypt;
> ++		Camellia_ctr128_encrypt;
> ++		Camellia_cfbr_encrypt_block;
> ++		Camellia_decrypt;
> ++		Camellia_ecb_encrypt;
> ++		Camellia_encrypt;
> ++		Camellia_ofb128_encrypt;
> ++		Camellia_set_key;
> ++		EVP_camellia_128_cbc;
> ++		EVP_camellia_128_cfb128;
> ++		EVP_camellia_128_cfb1;
> ++		EVP_camellia_128_cfb8;
> ++		EVP_camellia_128_ecb;
> ++		EVP_camellia_128_ofb;
> ++		EVP_camellia_192_cbc;
> ++		EVP_camellia_192_cfb128;
> ++		EVP_camellia_192_cfb1;
> ++		EVP_camellia_192_cfb8;
> ++		EVP_camellia_192_ecb;
> ++		EVP_camellia_192_ofb;
> ++		EVP_camellia_256_cbc;
> ++		EVP_camellia_256_cfb128;
> ++		EVP_camellia_256_cfb1;
> ++		EVP_camellia_256_cfb8;
> ++		EVP_camellia_256_ecb;
> ++		EVP_camellia_256_ofb;
> ++		a2i_ipadd;
> ++		ASIdentifiers_free;
> ++		i2d_ASIdOrRange;
> ++		EVP_CIPHER_block_size;
> ++		v3_asid_is_canonical;
> ++		IPAddressChoice_free;
> ++		EVP_CIPHER_CTX_set_app_data;
> ++		BIO_set_callback_arg;
> ++		v3_addr_add_prefix;
> ++		IPAddressOrRange_it;
> ++		BIO_set_flags;
> ++		ASIdentifiers_it;
> ++		v3_addr_get_range;
> ++		BIO_method_type;
> ++		v3_addr_inherits;
> ++		IPAddressChoice_it;
> ++		AES_ige_encrypt;
> ++		v3_addr_add_range;
> ++		EVP_CIPHER_CTX_nid;
> ++		d2i_ASRange;
> ++		v3_addr_add_inherit;
> ++		v3_asid_add_id_or_range;
> ++		v3_addr_validate_resource_set;
> ++		EVP_CIPHER_iv_length;
> ++		EVP_MD_type;
> ++		v3_asid_canonize;
> ++		IPAddressRange_free;
> ++		v3_asid_add_inherit;
> ++		EVP_CIPHER_CTX_key_length;
> ++		IPAddressRange_new;
> ++		ASIdOrRange_new;
> ++		EVP_MD_size;
> ++		EVP_MD_CTX_test_flags;
> ++		BIO_clear_flags;
> ++		i2d_ASRange;
> ++		IPAddressRange_it;
> ++		IPAddressChoice_new;
> ++		ASIdentifierChoice_new;
> ++		ASRange_free;
> ++		EVP_MD_pkey_type;
> ++		EVP_MD_CTX_clear_flags;
> ++		IPAddressFamily_free;
> ++		i2d_IPAddressFamily;
> ++		IPAddressOrRange_new;
> ++		EVP_CIPHER_flags;
> ++		v3_asid_validate_resource_set;
> ++		d2i_IPAddressRange;
> ++		AES_bi_ige_encrypt;
> ++		BIO_get_callback;
> ++		IPAddressOrRange_free;
> ++		v3_addr_subset;
> ++		d2i_IPAddressFamily;
> ++		v3_asid_subset;
> ++		BIO_test_flags;
> ++		i2d_ASIdentifierChoice;
> ++		ASRange_it;
> ++		d2i_ASIdentifiers;
> ++		ASRange_new;
> ++		d2i_IPAddressChoice;
> ++		v3_addr_get_afi;
> ++		EVP_CIPHER_key_length;
> ++		EVP_Cipher;
> ++		i2d_IPAddressOrRange;
> ++		ASIdOrRange_it;
> ++		EVP_CIPHER_nid;
> ++		i2d_IPAddressChoice;
> ++		EVP_CIPHER_CTX_block_size;
> ++		ASIdentifiers_new;
> ++		v3_addr_validate_path;
> ++		IPAddressFamily_new;
> ++		EVP_MD_CTX_set_flags;
> ++		v3_addr_is_canonical;
> ++		i2d_IPAddressRange;
> ++		IPAddressFamily_it;
> ++		v3_asid_inherits;
> ++		EVP_CIPHER_CTX_cipher;
> ++		EVP_CIPHER_CTX_get_app_data;
> ++		EVP_MD_block_size;
> ++		EVP_CIPHER_CTX_flags;
> ++		v3_asid_validate_path;
> ++		d2i_IPAddressOrRange;
> ++		v3_addr_canonize;
> ++		ASIdentifierChoice_it;
> ++		EVP_MD_CTX_md;
> ++		d2i_ASIdentifierChoice;
> ++		BIO_method_name;
> ++		EVP_CIPHER_CTX_iv_length;
> ++		ASIdOrRange_free;
> ++		ASIdentifierChoice_free;
> ++		BIO_get_callback_arg;
> ++		BIO_set_callback;
> ++		d2i_ASIdOrRange;
> ++		i2d_ASIdentifiers;
> ++		SEED_decrypt;
> ++		SEED_encrypt;
> ++		SEED_cbc_encrypt;
> ++		EVP_seed_ofb;
> ++		SEED_cfb128_encrypt;
> ++		SEED_ofb128_encrypt;
> ++		EVP_seed_cbc;
> ++		SEED_ecb_encrypt;
> ++		EVP_seed_ecb;
> ++		SEED_set_key;
> ++		EVP_seed_cfb128;
> ++		X509_EXTENSIONS_it;
> ++		X509_get1_ocsp;
> ++		OCSP_REQ_CTX_free;
> ++		i2d_X509_EXTENSIONS;
> ++		OCSP_sendreq_nbio;
> ++		OCSP_sendreq_new;
> ++		d2i_X509_EXTENSIONS;
> ++		X509_ALGORS_it;
> ++		X509_ALGOR_get0;
> ++		X509_ALGOR_set0;
> ++		AES_unwrap_key;
> ++		AES_wrap_key;
> ++		X509at_get0_data_by_OBJ;
> ++		ASN1_TYPE_set1;
> ++		ASN1_STRING_set0;
> ++		i2d_X509_ALGORS;
> ++		BIO_f_zlib;
> ++		COMP_zlib_cleanup;
> ++		d2i_X509_ALGORS;
> ++		CMS_ReceiptRequest_free;
> ++		PEM_write_CMS;
> ++		CMS_add0_CertificateChoices;
> ++		CMS_unsigned_add1_attr_by_OBJ;
> ++		ERR_load_CMS_strings;
> ++		CMS_sign_receipt;
> ++		i2d_CMS_ContentInfo;
> ++		CMS_signed_delete_attr;
> ++		d2i_CMS_bio;
> ++		CMS_unsigned_get_attr_by_NID;
> ++		CMS_verify;
> ++		SMIME_read_CMS;
> ++		CMS_decrypt_set1_key;
> ++		CMS_SignerInfo_get0_algs;
> ++		CMS_add1_cert;
> ++		CMS_set_detached;
> ++		CMS_encrypt;
> ++		CMS_EnvelopedData_create;
> ++		CMS_uncompress;
> ++		CMS_add0_crl;
> ++		CMS_SignerInfo_verify_content;
> ++		CMS_unsigned_get0_data_by_OBJ;
> ++		PEM_write_bio_CMS;
> ++		CMS_unsigned_get_attr;
> ++		CMS_RecipientInfo_ktri_cert_cmp;
> ++		CMS_RecipientInfo_ktri_get0_algs;
> ++		CMS_RecipInfo_ktri_get0_algs;
> ++		CMS_ContentInfo_free;
> ++		CMS_final;
> ++		CMS_add_simple_smimecap;
> ++		CMS_SignerInfo_verify;
> ++		CMS_data;
> ++		CMS_ContentInfo_it;
> ++		d2i_CMS_ReceiptRequest;
> ++		CMS_compress;
> ++		CMS_digest_create;
> ++		CMS_SignerInfo_cert_cmp;
> ++		CMS_SignerInfo_sign;
> ++		CMS_data_create;
> ++		i2d_CMS_bio;
> ++		CMS_EncryptedData_set1_key;
> ++		CMS_decrypt;
> ++		int_smime_write_ASN1;
> ++		CMS_unsigned_delete_attr;
> ++		CMS_unsigned_get_attr_count;
> ++		CMS_add_smimecap;
> ++		PEM_read_CMS;
> ++		CMS_signed_get_attr_by_OBJ;
> ++		d2i_CMS_ContentInfo;
> ++		CMS_add_standard_smimecap;
> ++		CMS_ContentInfo_new;
> ++		CMS_RecipientInfo_type;
> ++		CMS_get0_type;
> ++		CMS_is_detached;
> ++		CMS_sign;
> ++		CMS_signed_add1_attr;
> ++		CMS_unsigned_get_attr_by_OBJ;
> ++		SMIME_write_CMS;
> ++		CMS_EncryptedData_decrypt;
> ++		CMS_get0_RecipientInfos;
> ++		CMS_add0_RevocationInfoChoice;
> ++		CMS_decrypt_set1_pkey;
> ++		CMS_SignerInfo_set1_signer_cert;
> ++		CMS_get0_signers;
> ++		CMS_ReceiptRequest_get0_values;
> ++		CMS_signed_get0_data_by_OBJ;
> ++		CMS_get0_SignerInfos;
> ++		CMS_add0_cert;
> ++		CMS_EncryptedData_encrypt;
> ++		CMS_digest_verify;
> ++		CMS_set1_signers_certs;
> ++		CMS_signed_get_attr;
> ++		CMS_RecipientInfo_set0_key;
> ++		CMS_SignedData_init;
> ++		CMS_RecipientInfo_kekri_get0_id;
> ++		CMS_verify_receipt;
> ++		CMS_ReceiptRequest_it;
> ++		PEM_read_bio_CMS;
> ++		CMS_get1_crls;
> ++		CMS_add0_recipient_key;
> ++		SMIME_read_ASN1;
> ++		CMS_ReceiptRequest_new;
> ++		CMS_get0_content;
> ++		CMS_get1_ReceiptRequest;
> ++		CMS_signed_add1_attr_by_OBJ;
> ++		CMS_RecipientInfo_kekri_id_cmp;
> ++		CMS_add1_ReceiptRequest;
> ++		CMS_SignerInfo_get0_signer_id;
> ++		CMS_unsigned_add1_attr_by_NID;
> ++		CMS_unsigned_add1_attr;
> ++		CMS_signed_get_attr_by_NID;
> ++		CMS_get1_certs;
> ++		CMS_signed_add1_attr_by_NID;
> ++		CMS_unsigned_add1_attr_by_txt;
> ++		CMS_dataFinal;
> ++		CMS_RecipientInfo_ktri_get0_signer_id;
> ++		CMS_RecipInfo_ktri_get0_sigr_id;
> ++		i2d_CMS_ReceiptRequest;
> ++		CMS_add1_recipient_cert;
> ++		CMS_dataInit;
> ++		CMS_signed_add1_attr_by_txt;
> ++		CMS_RecipientInfo_decrypt;
> ++		CMS_signed_get_attr_count;
> ++		CMS_get0_eContentType;
> ++		CMS_set1_eContentType;
> ++		CMS_ReceiptRequest_create0;
> ++		CMS_add1_signer;
> ++		CMS_RecipientInfo_set0_pkey;
> ++		ENGINE_set_load_ssl_client_cert_function;
> ++		ENGINE_set_ld_ssl_clnt_cert_fn;
> ++		ENGINE_get_ssl_client_cert_function;
> ++		ENGINE_get_ssl_client_cert_fn;
> ++		ENGINE_load_ssl_client_cert;
> ++		ENGINE_load_capi;
> ++		OPENSSL_isservice;
> ++		FIPS_dsa_sig_decode;
> ++		EVP_CIPHER_CTX_clear_flags;
> ++		FIPS_rand_status;
> ++		FIPS_rand_set_key;
> ++		CRYPTO_set_mem_info_functions;
> ++		RSA_X931_generate_key_ex;
> ++		int_ERR_set_state_func;
> ++		int_EVP_MD_set_engine_callbacks;
> ++		int_CRYPTO_set_do_dynlock_callback;
> ++		FIPS_rng_stick;
> ++		EVP_CIPHER_CTX_set_flags;
> ++		BN_X931_generate_prime_ex;
> ++		FIPS_selftest_check;
> ++		FIPS_rand_set_dt;
> ++		CRYPTO_dbg_pop_info;
> ++		FIPS_dsa_free;
> ++		RSA_X931_derive_ex;
> ++		FIPS_rsa_new;
> ++		FIPS_rand_bytes;
> ++		fips_cipher_test;
> ++		EVP_CIPHER_CTX_test_flags;
> ++		CRYPTO_malloc_debug_init;
> ++		CRYPTO_dbg_push_info;
> ++		FIPS_corrupt_rsa_keygen;
> ++		FIPS_dh_new;
> ++		FIPS_corrupt_dsa_keygen;
> ++		FIPS_dh_free;
> ++		fips_pkey_signature_test;
> ++		EVP_add_alg_module;
> ++		int_RAND_init_engine_callbacks;
> ++		int_EVP_CIPHER_set_engine_callbacks;
> ++		int_EVP_MD_init_engine_callbacks;
> ++		FIPS_rand_test_mode;
> ++		FIPS_rand_reset;
> ++		FIPS_dsa_new;
> ++		int_RAND_set_callbacks;
> ++		BN_X931_derive_prime_ex;
> ++		int_ERR_lib_init;
> ++		int_EVP_CIPHER_init_engine_callbacks;
> ++		FIPS_rsa_free;
> ++		FIPS_dsa_sig_encode;
> ++		CRYPTO_dbg_remove_all_info;
> ++		OPENSSL_init;
> ++		CRYPTO_strdup;
> ++		JPAKE_STEP3A_process;
> ++		JPAKE_STEP1_release;
> ++		JPAKE_get_shared_key;
> ++		JPAKE_STEP3B_init;
> ++		JPAKE_STEP1_generate;
> ++		JPAKE_STEP1_init;
> ++		JPAKE_STEP3B_process;
> ++		JPAKE_STEP2_generate;
> ++		JPAKE_CTX_new;
> ++		JPAKE_CTX_free;
> ++		JPAKE_STEP3B_release;
> ++		JPAKE_STEP3A_release;
> ++		JPAKE_STEP2_process;
> ++		JPAKE_STEP3B_generate;
> ++		JPAKE_STEP1_process;
> ++		JPAKE_STEP3A_generate;
> ++		JPAKE_STEP2_release;
> ++		JPAKE_STEP3A_init;
> ++		ERR_load_JPAKE_strings;
> ++		JPAKE_STEP2_init;
> ++		pqueue_size;
> ++		i2d_TS_ACCURACY;
> ++		i2d_TS_MSG_IMPRINT_fp;
> ++		i2d_TS_MSG_IMPRINT;
> ++		EVP_PKEY_print_public;
> ++		EVP_PKEY_CTX_new;
> ++		i2d_TS_TST_INFO;
> ++		EVP_PKEY_asn1_find;
> ++		DSO_METHOD_beos;
> ++		TS_CONF_load_cert;
> ++		TS_REQ_get_ext;
> ++		EVP_PKEY_sign_init;
> ++		ASN1_item_print;
> ++		TS_TST_INFO_set_nonce;
> ++		TS_RESP_dup;
> ++		ENGINE_register_pkey_meths;
> ++		EVP_PKEY_asn1_add0;
> ++		PKCS7_add0_attrib_signing_time;
> ++		i2d_TS_TST_INFO_fp;
> ++		BIO_asn1_get_prefix;
> ++		TS_TST_INFO_set_time;
> ++		EVP_PKEY_meth_set_decrypt;
> ++		EVP_PKEY_set_type_str;
> ++		EVP_PKEY_CTX_get_keygen_info;
> ++		TS_REQ_set_policy_id;
> ++		d2i_TS_RESP_fp;
> ++		ENGINE_get_pkey_asn1_meth_engine;
> ++		ENGINE_get_pkey_asn1_meth_eng;
> ++		WHIRLPOOL_Init;
> ++		TS_RESP_set_status_info;
> ++		EVP_PKEY_keygen;
> ++		EVP_DigestSignInit;
> ++		TS_ACCURACY_set_millis;
> ++		TS_REQ_dup;
> ++		GENERAL_NAME_dup;
> ++		ASN1_SEQUENCE_ANY_it;
> ++		WHIRLPOOL;
> ++		X509_STORE_get1_crls;
> ++		ENGINE_get_pkey_asn1_meth;
> ++		EVP_PKEY_asn1_new;
> ++		BIO_new_NDEF;
> ++		ENGINE_get_pkey_meth;
> ++		TS_MSG_IMPRINT_set_algo;
> ++		i2d_TS_TST_INFO_bio;
> ++		TS_TST_INFO_set_ordering;
> ++		TS_TST_INFO_get_ext_by_OBJ;
> ++		CRYPTO_THREADID_set_pointer;
> ++		TS_CONF_get_tsa_section;
> ++		SMIME_write_ASN1;
> ++		TS_RESP_CTX_set_signer_key;
> ++		EVP_PKEY_encrypt_old;
> ++		EVP_PKEY_encrypt_init;
> ++		CRYPTO_THREADID_cpy;
> ++		ASN1_PCTX_get_cert_flags;
> ++		i2d_ESS_SIGNING_CERT;
> ++		TS_CONF_load_key;
> ++		i2d_ASN1_SEQUENCE_ANY;
> ++		d2i_TS_MSG_IMPRINT_bio;
> ++		EVP_PKEY_asn1_set_public;
> ++		b2i_PublicKey_bio;
> ++		BIO_asn1_set_prefix;
> ++		EVP_PKEY_new_mac_key;
> ++		BIO_new_CMS;
> ++		CRYPTO_THREADID_cmp;
> ++		TS_REQ_ext_free;
> ++		EVP_PKEY_asn1_set_free;
> ++		EVP_PKEY_get0_asn1;
> ++		d2i_NETSCAPE_X509;
> ++		EVP_PKEY_verify_recover_init;
> ++		EVP_PKEY_CTX_set_data;
> ++		EVP_PKEY_keygen_init;
> ++		TS_RESP_CTX_set_status_info;
> ++		TS_MSG_IMPRINT_get_algo;
> ++		TS_REQ_print_bio;
> ++		EVP_PKEY_CTX_ctrl_str;
> ++		EVP_PKEY_get_default_digest_nid;
> ++		PEM_write_bio_PKCS7_stream;
> ++		TS_MSG_IMPRINT_print_bio;
> ++		BN_asc2bn;
> ++		TS_REQ_get_policy_id;
> ++		ENGINE_set_default_pkey_asn1_meths;
> ++		ENGINE_set_def_pkey_asn1_meths;
> ++		d2i_TS_ACCURACY;
> ++		DSO_global_lookup;
> ++		TS_CONF_set_tsa_name;
> ++		i2d_ASN1_SET_ANY;
> ++		ENGINE_load_gost;
> ++		WHIRLPOOL_BitUpdate;
> ++		ASN1_PCTX_get_flags;
> ++		TS_TST_INFO_get_ext_by_NID;
> ++		TS_RESP_new;
> ++		ESS_CERT_ID_dup;
> ++		TS_STATUS_INFO_dup;
> ++		TS_REQ_delete_ext;
> ++		EVP_DigestVerifyFinal;
> ++		EVP_PKEY_print_params;
> ++		i2d_CMS_bio_stream;
> ++		TS_REQ_get_msg_imprint;
> ++		OBJ_find_sigid_by_algs;
> ++		TS_TST_INFO_get_serial;
> ++		TS_REQ_get_nonce;
> ++		X509_PUBKEY_set0_param;
> ++		EVP_PKEY_CTX_set0_keygen_info;
> ++		DIST_POINT_set_dpname;
> ++		i2d_ISSUING_DIST_POINT;
> ++		ASN1_SET_ANY_it;
> ++		EVP_PKEY_CTX_get_data;
> ++		TS_STATUS_INFO_print_bio;
> ++		EVP_PKEY_derive_init;
> ++		d2i_TS_TST_INFO;
> ++		EVP_PKEY_asn1_add_alias;
> ++		d2i_TS_RESP_bio;
> ++		OTHERNAME_cmp;
> ++		GENERAL_NAME_set0_value;
> ++		PKCS7_RECIP_INFO_get0_alg;
> ++		TS_RESP_CTX_new;
> ++		TS_RESP_set_tst_info;
> ++		PKCS7_final;
> ++		EVP_PKEY_base_id;
> ++		TS_RESP_CTX_set_signer_cert;
> ++		TS_REQ_set_msg_imprint;
> ++		EVP_PKEY_CTX_ctrl;
> ++		TS_CONF_set_digests;
> ++		d2i_TS_MSG_IMPRINT;
> ++		EVP_PKEY_meth_set_ctrl;
> ++		TS_REQ_get_ext_by_NID;
> ++		PKCS5_pbe_set0_algor;
> ++		BN_BLINDING_thread_id;
> ++		TS_ACCURACY_new;
> ++		X509_CRL_METHOD_free;
> ++		ASN1_PCTX_get_nm_flags;
> ++		EVP_PKEY_meth_set_sign;
> ++		CRYPTO_THREADID_current;
> ++		EVP_PKEY_decrypt_init;
> ++		NETSCAPE_X509_free;
> ++		i2b_PVK_bio;
> ++		EVP_PKEY_print_private;
> ++		GENERAL_NAME_get0_value;
> ++		b2i_PVK_bio;
> ++		ASN1_UTCTIME_adj;
> ++		TS_TST_INFO_new;
> ++		EVP_MD_do_all_sorted;
> ++		TS_CONF_set_default_engine;
> ++		TS_ACCURACY_set_seconds;
> ++		TS_TST_INFO_get_time;
> ++		PKCS8_pkey_get0;
> ++		EVP_PKEY_asn1_get0;
> ++		OBJ_add_sigid;
> ++		PKCS7_SIGNER_INFO_sign;
> ++		EVP_PKEY_paramgen_init;
> ++		EVP_PKEY_sign;
> ++		OBJ_sigid_free;
> ++		EVP_PKEY_meth_set_init;
> ++		d2i_ESS_ISSUER_SERIAL;
> ++		ISSUING_DIST_POINT_new;
> ++		ASN1_TIME_adj;
> ++		TS_OBJ_print_bio;
> ++		EVP_PKEY_meth_set_verify_recover;
> ++		EVP_PKEY_meth_set_vrfy_recover;
> ++		TS_RESP_get_status_info;
> ++		CMS_stream;
> ++		EVP_PKEY_CTX_set_cb;
> ++		PKCS7_to_TS_TST_INFO;
> ++		ASN1_PCTX_get_oid_flags;
> ++		TS_TST_INFO_add_ext;
> ++		EVP_PKEY_meth_set_derive;
> ++		i2d_TS_RESP_fp;
> ++		i2d_TS_MSG_IMPRINT_bio;
> ++		TS_RESP_CTX_set_accuracy;
> ++		TS_REQ_set_nonce;
> ++		ESS_CERT_ID_new;
> ++		ENGINE_pkey_asn1_find_str;
> ++		TS_REQ_get_ext_count;
> ++		BUF_reverse;
> ++		TS_TST_INFO_print_bio;
> ++		d2i_ISSUING_DIST_POINT;
> ++		ENGINE_get_pkey_meths;
> ++		i2b_PrivateKey_bio;
> ++		i2d_TS_RESP;
> ++		b2i_PublicKey;
> ++		TS_VERIFY_CTX_cleanup;
> ++		TS_STATUS_INFO_free;
> ++		TS_RESP_verify_token;
> ++		OBJ_bsearch_ex_;
> ++		ASN1_bn_print;
> ++		EVP_PKEY_asn1_get_count;
> ++		ENGINE_register_pkey_asn1_meths;
> ++		ASN1_PCTX_set_nm_flags;
> ++		EVP_DigestVerifyInit;
> ++		ENGINE_set_default_pkey_meths;
> ++		TS_TST_INFO_get_policy_id;
> ++		TS_REQ_get_cert_req;
> ++		X509_CRL_set_meth_data;
> ++		PKCS8_pkey_set0;
> ++		ASN1_STRING_copy;
> ++		d2i_TS_TST_INFO_fp;
> ++		X509_CRL_match;
> ++		EVP_PKEY_asn1_set_private;
> ++		TS_TST_INFO_get_ext_d2i;
> ++		TS_RESP_CTX_add_policy;
> ++		d2i_TS_RESP;
> ++		TS_CONF_load_certs;
> ++		TS_TST_INFO_get_msg_imprint;
> ++		ERR_load_TS_strings;
> ++		TS_TST_INFO_get_version;
> ++		EVP_PKEY_CTX_dup;
> ++		EVP_PKEY_meth_set_verify;
> ++		i2b_PublicKey_bio;
> ++		TS_CONF_set_certs;
> ++		EVP_PKEY_asn1_get0_info;
> ++		TS_VERIFY_CTX_free;
> ++		TS_REQ_get_ext_by_critical;
> ++		TS_RESP_CTX_set_serial_cb;
> ++		X509_CRL_get_meth_data;
> ++		TS_RESP_CTX_set_time_cb;
> ++		TS_MSG_IMPRINT_get_msg;
> ++		TS_TST_INFO_ext_free;
> ++		TS_REQ_get_version;
> ++		TS_REQ_add_ext;
> ++		EVP_PKEY_CTX_set_app_data;
> ++		OBJ_bsearch_;
> ++		EVP_PKEY_meth_set_verifyctx;
> ++		i2d_PKCS7_bio_stream;
> ++		CRYPTO_THREADID_set_numeric;
> ++		PKCS7_sign_add_signer;
> ++		d2i_TS_TST_INFO_bio;
> ++		TS_TST_INFO_get_ordering;
> ++		TS_RESP_print_bio;
> ++		TS_TST_INFO_get_exts;
> ++		HMAC_CTX_copy;
> ++		PKCS5_pbe2_set_iv;
> ++		ENGINE_get_pkey_asn1_meths;
> ++		b2i_PrivateKey;
> ++		EVP_PKEY_CTX_get_app_data;
> ++		TS_REQ_set_cert_req;
> ++		CRYPTO_THREADID_set_callback;
> ++		TS_CONF_set_serial;
> ++		TS_TST_INFO_free;
> ++		d2i_TS_REQ_fp;
> ++		TS_RESP_verify_response;
> ++		i2d_ESS_ISSUER_SERIAL;
> ++		TS_ACCURACY_get_seconds;
> ++		EVP_CIPHER_do_all;
> ++		b2i_PrivateKey_bio;
> ++		OCSP_CERTID_dup;
> ++		X509_PUBKEY_get0_param;
> ++		TS_MSG_IMPRINT_dup;
> ++		PKCS7_print_ctx;
> ++		i2d_TS_REQ_bio;
> ++		EVP_whirlpool;
> ++		EVP_PKEY_asn1_set_param;
> ++		EVP_PKEY_meth_set_encrypt;
> ++		ASN1_PCTX_set_flags;
> ++		i2d_ESS_CERT_ID;
> ++		TS_VERIFY_CTX_new;
> ++		TS_RESP_CTX_set_extension_cb;
> ++		ENGINE_register_all_pkey_meths;
> ++		TS_RESP_CTX_set_status_info_cond;
> ++		TS_RESP_CTX_set_stat_info_cond;
> ++		EVP_PKEY_verify;
> ++		WHIRLPOOL_Final;
> ++		X509_CRL_METHOD_new;
> ++		EVP_DigestSignFinal;
> ++		TS_RESP_CTX_set_def_policy;
> ++		NETSCAPE_X509_it;
> ++		TS_RESP_create_response;
> ++		PKCS7_SIGNER_INFO_get0_algs;
> ++		TS_TST_INFO_get_nonce;
> ++		EVP_PKEY_decrypt_old;
> ++		TS_TST_INFO_set_policy_id;
> ++		TS_CONF_set_ess_cert_id_chain;
> ++		EVP_PKEY_CTX_get0_pkey;
> ++		d2i_TS_REQ;
> ++		EVP_PKEY_asn1_find_str;
> ++		BIO_f_asn1;
> ++		ESS_SIGNING_CERT_new;
> ++		EVP_PBE_find;
> ++		X509_CRL_get0_by_cert;
> ++		EVP_PKEY_derive;
> ++		i2d_TS_REQ;
> ++		TS_TST_INFO_delete_ext;
> ++		ESS_ISSUER_SERIAL_free;
> ++		ASN1_PCTX_set_str_flags;
> ++		ENGINE_get_pkey_asn1_meth_str;
> ++		TS_CONF_set_signer_key;
> ++		TS_ACCURACY_get_millis;
> ++		TS_RESP_get_token;
> ++		TS_ACCURACY_dup;
> ++		ENGINE_register_all_pkey_asn1_meths;
> ++		ENGINE_reg_all_pkey_asn1_meths;
> ++		X509_CRL_set_default_method;
> ++		CRYPTO_THREADID_hash;
> ++		CMS_ContentInfo_print_ctx;
> ++		TS_RESP_free;
> ++		ISSUING_DIST_POINT_free;
> ++		ESS_ISSUER_SERIAL_new;
> ++		CMS_add1_crl;
> ++		PKCS7_add1_attrib_digest;
> ++		TS_RESP_CTX_add_md;
> ++		TS_TST_INFO_dup;
> ++		ENGINE_set_pkey_asn1_meths;
> ++		PEM_write_bio_Parameters;
> ++		TS_TST_INFO_get_accuracy;
> ++		X509_CRL_get0_by_serial;
> ++		TS_TST_INFO_set_version;
> ++		TS_RESP_CTX_get_tst_info;
> ++		TS_RESP_verify_signature;
> ++		CRYPTO_THREADID_get_callback;
> ++		TS_TST_INFO_get_tsa;
> ++		TS_STATUS_INFO_new;
> ++		EVP_PKEY_CTX_get_cb;
> ++		TS_REQ_get_ext_d2i;
> ++		GENERAL_NAME_set0_othername;
> ++		TS_TST_INFO_get_ext_count;
> ++		TS_RESP_CTX_get_request;
> ++		i2d_NETSCAPE_X509;
> ++		ENGINE_get_pkey_meth_engine;
> ++		EVP_PKEY_meth_set_signctx;
> ++		EVP_PKEY_asn1_copy;
> ++		ASN1_TYPE_cmp;
> ++		EVP_CIPHER_do_all_sorted;
> ++		EVP_PKEY_CTX_free;
> ++		ISSUING_DIST_POINT_it;
> ++		d2i_TS_MSG_IMPRINT_fp;
> ++		X509_STORE_get1_certs;
> ++		EVP_PKEY_CTX_get_operation;
> ++		d2i_ESS_SIGNING_CERT;
> ++		TS_CONF_set_ordering;
> ++		EVP_PBE_alg_add_type;
> ++		TS_REQ_set_version;
> ++		EVP_PKEY_get0;
> ++		BIO_asn1_set_suffix;
> ++		i2d_TS_STATUS_INFO;
> ++		EVP_MD_do_all;
> ++		TS_TST_INFO_set_accuracy;
> ++		PKCS7_add_attrib_content_type;
> ++		ERR_remove_thread_state;
> ++		EVP_PKEY_meth_add0;
> ++		TS_TST_INFO_set_tsa;
> ++		EVP_PKEY_meth_new;
> ++		WHIRLPOOL_Update;
> ++		TS_CONF_set_accuracy;
> ++		ASN1_PCTX_set_oid_flags;
> ++		ESS_SIGNING_CERT_dup;
> ++		d2i_TS_REQ_bio;
> ++		X509_time_adj_ex;
> ++		TS_RESP_CTX_add_flags;
> ++		d2i_TS_STATUS_INFO;
> ++		TS_MSG_IMPRINT_set_msg;
> ++		BIO_asn1_get_suffix;
> ++		TS_REQ_free;
> ++		EVP_PKEY_meth_free;
> ++		TS_REQ_get_exts;
> ++		TS_RESP_CTX_set_clock_precision_digits;
> ++		TS_RESP_CTX_set_clk_prec_digits;
> ++		TS_RESP_CTX_add_failure_info;
> ++		i2d_TS_RESP_bio;
> ++		EVP_PKEY_CTX_get0_peerkey;
> ++		PEM_write_bio_CMS_stream;
> ++		TS_REQ_new;
> ++		TS_MSG_IMPRINT_new;
> ++		EVP_PKEY_meth_find;
> ++		EVP_PKEY_id;
> ++		TS_TST_INFO_set_serial;
> ++		a2i_GENERAL_NAME;
> ++		TS_CONF_set_crypto_device;
> ++		EVP_PKEY_verify_init;
> ++		TS_CONF_set_policies;
> ++		ASN1_PCTX_new;
> ++		ESS_CERT_ID_free;
> ++		ENGINE_unregister_pkey_meths;
> ++		TS_MSG_IMPRINT_free;
> ++		TS_VERIFY_CTX_init;
> ++		PKCS7_stream;
> ++		TS_RESP_CTX_set_certs;
> ++		TS_CONF_set_def_policy;
> ++		ASN1_GENERALIZEDTIME_adj;
> ++		NETSCAPE_X509_new;
> ++		TS_ACCURACY_free;
> ++		TS_RESP_get_tst_info;
> ++		EVP_PKEY_derive_set_peer;
> ++		PEM_read_bio_Parameters;
> ++		TS_CONF_set_clock_precision_digits;
> ++		TS_CONF_set_clk_prec_digits;
> ++		ESS_ISSUER_SERIAL_dup;
> ++		TS_ACCURACY_get_micros;
> ++		ASN1_PCTX_get_str_flags;
> ++		NAME_CONSTRAINTS_check;
> ++		ASN1_BIT_STRING_check;
> ++		X509_check_akid;
> ++		ENGINE_unregister_pkey_asn1_meths;
> ++		ENGINE_unreg_pkey_asn1_meths;
> ++		ASN1_PCTX_free;
> ++		PEM_write_bio_ASN1_stream;
> ++		i2d_ASN1_bio_stream;
> ++		TS_X509_ALGOR_print_bio;
> ++		EVP_PKEY_meth_set_cleanup;
> ++		EVP_PKEY_asn1_free;
> ++		ESS_SIGNING_CERT_free;
> ++		TS_TST_INFO_set_msg_imprint;
> ++		GENERAL_NAME_cmp;
> ++		d2i_ASN1_SET_ANY;
> ++		ENGINE_set_pkey_meths;
> ++		i2d_TS_REQ_fp;
> ++		d2i_ASN1_SEQUENCE_ANY;
> ++		GENERAL_NAME_get0_otherName;
> ++		d2i_ESS_CERT_ID;
> ++		OBJ_find_sigid_algs;
> ++		EVP_PKEY_meth_set_keygen;
> ++		PKCS5_PBKDF2_HMAC;
> ++		EVP_PKEY_paramgen;
> ++		EVP_PKEY_meth_set_paramgen;
> ++		BIO_new_PKCS7;
> ++		EVP_PKEY_verify_recover;
> ++		TS_ext_print_bio;
> ++		TS_ASN1_INTEGER_print_bio;
> ++		check_defer;
> ++		DSO_pathbyaddr;
> ++		EVP_PKEY_set_type;
> ++		TS_ACCURACY_set_micros;
> ++		TS_REQ_to_TS_VERIFY_CTX;
> ++		EVP_PKEY_meth_set_copy;
> ++		ASN1_PCTX_set_cert_flags;
> ++		TS_TST_INFO_get_ext;
> ++		EVP_PKEY_asn1_set_ctrl;
> ++		TS_TST_INFO_get_ext_by_critical;
> ++		EVP_PKEY_CTX_new_id;
> ++		TS_REQ_get_ext_by_OBJ;
> ++		TS_CONF_set_signer_cert;
> ++		X509_NAME_hash_old;
> ++		ASN1_TIME_set_string;
> ++		EVP_MD_flags;
> ++		TS_RESP_CTX_free;
> ++		DSAparams_dup;
> ++		DHparams_dup;
> ++		OCSP_REQ_CTX_add1_header;
> ++		OCSP_REQ_CTX_set1_req;
> ++		X509_STORE_set_verify_cb;
> ++		X509_STORE_CTX_get0_current_crl;
> ++		X509_STORE_CTX_get0_parent_ctx;
> ++		X509_STORE_CTX_get0_current_issuer;
> ++		X509_STORE_CTX_get0_cur_issuer;
> ++		X509_issuer_name_hash_old;
> ++		X509_subject_name_hash_old;
> ++		EVP_CIPHER_CTX_copy;
> ++		UI_method_get_prompt_constructor;
> ++		UI_method_get_prompt_constructr;
> ++		UI_method_set_prompt_constructor;
> ++		UI_method_set_prompt_constructr;
> ++		EVP_read_pw_string_min;
> ++		CRYPTO_cts128_encrypt;
> ++		CRYPTO_cts128_decrypt_block;
> ++		CRYPTO_cfb128_1_encrypt;
> ++		CRYPTO_cbc128_encrypt;
> ++		CRYPTO_ctr128_encrypt;
> ++		CRYPTO_ofb128_encrypt;
> ++		CRYPTO_cts128_decrypt;
> ++		CRYPTO_cts128_encrypt_block;
> ++		CRYPTO_cbc128_decrypt;
> ++		CRYPTO_cfb128_encrypt;
> ++		CRYPTO_cfb128_8_encrypt;
> ++
> ++	local:
> ++		*;
> ++};
> ++
> ++
> ++OPENSSL_1.0.1 {
> ++	global:
> ++		SSL_renegotiate_abbreviated;
> ++		TLSv1_1_method;
> ++		TLSv1_1_client_method;
> ++		TLSv1_1_server_method;
> ++		SSL_CTX_set_srp_client_pwd_callback;
> ++		SSL_CTX_set_srp_client_pwd_cb;
> ++		SSL_get_srp_g;
> ++		SSL_CTX_set_srp_username_callback;
> ++		SSL_CTX_set_srp_un_cb;
> ++		SSL_get_srp_userinfo;
> ++		SSL_set_srp_server_param;
> ++		SSL_set_srp_server_param_pw;
> ++		SSL_get_srp_N;
> ++		SSL_get_srp_username;
> ++		SSL_CTX_set_srp_password;
> ++		SSL_CTX_set_srp_strength;
> ++		SSL_CTX_set_srp_verify_param_callback;
> ++		SSL_CTX_set_srp_vfy_param_cb;
> ++		SSL_CTX_set_srp_cb_arg;
> ++		SSL_CTX_set_srp_username;
> ++		SSL_CTX_SRP_CTX_init;
> ++		SSL_SRP_CTX_init;
> ++		SRP_Calc_A_param;
> ++		SRP_generate_server_master_secret;
> ++		SRP_gen_server_master_secret;
> ++		SSL_CTX_SRP_CTX_free;
> ++		SRP_generate_client_master_secret;
> ++		SRP_gen_client_master_secret;
> ++		SSL_srp_server_param_with_username;
> ++		SSL_srp_server_param_with_un;
> ++		SSL_SRP_CTX_free;
> ++		SSL_set_debug;
> ++		SSL_SESSION_get0_peer;
> ++		TLSv1_2_client_method;
> ++		SSL_SESSION_set1_id_context;
> ++		TLSv1_2_server_method;
> ++		SSL_cache_hit;
> ++		SSL_get0_kssl_ctx;
> ++		SSL_set0_kssl_ctx;
> ++		SSL_set_state;
> ++		SSL_CIPHER_get_id;
> ++		TLSv1_2_method;
> ++		kssl_ctx_get0_client_princ;
> ++		SSL_export_keying_material;
> ++		SSL_set_tlsext_use_srtp;
> ++		SSL_CTX_set_next_protos_advertised_cb;
> ++		SSL_CTX_set_next_protos_adv_cb;
> ++		SSL_get0_next_proto_negotiated;
> ++		SSL_get_selected_srtp_profile;
> ++		SSL_CTX_set_tlsext_use_srtp;
> ++		SSL_select_next_proto;
> ++		SSL_get_srtp_profiles;
> ++		SSL_CTX_set_next_proto_select_cb;
> ++		SSL_CTX_set_next_proto_sel_cb;
> ++		SSL_SESSION_get_compress_id;
> ++
> ++		SRP_VBASE_get_by_user;
> ++		SRP_Calc_server_key;
> ++		SRP_create_verifier;
> ++		SRP_create_verifier_BN;
> ++		SRP_Calc_u;
> ++		SRP_VBASE_free;
> ++		SRP_Calc_client_key;
> ++		SRP_get_default_gN;
> ++		SRP_Calc_x;
> ++		SRP_Calc_B;
> ++		SRP_VBASE_new;
> ++		SRP_check_known_gN_param;
> ++		SRP_Calc_A;
> ++		SRP_Verify_A_mod_N;
> ++		SRP_VBASE_init;
> ++		SRP_Verify_B_mod_N;
> ++		EC_KEY_set_public_key_affine_coordinates;
> ++		EC_KEY_set_pub_key_aff_coords;
> ++		EVP_aes_192_ctr;
> ++		EVP_PKEY_meth_get0_info;
> ++		EVP_PKEY_meth_copy;
> ++		ERR_add_error_vdata;
> ++		EVP_aes_128_ctr;
> ++		EVP_aes_256_ctr;
> ++		EC_GFp_nistp224_method;
> ++		EC_KEY_get_flags;
> ++		RSA_padding_add_PKCS1_PSS_mgf1;
> ++		EVP_aes_128_xts;
> ++		EVP_aes_256_xts;
> ++		EVP_aes_128_gcm;
> ++		EC_KEY_clear_flags;
> ++		EC_KEY_set_flags;
> ++		EVP_aes_256_ccm;
> ++		RSA_verify_PKCS1_PSS_mgf1;
> ++		EVP_aes_128_ccm;
> ++		EVP_aes_192_gcm;
> ++		X509_ALGOR_set_md;
> ++		RAND_init_fips;
> ++		EVP_aes_256_gcm;
> ++		EVP_aes_192_ccm;
> ++		CMAC_CTX_copy;
> ++		CMAC_CTX_free;
> ++		CMAC_CTX_get0_cipher_ctx;
> ++		CMAC_CTX_cleanup;
> ++		CMAC_Init;
> ++		CMAC_Update;
> ++		CMAC_resume;
> ++		CMAC_CTX_new;
> ++		CMAC_Final;
> ++		CRYPTO_ctr128_encrypt_ctr32;
> ++		CRYPTO_gcm128_release;
> ++		CRYPTO_ccm128_decrypt_ccm64;
> ++		CRYPTO_ccm128_encrypt;
> ++		CRYPTO_gcm128_encrypt;
> ++		CRYPTO_xts128_encrypt;
> ++		EVP_rc4_hmac_md5;
> ++		CRYPTO_nistcts128_decrypt_block;
> ++		CRYPTO_gcm128_setiv;
> ++		CRYPTO_nistcts128_encrypt;
> ++		EVP_aes_128_cbc_hmac_sha1;
> ++		CRYPTO_gcm128_tag;
> ++		CRYPTO_ccm128_encrypt_ccm64;
> ++		ENGINE_load_rdrand;
> ++		CRYPTO_ccm128_setiv;
> ++		CRYPTO_nistcts128_encrypt_block;
> ++		CRYPTO_gcm128_aad;
> ++		CRYPTO_ccm128_init;
> ++		CRYPTO_nistcts128_decrypt;
> ++		CRYPTO_gcm128_new;
> ++		CRYPTO_ccm128_tag;
> ++		CRYPTO_ccm128_decrypt;
> ++		CRYPTO_ccm128_aad;
> ++		CRYPTO_gcm128_init;
> ++		CRYPTO_gcm128_decrypt;
> ++		ENGINE_load_rsax;
> ++		CRYPTO_gcm128_decrypt_ctr32;
> ++		CRYPTO_gcm128_encrypt_ctr32;
> ++		CRYPTO_gcm128_finish;
> ++		EVP_aes_256_cbc_hmac_sha1;
> ++		PKCS5_pbkdf2_set;
> ++		CMS_add0_recipient_password;
> ++		CMS_decrypt_set1_password;
> ++		CMS_RecipientInfo_set0_password;
> ++		RAND_set_fips_drbg_type;
> ++		X509_REQ_sign_ctx;
> ++		RSA_PSS_PARAMS_new;
> ++		X509_CRL_sign_ctx;
> ++		X509_signature_dump;
> ++		d2i_RSA_PSS_PARAMS;
> ++		RSA_PSS_PARAMS_it;
> ++		RSA_PSS_PARAMS_free;
> ++		X509_sign_ctx;
> ++		i2d_RSA_PSS_PARAMS;
> ++		ASN1_item_sign_ctx;
> ++		EC_GFp_nistp521_method;
> ++		EC_GFp_nistp256_method;
> ++		OPENSSL_stderr;
> ++		OPENSSL_cpuid_setup;
> ++		OPENSSL_showfatal;
> ++		BIO_new_dgram_sctp;
> ++		BIO_dgram_sctp_msg_waiting;
> ++		BIO_dgram_sctp_wait_for_dry;
> ++		BIO_s_datagram_sctp;
> ++		BIO_dgram_is_sctp;
> ++		BIO_dgram_sctp_notification_cb;
> ++} OPENSSL_1.0.0;
> ++
> ++OPENSSL_1.0.1d {
> ++	global:
> ++		CRYPTO_memcmp;
> ++} OPENSSL_1.0.1;
> ++
> ++OPENSSL_1.0.2 {
> ++	global:
> ++		SSL_CTX_set_alpn_protos;
> ++		SSL_set_alpn_protos;
> ++		SSL_CTX_set_alpn_select_cb;
> ++		SSL_get0_alpn_selected;
> ++		SSL_CTX_set_custom_cli_ext;
> ++		SSL_CTX_set_custom_srv_ext;
> ++		SSL_CTX_set_srv_supp_data;
> ++		SSL_CTX_set_cli_supp_data;
> ++		SSL_set_cert_cb;
> ++		SSL_CTX_use_serverinfo;
> ++		SSL_CTX_use_serverinfo_file;
> ++		SSL_CTX_set_cert_cb;
> ++		SSL_CTX_get0_param;
> ++		SSL_get0_param;
> ++		SSL_certs_clear;
> ++		DTLSv1_2_method;
> ++		DTLSv1_2_server_method;
> ++		DTLSv1_2_client_method;
> ++		DTLS_method;
> ++		DTLS_server_method;
> ++		DTLS_client_method;
> ++		SSL_CTX_get_ssl_method;
> ++		SSL_CTX_get0_certificate;
> ++		SSL_CTX_get0_privatekey;
> ++		SSL_COMP_set0_compression_methods;
> ++		SSL_COMP_free_compression_methods;
> ++		SSL_CIPHER_find;
> ++		SSL_is_server;
> ++		SSL_CONF_CTX_new;
> ++		SSL_CONF_CTX_finish;
> ++		SSL_CONF_CTX_free;
> ++		SSL_CONF_CTX_set_flags;
> ++		SSL_CONF_CTX_clear_flags;
> ++		SSL_CONF_CTX_set1_prefix;
> ++		SSL_CONF_CTX_set_ssl;
> ++		SSL_CONF_CTX_set_ssl_ctx;
> ++		SSL_CONF_cmd;
> ++		SSL_CONF_cmd_argv;
> ++		SSL_CONF_cmd_value_type;
> ++		SSL_trace;
> ++		SSL_CIPHER_standard_name;
> ++		SSL_get_tlsa_record_byname;
> ++		ASN1_TIME_diff;
> ++		BIO_hex_string;
> ++		CMS_RecipientInfo_get0_pkey_ctx;
> ++		CMS_RecipientInfo_encrypt;
> ++		CMS_SignerInfo_get0_pkey_ctx;
> ++		CMS_SignerInfo_get0_md_ctx;
> ++		CMS_SignerInfo_get0_signature;
> ++		CMS_RecipientInfo_kari_get0_alg;
> ++		CMS_RecipientInfo_kari_get0_reks;
> ++		CMS_RecipientInfo_kari_get0_orig_id;
> ++		CMS_RecipientInfo_kari_orig_id_cmp;
> ++		CMS_RecipientEncryptedKey_get0_id;
> ++		CMS_RecipientEncryptedKey_cert_cmp;
> ++		CMS_RecipientInfo_kari_set0_pkey;
> ++		CMS_RecipientInfo_kari_get0_ctx;
> ++		CMS_RecipientInfo_kari_decrypt;
> ++		CMS_SharedInfo_encode;
> ++		DH_compute_key_padded;
> ++		d2i_DHxparams;
> ++		i2d_DHxparams;
> ++		DH_get_1024_160;
> ++		DH_get_2048_224;
> ++		DH_get_2048_256;
> ++		DH_KDF_X9_42;
> ++		ECDH_KDF_X9_62;
> ++		ECDSA_METHOD_new;
> ++		ECDSA_METHOD_free;
> ++		ECDSA_METHOD_set_app_data;
> ++		ECDSA_METHOD_get_app_data;
> ++		ECDSA_METHOD_set_sign;
> ++		ECDSA_METHOD_set_sign_setup;
> ++		ECDSA_METHOD_set_verify;
> ++		ECDSA_METHOD_set_flags;
> ++		ECDSA_METHOD_set_name;
> ++		EVP_des_ede3_wrap;
> ++		EVP_aes_128_wrap;
> ++		EVP_aes_192_wrap;
> ++		EVP_aes_256_wrap;
> ++		EVP_aes_128_cbc_hmac_sha256;
> ++		EVP_aes_256_cbc_hmac_sha256;
> ++		CRYPTO_128_wrap;
> ++		CRYPTO_128_unwrap;
> ++		OCSP_REQ_CTX_nbio;
> ++		OCSP_REQ_CTX_new;
> ++		OCSP_set_max_response_length;
> ++		OCSP_REQ_CTX_i2d;
> ++		OCSP_REQ_CTX_nbio_d2i;
> ++		OCSP_REQ_CTX_get0_mem_bio;
> ++		OCSP_REQ_CTX_http;
> ++		RSA_padding_add_PKCS1_OAEP_mgf1;
> ++		RSA_padding_check_PKCS1_OAEP_mgf1;
> ++		RSA_OAEP_PARAMS_free;
> ++		RSA_OAEP_PARAMS_it;
> ++		RSA_OAEP_PARAMS_new;
> ++		SSL_get_sigalgs;
> ++		SSL_get_shared_sigalgs;
> ++		SSL_check_chain;
> ++		X509_chain_up_ref;
> ++		X509_http_nbio;
> ++		X509_CRL_http_nbio;
> ++		X509_REVOKED_dup;
> ++		i2d_re_X509_tbs;
> ++		X509_get0_signature;
> ++		X509_get_signature_nid;
> ++		X509_CRL_diff;
> ++		X509_chain_check_suiteb;
> ++		X509_CRL_check_suiteb;
> ++		X509_check_host;
> ++		X509_check_email;
> ++		X509_check_ip;
> ++		X509_check_ip_asc;
> ++		X509_STORE_set_lookup_crls_cb;
> ++		X509_STORE_CTX_get0_store;
> ++		X509_VERIFY_PARAM_set1_host;
> ++		X509_VERIFY_PARAM_add1_host;
> ++		X509_VERIFY_PARAM_set_hostflags;
> ++		X509_VERIFY_PARAM_get0_peername;
> ++		X509_VERIFY_PARAM_set1_email;
> ++		X509_VERIFY_PARAM_set1_ip;
> ++		X509_VERIFY_PARAM_set1_ip_asc;
> ++		X509_VERIFY_PARAM_get0_name;
> ++		X509_VERIFY_PARAM_get_count;
> ++		X509_VERIFY_PARAM_get0;
> ++		X509V3_EXT_free;
> ++		EC_GROUP_get_mont_data;
> ++		EC_curve_nid2nist;
> ++		EC_curve_nist2nid;
> ++		PEM_write_bio_DHxparams;
> ++		PEM_write_DHxparams;
> ++		SSL_CTX_add_client_custom_ext;
> ++		SSL_CTX_add_server_custom_ext;
> ++		SSL_extension_supported;
> ++		BUF_strnlen;
> ++		sk_deep_copy;
> ++		SSL_test_functions;
> ++} OPENSSL_1.0.1d;
> ++
> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
> +===================================================================
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld	2014-02-24 21:02:30.000000000 +0100
> +@@ -0,0 +1,10 @@
> ++OPENSSL_1.0.0 {
> ++	global:
> ++		bind_engine;
> ++		v_check;
> ++		OPENSSL_init;
> ++		OPENSSL_finish;
> ++	local:
> ++		*;
> ++};
> ++
> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
> +===================================================================
> +--- /dev/null	1970-01-01 00:00:00.000000000 +0000
> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld	2014-02-24 21:02:30.000000000 +0100
> +@@ -0,0 +1,10 @@
> ++OPENSSL_1.0.0 {
> ++	global:
> ++		bind_engine;
> ++		v_check;
> ++		OPENSSL_init;
> ++		OPENSSL_finish;
> ++	local:
> ++		*;
> ++};
> ++
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> index f53efdb..29f11a2 100644
> --- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
> @@ -15,8 +15,8 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  ===================================================================
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld	2014-02-24 22:19:08.601827266 +0100
> -@@ -0,0 +1,4621 @@
> -+OPENSSL_1.0.0 {
> +@@ -0,0 +1,4608 @@
> ++OPENSSL_1.0.2d {
>  +	global:
>  +		BIO_f_ssl;
>  +		BIO_new_buffer_ssl_connect;
> @@ -4314,14 +4314,6 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  +		CRYPTO_cbc128_decrypt;
>  +		CRYPTO_cfb128_encrypt;
>  +		CRYPTO_cfb128_8_encrypt;
> -+
> -+	local:
> -+		*;
> -+};
> -+
> -+
> -+OPENSSL_1.0.1 {
> -+	global:
>  +		SSL_renegotiate_abbreviated;
>  +		TLSv1_1_method;
>  +		TLSv1_1_client_method;
> @@ -4483,15 +4475,7 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  +		BIO_s_datagram_sctp;
>  +		BIO_dgram_is_sctp;
>  +		BIO_dgram_sctp_notification_cb;
> -+} OPENSSL_1.0.0;
> -+
> -+OPENSSL_1.0.1d {
> -+	global:
>  +		CRYPTO_memcmp;
> -+} OPENSSL_1.0.1;
> -+
> -+OPENSSL_1.0.2 {
> -+	global:
>  +		SSL_CTX_set_alpn_protos;
>  +		SSL_set_alpn_protos;
>  +		SSL_CTX_set_alpn_select_cb;
> @@ -4629,20 +4613,23 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>  +		BUF_strnlen;
>  +		sk_deep_copy;
>  +		SSL_test_functions;
> -+} OPENSSL_1.0.1d;
> ++
> ++	local:
> ++		*;
> ++};
>  +
>  +OPENSSL_1.0.2g {
>  +       global:
>  +               SRP_VBASE_get1_by_user;
>  +               SRP_user_pwd_free;
> -+} OPENSSL_1.0.2;
> ++} OPENSSL_1.0.2d;
>  +
>  Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
>  ===================================================================
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld	2014-02-24 21:02:30.000000000 +0100
>  @@ -0,0 +1,10 @@
> -+OPENSSL_1.0.0 {
> ++OPENSSL_1.0.2 {
>  +	global:
>  +		bind_engine;
>  +		v_check;
> @@ -4657,7 +4644,7 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>  +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld	2014-02-24 21:02:30.000000000 +0100
>  @@ -0,0 +1,10 @@
> -+OPENSSL_1.0.0 {
> ++OPENSSL_1.0.2 {
>  +	global:
>  +		bind_engine;
>  +		v_check;
> diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> index 06d1ea6..2a318a4 100644
> --- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> @@ -4,7 +4,7 @@ This patch adds the fix for one of the ciphers used in openssl, namely
>  the cipher des-ede3-cfb1. Complete bug log and patch is present here:
>  http://rt.openssl.org/Ticket/Display.html?id=2867
>  
> -Signed-Off-By: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> +Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>  
>  Index: openssl-1.0.2/crypto/evp/e_des3.c
>  ===================================================================
> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> new file mode 100644
> index 0000000..6620fdc
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> @@ -0,0 +1,222 @@
> +#!/bin/sh
> +#
> +# Ben Secrest <blsecres@gmail.com>
> +#
> +# sh c_rehash script, scan all files in a directory
> +# and add symbolic links to their hash values.
> +#
> +# based on the c_rehash perl script distributed with openssl
> +#
> +# LICENSE: See OpenSSL license
> +# ^^acceptable?^^
> +#
> +
> +# default certificate location
> +DIR=/etc/openssl
> +
> +# for filetype bitfield
> +IS_CERT=$(( 1 << 0 ))
> +IS_CRL=$(( 1 << 1 ))
> +
> +
> +# check to see if a file is a certificate file or a CRL file
> +# arguments:
> +#       1. the filename to be scanned
> +# returns:
> +#       bitfield of file type; uses ${IS_CERT} and ${IS_CRL}
> +#
> +check_file()
> +{
> +    local IS_TYPE=0
> +
> +    # make IFS a newline so we can process grep output line by line
> +    local OLDIFS=${IFS}
> +    IFS=$( printf "\n" )
> +
> +    # XXX: could be more efficient to have two 'grep -m' but is -m portable?
> +    for LINE in $( grep '^-----BEGIN .*-----' ${1} )
> +    do
> +	if echo ${LINE} \
> +	    | grep -q -E '^-----BEGIN (X509 |TRUSTED )?CERTIFICATE-----'
> +	then
> +	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CERT} ))
> +
> +	    if [ $(( ${IS_TYPE} & ${IS_CRL} )) -ne 0 ]
> +	    then
> +	    	break
> +	    fi
> +	elif echo ${LINE} | grep -q '^-----BEGIN X509 CRL-----'
> +	then
> +	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CRL} ))
> +
> +	    if [ $(( ${IS_TYPE} & ${IS_CERT} )) -ne 0 ]
> +	    then
> +	    	break
> +	    fi
> +	fi
> +    done
> +
> +    # restore IFS
> +    IFS=${OLDIFS}
> +
> +    return ${IS_TYPE}
> +}
> +
> +
> +#
> +# use openssl to fingerprint a file
> +#    arguments:
> +#	1. the filename to fingerprint
> +#	2. the method to use (x509, crl)
> +#    returns:
> +#	none
> +#    assumptions:
> +#	user will capture output from last stage of pipeline
> +#
> +fingerprint()
> +{
> +    ${SSL_CMD} ${2} -fingerprint -noout -in ${1} | sed 's/^.*=//' | tr -d ':'
> +}
> +
> +
> +#
> +# link_hash - create links to certificate files
> +#    arguments:
> +#       1. the filename to create a link for
> +#	2. the type of certificate being linked (x509, crl)
> +#    returns:
> +#	0 on success, 1 otherwise
> +#
> +link_hash()
> +{
> +    local FINGERPRINT=$( fingerprint ${1} ${2} )
> +    local HASH=$( ${SSL_CMD} ${2} -hash -noout -in ${1} )
> +    local SUFFIX=0
> +    local LINKFILE=''
> +    local TAG=''
> +
> +    if [ ${2} = "crl" ]
> +    then
> +    	TAG='r'
> +    fi
> +
> +    LINKFILE=${HASH}.${TAG}${SUFFIX}
> +
> +    while [ -f ${LINKFILE} ]
> +    do
> +	if [ ${FINGERPRINT} = $( fingerprint ${LINKFILE} ${2} ) ]
> +	then
> +	    echo "NOTE: Skipping duplicate file ${1}" >&2
> +	    return 1
> +	fi	
> +
> +	SUFFIX=$(( ${SUFFIX} + 1 ))
> +	LINKFILE=${HASH}.${TAG}${SUFFIX}
> +    done
> +
> +    echo "${3} => ${LINKFILE}"
> +
> +    # assume any system with a POSIX shell will either support symlinks or
> +    # do something to handle this gracefully
> +    ln -s ${3} ${LINKFILE}
> +
> +    return 0
> +}
> +
> +
> +# hash_dir create hash links in a given directory
> +hash_dir()
> +{
> +    echo "Doing ${1}"
> +
> +    cd ${1}
> +
> +    ls -1 * 2>/dev/null | while read FILE
> +    do
> +        if echo ${FILE} | grep -q -E '^[[:xdigit:]]{8}\.r?[[:digit:]]+$' \
> +	    	&& [ -h "${FILE}" ]
> +        then
> +            rm ${FILE}
> +        fi
> +    done
> +
> +    ls -1 *.pem *.cer *.crt *.crl 2>/dev/null | while read FILE
> +    do
> +	REAL_FILE=${FILE}
> +	# if we run on build host then get to the real files in rootfs
> +	if [ -n "${SYSROOT}" -a -h ${FILE} ]
> +	then
> +	    FILE=$( readlink ${FILE} )
> +	    # check the symlink is absolute (or dangling in other word)
> +	    if [ "x/" = "x$( echo ${FILE} | cut -c1 -)" ]
> +	    then
> +		REAL_FILE=${SYSROOT}/${FILE}
> +	    fi
> +	fi
> +
> +	check_file ${REAL_FILE}
> +        local FILE_TYPE=${?}
> +	local TYPE_STR=''
> +
> +        if [ $(( ${FILE_TYPE} & ${IS_CERT} )) -ne 0 ]
> +        then
> +            TYPE_STR='x509'
> +        elif [ $(( ${FILE_TYPE} & ${IS_CRL} )) -ne 0 ]
> +        then
> +            TYPE_STR='crl'
> +        else
> +            echo "NOTE: ${FILE} does not contain a certificate or CRL: skipping" >&2
> +	    continue
> +        fi
> +
> +	link_hash ${REAL_FILE} ${TYPE_STR} ${FILE}
> +    done
> +}
> +
> +
> +# choose the name of an ssl application
> +if [ -n "${OPENSSL}" ]
> +then
> +    SSL_CMD=$(which ${OPENSSL} 2>/dev/null)
> +else
> +    SSL_CMD=/usr/bin/openssl
> +    OPENSSL=${SSL_CMD}
> +    export OPENSSL
> +fi
> +
> +# fix paths
> +PATH=${PATH}:${DIR}/bin
> +export PATH
> +
> +# confirm existance/executability of ssl command
> +if ! [ -x ${SSL_CMD} ]
> +then
> +    echo "${0}: rehashing skipped ('openssl' program not available)" >&2
> +    exit 0
> +fi
> +
> +# determine which directories to process
> +old_IFS=$IFS
> +if [ ${#} -gt 0 ]
> +then
> +    IFS=':'
> +    DIRLIST=${*}
> +elif [ -n "${SSL_CERT_DIR}" ]
> +then
> +    DIRLIST=$SSL_CERT_DIR
> +else
> +    DIRLIST=${DIR}/certs
> +fi
> +
> +IFS=':'
> +
> +# process directories
> +for CERT_DIR in ${DIRLIST}
> +do
> +    if [ -d ${CERT_DIR} -a -w ${CERT_DIR} ]
> +    then
> +        IFS=$old_IFS
> +        hash_dir ${CERT_DIR}
> +        IFS=':'
> +    fi
> +done
> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
> new file mode 100644
> index 0000000..065b9b1
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
> @@ -0,0 +1,34 @@
> +From e427748f3bb5d37e78dc8d70a558c373aa8ababb Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Mon, 19 Sep 2016 22:06:28 -0700
> +Subject: [PATCH] util/perlpath.pl: make it work when cwd is not in @INC
> +
> +Fixed when building on Debian-testing:
> +| Can't locate find.pl in @INC (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.2 /usr/local/share/perl/5.22.2 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at perlpath.pl line 7.
> +
> +The find.pl is added by oe-core, so once openssl/find.pl is removed,
> +then this patch can be dropped.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + util/perlpath.pl | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/util/perlpath.pl b/util/perlpath.pl
> +index a1f236b..5599892 100755
> +--- a/util/perlpath.pl
> ++++ b/util/perlpath.pl
> +@@ -4,6 +4,8 @@
> + # line in all scripts that rely on perl.
> + #
> + 
> ++BEGIN { unshift @INC, "."; }
> ++
> + require "find.pl";
> + 
> + $#ARGV == 0 || print STDERR "usage: perlpath newpath  (eg /usr/bin)\n";
> +-- 
> +2.9.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
> index cbce32c..0f08a64 100644
> --- a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
> @@ -2,10 +2,10 @@ Upstream-Status: Pending
>  
>  Received from H J Liu @ Intel
>  Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
> +Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
>  
>  ported the patch to the 1.0.0e version
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
> +Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
>  Index: openssl-1.0.2/crypto/bn/bn.h
>  ===================================================================
>  --- openssl-1.0.2.orig/crypto/bn/bn.h
> diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/meta/recipes-connectivity/openssl/openssl/parallel.patch
> index b6c2c14..f3f4c99 100644
> --- a/meta/recipes-connectivity/openssl/openssl/parallel.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/parallel.patch
> @@ -6,6 +6,9 @@ https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1
>  Upstream-Status: Pending
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>  
> +Refreshed for 1.0.2i
> +Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> +
>  --- openssl-1.0.2g/crypto/Makefile
>  +++ openssl-1.0.2g/crypto/Makefile
>  @@ -85,11 +85,11 @@
> @@ -133,7 +136,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   		fi; \
>  --- openssl-1.0.2g/test/Makefile
>  +++ openssl-1.0.2g/test/Makefile
> -@@ -139,7 +139,7 @@
> +@@ -144,7 +144,7 @@
>   tags:
>   	ctags $(SRC)
>   
> @@ -142,7 +145,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   
>   apps:
>   	@(cd ..; $(MAKE) DIRS=apps all)
> -@@ -421,130 +421,130 @@
> +@@ -438,136 +438,136 @@
>   		link_app.$${shlib_target}
>   
>   $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
> @@ -309,13 +312,21 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>  -	@target=$(CLIENTHELLOTEST) $(BUILD_CMD)
>  +	+@target=$(CLIENTHELLOTEST) $(BUILD_CMD)
>   
> + $(BADDTLSTEST)$(EXE_EXT): $(BADDTLSTEST).o
> +-	@target=$(BADDTLSTEST) $(BUILD_CMD)
> ++	+@target=$(BADDTLSTEST) $(BUILD_CMD)
> + 
>   $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
>  -	@target=$(SSLV2CONFTEST) $(BUILD_CMD)
>  +	+@target=$(SSLV2CONFTEST) $(BUILD_CMD)
>   
> + $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
> +-	@target=$(DTLSTEST); exobj=ssltestlib.o; $(BUILD_CMD)
> ++	+@target=$(DTLSTEST); exobj=ssltestlib.o; $(BUILD_CMD)
> + 
>   #$(AESTEST).o: $(AESTEST).c
>   #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
> -@@ -557,7 +557,7 @@
> +@@ -580,6 +580,6 @@
>   #	fi
>   
>   dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> deleted file mode 100644
> index 26bc6be..0000000
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -require openssl.inc
> -
> -# For target side versions of openssl enable support for OCF Linux driver
> -# if they are available.
> -DEPENDS += "cryptodev-linux"
> -
> -CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
> -
> -export DIRS = "crypto ssl apps engines"
> -export OE_LDFLAGS="${LDFLAGS}"
> -
> -SRC_URI += "file://configure-targets.patch \
> -            file://shared-libs.patch \
> -            file://oe-ldflags.patch \
> -            file://engines-install-in-libdir-ssl.patch \
> -            file://debian1.0.2/block_diginotar.patch \
> -            file://debian1.0.2/block_digicert_malaysia.patch \
> -            file://debian/ca.patch \
> -            file://debian/c_rehash-compat.patch \
> -            file://debian/debian-targets.patch \
> -            file://debian/man-dir.patch \
> -            file://debian/man-section.patch \
> -            file://debian/no-rpath.patch \
> -            file://debian/no-symbolic.patch \
> -            file://debian/pic.patch \
> -            file://debian1.0.2/version-script.patch \
> -            file://openssl_fix_for_x32.patch \
> -            file://fix-cipher-des-ede3-cfb1.patch \
> -            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
> -            file://find.pl \
> -            file://openssl-fix-des.pod-error.patch \
> -            file://Makefiles-ptest.patch \
> -            file://ptest-deps.patch \
> -            file://run-ptest \
> -            file://crypto_use_bigint_in_x86-64_perl.patch \
> -            file://openssl-1.0.2a-x32-asm.patch \
> -            file://ptest_makefile_deps.patch  \
> -            file://parallel.patch \
> -            file://CVE-2016-2177.patch \
> -            file://CVE-2016-2178.patch \
> -            file://CVE-2016-2180.patch \
> -            file://CVE-2016-2181_p1.patch \
> -            file://CVE-2016-2181_p2.patch \
> -            file://CVE-2016-2181_p3.patch \
> -            file://CVE-2016-2182.patch \
> -            file://CVE-2016-6302.patch \
> -            file://CVE-2016-6303.patch \
> -            file://CVE-2016-6304.patch \
> -            file://CVE-2016-6306.patch \
> -            file://CVE-2016-2179.patch \
> -            file://CVE-2016-8610.patch \
> -           "
> -
> -SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
> -SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
> -
> -PACKAGES =+ " \
> -	${PN}-engines \
> -	${PN}-engines-dbg \
> -	"
> -
> -FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
> -FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
> -
> -PARALLEL_MAKE = ""
> -PARALLEL_MAKEINST = ""
> -
> -do_configure_prepend() {
> -  cp ${WORKDIR}/find.pl ${S}/util/find.pl
> -}
> -
> -# The crypto_use_bigint patch means that perl's bignum module needs to be
> -# installed, but some distributions (for example Fedora 23) don't ship it by
> -# default.  As the resulting error is very misleading check for bignum before
> -# building.
> -do_configure_prepend() {
> -	if ! perl -Mbigint -e true; then
> -		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
> -	fi
> -}
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> new file mode 100644
> index 0000000..f333c8f
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> @@ -0,0 +1,64 @@
> +require openssl.inc
> +
> +# For target side versions of openssl enable support for OCF Linux driver
> +# if they are available.
> +DEPENDS += "cryptodev-linux"
> +
> +CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> +CFLAG_append_class-native = " -fPIC"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
> +
> +export DIRS = "crypto ssl apps engines"
> +export OE_LDFLAGS="${LDFLAGS}"
> +
> +SRC_URI += "file://find.pl;subdir=${BP}/util/ \
> +            file://run-ptest \
> +            file://openssl-c_rehash.sh \
> +            file://configure-targets.patch \
> +            file://shared-libs.patch \
> +            file://oe-ldflags.patch \
> +            file://engines-install-in-libdir-ssl.patch \
> +            file://debian1.0.2/block_diginotar.patch \
> +            file://debian1.0.2/block_digicert_malaysia.patch \
> +            file://debian/ca.patch \
> +            file://debian/c_rehash-compat.patch \
> +            file://debian/debian-targets.patch \
> +            file://debian/man-dir.patch \
> +            file://debian/man-section.patch \
> +            file://debian/no-rpath.patch \
> +            file://debian/no-symbolic.patch \
> +            file://debian/pic.patch \
> +            file://debian1.0.2/version-script.patch \
> +            file://openssl_fix_for_x32.patch \
> +            file://fix-cipher-des-ede3-cfb1.patch \
> +            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
> +            file://openssl-fix-des.pod-error.patch \
> +            file://Makefiles-ptest.patch \
> +            file://ptest-deps.patch \
> +            file://openssl-1.0.2a-x32-asm.patch \
> +            file://ptest_makefile_deps.patch  \
> +            file://parallel.patch \
> +            file://openssl-util-perlpath.pl-cwd.patch \
> +            file://0002-CVE-2017-3731.patch \
> +           "
> +SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
> +SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
> +
> +PACKAGES =+ " \
> +	${PN}-engines \
> +	${PN}-engines-dbg \
> +	"
> +
> +FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
> +FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
> +
> +# The crypto_use_bigint patch means that perl's bignum module needs to be
> +# installed, but some distributions (for example Fedora 23) don't ship it by
> +# default.  As the resulting error is very misleading check for bignum before
> +# building.
> +do_configure_prepend() {
> +	if ! perl -Mbigint -e true; then
> +		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
> +	fi
> +}
> -- 
> 2.7.4
> 



