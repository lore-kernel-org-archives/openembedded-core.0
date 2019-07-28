Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 235F87F1E3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 15:06:40 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f17so22717043pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 08:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=0fqHjX7a0Peu8MvHYsS9uoXoASsaQeLkkvDweM6F9BU=;
	b=Fo2AT6tyZ+vz2LKbwwj5MckYWQoNsNVJVQWlNN46WdnTJWYMh6oWZS2kJr8sDqyULl
	AO2IXzRFvBY7PaosssveIOvTGovQCh+zxYsNH3ogT6kSoeXM12BVav4NLtqjDxHLCbZx
	Kdrx2loesVAn7XNhBpDsYX1nGi/jiSZtKPa/KbiyFhKp8AH3JSqRayw8qCTCo1LuZMfy
	QzHD6R/Hv20tvqbDLCJzvsCtMXeY6HuGjzXiRqO14HRFn54WTHjen2xQFulBofxq+qzl
	81IbkES3Sy+4TGdr4topZcAXemQ38QgMTboEGJLbsZBpkg+WqIZUl8VzVQXm/tP0GhEy
	a3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0fqHjX7a0Peu8MvHYsS9uoXoASsaQeLkkvDweM6F9BU=;
	b=rGROGA4mteqThmXTcc9flauOHvN6cYTU0ECASlKgQbnHvjLJx0U5PTc/1EHUm17PK1
	Pg0G8hhE6sn6HiTmbyKP401NmVFs4nR++eodA5oYWc7bnz3Ng2NQDdCeiBDD17iNSeps
	ckm6OYQExNEZ81wYbG7fHOSuYBnxYEp7oXbJxt1SionlC5w94IuzSkZKZIjV//lwK6+y
	gk9DVYd7dl7gq/dzt9D5kfNEWN14jjLF5OdH26SQ2BZ3X5fbjUqinHaQojv6a2wsgEhg
	UbkHp7TmzZr1MjU9Y8oXiE7fVjCiG+ItBMNcfC+gz6TlTk6dDn7gQmrPNfhQsMDUksu0
	Yk0A==
X-Gm-Message-State: APjAAAXJj97lb9Lv3CFmpD3XCx0+xL3YadsDI4kPUrCR0ZJ4WyNuL6lm
	uYwGegS737ZRVcP21eQAFyMGhHf8+ro=
X-Google-Smtp-Source: APXvYqyMpy9nBZN/MWdYTABxUIlLQ6Lgf7kDfHTkebGG3Ty7qmXYro4j1qMdHIXvDs0dlSs+91qfpA==
X-Received: by 2002:a17:90a:cb97:: with SMTP id
	a23mr11549624pju.67.1564326400433; 
	Sun, 28 Jul 2019 08:06:40 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::e5a4? ([2601:646:8500:6bc6::e5a4])
	by smtp.gmail.com with ESMTPSA id a3sm67824896pje.3.2019.07.28.08.06.37
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jul 2019 08:06:39 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1564260566-8134-1-git-send-email-akuster808@gmail.com>
	<ba93630ad71ed6be2e986cea9ea59cb891ba72a8.camel@intel.com>
	<9f416d86-afc5-3305-a79b-e383d109e9aa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <33691372-cb56-0488-870a-10b98252bd85@gmail.com>
