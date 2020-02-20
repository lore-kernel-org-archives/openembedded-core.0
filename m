Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E429761608
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:07:12 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so2200600pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 09:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vCLKUKB8aFWxjbTqUGGPvrnao7Uo6bbFfHvOy6TYc2E=;
	b=ClIyS2Z05fwxef5vb3slY9V6K7EShhcdeWoLXwAq5YBVNuj2kapVMkwmCpn8oL3BvT
	YG8A7CtSeB5q62hYLGq8Jyr7QsX6bQJrzsqagNipJre3YNSIKfu0g02hRsshB0mSgjyK
	o01aFtXPULsbjaL1UE7dSKVBc7T98315WKgBeZJy/BLBV9YLC+dgKaSrtgxvPnNjDvMY
	JnavkaL7IlXhudvaE64dj4UEzjmv6OWtx9C70J7yZL3szEHhxs2sS9w/hvZyZ1AF87zv
	ozD/1Od/+H2SbHrEoL2OdT/8blSbWohTYCSw4ycOCITfY/wPc7rPrhWdWW8xFtiLC81j
	HeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vCLKUKB8aFWxjbTqUGGPvrnao7Uo6bbFfHvOy6TYc2E=;
	b=F1sDFA3hidOsCkgR+dhza0HAZQfEisD6c8AXBBDm5yt3P0rMbCCUXPlMZhoepwz7gc
	UAaqR9PvuQ3/YPWLlU7vKuBX+rt4slBa+pgDVX/2oYVN0/ivdJIqCSCCU5IBj22SYaB3
	grRzILny220Ry1Rngr/0Folv97V00gez86swX/IrDbKCX/oZf0gvKQ7wmRxA/IEFJ7nB
	ZbFW8v0iajTh86FQVhuxsIdpx9vfcpShPRmZ4gerbRBG5N6rBLtfRTTlsix5bu51nxfY
	8U2IKxt6quV9pnS/PY5OVmrwfIyHyaBLcpBMjvTih/O352/IEmqKAELwGPr4kVFZdUDt
	CvNg==
X-Gm-Message-State: APjAAAVV9lAfM1QNLFbhvfp/0rdBRpM3b0NmjrL5SxVqV4ja1yDsgxa2
	09zpA7zonk2oTm+Ys1QI9FE=
X-Google-Smtp-Source: APXvYqxgLDFevSbH7lmrCi6qh07KTBZpZ4sJZKzA8tpgG3LcaTVI9fBn82lZFErlknVFz+ui3ENyog==
X-Received: by 2002:aa7:94b0:: with SMTP id a16mr32942105pfl.35.1582218433673; 
	Thu, 20 Feb 2020 09:07:13 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:94fc:1e40:9cc4:7d04?
	([2601:646:9200:4e0:94fc:1e40:9cc4:7d04])
	by smtp.gmail.com with ESMTPSA id 26sm33394pjk.3.2020.02.20.09.07.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 20 Feb 2020 09:07:12 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200219224239.3662791-1-raj.khem@gmail.com>
	<ef62cf8da954430991546afa3e3b3840@XBOX03.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8cd75706-4e07-0838-1f5e-5e47f0f4ef07@gmail.com>
Date: Thu, 20 Feb 2020 09:07:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ef62cf8da954430991546afa3e3b3840@XBOX03.axis.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: Re: [PATCH v3] binutils: Upgrade to 2.34 release
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
X-List-Received-Date: Thu, 20 Feb 2020 17:07:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/20/20 12:07 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: den 19 februari 2020 23:43
>> To: openembedded-core@lists.openembedded.org
>> Cc: Christopher Clark <christopher.clark6@baesystems.com>
>> Subject: [OE-core] [PATCH v3] binutils: Upgrade to 2.34 release
>>
>> Details of changelog [1]
>>
>> Removing bfd/ld patch to ebale pe targets instead use
> 
> Change "ebale" to "enable".
> 

Will be in v4

