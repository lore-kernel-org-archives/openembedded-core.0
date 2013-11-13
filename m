Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 257886D614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:22:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 06:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,692,1378882800"; d="scan'208";a="426915618"
Received: from cvoicu-vostro-460.rb.intel.com (HELO [10.237.105.65])
	([10.237.105.65])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:22:26 -0800
Message-ID: <52838C67.8020104@intel.com>
Date: Wed, 13 Nov 2013 16:27:51 +0200
From: "cristiana.voicu" <cristiana.voicu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, Marius Avram <marius.avram@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1382529581-31463-1-git-send-email-marius.avram@intel.com>
	<527454BF.8000307@linux.intel.com>
In-Reply-To: <527454BF.8000307@linux.intel.com>
Subject: Re: [PATCH 1/2] apt: Upgrade from 0.9.9.4 to 0.9.11.4
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
X-List-Received-Date: Wed, 13 Nov 2013 14:22:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2013 03:26 AM, Saul Wold wrote:
> On 10/23/2013 04:59 AM, Marius Avram wrote:
>> - no-ko-translation.patch respects new structure of po/LINGUAS file
>> - replaces configure.in to configure.ac inside multiple patches
>> - adds libapt-private installation
>>
>
> Seems they have moved to 0.9.12.1 already, and the 0.9.11.4 tarball is 
> gone.
>
> Sau!
On http://packages.qa.debian.org/a/apt.html, it says that the last 
stable version is 0.9.7.9. Do I have to upload to this one or to 0.9.12.1?
Thanks,
Cristiana