Date: Sun, 28 Jul 2019 08:06:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9f416d86-afc5-3305-a79b-e383d109e9aa@gmail.com>
Subject: Re: [PATCH] bind: Update to latest stable, 9.14.
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
X-List-Received-Date: Sun, 28 Jul 2019 15:06:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/28/19 12:08 AM, akuster808 wrote:
>
> On 7/27/19 8:44 PM, Mittal, Anuj wrote:
>> This is causing errors:
>>
>> | Makefile:557: recipe for target 'alloc.lo' failed
>> | make[2]: *** [alloc.lo] Error 1
>> | In file included from ../includes/dhcpd.h:91,
>> |                  from conflex.c:29:
>> | ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No
>> such file or directory
>> |    51 | #include <isc/boolean.h>
>> |       |          ^~~~~~~~~~~~~~~
>> | compilation terminated.
>> | Makefile:557: recipe for target 'dhcp4o6.lo' failed
>> | make[2]: *** [dhcp4o6.lo] Error 1
>> | In file included from ../includes/dhcpd.h:91,
>> |                  from icmp.c:30:
>> | ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No
>> such file or directory
>> |    51 | #include <isc/boolean.h>
>> |       |          ^~~~~~~~~~~~~~~
>> | compilation terminated.
>> | Makefile:557: recipe for target 'dispatch.lo' failed
>> | make[2]: *** [dispatch.lo] Error 1
>> | In file included from ../includes/dhcpd.h:91,
>> |                  from bpf.c:35:
>> | ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No
>> such file or directory
>> |    51 | #include <isc/boolean.h>
>> |       |          ^~~~~~~~~~~~~~~
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/871/steps/8/logs/step1b
> Ah, musl.. ok thanks,


this is basically due to [1]


[1] 
https://gitlab.isc.org/isc-projects/bind9/commit/4c06eb20cc2e11e78412031babebc6273be5dc08