>> specific emulations via --enable-targets for x86_64
>>
>> Re-arrange/forward-port patches and upgrade libctf configure to libtool
>> 2.4 patch
>>
>> rpaths are no longer emitted into elfedit/readelf therefore no need of
>> chrpath anymore
>>
>> Instead of pre-generating configure scripts and house them in libtool
>> patch, generate them during configure. This also ensures that we do not
>> patch configure directly but rather the sources which generate it
>>
>> Package newly added libctf library
>>
>> [1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00000.html
>>
>> Signed-off-by: Khem Raj <mailto:raj.khem@gmail.com>
>> Cc: Christopher Clark <mailto:christopher.clark6@baesystems.com>
>> ---
>> v2: Fix libtool patch and drop EFI patch for configure option
>> v3: Make libtool patch not generate configure, fix packaging
> 
> [cut]
> 
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index a4b9aa586d..b070d85e15 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -13,17 +13,12 @@ LICENSE = "GPLv3"
>>
>>   DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
>>
>> -#
>> -# we need chrpath > 0.14 and some distros like centos 7 still have older chrpath
>> -#
>> -DEPENDS_append_class-target = " chrpath-replacement-native"
>> -EXTRANATIVEPATH_append_class-target = " chrpath-native"
>> -
>>   inherit autotools gettext multilib_header texinfo
>>
>>   FILES_${PN} = " \
>>   	${bindir}/${TARGET_PREFIX}* \
>> -	${libdir}/lib*-*.so \
>> +	${libdir}/lib*.so.* \
>> +	${libdir}/lib*-${PV}*.so \
>>   	${prefix}/${TARGET_SYS}/bin/* \
>>           ${bindir}/embedspu"
>>
>> @@ -33,6 +28,8 @@ FILES_${PN}-dev = " \
>>   	${includedir} \
>>   	${libdir}/*.la \
>>   	${libdir}/libbfd.so \
>> +	${libdir}/libctf.so \
>> +	${libdir}/libctf-nobfd.so \
>>   	${libdir}/libopcodes.so"
>>
>>   # Rather than duplicating multiple entries for these, make one
>> @@ -80,6 +77,8 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>>                   ${LDGOLD} \
>>                   mailto:${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
>>
>> +EXTRA_OECONF_append_x86-64 = " --enable-targets=x86_64-pe,x86_64-pep "
>> +
>>   LDGOLD_class-native = ""
>>   LDGOLD_class-crosssdk = ""
>>   LDGOLD ?= "mailto:${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
>> @@ -112,7 +111,14 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
>>   MULTIARCH := "mailto:${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
>>   do_configure[vardeps] += "MULTIARCH"
>>   do_configure () {
>> -	(cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
>> +	(for d in . bfd binutils gas gold gprof ld libctf opcodes; do
>> +            cd ${S}/$d
>> +            autoconf
>> +            rm -rf autom4te.cache
>> +        done
>> +        cd ${S}
>> +        gnu-configize)
>> +
> 
> Correct the indentation to use tabs.
> 

in v4

> There are also some patches below that still modify configure, which
> shouldn't be needed with the introduction of autoconf above.
> 

thats intentional. Ideally all patches should modify configure since 
that will be needed if they are upstreamed. However, libtool 2.4 is 
quite intrusive where it has to be regenerated almost everytime it is 
rebased on top of latest binutils.

>>   	oe_runconf
>>   #
>>   # must prime config.cache to ensure the build of libiberty
>> @@ -123,10 +129,6 @@ do_configure () {
>>   	done
>>   }
>>
>> -do_compile_append_class-target() {
>> -	chrpath -d ${B}/binutils/elfedit
>> -	chrpath -d ${B}/binutils/readelf
>> -}
>>   do_install () {
>>   	autotools_do_install
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
>> index 3a9461bf4a..a36c259711 100644
>> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
>> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
>> @@ -1,7 +1,7 @@
>> -From c9aed4cb3c02715b2ba1fc70949043849f202f46 Mon Sep 17 00:00:00 2001
>> +From 9caa0964b6f50411d1b4520a31461cd0a87810fd Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <mailto:raj.khem@gmail.com>
>> -Date: Sun, 8 Dec 2019 00:31:35 -0800
>> -Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
>> +Date: Mon, 2 Mar 2015 01:58:54 +0000
>> +Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
>>
>>   This patch will modify the ELF linker scripts so that the crosssdk
>>   linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
> 
> [cut]
> 
>> @@ -57,3 +57,6 @@ index f9f0f7d402..9e469dca86 100644
>>    fi
>>    if test -z "$PLT"; then
>>      IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
>> +--
>> +2.25.1
>> +
> 
> May I suggest that you continue to use --no-signature and --no-numbered as
> options to git format-patch to avoid unnecessary changes to the patches?
> 

I guess yes will be in v4

>   [cut]
> 
>> diff --git a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
>> new file mode 100644
>> index 0000000000..82906026a9
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
>> @@ -0,0 +1,7118 @@
>> +From c0ec70962bffb56b563475f539e8175ea97d7eb1 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 14 Feb 2016 17:04:07 +0000
>> +Subject: [PATCH 07/15] Use libtool 2.4
>> +
>> +get libtool sysroot support
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + bfd/configure.ac |    2 +-
>> + libtool.m4       | 1080 +++++++++++------
>> + ltmain.sh        | 2925 +++++++++++++++++++++++++++++++---------------
>> + ltoptions.m4     |    2 +-
>> + ltversion.m4     |   12 +-
>> + lt~obsolete.m4   |    2 +-
> 
> Wouldn't it be better to run automake --add-missing --copy instead
> (or autoreconf)? That way you would get rid of all the patches to
> Makefile.in as well.

As said above, we only want to regenerate configure, nothing else, there 
are different versions of gettext etc would be needed to fully 
reconfigure it and its version specific.

> 
>> + 6 files changed, 2717 insertions(+), 1306 deletions(-)
>> +
> 
> [cut]
> 
> //Peter
> 

