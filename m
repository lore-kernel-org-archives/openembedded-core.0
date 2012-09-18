Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TDtqL-0002qT-D7
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:11:45 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 1692FD22E8; Tue, 18 Sep 2012 10:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5866CD20E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 10:58:39 +0200 (CEST)
Message-ID: <505837BA.2040305@linaro.org>
Date: Tue, 18 Sep 2012 10:58:34 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Best way to update gnu-config?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 09:11:45 -0000
X-Groupsio-MsgNum: 29421
Content-Type: multipart/mixed; boundary="------------090904030003080209050002"

--------------090904030003080209050002
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I am working on meta-aarch64 layer to add 64-bit ARM support.

For that I have to update gnu-config to newer version. Currently I am
using gnu-config_git.bbappend to move to 20120814 one. OE-Core is using
tarball prepared by Yocto Project so update is not so easy for outside
developer.

Attached are files which I am using (including updated uclibc patch).
Please reply with information how I can get it fully merged.


--------------090904030003080209050002
Content-Type: text/plain; charset=UTF-8;
 name="gnu-config_git.bbappend"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="gnu-config_git.bbappend"

TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vY29uZmlnLmd1ZXNzO2VuZGxpbmU9Mzk7bWQ1PWI3
OWE0NjYzNDc1ZjRkNzI0ODQ2NDYzMjc3ODE3ZTBkIgoKU1JDUkVWID0gIjA2MjU4N2VhYTg5MTM5
NmM5MzY1NTVhZTUxZjdlNzdlZWI3MWE1ZmUiClBWID0gIjIwMTIwODE0K2dpdCR7U1JDUFZ9IgpQ
UiA9ICJyMCIKClNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnN2LmdudS5vcmcvY29uZmlnLmdpdDtwcm90
b2NvbD1naXQgXAogICAgICAgICAgIGZpbGU6Ly9jb25maWctZ3Vlc3MtdWNsaWJjLnBhdGNoIFwK
ICAgICAgICAgICBmaWxlOi8vZ251LWNvbmZpZ2l6ZS5pbiIKCkRFRkFVTFRfUFJFRkVSRU5DRSA9
ICIxIgpGSUxFU0VYVFJBUEFUSFNfcHJlcGVuZCA6PSAiJHtUSElTRElSfS8ke0JQTn06Igo=

--------------090904030003080209050002
Content-Type: text/x-patch;
 name="config-guess-uclibc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config-guess-uclibc.patch"

Upstream-Status: Pending

Patch courtesy gentoo-portage/sys-devel/gnuconfig/files/automake-1.8.5-config-guess-uclibc.patch.

updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
updated to 20080123 by Nitin A Kamble (by hand)
updated to 20111001 by Saul Wold (by hand)
updated to 20120818 by Marcin 'Hrw' Juszkiewicz (by hand)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

---
 config.guess |   67 +++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 27 deletions(-)

--- git.orig/config.guess
+++ git/config.guess
@@ -138,6 +138,19 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` |
 UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
 UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
 
+# Detect uclibc systems.
+
+LIBC="gnu"
+if [ -f /usr/include/bits/uClibc_config.h ]
+then
+	LIBC=uclibc
+	if [ -n `grep "#define __UCLIBC_CONFIG_VERSION__" /usr/include/bits/uClibc_config.h` ]
+	then
+		UCLIBC_SUBVER=`sed -n "/#define __UCLIBC_CONFIG_VERSION__ /s///p" /usr/include/bits/uClibc_config.h`
+		LIBC=$LIBC$UCLIBC_SUBVER
+	fi
+fi
+
 # Note: order is significant - the case branches are not exclusive.
 
 case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
@@ -886,15 +899,15 @@ EOF
 	  EV68*) UNAME_MACHINE=alphaev68 ;;
 	esac
 	objdump --private-headers /bin/sh | grep -q ld.so.1
-	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
-	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
+	if test "$?" = 0 ; then LIBC="gnulibc1" ; else LIBC="" ; fi
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     arm*:Linux:*:*)
 	eval $set_cc_for_build
 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
 	    | grep -q __ARM_EABI__
 	then
-	    echo ${UNAME_MACHINE}-unknown-linux-gnu
+	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	else
 	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
 		| grep -q __ARM_PCS_VFP
@@ -906,19 +919,19 @@ EOF
 	fi
 	exit ;;
     avr32*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     cris:Linux:*:*)
-	echo ${UNAME_MACHINE}-axis-linux-gnu
+	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
 	exit ;;
     crisv32:Linux:*:*)
-	echo ${UNAME_MACHINE}-axis-linux-gnu
+	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
 	exit ;;
     frv:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     hexagon:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     i*86:Linux:*:*)
 	LIBC=gnu
@@ -932,13 +945,13 @@ EOF
 	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
 	exit ;;
     ia64:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     m32r*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     m68*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     mips:Linux:*:* | mips64:Linux:*:*)
 	eval $set_cc_for_build
@@ -957,54 +970,54 @@ EOF
 	#endif
 EOF
 	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
-	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
+	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
 	;;
     or32:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     padre:Linux:*:*)
-	echo sparc-unknown-linux-gnu
+	echo sparc-unknown-linux-${LIBC}
 	exit ;;
     parisc64:Linux:*:* | hppa64:Linux:*:*)
-	echo hppa64-unknown-linux-gnu
+	echo hppa64-unknown-linux-${LIBC}
 	exit ;;
     parisc:Linux:*:* | hppa:Linux:*:*)
 	# Look for CPU level
 	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
-	  PA7*) echo hppa1.1-unknown-linux-gnu ;;
-	  PA8*) echo hppa2.0-unknown-linux-gnu ;;
-	  *)    echo hppa-unknown-linux-gnu ;;
+	  PA7*) echo hppa1.1-unknown-linux-${LIBC} ;;
+	  PA8*) echo hppa2.0-unknown-linux-${LIBC} ;;
+	  *)    echo hppa-unknown-linux-${LIBC} ;;
 	esac
 	exit ;;
     ppc64:Linux:*:*)
-	echo powerpc64-unknown-linux-gnu
+	echo powerpc64-unknown-linux-${LIBC}
 	exit ;;
     ppc:Linux:*:*)
-	echo powerpc-unknown-linux-gnu
+	echo powerpc-unknown-linux-${LIBC}
 	exit ;;
     s390:Linux:*:* | s390x:Linux:*:*)
 	echo ${UNAME_MACHINE}-ibm-linux
 	exit ;;
     sh64*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     sh*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     sparc:Linux:*:* | sparc64:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     tile*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     vax:Linux:*:*)
-	echo ${UNAME_MACHINE}-dec-linux-gnu
+	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
 	exit ;;
     x86_64:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     xtensa*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     i*86:DYNIX/ptx:4*:*)
 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.


--------------090904030003080209050002--