> Armin
>> Thanks,
>>
>> Anuj
>>
>> On Sat, 2019-07-27 at 13:49 -0700, Armin Kuster wrote:
>>> Even releases are stable and supported for 1 year.
>>>
>>> Drop patches no longer needed.
>>> Refresh a few patches.
>>> Removed config options no longed supported.
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>   ...igure.in-remove-useless-L-use_openssl-lib.patch | 32 ------------
>>> ---------
>>>   ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 22 ------------
>>> ---
>>>   .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 31 ------------
>>> --------
>>>   ...lwresd-V-and-start-log-hide-build-options.patch | 33 ++++++++++
>>> ------------
>>>   ...-searching-for-json-headers-searches-sysr.patch | 30 ++++++++++
>>> ----------
>>>   .../bind/{bind_9.11.5-P4.bb => bind_9.14.3.bb}     | 24 ++++++----
>>> ------
>>>   6 files changed, 38 insertions(+), 134 deletions(-)
>>>   delete mode 100644 meta/recipes-connectivity/bind/bind/0001-
>>> configure.in-remove-useless-L-use_openssl-lib.patch
>>>   delete mode 100644 meta/recipes-connectivity/bind/bind/0001-gen.c-
>>> extend-DIRNAMESIZE-from-256-to-512.patch
>>>   delete mode 100644 meta/recipes-connectivity/bind/bind/0001-lib-dns-
>>> gen.c-fix-too-long-error.patch
>>>   rename meta/recipes-connectivity/bind/{bind_9.11.5-P4.bb =>
>>> bind_9.14.3.bb} (83%)
>>>
>>> diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-
>>> remove-useless-L-use_openssl-lib.patch b/meta/recipes-
>>> connectivity/bind/bind/0001-configure.in-remove-useless-L-
>>> use_openssl-lib.patch
>>> deleted file mode 100644
>>> index 871bb2a..0000000
>>> --- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-
>>> useless-L-use_openssl-lib.patch
>>> +++ /dev/null
>>> @@ -1,32 +0,0 @@
>>> -From 950867d9fd3f690e271c8c807b6eed144b2935b2 Mon Sep 17 00:00:00
>>> 2001
>>> -From: Hongxu Jia <hongxu.jia@windriver.com>
>>> -Date: Mon, 27 Aug 2018 15:00:51 +0800
>>> -Subject: [PATCH] configure.in: remove useless `-L$use_openssl/lib'
>>> -
>>> -Since `--with-openssl=${STAGING_DIR_HOST}${prefix}' is used in bind
>>> recipe,
>>> -the `-L$use_openssl/lib' has a hardcoded suffix, removing it is
>>> harmless
>>> -and helpful for clean up host build path in isc-config.sh
>>> -
>>> -Upstream-Status: Inappropriate [oe-core specific]
>>> -
>>> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ----
>>> - configure.in | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/configure.in b/configure.in
>>> -index 54efc55..76ac0eb 100644
>>> ---- a/configure.in
>>> -+++ b/configure.in
>>> -@@ -1691,7 +1691,7 @@ If you don't want OpenSSL, use --without-
>>> openssl])
>>> - 				fi
>>> - 				;;
>>> - 			*)
>>> --				DST_OPENSSL_LIBS="-L$use_openssl/lib
>>> -lcrypto"
>>> -+				DST_OPENSSL_LIBS="-lcrypto"
>>> - 				;;
>>> - 			esac
>>> - 		fi
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-
>>> DIRNAMESIZE-from-256-to-512.patch b/meta/recipes-
>>> connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-
>>> 512.patch
>>> deleted file mode 100644
>>> index a8d601d..0000000
>>> --- a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-
>>> DIRNAMESIZE-from-256-to-512.patch
>>> +++ /dev/null
>>> @@ -1,22 +0,0 @@
>>> -Upstream-Status: Pending
>>> -
>>> -Subject: gen.c: extend DIRNAMESIZE from 256 to 512
>>> -
>>> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ----
>>> - lib/dns/gen.c | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -Index: bind-9.11.3/lib/dns/gen.c
>>> -===================================================================
>>> ---- bind-9.11.3.orig/lib/dns/gen.c
>>> -+++ bind-9.11.3/lib/dns/gen.c
>>> -@@ -130,7 +130,7 @@ static const char copyright[] =
>>> - #define TYPECLASSBUF (TYPECLASSLEN + 1)
>>> - #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
>>> - #define ATTRIBUTESIZE 256
>>> --#define DIRNAMESIZE 256
>>> -+#define DIRNAMESIZE 512
>>> -
>>> - static struct cc {
>>> - 	struct cc *next;
>>> diff --git a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-
>>> fix-too-long-error.patch b/meta/recipes-connectivity/bind/bind/0001-
>>> lib-dns-gen.c-fix-too-long-error.patch
>>> deleted file mode 100644
>>> index 01874a4..0000000
>>> --- a/meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-
>>> long-error.patch
>>> +++ /dev/null
>>> @@ -1,31 +0,0 @@
>>> -From 5bc3167a8b714ec0c4a3f1c7f3b9411296ec0a23 Mon Sep 17 00:00:00
>>> 2001
>>> -From: Robert Yang <liezhi.yang@windriver.com>
>>> -Date: Wed, 16 Sep 2015 20:23:47 -0700
>>> -Subject: [PATCH] lib/dns/gen.c: fix too long error
>>> -
>>> -The 512 is a little short when build in deep dir, and cause "too
>>> long"
>>> -error, use PATH_MAX if defined.
>>> -
>>> -Upstream-Status: Pending
>>> -
>>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ----
>>> - lib/dns/gen.c |    4 ++++
>>> - 1 file changed, 4 insertions(+)
>>> -
>>> -Index: bind-9.11.3/lib/dns/gen.c
>>> -===================================================================
>>> ---- bind-9.11.3.orig/lib/dns/gen.c
>>> -+++ bind-9.11.3/lib/dns/gen.c
>>> -@@ -130,7 +130,11 @@ static const char copyright[] =
>>> - #define TYPECLASSBUF (TYPECLASSLEN + 1)
>>> - #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
>>> - #define ATTRIBUTESIZE 256
>>> -+#ifdef PATH_MAX
>>> -+#define DIRNAMESIZE PATH_MAX
>>> -+#else
>>> - #define DIRNAMESIZE 512
>>> -+#endif
>>> -
>>> - static struct cc {
>>> - 	struct cc *next;
>>> diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-
>>> and-start-log-hide-build-options.patch b/meta/recipes-
>>> connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-
>>> options.patch
>>> index 75908aa..84894ae 100644
>>> --- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-
>>> start-log-hide-build-options.patch
>>> +++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-
>>> start-log-hide-build-options.patch
>>> @@ -12,23 +12,20 @@ $ named -V
>>>   Upstream-Status: Inappropriate [oe-core specific]
>>>   
>>>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ----
>>> - bin/named/include/named/globals.h | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>>   
>>> -diff --git a/bin/named/include/named/globals.h
>>> b/bin/named/include/named/globals.h
>>> -index ba3457e..7741da7 100644
>>> ---- a/bin/named/include/named/globals.h
>>> -+++ b/bin/named/include/named/globals.h
>>> -@@ -68,7 +68,7 @@ EXTERN const char *		ns_g_version	
>>> 	INIT(VERSION);
>>> - EXTERN const char *		ns_g_product		INIT(PRODUCT)
>>> ;
>>> - EXTERN const char *		ns_g_description	INIT(DESCRIPTION);
>>> - EXTERN const char *		ns_g_srcid		INIT(SRCID);
>>> --EXTERN const char *		ns_g_configargs		INIT(CONFIGAR
>>> GS);
>>> -+EXTERN const char *		ns_g_configargs		INIT("***
>>> (options are hidden)");
>>> - EXTERN const char *		ns_g_builder		INIT(BUILDER)
>>> ;
>>> - EXTERN in_port_t		ns_g_port		INIT(0);
>>> - EXTERN isc_dscp_t		ns_g_dscp		INIT(-1);
>>> ---
>>> -2.7.4
>>> +[Refreshed for 9.14.3]
>>> +Signed-off-by: Armin kuster <akuster808@gmail.com>
>>>   
>>> +Index: bind-9.14.3/bin/named/include/named/globals.h
>>> +===================================================================
>>> +--- bind-9.14.3.orig/bin/named/include/named/globals.h
>>> ++++ bind-9.14.3/bin/named/include/named/globals.h
>>> +@@ -68,7 +68,7 @@ EXTERN const char *		named_g_version
>>> 		IN
>>> + EXTERN const char *		named_g_product		INIT(PRODUCT)
>>> ;
>>> + EXTERN const char *		named_g_description	INIT(DESCRIPT
>>> ION);
>>> + EXTERN const char *		named_g_srcid		INIT(SRCID);
>>> +-EXTERN const char *		named_g_configargs	INIT(CONFIGAR
>>> GS);
>>> ++EXTERN const char *		named_g_configargs	INIT("***
>>> (options are hidden)");
>>> + EXTERN const char *		named_g_builder		INIT(BUILDER)
>>> ;
>>> + EXTERN in_port_t		named_g_port		INIT(0);
>>> + EXTERN isc_dscp_t		named_g_dscp		INIT(-1);
>>> diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-
>>> searching-for-json-headers-searches-sysr.patch b/meta/recipes-
>>> connectivity/bind/bind/bind-ensure-searching-for-json-headers-
>>> searches-sysr.patch
>>> index 37e210e..3999c6a 100644
>>> --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-
>>> json-headers-searches-sysr.patch
>>> +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-
>>> json-headers-searches-sysr.patch
>>> @@ -17,25 +17,25 @@ No currently running tasks (773 of 781)
>>>   Summary: 1 task failed:
>>>     /meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure
>>>   
>>> -One way to fix it would be to unconditionally disable json in bind
>>> -configure[2] but here we fix it by using the path to where we would
>>> -put the header if we had json in the sysroot, in case someone wants
>>> -to make use of the combination some day.
>>> +  One way to fix it would be to unconditionally disable json in bind
>>> +  configure[2] but here we fix it by using the path to where we
>>> would
>>> +  put the header if we had json in the sysroot, in case someone
>>> wants
>>> +  to make use of the combination some day.
>>>   
>>> -[1] https://trac.macports.org/ticket/45305
>>> -[2] https://trac.macports.org/changeset/126406
>>> +  [1] https://trac.macports.org/ticket/45305
>>> +  [2] https://trac.macports.org/changeset/126406
>>>   
>>> -Upstream-Status: Inappropriate [OE Specific]
>>> -Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>> ----
>>> - configure.in | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +  Upstream-Status: Inappropriate [OE Specific]
>>> +  Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>>   
>>> -Index: bind-9.11.3/configure.in
>>> +[Refreshed for 9.14.3
>>> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> +
>>> +Index: bind-9.14.3/configure.ac
>>>   ===================================================================
>>> ---- bind-9.11.3.orig/configure.in
>>> -+++ bind-9.11.3/configure.in
>>> -@@ -2574,7 +2574,7 @@ case "$use_libjson" in
>>> +--- bind-9.14.3.orig/configure.ac
>>> ++++ bind-9.14.3/configure.ac
>>> +@@ -1353,7 +1353,7 @@ case "$use_libjson" in
>>>    		libjson_libs=""
>>>    		;;
>>>    	auto|yes)
>>> diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
>>> b/meta/recipes-connectivity/bind/bind_9.14.3.bb
>>> similarity index 83%
>>> rename from meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
>>> rename to meta/recipes-connectivity/bind/bind_9.14.3.bb
>>> index 1355841..2cffe0f 100644
>>> --- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
>>> +++ b/meta/recipes-connectivity/bind/bind_9.14.3.bb
>>> @@ -14,22 +14,18 @@ SRC_URI = "
>>> https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>>>              file://generate-rndc-key.sh \
>>>              file://make-etc-initd-bind-stop-work.patch \
>>>              file://init.d-add-support-for-read-only-rootfs.patch \
>>> +           file://0001-avoid-start-failure-with-bind-user.patch \
>>>              file://bind-ensure-searching-for-json-headers-searches-
>>> sysr.patch \
>>> -           file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-
>>> 512.patch \
>>> -           file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>>> -           file://0001-configure.in-remove-useless-L-use_openssl-
>>> lib.patch \
>>>              file://0001-named-lwresd-V-and-start-log-hide-build-
>>> options.patch \
>>> -           file://0001-avoid-start-failure-with-bind-user.patch \
>>>   "
>>>   
>>> -SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
>>> -SRC_URI[sha256sum] =
>>> "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
>>> +SRC_URI[md5sum] = "61f30afc2108cdc230e08f51466fe2f4"
>>> +SRC_URI[sha256sum] =
>>> "ce878aabcf01b61ed114522c32fff9e268b02da55b3c248349860bc3d0c8bdfa"
>>>   
>>>   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>>> -UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>>> -RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
>>> +RECIPE_NO_UPDATE_REASON = "even are stable"
>>>   
>>> -inherit autotools update-rc.d systemd useradd pkgconfig
>>> multilib_script
>>> +inherit autotools update-rc.d systemd useradd pkgconfig
>>> multilib_script upstream-version-is-even
>>>   
>>>   MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config
>>> ${PN}:${bindir}/isc-config.sh"
>>>   
>>> @@ -38,14 +34,10 @@ PACKAGECONFIG ?= "readline"
>>>   PACKAGECONFIG[httpstats] = "--with-
>>> libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
>>>   PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>>>   PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>>> -PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-
>>> randomdev=/dev/random,,"
>>>   PACKAGECONFIG[python3] = "--with-python=${PYTHON} --with-python-
>>> install-dir=${D}/${PYTHON_SITEPACKAGES_DIR} , --without-python,
>>> python3-ply-native,"
>>>   
>>> -ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES',
>>> 'ipv6', 'yes', 'no', d)}"
>>> -EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>>> -                 --disable-devpoll --enable-epoll --with-gost=no \
>>> -                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \
>>> -                 --with-lmdb=no \
>>> +EXTRA_OECONF = " --with-libtool --disable-devpoll --enable-epoll \
>>> +                 --with-gssapi=no --with-lmdb=no \
>>>                    --sysconfdir=${sysconfdir}/bind \
>>>                    --with-openssl=${STAGING_DIR_HOST}${prefix} \
>>>                  "
>>> @@ -126,7 +118,7 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
>>>   FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
>>>   
>>>   PACKAGE_BEFORE_PN += "${PN}-libs"
>>> -FILES_${PN}-libs = "${libdir}/*.so*"
>>> +FILES_${PN}-libs = "${libdir}/*.so* ${libdir}/named/*.so"
>>>   FILES_${PN}-staticdev += "${libdir}/*.la"
>>>   
>>>   PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG',
>>> 'python3', 'python3-bind', '', d)}"
>>> -- 
>>> 2.7.4
>>>