>
>> Signed-off-by: Marius Avram <marius.avram@intel.com>
>> ---
>>   .../disable-configure-in-makefile.patch            |    0
>>   .../fix-gcc-4.6-null-not-defined.patch             |    0
>>   .../{apt-0.9.9.4 => apt-0.9.11.4}/makerace.patch   |    0
>>   .../no-ko-translation.patch                        |   19 +++++++---
>>   .../no-nls-dpkg.patch                              |    0
>>   .../noconfigure.patch                              |    0
>>   .../apt/{apt-0.9.9.4 => apt-0.9.11.4}/nodoc.patch  |    0
>>   .../truncate-filename.patch                        |    0
>>   .../{apt-0.9.9.4 => apt-0.9.11.4}/use-host.patch   |    6 +--
>>   meta/recipes-devtools/apt/apt-native.inc           |    3 +-
>>   ...pt-native_0.9.9.4.bb => apt-native_0.9.11.4.bb} |    4 +-
>>   meta/recipes-devtools/apt/apt-package.inc          |    1 +
>>   .../apt/{apt_0.9.9.4.bb => apt_0.9.11.4.bb}        |    4 +-
>>   .../apt/files/db_linking_hack.patch                |   11 +++---
>>   meta/recipes-devtools/apt/files/no-curl.patch      |   39 
>> +++++++++++---------
>>   15 files changed, 51 insertions(+), 36 deletions(-)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/disable-configure-in-makefile.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/fix-gcc-4.6-null-not-defined.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/makerace.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/no-ko-translation.patch (32%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/no-nls-dpkg.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/noconfigure.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/nodoc.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/truncate-filename.patch (100%)
>>   rename meta/recipes-devtools/apt/{apt-0.9.9.4 => 
>> apt-0.9.11.4}/use-host.patch (84%)
>>   rename meta/recipes-devtools/apt/{apt-native_0.9.9.4.bb => 
>> apt-native_0.9.11.4.bb} (55%)
>>   rename meta/recipes-devtools/apt/{apt_0.9.9.4.bb => 
>> apt_0.9.11.4.bb} (74%)
>>
>> diff --git 
>> a/meta/recipes-devtools/apt/apt-0.9.9.4/disable-configure-in-makefile.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/disable-configure-in-makefile.patch 
>>
>> similarity index 100%
>> rename from 
>> meta/recipes-devtools/apt/apt-0.9.9.4/disable-configure-in-makefile.patch
>> rename to 
>> meta/recipes-devtools/apt/apt-0.9.11.4/disable-configure-in-makefile.patch
>> diff --git 
>> a/meta/recipes-devtools/apt/apt-0.9.9.4/fix-gcc-4.6-null-not-defined.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/fix-gcc-4.6-null-not-defined.patch 
>>
>> similarity index 100%
>> rename from 
>> meta/recipes-devtools/apt/apt-0.9.9.4/fix-gcc-4.6-null-not-defined.patch
>> rename to 
>> meta/recipes-devtools/apt/apt-0.9.11.4/fix-gcc-4.6-null-not-defined.patch
>> diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/makerace.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/makerace.patch
>> diff --git 
>> a/meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/no-ko-translation.patch
>> similarity index 32%
>> rename from 
>> meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/no-ko-translation.patch
>> index 7aa408f..b600e2b 100644
>> --- a/meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
>> +++ b/meta/recipes-devtools/apt/apt-0.9.11.4/no-ko-translation.patch
>> @@ -4,8 +4,17 @@ Upstream-Status: Inappropriate [configuration]
>>    po/LINGUAS |    2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> ---- a/po/LINGUAS
>> -+++ b/po/LINGUAS
>> -@@ -1 +1 @@
>> --ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ko ku 
>> lt mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
>> -+ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ku lt 
>> mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
>> +Index: apt-0.9.11.4/po/LINGUAS
>> +===================================================================
>> +--- apt-0.9.11.4.orig/po/LINGUAS
>> ++++ apt-0.9.11.4/po/LINGUAS
>> +@@ -1,7 +1,8 @@
>> + ## If a language isn't listed here but a po file is available the 
>> build will fail.
>> + ## If a language is disabled deliberately, list it in a line 
>> starting with a single '#'
>> +
>> +-ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ko ku 
>> lt mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl tr uk vi zh_CN zh_TW
>> ++ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ku lt 
>> mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl tr uk vi zh_CN zh_TW
>> +
>> + ## disabled by translator request #313283:
>> + # he
>> ++# ko
>> diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/no-nls-dpkg.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/no-nls-dpkg.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/apt/apt-0.9.9.4/no-nls-dpkg.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/no-nls-dpkg.patch
>> diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/noconfigure.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/noconfigure.patch
>> diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/nodoc.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/nodoc.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/apt/apt-0.9.9.4/nodoc.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/nodoc.patch
>> diff --git 
>> a/meta/recipes-devtools/apt/apt-0.9.9.4/truncate-filename.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/truncate-filename.patch
>> similarity index 100%
>> rename from 
>> meta/recipes-devtools/apt/apt-0.9.9.4/truncate-filename.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/truncate-filename.patch
>> diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch 
>> b/meta/recipes-devtools/apt/apt-0.9.11.4/use-host.patch
>> similarity index 84%
>> rename from meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch
>> rename to meta/recipes-devtools/apt/apt-0.9.11.4/use-host.patch
>> index 25caa3b..7a8e702 100644
>> --- a/meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch
>> +++ b/meta/recipes-devtools/apt/apt-0.9.11.4/use-host.patch
>> @@ -1,9 +1,9 @@
>>   Upstream-Status: Pending
>>
>> -Index: apt-0.9.7.7/configure.in
>> +Index: apt-0.9.7.7/configure.ic
>> ===================================================================
>> ---- apt-0.9.7.7.orig/configure.in
>> -+++ apt-0.9.7.7/configure.in
>> +--- apt-0.9.7.7.orig/configure.ac
>> ++++ apt-0.9.7.7/configure.ac
>>   @@ -112,7 +112,7 @@ dnl This is often the dpkg architecture
>>    dnl First check against the full canonical canoncial-system-type 
>> in $target
>>    dnl and if that fails, just look for the cpu
>> diff --git a/meta/recipes-devtools/apt/apt-native.inc 
>> b/meta/recipes-devtools/apt/apt-native.inc
>> index 294ca94..77d4cc0 100644
>> --- a/meta/recipes-devtools/apt/apt-native.inc
>> +++ b/meta/recipes-devtools/apt/apt-native.inc
>> @@ -46,6 +46,7 @@ do_install_base () {
>>       ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so 
>> ${D}${libdir}/libapt-pkg.so
>>       oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER 
>> ${D}${libdir}/
>>       ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so 
>> ${D}${libdir}/libapt-inst.so
>> +    oe_libinstall -so -C bin libapt-private ${D}${libdir}
>>
>>       install -d ${D}${libdir}/apt/methods
>>       install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
>> @@ -55,7 +56,7 @@ do_install_base () {
>>       install -m 0644 ${S}/dselect/names ${D}${libdir}/dpkg/methods/apt/
>>       install -m 0755 ${S}/dselect/install 
>> ${D}${libdir}/dpkg/methods/apt/
>>       install -m 0755 ${S}/dselect/setup ${D}${libdir}/dpkg/methods/apt/
>> -    install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/
>> +    install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/
>>
>>       install -d ${D}${sysconfdir}/apt
>>       install -d ${D}${sysconfdir}/apt/apt.conf.d
>> diff --git a/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb 
>> b/meta/recipes-devtools/apt/apt-native_0.9.11.4.bb
>> similarity index 55%
>> rename from meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
>> rename to meta/recipes-devtools/apt/apt-native_0.9.11.4.bb
>> index d5934f9..11fdf49 100644
>> --- a/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
>> +++ b/meta/recipes-devtools/apt/apt-native_0.9.11.4.bb
>> @@ -3,7 +3,7 @@ require apt-native.inc
>>   SRC_URI += "file://noconfigure.patch \
>>               file://no-curl.patch"
>>
>> -SRC_URI[md5sum] = "72b3283acd9b99868da5545f0499b0da"
>> -SRC_URI[sha256sum] = 
>> "770cb94d7f4c922c2a1516f2b5ec852d3ad668a8c9c3713ac2528c861b7fa79a"
>> +SRC_URI[md5sum] = "1f8dfacfd7ce4a68ed1fdfa4fa73e628"
>> +SRC_URI[sha256sum] = 
>> "f466b00f277f010b32028dbcd81ad5525a5b8ee72b4fdd4b85023e8eae2201fc"
>>
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> diff --git a/meta/recipes-devtools/apt/apt-package.inc 
>> b/meta/recipes-devtools/apt/apt-package.inc
>> index 0897d3a..e812805 100644
>> --- a/meta/recipes-devtools/apt/apt-package.inc
>> +++ b/meta/recipes-devtools/apt/apt-package.inc
>> @@ -52,6 +52,7 @@ do_install () {
>>
>>       oe_libinstall -so -C bin libapt-pkg ${D}${libdir}
>>       oe_libinstall -so -C bin libapt-inst ${D}${libdir}
>> +    oe_libinstall -so -C bin libapt-private ${D}${libdir}
>>
>>       install -d ${D}${libdir}/apt/methods
>>       install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
>> diff --git a/meta/recipes-devtools/apt/apt_0.9.9.4.bb 
>> b/meta/recipes-devtools/apt/apt_0.9.11.4.bb
>> similarity index 74%
>> rename from meta/recipes-devtools/apt/apt_0.9.9.4.bb
>> rename to meta/recipes-devtools/apt/apt_0.9.11.4.bb
>> index ae9ed6c..c2547be 100644
>> --- a/meta/recipes-devtools/apt/apt_0.9.9.4.bb
>> +++ b/meta/recipes-devtools/apt/apt_0.9.11.4.bb
>> @@ -3,8 +3,8 @@ RDEPENDS_${PN} = "dpkg"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>   require apt.inc
>>
>> -SRC_URI[md5sum] = "72b3283acd9b99868da5545f0499b0da"
>> -SRC_URI[sha256sum] = 
>> "770cb94d7f4c922c2a1516f2b5ec852d3ad668a8c9c3713ac2528c861b7fa79a"
>> +SRC_URI[md5sum] = "1f8dfacfd7ce4a68ed1fdfa4fa73e628"
>> +SRC_URI[sha256sum] = 
>> "f466b00f277f010b32028dbcd81ad5525a5b8ee72b4fdd4b85023e8eae2201fc"
>>
>>   require apt-package.inc
>>
>> diff --git a/meta/recipes-devtools/apt/files/db_linking_hack.patch 
>> b/meta/recipes-devtools/apt/files/db_linking_hack.patch
>> index d2246b3..de29264 100644
>> --- a/meta/recipes-devtools/apt/files/db_linking_hack.patch
>> +++ b/meta/recipes-devtools/apt/files/db_linking_hack.patch
>> @@ -1,16 +1,15 @@
>>   Upstream-Status: Backport
>>
>> -Index: apt-0.7.3/configure.in
>> +Index: apt-0.9.11.4/configure.ac
>> ===================================================================
>> ---- apt-0.7.3.orig/configure.in    2007-07-01 10:38:45.000000000 +0000
>> -+++ apt-0.7.3/configure.in    2007-08-21 13:39:26.000000000 +0000
>> -@@ -67,8 +67,20 @@
>> +--- apt-0.9.11.4.orig/configure.ac
>> ++++ apt-0.9.11.4/configure.ac
>> +@@ -75,8 +75,19 @@ AC_CHECK_HEADER(db.h,
>>          [AC_DEFINE(HAVE_BDB)
>>           BDBLIB="-ldb"
>>           AC_MSG_RESULT(yes)],
>>   -      [BDBLIB=""
>>   -       AC_MSG_RESULT(no)]
>> -+
>>   +       LIBS="$LIBS -lpthread"
>>   +       [AC_MSG_CHECKING(if we can link against BerkeleyDB with 
>> pthread)
>>   +        AC_LINK_IFELSE(
>> @@ -23,7 +22,7 @@ Index: apt-0.7.3/configure.in
>>   +         AC_MSG_RESULT(yes)],
>>   +        [BDBLIB=""
>>   +         AC_MSG_RESULT(no)]
>> -+      )]
>> ++      )]
>>        )]
>>    )
>>
>> diff --git a/meta/recipes-devtools/apt/files/no-curl.patch 
>> b/meta/recipes-devtools/apt/files/no-curl.patch
>> index 9fd3b3a..686bacd 100644
>> --- a/meta/recipes-devtools/apt/files/no-curl.patch
>> +++ b/meta/recipes-devtools/apt/files/no-curl.patch
>> @@ -5,23 +5,10 @@ Upstream-Status: Inappropriate [configuration]
>>    methods/makefile |    7 -------
>>    2 files changed, 13 deletions(-)
>>
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -86,12 +86,6 @@ AC_CHECK_HEADER(db.h,
>> -
>> - LIBS="$saveLIBS"
>> -
>> --AC_CHECK_LIB(curl, curl_easy_init,
>> --     [AC_CHECK_HEADER(curl/curl.h,
>> --        curl_ok=yes,
>> --        curl_ok=no)],
>> --     AC_MSG_ERROR([failed: I need CURL due https support]),
>> --)
>> -
>> - AC_SUBST(BDBLIB)
>> -
>> ---- a/methods/makefile
>> -+++ b/methods/makefile
>> +Index: apt-0.9.11.4/methods/makefile
>> +===================================================================
>> +--- apt-0.9.11.4.orig/methods/makefile
>> ++++ apt-0.9.11.4/methods/makefile
>>   @@ -51,13 +51,6 @@ LIB_MAKES = apt-pkg/makefile
>>    SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc
>>    include $(PROGRAM_H)
>> @@ -36,3 +23,21 @@ Upstream-Status: Inappropriate [configuration]
>>    # The ftp method
>>    PROGRAM=ftp
>>    SLIBS = -lapt-pkg $(SOCKETLIBS) $(INTLLIBS)
>> +Index: apt-0.9.11.4/configure.ac
>> +===================================================================
>> +--- apt-0.9.11.4.orig/configure.ac
>> ++++ apt-0.9.11.4/configure.ac
>> +@@ -93,13 +93,6 @@ AC_CHECK_HEADER(db.h,
>> +
>> + LIBS="$saveLIBS"
>> +
>> +-AC_CHECK_LIB(curl, curl_easy_init,
>> +-     [AC_CHECK_HEADER(curl/curl.h,
>> +-        curl_ok=yes,
>> +-        curl_ok=no)],
>> +-     AC_MSG_ERROR([failed: I need CURL due https support]),
>> +-)
>> +-
>> + AC_SUBST(BDBLIB)
>> +
>> + HAVE_ZLIB=no
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


