Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RW99o-00042b-9w
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:06:46 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id D3702143C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 17:00:02 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-AV: E=Sophos;i="4.71,279,1320620400"; 
	d="3390'?txt'?scan'208";a="225561647"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.235]) ([83.227.56.19])
	by ipb2.telenor.se with ESMTP; 01 Dec 2011 16:59:42 +0100
Message-ID: <4ED7A46E.2030603@emagii.com>
Date: Thu, 01 Dec 2011 16:59:42 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EC24711.2010805@eukrea.com>
	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
	<1322743693.17484.120.camel@ted>
	<CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>
In-Reply-To: <CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 01 Dec 2011 16:06:46 -0000
X-Groupsio-MsgNum: 13454
Content-Type: multipart/mixed; boundary="------------080004000302050607040803"

--------------080004000302050607040803
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-12-01 15:12, Cliff Brake skrev:
> On Thu, Dec 1, 2011 at 7:48 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>
>> When you restart the build is the problem persistent or does it work the
>> second time?
> I set BB_NUMBER_THREADS  = "2" (was 4 when failing)
>
> I tried to restart the build and cleanall just the failing package,
> and it still failed.  I then ran:
>
> bitbake -c cleanall gcc-cross gcc-cross-initial gcc-cross-intermediate
> gcc-runtime
>
> and after that, everything worked.
>
>> Does someone have a complete console log for a build that failed with
>> this they could share?
> I'll restart the build and collect one.  So you just want the output
> of the console for bitbake?
>
> Thanks,
> Cliff
>
Here is my buildlog, creating the failure.
The C++ compiler cannot find "string", even though it is in 
"<sysroot>/usr/include/c++"

BB_NUMBER_THREADS  = "24"
PARALLEL_MAKE = "-j24"

Fun to see bitbake run through the first 1000 tasks of "console-image" 
in ~2 minutes.
Pity it slows down...

-- 
Best Regards
Ulf Samuelsson
eMagii


--------------080004000302050607040803
Content-Type: text/plain;
 name="buildlog.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="buildlog.txt"

meta-jasperforest 
meta-n450         = "master:68c6b19d623b34a504090ad2c706859ecc946256"
meta              = "master:2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 1 of 63 (ID: 11, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_fetch)
NOTE: Running task 2 of 63 (ID: 53, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_fetch)
NOTE: Running task 3 of 63 (ID: 60, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_fetch)
NOTE: Running task 4 of 63 (ID: 32, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_fetch)
NOTE: Running task 5 of 63 (ID: 39, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_fetch)
NOTE: Running task 6 of 63 (ID: 46, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_fetch)
NOTE: Running task 7 of 63 (ID: 25, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_fetch)
NOTE: Running task 8 of 63 (ID: 18, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_fetch)
NOTE: Running task 9 of 63 (ID: 4, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_fetch)
NOTE: package libtool-native-2.4-r4: task do_fetch: Started
NOTE: package quilt-native-0.48-r0: task do_fetch: Started
NOTE: package quilt-native-0.48-r0: task do_fetch: Succeeded
NOTE: package gnu-config-native-20111111-r0: task do_fetch: Started
NOTE: package m4-native-1.4.16-r0: task do_fetch: Started
NOTE: package m4-native-1.4.16-r0: task do_fetch: Succeeded
NOTE: package libtool-native-2.4-r4: task do_fetch: Succeeded
NOTE: Running task 10 of 63 (ID: 7, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_unpack)
NOTE: package gnu-config-native-20111111-r0: task do_fetch: Succeeded
NOTE: package pseudo-native-1.2-r3: task do_fetch: Started
NOTE: Running task 11 of 63 (ID: 49, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_unpack)
NOTE: Running task 12 of 63 (ID: 56, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_unpack)
NOTE: package pseudo-native-1.2-r3: task do_fetch: Succeeded
NOTE: Running task 13 of 63 (ID: 42, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_unpack)
NOTE: Running task 14 of 63 (ID: 0, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_unpack)
NOTE: package autoconf-native-2.68-r3: task do_fetch: Started
NOTE: package autoconf-native-2.68-r3: task do_fetch: Succeeded
NOTE: package automake-native-1.11.1-r4: task do_fetch: Started
NOTE: package automake-native-1.11.1-r4: task do_fetch: Succeeded
NOTE: package pkgconfig-native-0.25-r2: task do_fetch: Started
NOTE: package pkgconfig-native-0.25-r2: task do_fetch: Succeeded
NOTE: package sqlite3-native-3.7.7.1-r1: task do_fetch: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_fetch: Succeeded
NOTE: Running task 15 of 63 (ID: 28, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_unpack)
NOTE: Running task 16 of 63 (ID: 35, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_unpack)
NOTE: Running task 17 of 63 (ID: 21, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_unpack)
NOTE: Running task 18 of 63 (ID: 14, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_unpack)
NOTE: package quilt-native-0.48-r0: task do_unpack: Started
NOTE: package quilt-native-0.48-r0: task do_unpack: Succeeded
NOTE: package gnu-config-native-20111111-r0: task do_unpack: Started
NOTE: package m4-native-1.4.16-r0: task do_unpack: Started
NOTE: package libtool-native-2.4-r4: task do_unpack: Started
NOTE: Running task 19 of 63 (ID: 8, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_patch)
NOTE: package gnu-config-native-20111111-r0: task do_unpack: Succeeded
NOTE: package m4-native-1.4.16-r0: task do_unpack: Succeeded
NOTE: package pseudo-native-1.2-r3: task do_unpack: Started
NOTE: package libtool-native-2.4-r4: task do_unpack: Succeeded
NOTE: package pseudo-native-1.2-r3: task do_unpack: Succeeded
NOTE: package pkgconfig-native-0.25-r2: task do_unpack: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_unpack: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_unpack: Succeeded
NOTE: package quilt-native-0.48-r0: task do_patch: Started
NOTE: package quilt-native-0.48-r0: task do_patch: Succeeded
NOTE: Running task 20 of 63 (ID: 12, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_configure)
NOTE: package autoconf-native-2.68-r3: task do_unpack: Started
NOTE: package automake-native-1.11.1-r4: task do_unpack: Started
NOTE: package pkgconfig-native-0.25-r2: task do_unpack: Succeeded
NOTE: package quilt-native-0.48-r0: task do_configure: Started
NOTE: package automake-native-1.11.1-r4: task do_unpack: Succeeded
NOTE: package autoconf-native-2.68-r3: task do_unpack: Succeeded
NOTE: package quilt-native-0.48-r0: task do_configure: Succeeded
NOTE: Running task 21 of 63 (ID: 13, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_compile)
NOTE: package quilt-native-0.48-r0: task do_compile: Started
NOTE: package quilt-native-0.48-r0: task do_compile: Succeeded
NOTE: Running task 22 of 63 (ID: 9, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_install)
NOTE: package quilt-native-0.48-r0: task do_install: Started
NOTE: package quilt-native-0.48-r0: task do_install: Succeeded
NOTE: Running task 23 of 63 (ID: 10, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_populate_sysroot)
NOTE: package quilt-native-0.48-r0: task do_populate_sysroot: Started
NOTE: package quilt-native-0.48-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 24 of 63 (ID: 50, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_patch)
NOTE: Running task 25 of 63 (ID: 57, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_patch)
NOTE: Running task 26 of 63 (ID: 29, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_patch)
NOTE: Running task 27 of 63 (ID: 36, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_patch)
NOTE: Running task 28 of 63 (ID: 43, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_patch)
NOTE: Running task 29 of 63 (ID: 22, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_patch)
NOTE: Running task 30 of 63 (ID: 15, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_patch)
NOTE: Running task 31 of 63 (ID: 1, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_patch)
NOTE: package gnu-config-native-20111111-r0: task do_patch: Started
NOTE: package m4-native-1.4.16-r0: task do_patch: Started
NOTE: package m4-native-1.4.16-r0: task do_patch: Succeeded
NOTE: package gnu-config-native-20111111-r0: task do_patch: Succeeded
NOTE: package libtool-native-2.4-r4: task do_patch: Started
NOTE: package pseudo-native-1.2-r3: task do_patch: Started
NOTE: Running task 32 of 63 (ID: 54, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_configure)
NOTE: package autoconf-native-2.68-r3: task do_patch: Started
NOTE: package automake-native-1.11.1-r4: task do_patch: Started
NOTE: package pkgconfig-native-0.25-r2: task do_patch: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_patch: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_patch: Succeeded
NOTE: package pseudo-native-1.2-r3: task do_patch: Succeeded
NOTE: package automake-native-1.11.1-r4: task do_patch: Succeeded
NOTE: package pkgconfig-native-0.25-r2: task do_patch: Succeeded
NOTE: package gnu-config-native-20111111-r0: task do_configure: Started
NOTE: package gnu-config-native-20111111-r0: task do_configure: Succeeded
NOTE: Running task 33 of 63 (ID: 55, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_compile)
NOTE: package autoconf-native-2.68-r3: task do_patch: Succeeded
NOTE: package libtool-native-2.4-r4: task do_patch: Succeeded
NOTE: package gnu-config-native-20111111-r0: task do_compile: Started
NOTE: package gnu-config-native-20111111-r0: task do_compile: Succeeded
NOTE: Running task 34 of 63 (ID: 51, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_install)
NOTE: package gnu-config-native-20111111-r0: task do_install: Started
NOTE: package gnu-config-native-20111111-r0: task do_install: Succeeded
NOTE: Running task 35 of 63 (ID: 52, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_populate_sysroot)
NOTE: package gnu-config-native-20111111-r0: task do_populate_sysroot: Started
NOTE: package gnu-config-native-20111111-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 36 of 63 (ID: 61, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_configure)
NOTE: package m4-native-1.4.16-r0: task do_configure: Started
NOTE: package m4-native-1.4.16-r0: task do_configure: Succeeded
NOTE: Running task 37 of 63 (ID: 62, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_compile)
NOTE: package m4-native-1.4.16-r0: task do_compile: Started
NOTE: package m4-native-1.4.16-r0: task do_compile: Succeeded
NOTE: Running task 38 of 63 (ID: 58, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_install)
NOTE: package m4-native-1.4.16-r0: task do_install: Started
NOTE: package m4-native-1.4.16-r0: task do_install: Succeeded
NOTE: Running task 39 of 63 (ID: 59, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_populate_sysroot)
NOTE: package m4-native-1.4.16-r0: task do_populate_sysroot: Started
NOTE: package m4-native-1.4.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 40 of 63 (ID: 33, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_configure)
NOTE: package autoconf-native-2.68-r3: task do_configure: Started
NOTE: package autoconf-native-2.68-r3: task do_configure: Succeeded
NOTE: Running task 41 of 63 (ID: 34, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_compile)
NOTE: package autoconf-native-2.68-r3: task do_compile: Started
NOTE: package autoconf-native-2.68-r3: task do_compile: Succeeded
NOTE: Running task 42 of 63 (ID: 30, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_install)
NOTE: package autoconf-native-2.68-r3: task do_install: Started
NOTE: package autoconf-native-2.68-r3: task do_install: Succeeded
NOTE: Running task 43 of 63 (ID: 31, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_populate_sysroot)
NOTE: package autoconf-native-2.68-r3: task do_populate_sysroot: Started
NOTE: package autoconf-native-2.68-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 44 of 63 (ID: 40, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_configure)
NOTE: package automake-native-1.11.1-r4: task do_configure: Started
NOTE: package automake-native-1.11.1-r4: task do_configure: Succeeded
NOTE: Running task 45 of 63 (ID: 41, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_compile)
NOTE: package automake-native-1.11.1-r4: task do_compile: Started
NOTE: package automake-native-1.11.1-r4: task do_compile: Succeeded
NOTE: Running task 46 of 63 (ID: 37, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_install)
NOTE: package automake-native-1.11.1-r4: task do_install: Started
NOTE: package automake-native-1.11.1-r4: task do_install: Succeeded
NOTE: Running task 47 of 63 (ID: 38, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_populate_sysroot)
NOTE: package automake-native-1.11.1-r4: task do_populate_sysroot: Started
NOTE: package automake-native-1.11.1-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 48 of 63 (ID: 47, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_configure)
NOTE: package libtool-native-2.4-r4: task do_configure: Started
NOTE: package libtool-native-2.4-r4: task do_configure: Succeeded
NOTE: Running task 49 of 63 (ID: 48, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_compile)
NOTE: package libtool-native-2.4-r4: task do_compile: Started
NOTE: package libtool-native-2.4-r4: task do_compile: Succeeded
NOTE: Running task 50 of 63 (ID: 44, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_install)
NOTE: package libtool-native-2.4-r4: task do_install: Started
NOTE: package libtool-native-2.4-r4: task do_install: Succeeded
NOTE: Running task 51 of 63 (ID: 45, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_populate_sysroot)
NOTE: package libtool-native-2.4-r4: task do_populate_sysroot: Started
NOTE: package libtool-native-2.4-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 52 of 63 (ID: 26, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_configure)
NOTE: package pkgconfig-native-0.25-r2: task do_configure: Started
NOTE: package pkgconfig-native-0.25-r2: task do_configure: Succeeded
NOTE: Running task 53 of 63 (ID: 27, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_compile)
NOTE: package pkgconfig-native-0.25-r2: task do_compile: Started
NOTE: package pkgconfig-native-0.25-r2: task do_compile: Succeeded
NOTE: Running task 54 of 63 (ID: 23, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_install)
NOTE: package pkgconfig-native-0.25-r2: task do_install: Started
NOTE: package pkgconfig-native-0.25-r2: task do_install: Succeeded
NOTE: Running task 55 of 63 (ID: 24, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_populate_sysroot)
NOTE: package pkgconfig-native-0.25-r2: task do_populate_sysroot: Started
NOTE: package pkgconfig-native-0.25-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 56 of 63 (ID: 19, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_configure)
NOTE: package sqlite3-native-3.7.7.1-r1: task do_configure: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_configure: Succeeded
NOTE: Running task 57 of 63 (ID: 20, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_compile)
NOTE: package sqlite3-native-3.7.7.1-r1: task do_compile: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_compile: Succeeded
NOTE: Running task 58 of 63 (ID: 16, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_install)
NOTE: package sqlite3-native-3.7.7.1-r1: task do_install: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_install: Succeeded
NOTE: Running task 59 of 63 (ID: 17, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_populate_sysroot)
NOTE: package sqlite3-native-3.7.7.1-r1: task do_populate_sysroot: Started
NOTE: package sqlite3-native-3.7.7.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 60 of 63 (ID: 5, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_configure)
NOTE: package pseudo-native-1.2-r3: task do_configure: Started
NOTE: package pseudo-native-1.2-r3: task do_configure: Succeeded
NOTE: Running task 61 of 63 (ID: 6, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_compile)
NOTE: package pseudo-native-1.2-r3: task do_compile: Started
NOTE: package pseudo-native-1.2-r3: task do_compile: Succeeded
NOTE: Running task 62 of 63 (ID: 2, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_install)
NOTE: package pseudo-native-1.2-r3: task do_install: Started
NOTE: package pseudo-native-1.2-r3: task do_install: Succeeded
NOTE: Running task 63 of 63 (ID: 3, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_populate_sysroot)
NOTE: package pseudo-native-1.2-r3: task do_populate_sysroot: Started
NOTE: package pseudo-native-1.2-r3: task do_populate_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 63 tasks of which 0 didn't need to be rerun and 0 failed.
Loading cache: 100% |###########################################| ETA:  00:00:00
Loaded 2459 entries from dependency cache.

OE Build Configuration:
BB_VERSION        = "1.15.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.12-core"
TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
TARGET_FPU        = "soft"
meta-angstrom     = "master:bc72e71ccf7e79cdc8246e0ae0dbe62d11355263"
meta-oe           
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         = "master:720cd3f32ca8cc4701e99effdd3b3da0cca8348d"
meta-opie         = "master:bd11184f5b5a8037444b22019c73249a967a4eb7"
meta-ti           = "master:078587ca99720b964dd1b39bbb676f1e5e930b13"
meta-ettus        = "master:f097bb61772d07610d84a668dc19a47e180962b3"
meta-efikamx      = "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        = "master:17853811179f2760791c6b138f96e9dd15493517"
meta-htc          
meta-nokia        
meta-openmoko     
meta-palm         = "master:a11089c4a2b065d4356793ba2810538408cfccbf"
meta-handheld     = "master:e9c14dd19c5e0c1d90f421d73c2da216afcc0715"
meta-sugarbay     
meta-crownbay     
meta-emenlow      
meta-fishriver    
meta-jasperforest 
meta-n450         = "master:68c6b19d623b34a504090ad2c706859ecc946256"
meta              = "master:2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 49 of 2451 (ID: 1639, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_fetch)
NOTE: Running task 51 of 2451 (ID: 581, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_fetch)
NOTE: Running task 59 of 2451 (ID: 592, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_fetch)
NOTE: Running task 60 of 2451 (ID: 1628, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_fetch)
NOTE: Running task 68 of 2451 (ID: 2378, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_fetch)
NOTE: Running task 69 of 2451 (ID: 1871, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_fetch)
NOTE: Running task 70 of 2451 (ID: 2112, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_fetch)
NOTE: Running task 71 of 2451 (ID: 1463, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_fetch)
NOTE: Running task 72 of 2451 (ID: 2134, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_fetch)
NOTE: Running task 73 of 2451 (ID: 1606, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_fetch)
NOTE: Running task 74 of 2451 (ID: 2145, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_fetch)
NOTE: Running task 75 of 2451 (ID: 1496, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_fetch)
NOTE: Running task 76 of 2451 (ID: 603, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_fetch)
NOTE: Running task 77 of 2451 (ID: 537, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_fetch)
NOTE: Running task 78 of 2451 (ID: 1068, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_fetch)
NOTE: Running task 79 of 2451 (ID: 1485, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_fetch)
NOTE: Running task 80 of 2451 (ID: 1650, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_fetch)
NOTE: Running task 81 of 2451 (ID: 1617, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_fetch)
NOTE: Running task 82 of 2451 (ID: 2156, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_fetch)
NOTE: Running task 83 of 2451 (ID: 1661, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_fetch)
NOTE: Running task 84 of 2451 (ID: 2168, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_fetch)
NOTE: Running task 85 of 2451 (ID: 727, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_fetch)
NOTE: Running task 86 of 2451 (ID: 705, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_fetch)
NOTE: Running task 87 of 2451 (ID: 1849, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_fetch)
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_fetch: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 88 of 2451 (ID: 577, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_unpack)
NOTE: package gmp-native-5.0.2-r1: task do_fetch: Started
NOTE: package zlib-native-1.2.5-r1: task do_fetch: Started
NOTE: package gmp-native-5.0.2-r1: task do_fetch: Succeeded
NOTE: package zlib-native-1.2.5-r1: task do_fetch: Succeeded
NOTE: package mpfr-native-3.1.0-r0: task do_fetch: Started
NOTE: package mpfr-native-3.1.0-r0: task do_fetch: Succeeded
NOTE: package python-native-2.7.2-r0.0: task do_fetch: Started
NOTE: package linux-libc-headers-3.1-r1: task do_fetch: Started
NOTE: package linux-libc-headers-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 89 of 2451 (ID: 1635, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_unpack)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_fetch: Started
NOTE: package readline-native-6.2-r0: task do_fetch: Started
NOTE: Running task 90 of 2451 (ID: 588, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_unpack)
NOTE: Running task 91 of 2451 (ID: 1624, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_unpack)
NOTE: package readline-native-6.2-r0: task do_fetch: Succeeded
NOTE: package python-native-2.7.2-r0.0: task do_fetch: Succeeded
NOTE: Running task 92 of 2451 (ID: 1657, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_unpack)
NOTE: Running task 93 of 2451 (ID: 2130, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_unpack)
NOTE: Running task 94 of 2451 (ID: 1602, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_unpack)
NOTE: package bzip2-native-1.0.6-r3: task do_fetch: Started
NOTE: package ncurses-native-5.9-r2.1: task do_fetch: Started
NOTE: package ncurses-native-5.9-r2.1: task do_fetch: Succeeded
NOTE: package ocf-linux-native-20100325-r3.0: task do_fetch: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_fetch: Succeeded
NOTE: package openssl-native-1.0.0e-r14.4: task do_fetch: Started
NOTE: package bzip2-native-1.0.6-r3: task do_fetch: Succeeded
NOTE: package gettext-native-0.18.1.1-r5: task do_fetch: Started
NOTE: package gettext-native-0.18.1.1-r5: task do_fetch: Succeeded
NOTE: package libmpc-native-0.8.2-r0: task do_fetch: Started
NOTE: package libmpc-native-0.8.2-r0: task do_fetch: Succeeded
NOTE: package unifdef-native-2.6.18+git-r0: task do_fetch: Started
NOTE: package unifdef-native-2.6.18+git-r0: task do_fetch: Succeeded
NOTE: Running task 95 of 2451 (ID: 1867, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_unpack)
NOTE: Running task 96 of 2451 (ID: 2108, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_unpack)
NOTE: Running task 97 of 2451 (ID: 2141, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_unpack)
NOTE: package libxml2-native-2.7.8-r4: task do_fetch: Started
NOTE: package flex-native-2.5.35-r2: task do_fetch: Started
NOTE: package gperf-native-3.0.4-r0: task do_fetch: Started
NOTE: package gperf-native-3.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 98 of 2451 (ID: 599, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_unpack)
NOTE: package openssl-native-1.0.0e-r14.4: task do_fetch: Succeeded
NOTE: package libxml2-native-2.7.8-r4: task do_fetch: Succeeded
NOTE: package flex-native-2.5.35-r2: task do_fetch: Succeeded
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_unpack: Started
NOTE: Running task 99 of 2451 (ID: 1459, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_unpack)
NOTE: Running task 100 of 2451 (ID: 1492, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_unpack)
NOTE: package elfutils-native-0.148-r3: task do_fetch: Started
NOTE: Running task 101 of 2451 (ID: 1064, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_unpack)
NOTE: package binutils-cross-2.20.1-r9: task do_fetch: Started
NOTE: package eglibc-2.12-r27: task do_fetch: Started
NOTE: Running task 102 of 2451 (ID: 1646, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_unpack)
NOTE: package eglibc-initial-2.12-r27: task do_fetch: Started
NOTE: Running task 103 of 2451 (ID: 2152, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_unpack)
NOTE: package bison-native-2.5-r1: task do_fetch: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 104 of 2451 (ID: 723, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_unpack)
NOTE: package bison-native-2.5-r1: task do_fetch: Succeeded
NOTE: package eglibc-2.12-r27: task do_fetch: Succeeded
NOTE: Running task 105 of 2451 (ID: 1481, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_unpack)
NOTE: package elfutils-native-0.148-r3: task do_fetch: Succeeded
NOTE: package eglibc-initial-2.12-r27: task do_fetch: Succeeded
NOTE: package gzip-native-1.4-r0: task do_fetch: Started
NOTE: package gzip-native-1.4-r0: task do_fetch: Succeeded
NOTE: Running task 106 of 2451 (ID: 533, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_unpack)
NOTE: Running task 107 of 2451 (ID: 2163, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_unpack)
NOTE: package binutils-cross-2.20.1-r9: task do_fetch: Succeeded
NOTE: Running task 108 of 2451 (ID: 1613, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_unpack)
NOTE: Running task 109 of 2451 (ID: 700, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_unpack)
NOTE: Running task 110 of 2451 (ID: 1845, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_unpack)
NOTE: package gmp-native-5.0.2-r1: task do_unpack: Started
NOTE: package linux-libc-headers-3.1-r1: task do_unpack: Started
NOTE: Running task 111 of 2451 (ID: 578, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_patch)
NOTE: package libxml2-native-2.7.8-r4: task do_unpack: Started
NOTE: package zlib-native-1.2.5-r1: task do_unpack: Started
NOTE: package mpfr-native-3.1.0-r0: task do_unpack: Started
NOTE: package readline-native-6.2-r0: task do_unpack: Started
NOTE: package python-native-2.7.2-r0.0: task do_unpack: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_unpack: Started
NOTE: package ncurses-native-5.9-r2.1: task do_unpack: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_unpack: Succeeded
NOTE: package bzip2-native-1.0.6-r3: task do_unpack: Started
NOTE: package gettext-native-0.18.1.1-r5: task do_unpack: Started
NOTE: package openssl-native-1.0.0e-r14.4: task do_unpack: Started
NOTE: Running task 112 of 2451 (ID: 2109, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_patch)
NOTE: package bzip2-native-1.0.6-r3: task do_unpack: Succeeded
NOTE: package libmpc-native-0.8.2-r0: task do_unpack: Started
NOTE: package unifdef-native-2.6.18+git-r0: task do_unpack: Started
NOTE: Running task 113 of 2451 (ID: 2142, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_patch)
NOTE: package readline-native-6.2-r0: task do_unpack: Succeeded
NOTE: package flex-native-2.5.35-r2: task do_unpack: Started
NOTE: package libmpc-native-0.8.2-r0: task do_unpack: Succeeded
NOTE: package unifdef-native-2.6.18+git-r0: task do_unpack: Succeeded
NOTE: package gperf-native-3.0.4-r0: task do_unpack: Started
NOTE: package bison-native-2.5-r1: task do_unpack: Started
NOTE: package elfutils-native-0.148-r3: task do_unpack: Started
NOTE: package binutils-cross-2.20.1-r9: task do_unpack: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_patch: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_patch: Succeeded
NOTE: Running task 114 of 2451 (ID: 2131, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_patch)
NOTE: Running task 115 of 2451 (ID: 1647, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_patch)
NOTE: package libxml2-native-2.7.8-r4: task do_unpack: Succeeded
NOTE: Running task 116 of 2451 (ID: 2153, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_patch)
NOTE: package zlib-native-1.2.5-r1: task do_unpack: Succeeded
NOTE: Running task 117 of 2451 (ID: 589, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_patch)
NOTE: Running task 118 of 2451 (ID: 1493, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_patch)
NOTE: Running task 119 of 2451 (ID: 582, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_configure)
NOTE: package ncurses-native-5.9-r2.1: task do_unpack: Succeeded
NOTE: package gperf-native-3.0.4-r0: task do_unpack: Succeeded
NOTE: package eglibc-initial-2.12-r27: task do_unpack: Started
NOTE: package eglibc-2.12-r27: task do_unpack: Started
NOTE: Running task 120 of 2451 (ID: 1868, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_patch)
NOTE: Running task 121 of 2451 (ID: 724, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_patch)
NOTE: package gzip-native-1.4-r0: task do_unpack: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_patch: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_patch: Succeeded
NOTE: package bison-native-2.5-r1: task do_unpack: Succeeded
NOTE: package gzip-native-1.4-r0: task do_unpack: Succeeded
NOTE: Running task 122 of 2451 (ID: 1482, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_patch)
NOTE: Running task 123 of 2451 (ID: 1846, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_patch)
NOTE: Running task 124 of 2451 (ID: 2113, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_configure)
NOTE: package mpfr-native-3.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 125 of 2451 (ID: 1625, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_patch)
NOTE: package unifdef-native-2.6.18+git-r0: task do_patch: Started
NOTE: package unifdef-native-2.6.18+git-r0: task do_patch: Succeeded
NOTE: package zlib-native-1.2.5-r1: task do_patch: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_configure: Started
NOTE: package bzip2-native-1.0.6-r3: task do_patch: Started
NOTE: package bzip2-native-1.0.6-r3: task do_patch: Succeeded
NOTE: Running task 126 of 2451 (ID: 2146, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_configure)
NOTE: Running task 127 of 2451 (ID: 2157, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_configure)
NOTE: package readline-native-6.2-r0: task do_patch: Started
NOTE: package libmpc-native-0.8.2-r0: task do_patch: Started
NOTE: package libmpc-native-0.8.2-r0: task do_patch: Succeeded
NOTE: package libxml2-native-2.7.8-r4: task do_patch: Started
NOTE: package gmp-native-5.0.2-r1: task do_unpack: Succeeded
NOTE: Running task 128 of 2451 (ID: 1636, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_patch)
NOTE: Running task 129 of 2451 (ID: 1474, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_fetch)
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_configure: Succeeded
NOTE: package gperf-native-3.0.4-r0: task do_patch: Started
NOTE: package gperf-native-3.0.4-r0: task do_patch: Succeeded
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_fetch: Succeeded
NOTE: package openssl-native-1.0.0e-r14.4: task do_unpack: Succeeded
NOTE: package flex-native-2.5.35-r2: task do_unpack: Succeeded
NOTE: Running task 130 of 2451 (ID: 2374, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_unpack)
NOTE: Running task 131 of 2451 (ID: 1460, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_patch)
NOTE: Running task 132 of 2451 (ID: 1065, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_patch)
NOTE: package gettext-native-0.18.1.1-r5: task do_unpack: Succeeded
NOTE: Running task 133 of 2451 (ID: 600, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_patch)
NOTE: Running task 134 of 2451 (ID: 583, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_compile)
NOTE: package readline-native-6.2-r0: task do_patch: Succeeded
NOTE: package ncurses-native-5.9-r2.1: task do_patch: Started
NOTE: Running task 136 of 2451 (ID: 728, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_configure)
NOTE: Running task 140 of 2451 (ID: 859, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_fetch)
NOTE: package mpfr-native-3.1.0-r0: task do_patch: Started
NOTE: package mpfr-native-3.1.0-r0: task do_patch: Succeeded
NOTE: Running task 141 of 2451 (ID: 1573, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_fetch)
NOTE: package zlib-native-1.2.5-r1: task do_patch: Succeeded
NOTE: package gzip-native-1.4-r0: task do_patch: Started
NOTE: Running task 142 of 2451 (ID: 593, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_configure)
NOTE: package ocf-linux-native-20100325-r3.0: task do_configure: Started
NOTE: package gzip-native-1.4-r0: task do_patch: Succeeded
NOTE: Running task 143 of 2451 (ID: 1850, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_configure)
NOTE: package bison-native-2.5-r1: task do_patch: Started
NOTE: package libxml2-native-2.7.8-r4: task do_patch: Succeeded
NOTE: package bzip2-native-1.0.6-r3: task do_configure: Started
NOTE: package unifdef-native-2.6.18+git-r0: task do_configure: Started
NOTE: package gmp-native-5.0.2-r1: task do_patch: Started
NOTE: package expat-native-2.0.1-r1: task do_fetch: Started
NOTE: package expat-native-2.0.1-r1: task do_fetch: Succeeded
NOTE: Running task 144 of 2451 (ID: 716, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_fetch)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_unpack: Started
NOTE: Running task 145 of 2451 (ID: 570, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_fetch)
NOTE: package ncurses-native-5.9-r2.1: task do_patch: Succeeded
NOTE: package ocf-linux-native-20100325-r3.0: task do_configure: Succeeded
NOTE: package unifdef-native-2.6.18+git-r0: task do_configure: Succeeded
NOTE: package elfutils-native-0.148-r3: task do_unpack: Succeeded
NOTE: Running task 146 of 2451 (ID: 534, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_patch)
NOTE: Running task 147 of 2451 (ID: 1872, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_configure)
NOTE: Running task 148 of 2451 (ID: 2114, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_compile)
NOTE: Running task 149 of 2451 (ID: 2158, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_compile)
NOTE: package bison-native-2.5-r1: task do_patch: Succeeded
NOTE: package openssl-native-1.0.0e-r14.4: task do_patch: Started
NOTE: package libtool-cross-2.4-r5: task do_fetch: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_compile: Started
NOTE: package perl-native-5.14.2-r0: task do_fetch: Started
NOTE: Running task 150 of 2451 (ID: 482, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_fetch)
NOTE: package libtool-cross-2.4-r5: task do_fetch: Succeeded
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_compile: Succeeded
NOTE: package flex-native-2.5.35-r2: task do_patch: Started
NOTE: package flex-native-2.5.35-r2: task do_patch: Succeeded
NOTE: package gettext-native-0.18.1.1-r5: task do_patch: Started
NOTE: package gperf-native-3.0.4-r0: task do_configure: Started
NOTE: package perl-native-5.14.2-r0: task do_fetch: Succeeded
NOTE: package zlib-native-1.2.5-r1: task do_configure: Started
NOTE: Running task 151 of 2451 (ID: 1540, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_fetch)
NOTE: Running task 152 of 2451 (ID: 579, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_install)
NOTE: package gettext-native-0.18.1.1-r5: task do_patch: Succeeded
NOTE: Running task 153 of 2451 (ID: 855, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_unpack)
NOTE: Running task 154 of 2451 (ID: 1507, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_fetch)
NOTE: Running task 155 of 2451 (ID: 712, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_unpack)
NOTE: package attr-native-2.4.46-r2: task do_fetch: Started
NOTE: package unifdef-native-2.6.18+git-r0: task do_compile: Started
NOTE: package curl-native-7.22.0-r0: task do_fetch: Started
NOTE: package curl-native-7.22.0-r0: task do_fetch: Succeeded
NOTE: package attr-native-2.4.46-r2: task do_fetch: Succeeded
NOTE: package gzip-native-1.4-r0: task do_configure: Started
NOTE: Running task 156 of 2451 (ID: 1569, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_unpack)
NOTE: Running task 157 of 2451 (ID: 566, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_unpack)
NOTE: package ncurses-native-5.9-r2.1: task do_configure: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_compile: Started
NOTE: package elfutils-native-0.148-r3: task do_patch: Started
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_install: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_compile: Succeeded
NOTE: package python-argparse-native-1.2.1-r1: task do_fetch: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_fetch: Succeeded
NOTE: package perl-native-5.14.2-r0: task do_unpack: Started
NOTE: package gtk-doc-native-1.0-r4: task do_fetch: Started
NOTE: package gtk-doc-native-1.0-r4: task do_fetch: Succeeded
NOTE: package libtool-cross-2.4-r5: task do_unpack: Started
NOTE: Running task 158 of 2451 (ID: 2110, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_install)
NOTE: Running task 159 of 2451 (ID: 1536, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_unpack)
NOTE: Running task 160 of 2451 (ID: 1503, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_unpack)
NOTE: package unifdef-native-2.6.18+git-r0: task do_compile: Succeeded
NOTE: package attr-native-2.4.46-r2: task do_unpack: Started
NOTE: package git-native-1.7.7-r1: task do_fetch: Started
NOTE: package git-native-1.7.7-r1: task do_fetch: Succeeded
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_install: Succeeded
NOTE: Running task 161 of 2451 (ID: 2154, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_install)
NOTE: Running task 162 of 2451 (ID: 478, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_unpack)
NOTE: package curl-native-7.22.0-r0: task do_unpack: Started
NOTE: Running task 163 of 2451 (ID: 580, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_populate_sysroot)
NOTE: package attr-native-2.4.46-r2: task do_unpack: Succeeded
NOTE: Running task 164 of 2451 (ID: 1570, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_patch)
NOTE: package python-argparse-native-1.2.1-r1: task do_unpack: Started
NOTE: package gmp-native-5.0.2-r1: task do_patch: Succeeded
NOTE: package gtk-doc-native-1.0-r4: task do_unpack: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_unpack: Succeeded
NOTE: Running task 165 of 2451 (ID: 1640, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_configure)
NOTE: Running task 166 of 2451 (ID: 1537, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_patch)
NOTE: package gtk-doc-native-1.0-r4: task do_unpack: Succeeded
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_populate_sysroot: Started
NOTE: package attr-native-2.4.46-r2: task do_patch: Started
NOTE: package libtool-cross-2.4-r5: task do_unpack: Succeeded
NOTE: package unifdef-native-2.6.18+git-r0: task do_install: Started
NOTE: package ocf-linux-native-20100325-r3.0: task do_install: Started
NOTE: Running task 167 of 2451 (ID: 713, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_patch)
NOTE: package git-native-1.7.7-r1: task do_unpack: Started
NOTE: Running task 168 of 2451 (ID: 1504, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_patch)
NOTE: package eglibc-initial-2.12-r27: task do_unpack: Succeeded
NOTE: package unifdef-native-2.6.18+git-r0: task do_install: Succeeded
NOTE: Running task 169 of 2451 (ID: 2164, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_patch)
NOTE: Running task 170 of 2451 (ID: 2155, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_populate_sysroot)
NOTE: package eglibc-initial-2.12-r27: task do_patch: Started
NOTE: package unifdef-native-2.6.18+git-r0: task do_populate_sysroot: Started
NOTE: package libtool-cross-2.4-r5: task do_patch: Started
NOTE: package gtk-doc-native-1.0-r4: task do_patch: Started
NOTE: package gtk-doc-native-1.0-r4: task do_patch: Succeeded
NOTE: package python-argparse-native-1.2.1-r1: task do_patch: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_patch: Succeeded
NOTE: package gmp-native-5.0.2-r1: task do_configure: Started
NOTE: package attr-native-2.4.46-r2: task do_patch: Succeeded
NOTE: package ocf-linux-native-20100325-r3.0: task do_install: Succeeded
NOTE: Running task 171 of 2451 (ID: 2111, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_populate_sysroot)
NOTE: Running task 172 of 2451 (ID: 2123, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_fetch)
NOTE: Running task 173 of 2451 (ID: 1518, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_fetch)
NOTE: Running task 174 of 2451 (ID: 1508, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_configure)
NOTE: package git-native-1.7.7-r1: task do_unpack: Succeeded
NOTE: package gettext-minimal-native-0.18.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 175 of 2451 (ID: 479, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_patch)
NOTE: Running task 176 of 2451 (ID: 1069, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_configure)
NOTE: package curl-native-7.22.0-r0: task do_unpack: Succeeded
NOTE: package unifdef-native-2.6.18+git-r0: task do_populate_sysroot: Succeeded
NOTE: package ocf-linux-native-20100325-r3.0: task do_populate_sysroot: Started
NOTE: Running task 177 of 2451 (ID: 1486, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_configure)
NOTE: Running task 178 of 2451 (ID: 567, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_patch)
NOTE: package dbus-native-1.4.16-r0: task do_fetch: Started
NOTE: package dbus-native-1.4.16-r0: task do_fetch: Succeeded
NOTE: package python-setuptools-native-0.6c11-ml3: task do_fetch: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_fetch: Succeeded
NOTE: Running task 179 of 2451 (ID: 2119, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_unpack)
NOTE: Running task 180 of 2451 (ID: 1514, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_unpack)
NOTE: package flex-native-2.5.35-r2: task do_configure: Started
NOTE: package gtk-doc-native-1.0-r4: task do_configure: Started
NOTE: package gtk-doc-native-1.0-r4: task do_configure: Succeeded
NOTE: package git-native-1.7.7-r1: task do_patch: Started
NOTE: package git-native-1.7.7-r1: task do_patch: Succeeded
NOTE: Running task 181 of 2451 (ID: 1509, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_compile)
NOTE: Running task 182 of 2451 (ID: 625, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_fetch)
NOTE: package ocf-linux-native-20100325-r3.0: task do_populate_sysroot: Succeeded
NOTE: Running task 183 of 2451 (ID: 1529, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_fetch)
NOTE: package curl-native-7.22.0-r0: task do_patch: Started
NOTE: package bison-native-2.5-r1: task do_configure: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_unpack: Started
NOTE: package dbus-native-1.4.16-r0: task do_unpack: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_unpack: Succeeded
NOTE: package gtk-doc-native-1.0-r4: task do_compile: Started
NOTE: Running task 184 of 2451 (ID: 2120, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_patch)
NOTE: package libffi-native-3.0.9-r2: task do_fetch: Started
NOTE: package libffi-native-3.0.9-r2: task do_fetch: Succeeded
NOTE: package perl-native-5.14.2-r0: task do_unpack: Succeeded
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_fetch: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_fetch: Succeeded
NOTE: Running task 185 of 2451 (ID: 856, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_patch)
NOTE: Running task 186 of 2451 (ID: 621, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_unpack)
NOTE: package gtk-doc-native-1.0-r4: task do_compile: Succeeded
NOTE: Running task 187 of 2451 (ID: 1525, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_unpack)
NOTE: Running task 188 of 2451 (ID: 1505, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_install)
NOTE: package eglibc-initial-2.12-r27: task do_patch: Succeeded
NOTE: Running task 189 of 2451 (ID: 1595, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_fetch)
NOTE: package python-setuptools-native-0.6c11-ml3: task do_patch: Started
NOTE: package dbus-native-1.4.16-r0: task do_unpack: Succeeded
NOTE: Running task 190 of 2451 (ID: 1515, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_patch)
NOTE: package python-setuptools-native-0.6c11-ml3: task do_patch: Succeeded
NOTE: package perl-native-5.14.2-r0: task do_patch: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_unpack: Started
NOTE: package libffi-native-3.0.9-r2: task do_unpack: Started
NOTE: Running task 191 of 2451 (ID: 1584, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_fetch)
NOTE: package curl-native-7.22.0-r0: task do_patch: Succeeded
NOTE: Running task 192 of 2451 (ID: 1562, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_fetch)
NOTE: package libffi-native-3.0.9-r2: task do_unpack: Succeeded
NOTE: package eglibc-2.12-r27: task do_unpack: Succeeded
NOTE: Running task 193 of 2451 (ID: 701, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_patch)
NOTE: Running task 194 of 2451 (ID: 1526, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_patch)
NOTE: package gtk-doc-native-1.0-r4: task do_install: Started
NOTE: package popt-native-1.16-r0: task do_fetch: Started
NOTE: package popt-native-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 195 of 2451 (ID: 1591, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_unpack)
NOTE: package popt-native-1.16-r0: task do_unpack: Started
NOTE: package libffi-native-3.0.9-r2: task do_patch: Started
NOTE: package libffi-native-3.0.9-r2: task do_patch: Succeeded
NOTE: package libpcre-native-8.20-r0: task do_fetch: Started
NOTE: package libpcre-native-8.20-r0: task do_fetch: Succeeded
NOTE: package gtk-doc-native-1.0-r4: task do_install: Succeeded
NOTE: package acl-native-2.2.51-r2: task do_fetch: Started
NOTE: package acl-native-2.2.51-r2: task do_fetch: Succeeded
NOTE: package dbus-native-1.4.16-r0: task do_patch: Started
NOTE: package eglibc-2.12-r27: task do_patch: Started
NOTE: Running task 196 of 2451 (ID: 1506, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_populate_sysroot)
NOTE: Running task 197 of 2451 (ID: 1580, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_unpack)
NOTE: Running task 198 of 2451 (ID: 1558, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_unpack)
NOTE: Running task 199 of 2451 (ID: 1530, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_configure)
NOTE: package popt-native-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 200 of 2451 (ID: 1592, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_patch)
NOTE: package gtk-doc-native-1.0-r4: task do_populate_sysroot: Started
NOTE: package libpcre-native-8.20-r0: task do_unpack: Started
NOTE: package python-native-2.7.2-r0.0: task do_unpack: Succeeded
NOTE: package libffi-native-3.0.9-r2: task do_configure: Started
NOTE: package dbus-native-1.4.16-r0: task do_patch: Succeeded
NOTE: package elfutils-native-0.148-r3: task do_patch: Succeeded
NOTE: Running task 201 of 2451 (ID: 1603, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_patch)
NOTE: Running task 202 of 2451 (ID: 1551, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_fetch)
NOTE: Running task 203 of 2451 (ID: 669, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_fetch)
NOTE: package acl-native-2.2.51-r2: task do_unpack: Started
NOTE: package popt-native-1.16-r0: task do_patch: Started
NOTE: package popt-native-1.16-r0: task do_patch: Succeeded
NOTE: Running task 204 of 2451 (ID: 1596, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_configure)
NOTE: package acl-native-2.2.51-r2: task do_unpack: Succeeded
NOTE: Running task 205 of 2451 (ID: 1581, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_patch)
NOTE: package gtk-doc-native-1.0-r4: task do_populate_sysroot: Succeeded
NOTE: package desktop-file-utils-native-0.15-r0: task do_fetch: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 206 of 2451 (ID: 658, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_fetch)
NOTE: Running task 207 of 2451 (ID: 665, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_unpack)
NOTE: package libtool-cross-2.4-r5: task do_patch: Succeeded
NOTE: package openssl-native-1.0.0e-r14.4: task do_patch: Succeeded
NOTE: package python-native-2.7.2-r0.0: task do_patch: Started
NOTE: Running task 208 of 2451 (ID: 1464, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_configure)
NOTE: Running task 209 of 2451 (ID: 647, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_fetch)
NOTE: package db-native-5.1.19-r3: task do_fetch: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_unpack: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_unpack: Succeeded
NOTE: package acl-native-2.2.51-r2: task do_patch: Started
NOTE: package popt-native-1.16-r0: task do_configure: Started
NOTE: Running task 210 of 2451 (ID: 666, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_patch)
NOTE: package perl-native-5.14.2-r0: task do_patch: Succeeded
NOTE: package libpcre-native-8.20-r0: task do_unpack: Succeeded
NOTE: package db-native-5.1.19-r3: task do_fetch: Succeeded
NOTE: Running task 211 of 2451 (ID: 860, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_configure)
NOTE: Running task 212 of 2451 (ID: 1559, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_patch)
NOTE: Running task 213 of 2451 (ID: 1547, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_unpack)
NOTE: package pax-utils-native-0.2.2-r0: task do_fetch: Started
NOTE: package pax-utils-native-0.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 214 of 2451 (ID: 654, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_unpack)
NOTE: package openssl-native-1.0.0e-r14.4: task do_configure: Started
NOTE: package file-native-5.09-r0: task do_fetch: Started
NOTE: package acl-native-2.2.51-r2: task do_patch: Succeeded
NOTE: package perl-native-5.14.2-r0: task do_configure: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_patch: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_patch: Succeeded
NOTE: package db-native-5.1.19-r3: task do_unpack: Started
NOTE: package file-native-5.09-r0: task do_fetch: Succeeded
NOTE: Running task 215 of 2451 (ID: 636, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_fetch)
NOTE: Running task 216 of 2451 (ID: 643, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_unpack)
NOTE: Running task 225 of 2451 (ID: 1090, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_fetch)
NOTE: package libpcre-native-8.20-r0: task do_patch: Started
NOTE: package pax-utils-native-0.2.2-r0: task do_unpack: Started
NOTE: package eglibc-2.12-r27: task do_patch: Succeeded
NOTE: Running task 226 of 2451 (ID: 2179, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_fetch)
NOTE: package ncurses-5.9-r2.1: task do_fetch: Started
NOTE: package ncurses-5.9-r2.1: task do_fetch: Succeeded
NOTE: package pax-utils-native-0.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 227 of 2451 (ID: 655, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_patch)
NOTE: Running task 228 of 2451 (ID: 1086, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_unpack)
NOTE: package rpm-native-5.4.0-r24: task do_fetch: Started
NOTE: package file-native-5.09-r0: task do_unpack: Started
NOTE: package rpm-native-5.4.0-r24: task do_fetch: Succeeded
NOTE: Running task 229 of 2451 (ID: 632, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_unpack)
NOTE: package util-macros-1_1.15.0-r0: task do_fetch: Started
NOTE: package pax-utils-native-0.2.2-r0: task do_patch: Started
NOTE: package ncurses-5.9-r2.1: task do_unpack: Started
NOTE: package util-macros-1_1.15.0-r0: task do_fetch: Succeeded
NOTE: package rpm-native-5.4.0-r24: task do_unpack: Started
NOTE: package pax-utils-native-0.2.2-r0: task do_patch: Succeeded
NOTE: package libpcre-native-8.20-r0: task do_patch: Succeeded
NOTE: Running task 230 of 2451 (ID: 1035, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_fetch)
NOTE: Running task 231 of 2451 (ID: 2175, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_unpack)
NOTE: Running task 232 of 2451 (ID: 659, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_configure)
NOTE: package file-native-5.09-r0: task do_unpack: Succeeded
NOTE: Running task 233 of 2451 (ID: 644, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_patch)
NOTE: package ncurses-5.9-r2.1: task do_unpack: Succeeded
NOTE: Running task 234 of 2451 (ID: 1087, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_patch)
NOTE: package expat-2.0.1-r1: task do_fetch: Started
NOTE: package expat-2.0.1-r1: task do_fetch: Succeeded
NOTE: package util-macros-1_1.15.0-r0: task do_unpack: Started
NOTE: package util-macros-1_1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 235 of 2451 (ID: 903, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_fetch)
NOTE: Running task 236 of 2451 (ID: 2176, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_patch)
NOTE: package pax-utils-native-0.2.2-r0: task do_configure: Started
NOTE: package file-native-5.09-r0: task do_patch: Started
NOTE: package ncurses-5.9-r2.1: task do_patch: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_unpack: Succeeded
NOTE: package pax-utils-native-0.2.2-r0: task do_configure: Succeeded
NOTE: Running task 237 of 2451 (ID: 622, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_patch)
NOTE: Running task 238 of 2451 (ID: 660, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_compile)
NOTE: package gettext-0.18.1.1-r5: task do_fetch: Started
NOTE: package gettext-0.18.1.1-r5: task do_fetch: Succeeded
NOTE: package util-macros-1_1.15.0-r0: task do_patch: Started
NOTE: package util-macros-1_1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 239 of 2451 (ID: 899, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_unpack)
NOTE: Running task 243 of 2451 (ID: 710, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_populate_lic)
NOTE: package file-native-5.09-r0: task do_patch: Succeeded
NOTE: package ncurses-5.9-r2.1: task do_patch: Succeeded
NOTE: Running task 244 of 2451 (ID: 721, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_populate_lic)
NOTE: Running task 245 of 2451 (ID: 2234, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_fetch)
NOTE: package pax-utils-native-0.2.2-r0: task do_compile: Started
NOTE: package gettext-0.18.1.1-r5: task do_unpack: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_patch: Started
NOTE: package eglibc-2.12-r27: task do_populate_lic: Started
NOTE: package xproto-1_7.0.22-r0: task do_fetch: Started
NOTE: package xproto-1_7.0.22-r0: task do_fetch: Succeeded
NOTE: Running task 246 of 2451 (ID: 2230, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_unpack)
NOTE: package libtool-cross-2.4-r5: task do_populate_lic: Started
NOTE: package eglibc-2.12-r27: task do_populate_lic: Succeeded
NOTE: Running task 250 of 2451 (ID: 2184, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_populate_lic)
NOTE: package python-native-2.7.2-r0.0: task do_patch: Succeeded
NOTE: package binutils-cross-2.20.1-r9: task do_unpack: Succeeded
NOTE: package libtool-cross-2.4-r5: task do_populate_lic: Succeeded
NOTE: package xproto-1_7.0.22-r0: task do_unpack: Started
NOTE: Running task 251 of 2451 (ID: 1614, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_patch)
NOTE: Running task 253 of 2451 (ID: 1095, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_populate_lic)
NOTE: package rpm-native-5.4.0-r24: task do_unpack: Succeeded
NOTE: Running task 254 of 2451 (ID: 633, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_patch)
NOTE: Running task 256 of 2451 (ID: 2190, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_fetch)
NOTE: package gettext-0.18.1.1-r5: task do_unpack: Succeeded
NOTE: package util-macros-1_1.15.0-r0: task do_populate_lic: Started
NOTE: Running task 257 of 2451 (ID: 900, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_patch)
NOTE: package xproto-1_7.0.22-r0: task do_unpack: Succeeded
NOTE: Running task 258 of 2451 (ID: 2231, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_patch)
NOTE: package xtrans-1_1.2.6-r0: task do_fetch: Started
NOTE: package xtrans-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 259 of 2451 (ID: 2186, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_unpack)
NOTE: package ncurses-5.9-r2.1: task do_populate_lic: Started
NOTE: package util-macros-1_1.15.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 260 of 2451 (ID: 314, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_fetch)
NOTE: package binutils-cross-2.20.1-r9: task do_patch: Started
NOTE: package rpm-native-5.4.0-r24: task do_patch: Started
NOTE: package gettext-0.18.1.1-r5: task do_patch: Started
NOTE: package gettext-0.18.1.1-r5: task do_patch: Succeeded
NOTE: package xtrans-1_1.2.6-r0: task do_unpack: Started
NOTE: package xproto-1_7.0.22-r0: task do_patch: Started
NOTE: package xproto-1_7.0.22-r0: task do_patch: Succeeded
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_patch: Succeeded
NOTE: Running task 261 of 2451 (ID: 2212, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_fetch)
NOTE: package ncurses-5.9-r2.1: task do_populate_lic: Succeeded
NOTE: Running task 262 of 2451 (ID: 2201, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_fetch)
NOTE: Running task 263 of 2451 (ID: 908, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_populate_lic)
NOTE: Running task 264 of 2451 (ID: 870, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_fetch)
NOTE: package xtrans-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: package util-linux-2.19.1-r11: task do_fetch: Started
NOTE: Running task 265 of 2451 (ID: 2187, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_patch)
NOTE: package libxau-1_1.0.6-r0: task do_fetch: Started
NOTE: package libxau-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: package xtrans-1_1.2.6-r0: task do_patch: Started
NOTE: package xtrans-1_1.2.6-r0: task do_patch: Succeeded
NOTE: package db-native-5.1.19-r3: task do_unpack: Succeeded
NOTE: package libxdmcp-1_1.1.0-r0: task do_fetch: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: package pax-utils-native-0.2.2-r0: task do_compile: Succeeded
NOTE: package gettext-0.18.1.1-r5: task do_populate_lic: Started
NOTE: package util-linux-2.19.1-r11: task do_fetch: Succeeded
NOTE: package base-passwd-3.5.22-r9: task do_fetch: Started
NOTE: package base-passwd-3.5.22-r9: task do_fetch: Succeeded
NOTE: Running task 266 of 2451 (ID: 1548, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_patch)
NOTE: Running task 267 of 2451 (ID: 656, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_install)
NOTE: Running task 268 of 2451 (ID: 310, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_unpack)
NOTE: Running task 269 of 2451 (ID: 2208, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_unpack)
NOTE: Running task 270 of 2451 (ID: 2197, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_unpack)
NOTE: Running task 271 of 2451 (ID: 866, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_unpack)
NOTE: Running task 272 of 2451 (ID: 1079, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_fetch)
NOTE: package gettext-0.18.1.1-r5: task do_populate_lic: Succeeded
NOTE: Running task 273 of 2451 (ID: 1794, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_fetch)
NOTE: package libxdmcp-1_1.1.0-r0: task do_unpack: Started
NOTE: package util-linux-2.19.1-r11: task do_unpack: Started
NOTE: package db-native-5.1.19-r3: task do_patch: Started
NOTE: package pax-utils-native-0.2.2-r0: task do_install: Started
NOTE: package libxau-1_1.0.6-r0: task do_unpack: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 274 of 2451 (ID: 2198, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_patch)
NOTE: package base-passwd-3.5.22-r9: task do_unpack: Started
NOTE: package zlib-1.2.5-r1: task do_fetch: Started
NOTE: package zlib-1.2.5-r1: task do_fetch: Succeeded
NOTE: Running task 275 of 2451 (ID: 1075, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_unpack)
NOTE: package db-native-5.1.19-r3: task do_patch: Succeeded
NOTE: package pax-utils-native-0.2.2-r0: task do_install: Succeeded
NOTE: package libxau-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: package cracklib-2.8.18-r1: task do_fetch: Started
NOTE: package cracklib-2.8.18-r1: task do_fetch: Succeeded
NOTE: Running task 276 of 2451 (ID: 1552, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_configure)
NOTE: package base-passwd-3.5.22-r9: task do_unpack: Succeeded
NOTE: Running task 277 of 2451 (ID: 657, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_populate_sysroot)
NOTE: Running task 278 of 2451 (ID: 2209, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_patch)
NOTE: Running task 279 of 2451 (ID: 867, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_patch)
NOTE: Running task 280 of 2451 (ID: 1790, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_unpack)
NOTE: package openssl-native-1.0.0e-r14.4: task do_configure: Succeeded
NOTE: Running task 281 of 2451 (ID: 1465, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_compile)
NOTE: package zlib-1.2.5-r1: task do_unpack: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_patch: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 282 of 2451 (ID: 1783, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_fetch)
NOTE: package libxau-1_1.0.6-r0: task do_patch: Started
NOTE: package libxau-1_1.0.6-r0: task do_patch: Succeeded
NOTE: package cracklib-2.8.18-r1: task do_unpack: Started
NOTE: Running task 283 of 2451 (ID: 1772, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_fetch)
NOTE: package openssl-native-1.0.0e-r14.4: task do_compile: Started
NOTE: package pax-utils-native-0.2.2-r0: task do_populate_sysroot: Started
NOTE: package base-passwd-3.5.22-r9: task do_patch: Started
NOTE: package zlib-1.2.5-r1: task do_unpack: Succeeded
NOTE: package db-native-5.1.19-r3: task do_configure: Started
NOTE: package cracklib-2.8.18-r1: task do_unpack: Succeeded
NOTE: Running task 284 of 2451 (ID: 1076, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_patch)
NOTE: Running task 285 of 2451 (ID: 1791, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_patch)
NOTE: package flex-2.5.35-r2: task do_fetch: Started
NOTE: package flex-2.5.35-r2: task do_fetch: Succeeded
NOTE: Running task 286 of 2451 (ID: 1779, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_unpack)
NOTE: package base-passwd-3.5.22-r9: task do_patch: Succeeded
NOTE: package bison-2.5-r1: task do_fetch: Started
NOTE: package bison-2.5-r1: task do_fetch: Succeeded
NOTE: Running task 287 of 2451 (ID: 837, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_fetch)
NOTE: Running task 288 of 2451 (ID: 1768, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_unpack)
NOTE: package zlib-1.2.5-r1: task do_patch: Started
NOTE: package cracklib-2.8.18-r1: task do_patch: Started
NOTE: package cracklib-2.8.18-r1: task do_patch: Succeeded
NOTE: package pax-utils-native-0.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: package flex-2.5.35-r2: task do_unpack: Started
NOTE: Running task 289 of 2451 (ID: 2239, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_populate_lic)
NOTE: Running task 290 of 2451 (ID: 2422, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_fetch)
NOTE: package zlib-1.2.5-r1: task do_patch: Succeeded
NOTE: package libpam-1.1.4-r2: task do_fetch: Started
NOTE: package bison-2.5-r1: task do_unpack: Started
NOTE: Running task 291 of 2451 (ID: 2411, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_fetch)
NOTE: package libpam-1.1.4-r2: task do_fetch: Succeeded
NOTE: Running task 292 of 2451 (ID: 833, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_unpack)
NOTE: package flex-2.5.35-r2: task do_unpack: Succeeded
NOTE: Running task 293 of 2451 (ID: 1780, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_patch)
NOTE: package bison-2.5-r1: task do_unpack: Succeeded
NOTE: package xproto-1_7.0.22-r0: task do_populate_lic: Started
NOTE: Running task 294 of 2451 (ID: 1769, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_patch)
NOTE: package libpthread-stubs-0.3-r0: task do_fetch: Started
NOTE: package libpthread-stubs-0.3-r0: task do_fetch: Succeeded
NOTE: Running task 295 of 2451 (ID: 2418, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_unpack)
NOTE: package libpam-1.1.4-r2: task do_unpack: Started
NOTE: package xcb-proto-native-1.6-r4: task do_fetch: Started
NOTE: package xcb-proto-native-1.6-r4: task do_fetch: Succeeded
NOTE: Running task 296 of 2451 (ID: 2407, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_unpack)
NOTE: package util-linux-2.19.1-r11: task do_unpack: Succeeded
NOTE: package flex-2.5.35-r2: task do_patch: Started
NOTE: package flex-2.5.35-r2: task do_patch: Succeeded
NOTE: package xproto-1_7.0.22-r0: task do_populate_lic: Succeeded
NOTE: Running task 297 of 2451 (ID: 311, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_patch)
NOTE: Running task 298 of 2451 (ID: 2400, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_fetch)
NOTE: package bison-2.5-r1: task do_patch: Started
NOTE: Running task 299 of 2451 (ID: 2389, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_fetch)
NOTE: package libpthread-stubs-0.3-r0: task do_unpack: Started
NOTE: package rpm-native-5.4.0-r24: task do_patch: Succeeded
NOTE: Running task 300 of 2451 (ID: 1241, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_fetch)
NOTE: package libpthread-stubs-0.3-r0: task do_unpack: Succeeded
NOTE: package xcb-proto-native-1.6-r4: task do_unpack: Started
NOTE: Running task 301 of 2451 (ID: 2419, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_patch)
NOTE: package util-linux-2.19.1-r11: task do_patch: Started
NOTE: package xcb-proto-1.6-r4: task do_fetch: Started
NOTE: package libxslt-native-1.1.26-r4: task do_fetch: Started
NOTE: package libxslt-native-1.1.26-r4: task do_fetch: Succeeded
NOTE: package xcb-proto-1.6-r4: task do_fetch: Succeeded
NOTE: package xcb-proto-native-1.6-r4: task do_unpack: Succeeded
NOTE: Running task 302 of 2451 (ID: 2408, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_patch)
NOTE: package e2fsprogs-1.41.14-r3: task do_fetch: Started
NOTE: package bison-2.5-r1: task do_patch: Succeeded
NOTE: Running task 303 of 2451 (ID: 2396, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_unpack)
NOTE: Running task 304 of 2451 (ID: 2322, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_fetch)
NOTE: package e2fsprogs-1.41.14-r3: task do_fetch: Succeeded
NOTE: Running task 305 of 2451 (ID: 2385, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_unpack)
NOTE: Running task 306 of 2451 (ID: 1237, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_unpack)
NOTE: package binutils-cross-2.20.1-r9: task do_patch: Succeeded
NOTE: package libpthread-stubs-0.3-r0: task do_patch: Started
NOTE: package libpthread-stubs-0.3-r0: task do_patch: Succeeded
NOTE: Running task 307 of 2451 (ID: 2311, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_fetch)
NOTE: Running task 308 of 2451 (ID: 2300, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_fetch)
NOTE: package libice-1_1.0.7-r0: task do_fetch: Started
NOTE: package xcb-proto-native-1.6-r4: task do_patch: Started
NOTE: package libice-1_1.0.7-r0: task do_fetch: Succeeded
NOTE: package e2fsprogs-1.41.14-r3: task do_unpack: Started
NOTE: package libpam-1.1.4-r2: task do_unpack: Succeeded
NOTE: Running task 309 of 2451 (ID: 834, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_patch)
NOTE: Running task 310 of 2451 (ID: 2318, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_unpack)
NOTE: package xcb-proto-1.6-r4: task do_unpack: Started
NOTE: package libxslt-native-1.1.26-r4: task do_unpack: Started
NOTE: package xcb-proto-1.6-r4: task do_unpack: Succeeded
NOTE: package libxcb-1.7-r2: task do_fetch: Started
NOTE: package libxcb-1.7-r2: task do_fetch: Succeeded
NOTE: Running task 311 of 2451 (ID: 2386, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_patch)
NOTE: Running task 312 of 2451 (ID: 2296, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_unpack)
NOTE: package libpam-1.1.4-r2: task do_patch: Started
NOTE: package libice-1_1.0.7-r0: task do_unpack: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_fetch: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_fetch: Succeeded
NOTE: Running task 313 of 2451 (ID: 2307, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_unpack)
NOTE: package util-linux-2.19.1-r11: task do_patch: Succeeded
NOTE: package libxcb-1.7-r2: task do_unpack: Started
NOTE: package xcb-proto-native-1.6-r4: task do_patch: Succeeded
NOTE: Running task 314 of 2451 (ID: 315, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_remove_lscpu)
NOTE: package libice-1_1.0.7-r0: task do_unpack: Succeeded
NOTE: package xcb-proto-1.6-r4: task do_patch: Started
NOTE: Running task 315 of 2451 (ID: 2289, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_fetch)
NOTE: Running task 316 of 2451 (ID: 2319, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_patch)
NOTE: package libxcb-1.7-r2: task do_unpack: Succeeded
NOTE: package libxslt-native-1.1.26-r4: task do_unpack: Succeeded
NOTE: Running task 317 of 2451 (ID: 2297, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_patch)
NOTE: package libpam-1.1.4-r2: task do_patch: Succeeded
NOTE: package e2fsprogs-1.41.14-r3: task do_unpack: Succeeded
NOTE: package xcb-proto-1.6-r4: task do_patch: Succeeded
NOTE: Running task 318 of 2451 (ID: 2397, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_patch)
NOTE: Running task 319 of 2451 (ID: 1238, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_patch)
NOTE: Running task 320 of 2451 (ID: 2278, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_fetch)
NOTE: Running task 321 of 2451 (ID: 2267, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_fetch)
NOTE: package util-linux-2.19.1-r11: task do_remove_lscpu: Started
NOTE: package libice-1_1.0.7-r0: task do_patch: Started
NOTE: package libice-1_1.0.7-r0: task do_patch: Succeeded
NOTE: package xproto-native-1_7.0.22-r0: task do_unpack: Started
NOTE: Running task 322 of 2451 (ID: 2256, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_fetch)
NOTE: package util-linux-2.19.1-r11: task do_remove_lscpu: Succeeded
NOTE: package inputproto-1_2.0.2-r0: task do_fetch: Started
NOTE: package inputproto-1_2.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 323 of 2451 (ID: 2245, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_fetch)
NOTE: Running task 324 of 2451 (ID: 2285, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_unpack)
NOTE: package libxcb-1.7-r2: task do_patch: Started
NOTE: package libxcb-1.7-r2: task do_patch: Succeeded
NOTE: package xproto-native-1_7.0.22-r0: task do_unpack: Succeeded
NOTE: Running task 325 of 2451 (ID: 2308, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_patch)
NOTE: Running task 326 of 2451 (ID: 2223, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_fetch)
NOTE: package libxslt-native-1.1.26-r4: task do_patch: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_patch: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_fetch: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_fetch: Succeeded
NOTE: Running task 327 of 2451 (ID: 2263, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_unpack)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_fetch: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: package inputproto-1_2.0.2-r0: task do_unpack: Started
NOTE: Running task 328 of 2451 (ID: 2252, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_unpack)
NOTE: package inputproto-1_2.0.2-r0: task do_unpack: Succeeded
NOTE: package libxslt-native-1.1.26-r4: task do_patch: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_fetch: Started
NOTE: package xextproto-1_7.2.0-r0: task do_fetch: Succeeded
NOTE: package xproto-native-1_7.0.22-r0: task do_patch: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_patch: Succeeded
NOTE: package kbproto-1_1.0.5-r0: task do_fetch: Started
NOTE: package kbproto-1_1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 329 of 2451 (ID: 892, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_fetch)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_fetch: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 330 of 2451 (ID: 2274, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_unpack)
NOTE: Running task 331 of 2451 (ID: 2241, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_unpack)
NOTE: Running task 332 of 2451 (ID: 2286, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_patch)
NOTE: Running task 333 of 2451 (ID: 881, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_fetch)
NOTE: Running task 334 of 2451 (ID: 2219, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_unpack)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_fetch: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_fetch: Succeeded
NOTE: package kbproto-1_1.0.5-r0: task do_unpack: Started
NOTE: Running task 335 of 2451 (ID: 888, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_unpack)
NOTE: package shadow-native-4.1.4.3-r2: task do_fetch: Started
NOTE: package kbproto-1_1.0.5-r0: task do_unpack: Succeeded
NOTE: package inputproto-1_2.0.2-r0: task do_patch: Started
NOTE: package inputproto-1_2.0.2-r0: task do_patch: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_unpack: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_patch: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_unpack: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_unpack: Succeeded
NOTE: package xcmiscproto-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 336 of 2451 (ID: 170, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_fetch)
NOTE: package shadow-native-4.1.4.3-r2: task do_fetch: Succeeded
NOTE: Running task 337 of 2451 (ID: 2264, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_patch)
NOTE: Running task 338 of 2451 (ID: 2275, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_patch)
NOTE: Running task 339 of 2451 (ID: 2433, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_fetch)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 340 of 2451 (ID: 2253, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_patch)
NOTE: Running task 341 of 2451 (ID: 877, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_unpack)
NOTE: package xextproto-1_7.2.0-r0: task do_unpack: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 342 of 2451 (ID: 2242, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_patch)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 343 of 2451 (ID: 2220, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_patch)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_unpack: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 344 of 2451 (ID: 889, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_patch)
NOTE: package shadow-4.1.4.3-r5: task do_fetch: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_patch: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_patch: Succeeded
NOTE: package xcmiscproto-1_1.2.1-r0: task do_patch: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_patch: Succeeded
NOTE: package shadow-native-4.1.4.3-r2: task do_unpack: Started
NOTE: Running task 345 of 2451 (ID: 1761, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb, do_fetch)
NOTE: Running task 346 of 2451 (ID: 1750, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_fetch)
NOTE: package kbproto-1_1.0.5-r0: task do_patch: Started
NOTE: package kbproto-1_1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 347 of 2451 (ID: 793, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_fetch)
NOTE: package util-macros-native-1_1.15.0-r0: task do_fetch: Started
NOTE: package util-macros-native-1_1.15.0-r0: task do_fetch: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_patch: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_patch: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_patch: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r0: task do_patch: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_patch: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_patch: Succeeded
NOTE: Running task 348 of 2451 (ID: 2429, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_unpack)
NOTE: Running task 349 of 2451 (ID: 1904, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_fetch)
NOTE: Running task 351 of 2451 (ID: 2195, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_populate_lic)
NOTE: Running task 352 of 2451 (ID: 1717, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_fetch)
NOTE: package libsm-1_1.2.0-r1: task do_fetch: Started
NOTE: package libsm-1_1.2.0-r1: task do_fetch: Succeeded
NOTE: Running task 353 of 2451 (ID: 1757, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb, do_unpack)
NOTE: package dbus-1.4.16-r0: task do_fetch: Started
NOTE: package dbus-1.4.16-r0: task do_fetch: Succeeded
NOTE: Running task 354 of 2451 (ID: 789, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_unpack)
NOTE: package guilt-native-0.33-r1: task do_fetch: Started
NOTE: package xtrans-1_1.2.6-r0: task do_populate_lic: Started
NOTE: package libffi-3.0.9-r2: task do_fetch: Started
NOTE: package libffi-3.0.9-r2: task do_fetch: Succeeded
NOTE: package libx11-1.4.4-r0: task do_fetch: Started
NOTE: package libx11-1.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 355 of 2451 (ID: 1746, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_unpack)
NOTE: Running task 356 of 2451 (ID: 1713, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_unpack)
NOTE: package guilt-native-0.33-r1: task do_fetch: Succeeded
NOTE: Running task 357 of 2451 (ID: 1900, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_unpack)
NOTE: package libsm-1_1.2.0-r1: task do_unpack: Started
NOTE: package util-macros-native-1_1.15.0-r0: task do_unpack: Started
NOTE: package dbus-1.4.16-r0: task do_unpack: Started
NOTE: package libsm-1_1.2.0-r1: task do_unpack: Succeeded
NOTE: package util-macros-native-1_1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 358 of 2451 (ID: 2430, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_patch)
NOTE: package xtrans-1_1.2.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 359 of 2451 (ID: 1758, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb, do_patch)
NOTE: Running task 360 of 2451 (ID: 1706, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_fetch)
NOTE: package dbus-1.4.16-r0: task do_unpack: Succeeded
NOTE: package shadow-4.1.4.3-r5: task do_fetch: Succeeded
NOTE: package libffi-3.0.9-r2: task do_unpack: Started
NOTE: package libffi-3.0.9-r2: task do_unpack: Succeeded
NOTE: package guilt-native-0.33-r1: task do_unpack: Started
NOTE: Running task 361 of 2451 (ID: 166, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_unpack)
NOTE: Running task 362 of 2451 (ID: 790, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_patch)
NOTE: Running task 363 of 2451 (ID: 1714, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_patch)
NOTE: package shadow-native-4.1.4.3-r2: task do_unpack: Succeeded
NOTE: Running task 364 of 2451 (ID: 878, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_patch)
NOTE: package libx11-1.4.4-r0: task do_unpack: Started
NOTE: package libsm-1_1.2.0-r1: task do_patch: Started
NOTE: package libsm-1_1.2.0-r1: task do_patch: Succeeded
NOTE: Running task 365 of 2451 (ID: 760, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_fetch)
NOTE: package util-macros-native-1_1.15.0-r0: task do_patch: Started
NOTE: package util-macros-native-1_1.15.0-r0: task do_patch: Succeeded
NOTE: package zip-3.0-r0: task do_fetch: Started
NOTE: package zip-3.0-r0: task do_fetch: Succeeded
NOTE: package guilt-native-0.33-r1: task do_unpack: Succeeded
NOTE: Running task 366 of 2451 (ID: 2434, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_configure)
NOTE: package libffi-3.0.9-r2: task do_patch: Started
NOTE: package shadow-native-4.1.4.3-r2: task do_patch: Started
NOTE: package dbus-1.4.16-r0: task do_patch: Started
NOTE: Running task 367 of 2451 (ID: 1901, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_patch)
NOTE: Running task 368 of 2451 (ID: 1702, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_unpack)
NOTE: package libffi-3.0.9-r2: task do_patch: Succeeded
NOTE: Running task 369 of 2451 (ID: 875, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_populate_lic)
NOTE: package shadow-4.1.4.3-r5: task do_unpack: Started
NOTE: package glib-2.0-1_2.30.0-r4: task do_fetch: Started
NOTE: package glib-2.0-1_2.30.0-r4: task do_fetch: Succeeded
NOTE: package dbus-1.4.16-r0: task do_patch: Succeeded
NOTE: package zip-3.0-r0: task do_unpack: Started
NOTE: package guilt-native-0.33-r1: task do_patch: Started
NOTE: Running task 370 of 2451 (ID: 1178, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_fetch)
NOTE: Running task 371 of 2451 (ID: 756, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_unpack)
NOTE: package util-macros-native-1_1.15.0-r0: task do_configure: Started
NOTE: package zip-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 372 of 2451 (ID: 1703, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_patch)
NOTE: package base-passwd-3.5.22-r9: task do_populate_lic: Started
NOTE: package update-modules-1.0-r10: task do_fetch: Started
NOTE: package update-modules-1.0-r10: task do_fetch: Succeeded
NOTE: package glib-2.0-1_2.30.0-r4: task do_unpack: Started
NOTE: Running task 373 of 2451 (ID: 1174, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_unpack)
NOTE: package zip-3.0-r0: task do_patch: Started
NOTE: package zip-3.0-r0: task do_patch: Succeeded
NOTE: Running task 374 of 2451 (ID: 1167, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_fetch)
NOTE: package base-passwd-3.5.22-r9: task do_populate_lic: Succeeded
NOTE: Running task 375 of 2451 (ID: 2217, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_populate_lic)
NOTE: package update-modules-1.0-r10: task do_unpack: Started
NOTE: package module-init-tools-cross-3.16-r0: task do_fetch: Started
NOTE: package libx11-1.4.4-r0: task do_unpack: Succeeded
NOTE: package update-modules-1.0-r10: task do_unpack: Succeeded
NOTE: Running task 376 of 2451 (ID: 1747, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_patch)
NOTE: Running task 377 of 2451 (ID: 1175, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_patch)
NOTE: package module-init-tools-cross-3.16-r0: task do_fetch: Succeeded
NOTE: Running task 378 of 2451 (ID: 1163, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_unpack)
NOTE: package libxau-1_1.0.6-r0: task do_populate_lic: Started
NOTE: package shadow-native-4.1.4.3-r2: task do_patch: Succeeded
NOTE: Running task 379 of 2451 (ID: 882, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_configure)
NOTE: package update-modules-1.0-r10: task do_patch: Started
NOTE: package update-modules-1.0-r10: task do_patch: Succeeded
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_unpack: Succeeded
NOTE: package module-init-tools-cross-3.16-r0: task do_unpack: Started
NOTE: Running task 381 of 2451 (ID: 2373, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_headerfix)
NOTE: Running noexec task 385 of 2451 (ID: 1669, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_patch)
NOTE: Running task 386 of 2451 (ID: 1677, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_populate_lic)
NOTE: package shadow-4.1.4.3-r5: task do_unpack: Succeeded
NOTE: package libxau-1_1.0.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 387 of 2451 (ID: 167, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_patch)
NOTE: Running task 388 of 2451 (ID: 1179, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_configure)
NOTE: package libx11-1.4.4-r0: task do_patch: Started
NOTE: package module-init-tools-cross-3.16-r0: task do_unpack: Succeeded
NOTE: package shadow-native-4.1.4.3-r2: task do_configure: Started
NOTE: Running task 389 of 2451 (ID: 1164, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_patch)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_headerfix: Started
NOTE: package libgcc-4.5-r43+svnr178923: task do_populate_lic: Started
WARNING: libgcc: No generic license file exists for: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: libgcc: There is also no SPDXLICENSEMAP for this license type: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package shadow-4.1.4.3-r5: task do_patch: Started
NOTE: package update-modules-1.0-r10: task do_configure: Started
NOTE: package libx11-1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 390 of 2451 (ID: 2206, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_populate_lic)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_headerfix: Succeeded
NOTE: package libgcc-4.5-r43+svnr178923: task do_populate_lic: Succeeded
NOTE: package update-modules-1.0-r10: task do_configure: Succeeded
NOTE: Running task 398 of 2451 (ID: 686, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_populate_lic)
NOTE: Running task 399 of 2451 (ID: 1689, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_populate_lic)
NOTE: Running task 400 of 2451 (ID: 698, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_populate_lic)
NOTE: package module-init-tools-cross-3.16-r0: task do_patch: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_lic: Started
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_populate_lic: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_populate_lic: Started
WARNING: gcc-cross-intermediate: No generic license file exists for: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross-intermediate: There is also no SPDXLICENSEMAP for this license type: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_populate_lic: Started
WARNING: gcc-runtime: No generic license file exists for: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-runtime: There is also no SPDXLICENSEMAP for this license type: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross: No generic license file exists for: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross: There is also no SPDXLICENSEMAP for this license type: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 401 of 2451 (ID: 1180, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_compile)
NOTE: package module-init-tools-cross-3.16-r0: task do_patch: Succeeded
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_populate_lic: Succeeded
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_populate_lic: Succeeded
NOTE: Running task 402 of 2451 (ID: 1168, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_configure)
NOTE: Running task 403 of 2451 (ID: 1695, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_fetch)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_populate_lic: Succeeded
NOTE: Running task 405 of 2451 (ID: 1799, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_populate_lic)
NOTE: Running task 406 of 2451 (ID: 1788, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_populate_lic)
NOTE: package update-modules-1.0-r10: task do_compile: Started
NOTE: package update-modules-1.0-r10: task do_compile: Succeeded
NOTE: package cracklib-2.8.18-r1: task do_populate_lic: Started
NOTE: Running task 407 of 2451 (ID: 1176, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_install)
NOTE: package flex-2.5.35-r2: task do_populate_lic: Started
NOTE: package module-init-tools-cross-3.16-r0: task do_configure: Started
NOTE: package attr-2.4.46-r2: task do_fetch: Started
NOTE: package attr-2.4.46-r2: task do_fetch: Succeeded
NOTE: Running task 408 of 2451 (ID: 1691, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_unpack)
NOTE: package guilt-native-0.33-r1: task do_patch: Succeeded
NOTE: package zlib-native-1.2.5-r1: task do_configure: Succeeded
NOTE: Running task 409 of 2451 (ID: 594, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_compile)
NOTE: Running task 410 of 2451 (ID: 1905, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_configure)
NOTE: package cracklib-2.8.18-r1: task do_populate_lic: Succeeded
NOTE: package shadow-4.1.4.3-r5: task do_patch: Succeeded
NOTE: Running task 411 of 2451 (ID: 1777, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_populate_lic)
NOTE: Running task 412 of 2451 (ID: 842, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_populate_lic)
NOTE: package update-modules-1.0-r10: task do_install: Started
NOTE: package flex-2.5.35-r2: task do_populate_lic: Succeeded
NOTE: Running task 413 of 2451 (ID: 1084, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_populate_lic)
NOTE: package bzip2-native-1.0.6-r3: task do_configure: Succeeded
NOTE: Running task 414 of 2451 (ID: 2147, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_compile)
NOTE: package guilt-native-0.33-r1: task do_configure: Started
NOTE: package guilt-native-0.33-r1: task do_configure: Succeeded
NOTE: package update-modules-1.0-r10: task do_install: Succeeded
NOTE: package attr-2.4.46-r2: task do_unpack: Started
NOTE: package zlib-native-1.2.5-r1: task do_compile: Started
NOTE: Running task 415 of 2451 (ID: 1177, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_populate_sysroot)
NOTE: Running task 416 of 2451 (ID: 1906, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_compile)
NOTE: package attr-2.4.46-r2: task do_unpack: Succeeded
NOTE: package bison-2.5-r1: task do_populate_lic: Started
NOTE: Running task 417 of 2451 (ID: 1692, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_patch)
NOTE: package libpam-1.1.4-r2: task do_populate_lic: Started
NOTE: package update-modules-1.0-r10: task do_populate_sysroot: Started
NOTE: package zlib-1.2.5-r1: task do_populate_lic: Started
NOTE: package bison-2.5-r1: task do_populate_lic: Succeeded
NOTE: Running task 418 of 2451 (ID: 897, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_populate_lic)
NOTE: package guilt-native-0.33-r1: task do_compile: Started
NOTE: package bzip2-native-1.0.6-r3: task do_compile: Started
NOTE: package libpam-1.1.4-r2: task do_populate_lic: Succeeded
NOTE: Running task 420 of 2451 (ID: 175, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_populate_lic)
NOTE: package zlib-1.2.5-r1: task do_populate_lic: Succeeded
NOTE: Running task 421 of 2451 (ID: 320, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_populate_lic)
NOTE: package guilt-native-0.33-r1: task do_compile: Succeeded
NOTE: package attr-2.4.46-r2: task do_patch: Started
NOTE: Running task 422 of 2451 (ID: 1902, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_install)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_populate_lic: Started
NOTE: package update-modules-1.0-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 423 of 2451 (ID: 2427, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_populate_lic)
NOTE: package guilt-native-0.33-r1: task do_install: Started
NOTE: package shadow-4.1.4.3-r5: task do_populate_lic: Started
NOTE: package util-linux-2.19.1-r11: task do_populate_lic: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_populate_lic: Succeeded
NOTE: package attr-2.4.46-r2: task do_patch: Succeeded
NOTE: package libpthread-stubs-0.3-r0: task do_populate_lic: Started
NOTE: package guilt-native-0.33-r1: task do_install: Succeeded
NOTE: Running task 426 of 2451 (ID: 2394, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_populate_lic)
NOTE: Running task 427 of 2451 (ID: 1246, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_populate_lic)
NOTE: Running task 428 of 2451 (ID: 1903, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_populate_sysroot)
NOTE: package shadow-4.1.4.3-r5: task do_populate_lic: Succeeded
NOTE: Running task 429 of 2451 (ID: 2327, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_populate_lic)
NOTE: package util-linux-2.19.1-r11: task do_populate_lic: Succeeded
NOTE: Running task 431 of 2451 (ID: 2305, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_populate_lic)
NOTE: package glib-2.0-1_2.30.0-r4: task do_unpack: Succeeded
NOTE: package xcb-proto-1.6-r4: task do_populate_lic: Started
NOTE: package libpthread-stubs-0.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 432 of 2451 (ID: 757, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_patch)
NOTE: Running task 433 of 2451 (ID: 2294, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_populate_lic)
NOTE: package guilt-native-0.33-r1: task do_populate_sysroot: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_populate_lic: Started
NOTE: package libice-1_1.0.7-r0: task do_populate_lic: Started
NOTE: package glib-2.0-1_2.30.0-r4: task do_patch: Started
NOTE: package xcb-proto-1.6-r4: task do_populate_lic: Succeeded
NOTE: Running task 434 of 2451 (ID: 2283, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_populate_lic)
NOTE: package libxcb-1.7-r2: task do_populate_lic: Started
NOTE: package inputproto-1_2.0.2-r0: task do_populate_lic: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_populate_lic: Succeeded
NOTE: Running task 435 of 2451 (ID: 2272, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_populate_lic)
NOTE: package libxcb-1.7-r2: task do_populate_lic: Succeeded
NOTE: package libice-1_1.0.7-r0: task do_populate_lic: Succeeded
NOTE: Running task 436 of 2451 (ID: 2261, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_populate_lic)
NOTE: Running task 437 of 2451 (ID: 2250, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_populate_lic)
NOTE: package inputproto-1_2.0.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 438 of 2451 (ID: 2228, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_populate_lic)
NOTE: package kbproto-1_1.0.5-r0: task do_populate_lic: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_populate_lic: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_populate_lic: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_populate_lic: Started
NOTE: package kbproto-1_1.0.5-r0: task do_populate_lic: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_populate_lic: Started
NOTE: Running task 439 of 2451 (ID: 1766, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb, do_populate_lic)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 440 of 2451 (ID: 1755, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_populate_lic)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_populate_lic: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_populate_lic: Succeeded
NOTE: package guilt-native-0.33-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 441 of 2451 (ID: 798, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_populate_lic)
NOTE: Running task 442 of 2451 (ID: 1882, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_fetch)
NOTE: Running task 443 of 2451 (ID: 1057, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_fetch)
NOTE: package glib-2.0-1_2.30.0-r4: task do_patch: Succeeded
NOTE: package zlib-native-1.2.5-r1: task do_compile: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 444 of 2451 (ID: 590, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_install)
NOTE: Running task 445 of 2451 (ID: 1893, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_fetch)
NOTE: Running task 446 of 2451 (ID: 61, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_fetch)
NOTE: package libusb1-1.0.8-r0: task do_fetch: Started
NOTE: package libusb1-1.0.8-r0: task do_fetch: Succeeded
NOTE: package libsm-1_1.2.0-r1: task do_populate_lic: Started
NOTE: package libx11-1.4.4-r0: task do_populate_lic: Started
NOTE: package dbus-1.4.16-r0: task do_populate_lic: Started
NOTE: Running task 447 of 2451 (ID: 1878, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_unpack)
NOTE: package zlib-native-1.2.5-r1: task do_install: Started
NOTE: package dbus-glib-native-0.92-r1: task do_fetch: Started
NOTE: package dbus-glib-native-0.92-r1: task do_fetch: Succeeded
NOTE: package libsm-1_1.2.0-r1: task do_populate_lic: Succeeded
NOTE: package libx11-1.4.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 448 of 2451 (ID: 804, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_fetch)
NOTE: Running task 449 of 2451 (ID: 1112, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_fetch)
NOTE: Running task 450 of 2451 (ID: 1889, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_unpack)
NOTE: package intltool-native-0.40.6-r5: task do_fetch: Started
NOTE: package intltool-native-0.40.6-r5: task do_fetch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_fetch: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_fetch: Succeeded
NOTE: Running task 451 of 2451 (ID: 1053, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_unpack)
NOTE: Running task 452 of 2451 (ID: 57, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_unpack)
NOTE: package zlib-native-1.2.5-r1: task do_install: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_unpack: Started
NOTE: package dbus-1.4.16-r0: task do_populate_lic: Succeeded
NOTE: Running task 453 of 2451 (ID: 1860, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_fetch)
NOTE: Running task 454 of 2451 (ID: 591, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_populate_sysroot)
NOTE: package dbus-glib-native-0.92-r1: task do_unpack: Started
NOTE: package libusb1-1.0.8-r0: task do_unpack: Succeeded
NOTE: package libcap-2.22-r2: task do_fetch: Started
NOTE: package libcap-2.22-r2: task do_fetch: Succeeded
NOTE: package libusb-compat-1_0.1.3-r0: task do_fetch: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 455 of 2451 (ID: 1879, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_patch)
NOTE: Running task 456 of 2451 (ID: 800, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_unpack)
NOTE: Running task 457 of 2451 (ID: 1108, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_unpack)
NOTE: package dbus-glib-native-0.92-r1: task do_unpack: Succeeded
NOTE: package intltool-native-0.40.6-r5: task do_unpack: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_unpack: Started
NOTE: Running task 458 of 2451 (ID: 1890, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_patch)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_unpack: Succeeded
NOTE: Running task 459 of 2451 (ID: 58, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_patch)
NOTE: package libxml-parser-perl-native-2.41-r1: task do_fetch: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_fetch: Succeeded
NOTE: package libcap-2.22-r2: task do_unpack: Started
NOTE: package libcap-2.22-r2: task do_unpack: Succeeded
NOTE: package zlib-native-1.2.5-r1: task do_populate_sysroot: Started
NOTE: Running task 460 of 2451 (ID: 1856, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_unpack)
NOTE: Running task 461 of 2451 (ID: 801, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_patch)
NOTE: package libusb-compat-1_0.1.3-r0: task do_unpack: Started
NOTE: package intltool-native-0.40.6-r5: task do_unpack: Succeeded
NOTE: Running task 462 of 2451 (ID: 1054, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_patch)
NOTE: package libusb1-1.0.8-r0: task do_patch: Started
NOTE: package libusb1-1.0.8-r0: task do_patch: Succeeded
NOTE: package dbus-glib-native-0.92-r1: task do_patch: Started
NOTE: Running task 463 of 2451 (ID: 749, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_fetch)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_patch: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 464 of 2451 (ID: 1109, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_patch)
NOTE: package libxml-parser-perl-native-2.41-r1: task do_unpack: Started
NOTE: package intltool-native-0.40.6-r5: task do_patch: Started
NOTE: package libcap-2.22-r2: task do_patch: Started
NOTE: package libcap-2.22-r2: task do_patch: Succeeded
NOTE: package dbus-glib-native-0.92-r1: task do_patch: Succeeded
NOTE: package libxml-parser-perl-native-2.41-r1: task do_unpack: Succeeded
NOTE: Running task 465 of 2451 (ID: 1123, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_fetch)
NOTE: Running task 466 of 2451 (ID: 1857, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_patch)
NOTE: Running task 467 of 2451 (ID: 1722, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_populate_lic)
NOTE: package acl-2.2.51-r2: task do_fetch: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_patch: Started
NOTE: package acl-2.2.51-r2: task do_fetch: Succeeded
NOTE: Running task 468 of 2451 (ID: 745, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_unpack)
NOTE: package intltool-native-0.40.6-r5: task do_patch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_patch: Succeeded
NOTE: package bzip2-native-1.0.6-r3: task do_compile: Succeeded
NOTE: package dbus-glib-0.92-r1: task do_fetch: Started
NOTE: package dbus-glib-0.92-r1: task do_fetch: Succeeded
NOTE: package libxml-parser-perl-native-2.41-r1: task do_patch: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_patch: Succeeded
NOTE: package libffi-3.0.9-r2: task do_populate_lic: Started
NOTE: Running task 469 of 2451 (ID: 2143, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_install)
NOTE: package libusb-compat-1_0.1.3-r0: task do_patch: Succeeded
NOTE: Running task 470 of 2451 (ID: 62, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_configure)
NOTE: Running task 471 of 2451 (ID: 1711, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_populate_lic)
NOTE: Running task 476 of 2451 (ID: 1189, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_fetch)
NOTE: package acl-2.2.51-r2: task do_unpack: Started
NOTE: Running task 477 of 2451 (ID: 1119, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_unpack)
NOTE: Running task 478 of 2451 (ID: 765, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_populate_lic)
NOTE: package acl-2.2.51-r2: task do_unpack: Succeeded
NOTE: package libffi-3.0.9-r2: task do_populate_lic: Succeeded
NOTE: Running task 479 of 2451 (ID: 738, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_fetch)
NOTE: Running task 480 of 2451 (ID: 746, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_patch)
NOTE: package dbus-glib-0.92-r1: task do_unpack: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_configure: Started
NOTE: package zip-3.0-r0: task do_populate_lic: Started
WARNING: zip: No generic license file exists for: Info-ZIP at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: zip: There is also no SPDXLICENSEMAP for this license type: Info-ZIP at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package xz-native-5.0.2-r0: task do_fetch: Started
NOTE: package bzip2-native-1.0.6-r3: task do_install: Started
NOTE: package dbus-glib-0.92-r1: task do_unpack: Succeeded
NOTE: package glib-2.0-1_2.30.0-r4: task do_populate_lic: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_configure: Succeeded
NOTE: package xz-native-5.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 481 of 2451 (ID: 63, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_compile)
NOTE: package acl-2.2.51-r2: task do_patch: Started
NOTE: Running task 482 of 2451 (ID: 1185, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_unpack)
NOTE: Running task 483 of 2451 (ID: 1120, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_patch)
NOTE: package usbutils-0.91-r3: task do_fetch: Started
NOTE: package usbutils-0.91-r3: task do_fetch: Succeeded
NOTE: package zip-3.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 484 of 2451 (ID: 2355, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_fetch)
NOTE: package util-macros-native-1_1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 485 of 2451 (ID: 734, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_unpack)
NOTE: Running task 486 of 2451 (ID: 2435, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_compile)
NOTE: package acl-2.2.51-r2: task do_patch: Succeeded
NOTE: Running task 487 of 2451 (ID: 1700, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_populate_lic)
NOTE: package dbus-glib-0.92-r1: task do_patch: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_compile: Started
NOTE: package bzip2-native-1.0.6-r3: task do_install: Succeeded
NOTE: package glib-2.0-1_2.30.0-r4: task do_populate_lic: Succeeded
NOTE: package xz-native-5.0.2-r0: task do_unpack: Started
NOTE: Running task 488 of 2451 (ID: 2144, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_populate_sysroot)
NOTE: Running task 489 of 2451 (ID: 2003, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_fetch)
NOTE: package libxml2-2.7.8-r4: task do_fetch: Started
NOTE: package usbutils-0.91-r3: task do_unpack: Started
NOTE: package util-macros-native-1_1.15.0-r0: task do_compile: Started
NOTE: package attr-2.4.46-r2: task do_populate_lic: Started
NOTE: package libxml2-2.7.8-r4: task do_fetch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_compile: Succeeded
NOTE: Running task 490 of 2451 (ID: 59, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_install)
NOTE: Running task 491 of 2451 (ID: 2351, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_unpack)
NOTE: package dbus-glib-0.92-r1: task do_patch: Succeeded
NOTE: Running task 492 of 2451 (ID: 1959, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_fetch)
NOTE: package usbutils-0.91-r3: task do_unpack: Succeeded
NOTE: package xz-native-5.0.2-r0: task do_unpack: Succeeded
NOTE: package util-macros-native-1_1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 493 of 2451 (ID: 1186, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_patch)
NOTE: package bzip2-native-1.0.6-r3: task do_populate_sysroot: Started
NOTE: Running task 494 of 2451 (ID: 735, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_patch)
NOTE: Running task 495 of 2451 (ID: 2431, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_install)
NOTE: package shared-mime-info-native-0.91-r3: task do_fetch: Started
NOTE: package attr-2.4.46-r2: task do_populate_lic: Succeeded
NOTE: Running task 496 of 2451 (ID: 1937, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_fetch)
NOTE: package shared-mime-info-native-0.91-r3: task do_fetch: Succeeded
NOTE: Running task 497 of 2451 (ID: 782, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_fetch)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_install: Started
NOTE: package libxml2-2.7.8-r4: task do_unpack: Started
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_install: Succeeded
NOTE: Running task 498 of 2451 (ID: 60, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_populate_sysroot)
NOTE: package gnome-common-2.28.0-r1: task do_fetch: Started
NOTE: package gnome-common-2.28.0-r1: task do_fetch: Succeeded
NOTE: package usbutils-0.91-r3: task do_patch: Started
NOTE: package usbutils-0.91-r3: task do_patch: Succeeded
NOTE: Running task 499 of 2451 (ID: 1955, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_unpack)
NOTE: Running task 500 of 2451 (ID: 2333, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_fetch)
NOTE: package ocf-linux-20100325-r3.0: task do_fetch: Started
NOTE: package ocf-linux-20100325-r3.0: task do_fetch: Succeeded
NOTE: package xz-native-5.0.2-r0: task do_patch: Started
NOTE: package xz-native-5.0.2-r0: task do_patch: Succeeded
NOTE: Running task 501 of 2451 (ID: 1190, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_configure)
NOTE: package util-macros-native-1_1.15.0-r0: task do_install: Started
NOTE: package readline-6.2-r0: task do_fetch: Started
NOTE: Running task 502 of 2451 (ID: 1933, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_unpack)
NOTE: package readline-6.2-r0: task do_fetch: Succeeded
NOTE: Running task 503 of 2451 (ID: 778, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_unpack)
NOTE: package libxml2-2.7.8-r4: task do_unpack: Succeeded
NOTE: Running task 504 of 2451 (ID: 2352, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_patch)
NOTE: package gnome-common-2.28.0-r1: task do_unpack: Started
NOTE: package libgpg-error-1.10-r1: task do_fetch: Started
NOTE: package libgpg-error-1.10-r1: task do_fetch: Succeeded
NOTE: package util-macros-native-1_1.15.0-r0: task do_install: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_populate_sysroot: Started
NOTE: Running task 505 of 2451 (ID: 2432, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_populate_sysroot)
NOTE: package ocf-linux-20100325-r3.0: task do_unpack: Started
NOTE: Running task 506 of 2451 (ID: 2329, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_unpack)
NOTE: package bzip2-native-1.0.6-r3: task do_populate_sysroot: Succeeded
NOTE: package ocf-linux-20100325-r3.0: task do_unpack: Succeeded
NOTE: Running task 507 of 2451 (ID: 1200, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_fetch)
NOTE: package xz-native-5.0.2-r0: task do_configure: Started
NOTE: package readline-6.2-r0: task do_unpack: Started
NOTE: Running task 508 of 2451 (ID: 1934, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_patch)
NOTE: package gnome-common-2.28.0-r1: task do_unpack: Succeeded
NOTE: package readline-6.2-r0: task do_unpack: Succeeded
NOTE: package libxml2-2.7.8-r4: task do_patch: Started
NOTE: Running task 509 of 2451 (ID: 1956, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_patch)
NOTE: Running task 510 of 2451 (ID: 779, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_patch)
NOTE: package libgpg-error-1.10-r1: task do_unpack: Started
NOTE: package openssl-1.0.0e-r14.4: task do_fetch: Started
NOTE: package ocf-linux-20100325-r3.0: task do_patch: Started
NOTE: package ocf-linux-20100325-r3.0: task do_patch: Succeeded
NOTE: package util-macros-native-1_1.15.0-r0: task do_populate_sysroot: Started
NOTE: package libxml2-2.7.8-r4: task do_patch: Succeeded
NOTE: Running task 511 of 2451 (ID: 1101, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_fetch)
NOTE: Running task 512 of 2451 (ID: 1926, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_fetch)
NOTE: package openssl-1.0.0e-r14.4: task do_fetch: Succeeded
NOTE: package opkg-utils-native-0.1.8+svnr4747-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 513 of 2451 (ID: 1915, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_fetch)
NOTE: Running task 514 of 2451 (ID: 1196, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_unpack)
NOTE: package readline-6.2-r0: task do_patch: Started
NOTE: package gnome-common-2.28.0-r1: task do_patch: Started
NOTE: package zlib-native-1.2.5-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 515 of 2451 (ID: 538, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_configure)
NOTE: package alsa-lib-1.0.24.1-r1: task do_fetch: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_fetch: Succeeded
NOTE: package libgpg-error-1.10-r1: task do_unpack: Succeeded
NOTE: Running task 516 of 2451 (ID: 571, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_configure)
NOTE: Running task 517 of 2451 (ID: 648, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_configure)
NOTE: package bzip2-1.0.6-r3: task do_fetch: Started
NOTE: package util-macros-native-1_1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: package bzip2-1.0.6-r3: task do_fetch: Succeeded
NOTE: package gnome-common-2.28.0-r1: task do_patch: Succeeded
NOTE: Running task 518 of 2451 (ID: 2312, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_configure)
NOTE: package libtool-2.4-r4: task do_fetch: Started
NOTE: Running task 519 of 2451 (ID: 2330, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_patch)
NOTE: package readline-6.2-r0: task do_patch: Succeeded
NOTE: Running task 520 of 2451 (ID: 1960, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_configure)
NOTE: Running task 521 of 2451 (ID: 1097, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_unpack)
NOTE: package openssl-1.0.0e-r14.4: task do_unpack: Started
NOTE: package libtool-2.4-r4: task do_fetch: Succeeded
NOTE: package elfutils-native-0.148-r3: task do_configure: Started
NOTE: Running task 522 of 2451 (ID: 1922, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_unpack)
NOTE: package curl-native-7.22.0-r0: task do_configure: Started
NOTE: package file-native-5.09-r0: task do_configure: Started
NOTE: package libgpg-error-1.10-r1: task do_patch: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_configure: Started
NOTE: package gnome-common-2.28.0-r1: task do_configure: Started
NOTE: package bzip2-1.0.6-r3: task do_unpack: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_unpack: Started
NOTE: package libgpg-error-1.10-r1: task do_patch: Succeeded
NOTE: package bzip2-1.0.6-r3: task do_unpack: Succeeded
NOTE: Running task 523 of 2451 (ID: 1911, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_unpack)
NOTE: Running task 524 of 2451 (ID: 1923, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_patch)
NOTE: package openssl-1.0.0e-r14.4: task do_unpack: Succeeded
NOTE: Running task 525 of 2451 (ID: 1197, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_patch)
NOTE: package alsa-lib-1.0.24.1-r1: task do_unpack: Succeeded
NOTE: Running task 526 of 2451 (ID: 1098, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_patch)
NOTE: package libtool-2.4-r4: task do_unpack: Started
NOTE: package bzip2-1.0.6-r3: task do_patch: Started
NOTE: package bzip2-1.0.6-r3: task do_patch: Succeeded
NOTE: Running task 527 of 2451 (ID: 1838, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_fetch)
NOTE: package openssl-1.0.0e-r14.4: task do_patch: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_patch: Started
NOTE: package libtool-2.4-r4: task do_unpack: Succeeded
NOTE: package libgcrypt-1.5.0-r0: task do_fetch: Started
NOTE: package libgcrypt-1.5.0-r0: task do_fetch: Succeeded
NOTE: package module-init-tools-cross-3.16-r0: task do_configure: Succeeded
NOTE: Running task 528 of 2451 (ID: 1169, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_compile)
NOTE: Running task 529 of 2451 (ID: 1834, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_unpack)
NOTE: Running task 530 of 2451 (ID: 1912, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_patch)
NOTE: package alsa-lib-1.0.24.1-r1: task do_patch: Succeeded
NOTE: Running task 531 of 2451 (ID: 1827, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_fetch)
NOTE: package flex-native-2.5.35-r2: task do_configure: Succeeded
NOTE: Running task 532 of 2451 (ID: 1070, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_compile)
NOTE: package libgcrypt-1.5.0-r0: task do_unpack: Started
NOTE: package libtool-2.4-r4: task do_patch: Started
NOTE: package module-init-tools-cross-3.16-r0: task do_compile: Started
NOTE: package libgcrypt-1.5.0-r0: task do_unpack: Succeeded
NOTE: package libtasn1-2.10-r0: task do_fetch: Started
NOTE: package libtasn1-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 533 of 2451 (ID: 1835, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_patch)
NOTE: Running task 534 of 2451 (ID: 1823, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_unpack)
NOTE: package flex-native-2.5.35-r2: task do_compile: Started
NOTE: package libgcrypt-1.5.0-r0: task do_patch: Started
NOTE: package libffi-native-3.0.9-r2: task do_configure: Succeeded
NOTE: Running task 535 of 2451 (ID: 1531, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_compile)
NOTE: package libtasn1-2.10-r0: task do_unpack: Started
NOTE: package libtasn1-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 536 of 2451 (ID: 1824, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_patch)
NOTE: package libgcrypt-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 537 of 2451 (ID: 1816, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_fetch)
NOTE: package libffi-native-3.0.9-r2: task do_compile: Started
NOTE: package libtasn1-2.10-r0: task do_patch: Started
NOTE: package libtasn1-2.10-r0: task do_patch: Succeeded
NOTE: package module-init-tools-cross-3.16-r0: task do_compile: Succeeded
NOTE: Running task 538 of 2451 (ID: 1165, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_install)
NOTE: Running task 539 of 2451 (ID: 826, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_fetch)
NOTE: package lzo-2.05-r0: task do_fetch: Started
NOTE: package lzo-2.05-r0: task do_fetch: Succeeded
NOTE: Running task 540 of 2451 (ID: 1812, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_unpack)
NOTE: package module-init-tools-cross-3.16-r0: task do_install: Started
NOTE: package tcp-wrappers-7.6-r7: task do_fetch: Started
NOTE: package tcp-wrappers-7.6-r7: task do_fetch: Succeeded
NOTE: package lzo-2.05-r0: task do_unpack: Started
NOTE: Running task 541 of 2451 (ID: 822, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_unpack)
NOTE: package module-init-tools-cross-3.16-r0: task do_install: Succeeded
NOTE: package lzo-2.05-r0: task do_unpack: Succeeded
NOTE: Running task 542 of 2451 (ID: 1166, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_populate_sysroot)
NOTE: Running task 543 of 2451 (ID: 1813, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_patch)
NOTE: package gperf-native-3.0.4-r0: task do_configure: Succeeded
NOTE: Running task 544 of 2451 (ID: 729, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_compile)
NOTE: package tcp-wrappers-7.6-r7: task do_unpack: Started
NOTE: package libtool-2.4-r4: task do_patch: Succeeded
NOTE: Running task 545 of 2451 (ID: 809, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_populate_lic)
NOTE: package module-init-tools-cross-3.16-r0: task do_populate_sysroot: Started
NOTE: package lzo-2.05-r0: task do_patch: Started
NOTE: package gperf-native-3.0.4-r0: task do_compile: Started
NOTE: package libcap-2.22-r2: task do_populate_lic: Started
NOTE: package libcap-2.22-r2: task do_populate_lic: Succeeded
NOTE: package lzo-2.05-r0: task do_patch: Succeeded
NOTE: Running task 546 of 2451 (ID: 1156, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_fetch)
NOTE: Running task 547 of 2451 (ID: 1887, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_populate_lic)
NOTE: package tcp-wrappers-7.6-r7: task do_unpack: Succeeded
NOTE: Running task 548 of 2451 (ID: 823, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_patch)
NOTE: package libusb1-1.0.8-r0: task do_populate_lic: Started
NOTE: package elfutils-0.148-r3: task do_fetch: Started
NOTE: package tcp-wrappers-7.6-r7: task do_patch: Started
NOTE: package elfutils-0.148-r3: task do_fetch: Succeeded
NOTE: Running task 549 of 2451 (ID: 1152, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_unpack)
NOTE: package libusb1-1.0.8-r0: task do_populate_lic: Succeeded
NOTE: Running task 550 of 2451 (ID: 1728, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_fetch)
NOTE: package module-init-tools-cross-3.16-r0: task do_populate_sysroot: Succeeded
NOTE: package flex-native-2.5.35-r2: task do_compile: Succeeded
NOTE: Running task 551 of 2451 (ID: 1134, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_fetch)
NOTE: Running task 552 of 2451 (ID: 1066, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_install)
NOTE: package openssl-1.0.0e-r14.4: task do_patch: Succeeded
NOTE: Running task 553 of 2451 (ID: 1117, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_populate_lic)
NOTE: package elfutils-0.148-r3: task do_unpack: Started
NOTE: package libffi-native-3.0.9-r2: task do_compile: Succeeded
NOTE: package unzip-native-1_6.0-r1: task do_fetch: Started
NOTE: package unzip-native-1_6.0-r1: task do_fetch: Succeeded
NOTE: Running task 554 of 2451 (ID: 1527, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_install)
NOTE: Running task 555 of 2451 (ID: 1724, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_unpack)
NOTE: package libpcap-1.1.1-r1.0: task do_fetch: Started
NOTE: package libpcap-1.1.1-r1.0: task do_fetch: Succeeded
NOTE: Running task 556 of 2451 (ID: 1130, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_unpack)
NOTE: package flex-native-2.5.35-r2: task do_install: Started
NOTE: package linux-libc-headers-3.1-r1: task do_unpack: Succeeded
NOTE: package libusb-compat-1_0.1.3-r0: task do_populate_lic: Started
NOTE: package gperf-native-3.0.4-r0: task do_compile: Succeeded
NOTE: Running task 557 of 2451 (ID: 1658, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_patch)
NOTE: Running task 558 of 2451 (ID: 725, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_install)
NOTE: package unzip-native-1_6.0-r1: task do_unpack: Started
NOTE: package libffi-native-3.0.9-r2: task do_install: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_populate_lic: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_unpack: Started
NOTE: package unzip-native-1_6.0-r1: task do_unpack: Succeeded
NOTE: Running task 560 of 2451 (ID: 1046, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_fetch)
NOTE: Running task 561 of 2451 (ID: 1725, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_patch)
NOTE: package linux-libc-headers-3.1-r1: task do_patch: Started
NOTE: package libpcap-1.1.1-r1.0: task do_unpack: Succeeded
NOTE: Running task 562 of 2451 (ID: 1131, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_patch)
NOTE: package gperf-native-3.0.4-r0: task do_install: Started
NOTE: package libdaemon-0.14-r0: task do_fetch: Started
NOTE: package libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: package unzip-native-1_6.0-r1: task do_patch: Started
NOTE: Running task 563 of 2451 (ID: 1042, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_unpack)
*** %n in writable segment detected ***
NOTE: package linux-libc-headers-3.1-r1: task do_patch: Succeeded
NOTE: package libffi-native-3.0.9-r2: task do_install: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_patch: Started
NOTE: Running task 564 of 2451 (ID: 1528, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_populate_sysroot)
NOTE: Running task 565 of 2451 (ID: 1662, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_configure)
NOTE: package gperf-native-3.0.4-r0: task do_install: Succeeded
NOTE: Running task 566 of 2451 (ID: 726, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_populate_sysroot)
NOTE: package unzip-native-1_6.0-r1: task do_patch: Succeeded
NOTE: Running task 568 of 2451 (ID: 1666, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_populate_lic)
NOTE: package elfutils-0.148-r3: task do_unpack: Succeeded
NOTE: package libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 569 of 2451 (ID: 1153, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_patch)
NOTE: package libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: package libffi-native-3.0.9-r2: task do_populate_sysroot: Started
NOTE: package linux-libc-headers-3.1-r1: task do_configure: Started
NOTE: Running task 570 of 2451 (ID: 1043, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_patch)
NOTE: package linux-libc-headers-3.1-r1: task do_populate_lic: Started
NOTE: package gperf-native-3.0.4-r0: task do_populate_sysroot: Started
NOTE: package linux-libc-headers-3.1-r1: task do_populate_lic: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_patch: Succeeded
NOTE: package popt-native-1.16-r0: task do_configure: Succeeded
NOTE: Running task 571 of 2451 (ID: 1597, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_compile)
NOTE: Running task 572 of 2451 (ID: 991, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_fetch)
NOTE: Running task 574 of 2451 (ID: 1729, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_configure)
NOTE: package flex-native-2.5.35-r2: task do_install: Succeeded
NOTE: Running task 575 of 2451 (ID: 1067, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_populate_sysroot)
NOTE: package elfutils-0.148-r3: task do_patch: Started
NOTE: package libdaemon-0.14-r0: task do_patch: Started
NOTE: package libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: package gperf-native-3.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 577 of 2451 (ID: 1024, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_fetch)
NOTE: Running task 578 of 2451 (ID: 1128, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_populate_lic)
NOTE: package libffi-native-3.0.9-r2: task do_populate_sysroot: Succeeded
NOTE: package systemd-systemctl-native-1.0-r0: task do_fetch: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 579 of 2451 (ID: 848, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_fetch)
NOTE: Running task 580 of 2451 (ID: 987, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_unpack)
NOTE: package flex-native-2.5.35-r2: task do_populate_sysroot: Started
NOTE: package libnl-1_2.0-r6: task do_fetch: Started
NOTE: package libnl-1_2.0-r6: task do_fetch: Succeeded
NOTE: package popt-native-1.16-r0: task do_compile: Started
NOTE: package unzip-native-1_6.0-r1: task do_configure: Started
NOTE: Running task 581 of 2451 (ID: 1020, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_unpack)
NOTE: package unzip-native-1_6.0-r1: task do_configure: Succeeded
NOTE: Running task 582 of 2451 (ID: 1730, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_compile)
NOTE: package dbus-glib-0.92-r1: task do_populate_lic: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_unpack: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 583 of 2451 (ID: 988, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_patch)
NOTE: package vala-native-0.12.1-r0: task do_fetch: Started
NOTE: package dbus-glib-0.92-r1: task do_populate_lic: Succeeded
NOTE: package libnl-1_2.0-r6: task do_unpack: Started
NOTE: package vala-native-0.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 584 of 2451 (ID: 815, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_fetch)
NOTE: Running task 585 of 2451 (ID: 844, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_unpack)
NOTE: package unzip-native-1_6.0-r1: task do_compile: Started
NOTE: package libnl-1_2.0-r6: task do_unpack: Succeeded
NOTE: Running task 586 of 2451 (ID: 1021, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_patch)
NOTE: package flex-native-2.5.35-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 587 of 2451 (ID: 771, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_fetch)
NOTE: package libcgroup-0.37.1-r0: task do_fetch: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_patch: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_patch: Succeeded
NOTE: package libcgroup-0.37.1-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 2451 (ID: 754, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_populate_lic)
NOTE: Running task 589 of 2451 (ID: 811, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_unpack)
NOTE: package vala-native-0.12.1-r0: task do_unpack: Started
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_fetch: Started
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_fetch: Succeeded
NOTE: package libnl-1_2.0-r6: task do_patch: Started
NOTE: Running task 590 of 2451 (ID: 2444, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_fetch)
NOTE: package acl-2.2.51-r2: task do_populate_lic: Started
NOTE: package libcgroup-0.37.1-r0: task do_unpack: Started
NOTE: package acl-2.2.51-r2: task do_populate_lic: Succeeded
NOTE: package libcgroup-0.37.1-r0: task do_unpack: Succeeded
NOTE: Running task 591 of 2451 (ID: 812, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_patch)
NOTE: package eggdbus-native-0.6-r1: task do_fetch: Started
NOTE: Running task 592 of 2451 (ID: 2014, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_fetch)
NOTE: package eggdbus-native-0.6-r1: task do_fetch: Succeeded
NOTE: Running task 593 of 2451 (ID: 2440, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_unpack)
NOTE: package libnl-1_2.0-r6: task do_patch: Succeeded
NOTE: package gnome-common-2.28.0-r1: task do_configure: Succeeded
NOTE: Running task 594 of 2451 (ID: 1961, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_compile)
NOTE: Running task 595 of 2451 (ID: 1992, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_fetch)
NOTE: package libcgroup-0.37.1-r0: task do_patch: Started
NOTE: package libcgroup-0.37.1-r0: task do_patch: Succeeded
NOTE: Running task 596 of 2451 (ID: 1981, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.3.bb, do_fetch)
NOTE: package shared-mime-info-0.91-r3: task do_fetch: Started
NOTE: package shared-mime-info-0.91-r3: task do_fetch: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_fetch: Started
NOTE: package gconf-native-2.6.1-r1: task do_fetch: Succeeded
NOTE: Running task 597 of 2451 (ID: 2058, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_fetch)
NOTE: Running task 598 of 2451 (ID: 1988, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_unpack)
NOTE: package gnome-common-2.28.0-r1: task do_compile: Started
NOTE: package eggdbus-native-0.6-r1: task do_unpack: Started
NOTE: package gnome-common-2.28.0-r1: task do_compile: Succeeded
NOTE: package gconf-3.2.3-r1: task do_fetch: Started
NOTE: package gconf-3.2.3-r1: task do_fetch: Succeeded
NOTE: Running task 599 of 2451 (ID: 1977, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.3.bb, do_unpack)
NOTE: Running task 600 of 2451 (ID: 1957, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_install)
NOTE: package eggdbus-native-0.6-r1: task do_unpack: Succeeded
NOTE: package gdbm-1.8.3-r4: task do_fetch: Started
NOTE: package gdbm-1.8.3-r4: task do_fetch: Succeeded
NOTE: Running task 601 of 2451 (ID: 2441, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_patch)
NOTE: Running task 602 of 2451 (ID: 2054, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_unpack)
NOTE: package gconf-native-2.6.1-r1: task do_unpack: Started
NOTE: package popt-native-1.16-r0: task do_compile: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_unpack: Succeeded
NOTE: package vala-native-0.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 603 of 2451 (ID: 1593, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_install)
NOTE: Running task 604 of 2451 (ID: 845, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_patch)
NOTE: Running task 605 of 2451 (ID: 1989, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_patch)
NOTE: package tcp-wrappers-7.6-r7: task do_patch: Succeeded
NOTE: Running task 606 of 2451 (ID: 2047, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_fetch)
NOTE: package gconf-3.2.3-r1: task do_unpack: Started
NOTE: package gnome-common-2.28.0-r1: task do_install: Started
NOTE: package eggdbus-native-0.6-r1: task do_patch: Started
NOTE: package gdbm-1.8.3-r4: task do_unpack: Started
NOTE: package popt-native-1.16-r0: task do_install: Started
NOTE: package vala-native-0.12.1-r0: task do_patch: Started
NOTE: package vala-native-0.12.1-r0: task do_patch: Succeeded
NOTE: package elfutils-0.148-r3: task do_patch: Succeeded
NOTE: Running task 607 of 2451 (ID: 969, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.11.bb, do_fetch)
NOTE: Running task 608 of 2451 (ID: 1739, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_fetch)
NOTE: package gdbm-1.8.3-r4: task do_unpack: Succeeded
NOTE: Running task 609 of 2451 (ID: 2055, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_patch)
NOTE: package gconf-native-2.6.1-r1: task do_patch: Started
NOTE: package gconf-native-2.6.1-r1: task do_patch: Succeeded
NOTE: package db-5.1.19-r3: task do_fetch: Started
NOTE: package db-5.1.19-r3: task do_fetch: Succeeded
NOTE: Running task 610 of 2451 (ID: 992, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_configure)
NOTE: Running task 611 of 2451 (ID: 2043, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_unpack)
NOTE: package eggdbus-native-0.6-r1: task do_patch: Succeeded
NOTE: Running task 612 of 2451 (ID: 743, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_populate_lic)
NOTE: package sgml-common-native-0.6.3-r0: task do_fetch: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 613 of 2451 (ID: 1735, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_unpack)
NOTE: package popt-native-1.16-r0: task do_install: Succeeded
NOTE: package gnome-common-2.28.0-r1: task do_install: Succeeded
NOTE: Running task 614 of 2451 (ID: 1594, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_populate_sysroot)
NOTE: package gnutls-2.12.11-r3.0: task do_fetch: Started
NOTE: package gnutls-2.12.11-r3.0: task do_fetch: Succeeded
NOTE: package gdbm-1.8.3-r4: task do_patch: Started
NOTE: package db-5.1.19-r3: task do_unpack: Started
NOTE: Running task 615 of 2451 (ID: 1958, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_populate_sysroot)
NOTE: Running task 616 of 2451 (ID: 965, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.11.bb, do_unpack)
NOTE: package systemd-systemctl-native-1.0-r0: task do_configure: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_unpack: Started
NOTE: package usbutils-0.91-r3: task do_populate_lic: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 617 of 2451 (ID: 993, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_compile)
NOTE: package sgml-common-native-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 618 of 2451 (ID: 1736, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_patch)
NOTE: package gnutls-2.12.11-r3.0: task do_unpack: Started
NOTE: package popt-native-1.16-r0: task do_populate_sysroot: Started
NOTE: package usbutils-0.91-r3: task do_populate_lic: Succeeded
NOTE: Running task 619 of 2451 (ID: 367, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_fetch)
NOTE: package gconf-3.2.3-r1: task do_unpack: Succeeded
NOTE: package systemd-systemctl-native-1.0-r0: task do_compile: Started
NOTE: Running task 620 of 2451 (ID: 1978, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.3.bb, do_patch)
NOTE: package gnome-common-2.28.0-r1: task do_populate_sysroot: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_compile: Succeeded
NOTE: package gdbm-1.8.3-r4: task do_patch: Succeeded
NOTE: Running task 621 of 2451 (ID: 346, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.96.bb, do_fetch)
NOTE: Running task 622 of 2451 (ID: 989, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_install)
NOTE: package sgml-common-native-0.6.3-r0: task do_patch: Started
NOTE: package linux-libc-headers-3.1-r1: task do_configure: Succeeded
NOTE: Running task 623 of 2451 (ID: 1663, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_compile)
NOTE: package ppp-2.4.5-r2: task do_fetch: Started
NOTE: package systemd-systemctl-native-1.0-r0: task do_install: Started
NOTE: package ppp-2.4.5-r2: task do_fetch: Succeeded
NOTE: package bluez4-4.96-r4: task do_fetch: Started
NOTE: package bluez4-4.96-r4: task do_fetch: Succeeded
NOTE: package gconf-3.2.3-r1: task do_patch: Started
NOTE: Running task 624 of 2451 (ID: 363, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_unpack)
NOTE: Running task 625 of 2451 (ID: 342, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.96.bb, do_unpack)
NOTE: package gnome-common-2.28.0-r1: task do_populate_sysroot: Succeeded
NOTE: package popt-native-1.16-r0: task do_populate_sysroot: Succeeded
NOTE: package systemd-systemctl-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 626 of 2451 (ID: 2366, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_fetch)
NOTE: Running task 627 of 2451 (ID: 2360, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_populate_lic)
NOTE: Running task 628 of 2451 (ID: 2344, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_fetch)
NOTE: package linux-libc-headers-3.1-r1: task do_compile: Started
NOTE: package linux-libc-headers-3.1-r1: task do_compile: Succeeded
NOTE: Running task 629 of 2451 (ID: 1659, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_install)
NOTE: package bluez4-4.96-r4: task do_unpack: Started
NOTE: package libxml2-2.7.8-r4: task do_populate_lic: Started
NOTE: package eggdbus-0.6-r1: task do_fetch: Started
NOTE: package eggdbus-0.6-r1: task do_fetch: Succeeded
NOTE: package sgml-common-native-0.6.3-r0: task do_patch: Succeeded
NOTE: package ppp-2.4.5-r2: task do_unpack: Started
NOTE: Running task 630 of 2451 (ID: 1740, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_configure)
NOTE: Running task 631 of 2451 (ID: 2340, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_unpack)
NOTE: package bluez4-4.96-r4: task do_unpack: Succeeded
NOTE: package popt-1.16-r0: task do_fetch: Started
NOTE: package popt-1.16-r0: task do_fetch: Succeeded
NOTE: package gconf-3.2.3-r1: task do_patch: Succeeded
NOTE: package db-5.1.19-r3: task do_unpack: Succeeded
NOTE: Running task 632 of 2451 (ID: 2044, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_patch)
NOTE: Running task 633 of 2451 (ID: 1993, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_configure)
NOTE: Running task 634 of 2451 (ID: 343, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.96.bb, do_patch)
NOTE: Running task 635 of 2451 (ID: 2362, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_unpack)
NOTE: package linux-libc-headers-3.1-r1: task do_install: Started
NOTE: package libxml2-2.7.8-r4: task do_populate_lic: Succeeded
NOTE: Running task 636 of 2451 (ID: 263, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.30.bb, do_fetch)
NOTE: package eggdbus-0.6-r1: task do_unpack: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_configure: Started
NOTE: package ppp-2.4.5-r2: task do_unpack: Succeeded
NOTE: Running task 637 of 2451 (ID: 364, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_patch)
NOTE: package eggdbus-0.6-r1: task do_unpack: Succeeded
NOTE: package bluez4-4.96-r4: task do_patch: Started
NOTE: package bluez4-4.96-r4: task do_patch: Succeeded
NOTE: package popt-1.16-r0: task do_unpack: Started
NOTE: package popt-1.16-r0: task do_unpack: Succeeded
NOTE: package db-5.1.19-r3: task do_patch: Started
NOTE: Running task 638 of 2451 (ID: 2341, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_patch)
NOTE: package gconf-native-2.6.1-r1: task do_configure: Started
NOTE: Running task 639 of 2451 (ID: 1964, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_populate_lic)
NOTE: package avahi-0.6.30-r10.0: task do_fetch: Started
NOTE: Running task 640 of 2451 (ID: 2363, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_patch)
NOTE: package avahi-0.6.30-r10.0: task do_fetch: Succeeded
NOTE: Running task 641 of 2451 (ID: 259, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.30.bb, do_unpack)
NOTE: package gconf-native-2.6.1-r1: task do_configure: Succeeded
NOTE: Running task 642 of 2451 (ID: 1994, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_compile)
NOTE: package ppp-2.4.5-r2: task do_patch: Started
NOTE: package db-5.1.19-r3: task do_patch: Succeeded
NOTE: Running task 643 of 2451 (ID: 925, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_fetch)
NOTE: package eggdbus-0.6-r1: task do_patch: Started
NOTE: package avahi-0.6.30-r10.0: task do_unpack: Started
NOTE: package popt-1.16-r0: task do_patch: Started
NOTE: package popt-1.16-r0: task do_patch: Succeeded
NOTE: Running task 644 of 2451 (ID: 787, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_populate_lic)
NOTE: package gnome-common-2.28.0-r1: task do_populate_lic: Started
NOTE: package avahi-0.6.30-r10.0: task do_unpack: Succeeded
NOTE: Running task 645 of 2451 (ID: 260, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.30.bb, do_patch)
NOTE: package gconf-native-2.6.1-r1: task do_compile: Started
NOTE: package busybox-1.18.5-r2: task do_fetch: Started
NOTE: package busybox-1.18.5-r2: task do_fetch: Succeeded
NOTE: package gnome-common-2.28.0-r1: task do_populate_lic: Succeeded
NOTE: package gconf-native-2.6.1-r1: task do_compile: Succeeded
NOTE: Running task 646 of 2451 (ID: 1942, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_populate_lic)
NOTE: Running task 647 of 2451 (ID: 921, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_unpack)
NOTE: Running task 648 of 2451 (ID: 1990, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_install)
NOTE: package readline-6.2-r0: task do_populate_lic: Started
NOTE: package eggdbus-0.6-r1: task do_patch: Succeeded
NOTE: Running task 649 of 2451 (ID: 1805, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_fetch)
NOTE: package ocf-linux-20100325-r3.0: task do_populate_lic: Started
NOTE: package readline-6.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 650 of 2451 (ID: 1205, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_populate_lic)
NOTE: package busybox-1.18.5-r2: task do_unpack: Started
NOTE: package gconf-native-2.6.1-r1: task do_install: Started
NOTE: package bind-9.8.1-r1: task do_fetch: Started
NOTE: package bind-9.8.1-r1: task do_fetch: Succeeded
NOTE: package avahi-0.6.30-r10.0: task do_patch: Started
NOTE: Running task 651 of 2451 (ID: 1801, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_unpack)
NOTE: package gconf-native-2.6.1-r1: task do_install: Succeeded
NOTE: package ocf-linux-20100325-r3.0: task do_populate_lic: Succeeded
NOTE: package ppp-2.4.5-r2: task do_patch: Succeeded
NOTE: package xproto-native-1_7.0.22-r0: task do_configure: Succeeded
NOTE: package db-native-5.1.19-r3: task do_configure: Succeeded
NOTE: Running task 652 of 2451 (ID: 1553, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_compile)
NOTE: Running task 653 of 2451 (ID: 2313, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_compile)
NOTE: Running task 655 of 2451 (ID: 408, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_fetch)
NOTE: Running task 656 of 2451 (ID: 1106, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_populate_lic)
NOTE: Running task 657 of 2451 (ID: 398, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_fetch)
NOTE: package openssl-1.0.0e-r14.4: task do_populate_lic: Started
NOTE: package gnutls-2.12.11-r3.0: task do_unpack: Succeeded
NOTE: package avahi-0.6.30-r10.0: task do_patch: Succeeded
NOTE: Running task 658 of 2451 (ID: 966, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.11.bb, do_patch)
NOTE: Running task 659 of 2451 (ID: 1183, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_populate_lic)
NOTE: package bind-9.8.1-r1: task do_unpack: Started
NOTE: package openssl-1.0.0e-r14.4: task do_populate_lic: Succeeded
NOTE: package module-init-tools-3.16-r0: task do_fetch: Started
NOTE: package module-init-tools-3.16-r0: task do_fetch: Succeeded
NOTE: package db-native-5.1.19-r3: task do_compile: Started
NOTE: Running task 660 of 2451 (ID: 405, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_unpack)
NOTE: Running task 661 of 2451 (ID: 1172, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_populate_lic)
NOTE: package alsa-lib-1.0.24.1-r1: task do_populate_lic: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_compile: Started
NOTE: package sysfsutils-2.1.0-r2: task do_fetch: Started
NOTE: package sysfsutils-2.1.0-r2: task do_fetch: Succeeded
NOTE: package update-modules-1.0-r10: task do_populate_lic: Started
NOTE: Running task 662 of 2451 (ID: 394, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_unpack)
NOTE: package gnutls-2.12.11-r3.0: task do_patch: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_compile: Succeeded
NOTE: Running task 663 of 2451 (ID: 2309, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_install)
NOTE: package alsa-lib-1.0.24.1-r1: task do_populate_lic: Succeeded
NOTE: Running task 664 of 2451 (ID: 252, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_fetch)
NOTE: package module-init-tools-cross-3.16-r0: task do_populate_lic: Started
NOTE: package module-init-tools-3.16-r0: task do_unpack: Started
NOTE: package update-modules-1.0-r10: task do_populate_lic: Succeeded
NOTE: Running task 665 of 2451 (ID: 2338, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_populate_lic)
NOTE: package bind-9.8.1-r1: task do_unpack: Succeeded
NOTE: Running task 666 of 2451 (ID: 1802, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_patch)
NOTE: package module-init-tools-cross-3.16-r0: task do_populate_lic: Succeeded
NOTE: package sysfsutils-2.1.0-r2: task do_unpack: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_install: Started
NOTE: Running task 667 of 2451 (ID: 1171, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_package)
NOTE: package wpa-supplicant-0.7.3-r5: task do_fetch: Started
NOTE: package wpa-supplicant-0.7.3-r5: task do_fetch: Succeeded
NOTE: package module-init-tools-3.16-r0: task do_unpack: Succeeded
NOTE: Running task 668 of 2451 (ID: 406, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_patch)
NOTE: Running task 669 of 2451 (ID: 248, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_unpack)
NOTE: package gnutls-2.12.11-r3.0: task do_patch: Succeeded
NOTE: package sysfsutils-2.1.0-r2: task do_unpack: Succeeded
NOTE: Running task 670 of 2451 (ID: 1422, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_fetch)
NOTE: Running task 671 of 2451 (ID: 395, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_patch)
NOTE: package busybox-1.18.5-r2: task do_unpack: Succeeded
NOTE: Running task 672 of 2451 (ID: 831, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_populate_lic)
NOTE: package libgpg-error-1.10-r1: task do_populate_lic: Started
NOTE: package bind-9.8.1-r1: task do_patch: Started
NOTE: package module-init-tools-cross-3.16-r0: task do_package: Started
NOTE: package wpa-supplicant-0.7.3-r5: task do_unpack: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_install: Succeeded
NOTE: Running task 673 of 2451 (ID: 2310, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_populate_sysroot)
NOTE: package elfutils-native-0.148-r3: task do_configure: Succeeded
NOTE: package sysfsutils-2.1.0-r2: task do_patch: Started
NOTE: Running task 674 of 2451 (ID: 539, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_compile)
NOTE: package module-init-tools-3.16-r0: task do_patch: Started
NOTE: package libgpg-error-1.10-r1: task do_populate_lic: Succeeded
NOTE: Running task 676 of 2451 (ID: 2080, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_fetch)
NOTE: package bash-4.2-r1: task do_fetch: Started
NOTE: package bash-4.2-r1: task do_fetch: Succeeded
NOTE: Running task 677 of 2451 (ID: 1419, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_unpack)
NOTE: package tcp-wrappers-7.6-r7: task do_populate_lic: Started
WARNING: tcp-wrappers: No generic license file exists for: tcp-wrappers at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: tcp-wrappers: There is also no SPDXLICENSEMAP for this license type: tcp-wrappers at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package module-init-tools-cross-3.16-r0: task do_package: Succeeded
NOTE: Running task 678 of 2451 (ID: 2069, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_fetch)
NOTE: package bind-9.8.1-r1: task do_patch: Succeeded
NOTE: Running task 679 of 2451 (ID: 2036, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_fetch)
NOTE: package wpa-supplicant-0.7.3-r5: task do_unpack: Succeeded
NOTE: package sysfsutils-2.1.0-r2: task do_patch: Succeeded
NOTE: Running task 680 of 2451 (ID: 249, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_patch)
NOTE: package elfutils-native-0.148-r3: task do_compile: Started
NOTE: Running task 681 of 2451 (ID: 2025, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_fetch)
NOTE: package tcp-wrappers-7.6-r7: task do_populate_lic: Succeeded
NOTE: package xproto-native-1_7.0.22-r0: task do_populate_sysroot: Started
NOTE: Running task 682 of 2451 (ID: 1970, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb, do_fetch)
NOTE: package gmp-5.0.2-r1: task do_fetch: Started
NOTE: package gmp-5.0.2-r1: task do_fetch: Succeeded
NOTE: Running task 683 of 2451 (ID: 2076, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_unpack)
NOTE: package bash-4.2-r1: task do_unpack: Started
NOTE: package sqlite3-3.7.7.1-r1: task do_fetch: Started
NOTE: package tzcode-native-2011i-r4.2: task do_fetch: Started
NOTE: package tzcode-native-2011i-r4.2: task do_fetch: Succeeded
NOTE: package sqlite3-3.7.7.1-r1: task do_fetch: Succeeded
NOTE: Running task 684 of 2451 (ID: 2065, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_unpack)
NOTE: Running task 685 of 2451 (ID: 2032, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_unpack)
NOTE: package wpa-supplicant-0.7.3-r5: task do_patch: Started
NOTE: package wpa-supplicant-0.7.3-r5: task do_patch: Succeeded
NOTE: Running task 686 of 2451 (ID: 1948, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/polkit/polkit_0.102.bb, do_fetch)
NOTE: package pkgconfig-0.25-r2: task do_fetch: Started
NOTE: package hicolor-icon-theme-0.12-r1: task do_fetch: Started
NOTE: package module-init-tools-3.16-r0: task do_patch: Succeeded
NOTE: package pkgconfig-0.25-r2: task do_fetch: Succeeded
NOTE: package hicolor-icon-theme-0.12-r1: task do_fetch: Succeeded
NOTE: Running task 687 of 2451 (ID: 990, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_populate_sysroot)
NOTE: Running task 688 of 2451 (ID: 2021, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_unpack)
NOTE: Running task 689 of 2451 (ID: 1966, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb, do_unpack)
NOTE: package gmp-5.0.2-r1: task do_unpack: Started
NOTE: package xproto-native-1_7.0.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 690 of 2451 (ID: 1843, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_populate_lic)
NOTE: package sqlite3-3.7.7.1-r1: task do_unpack: Started
NOTE: package tzcode-native-2011i-r4.2: task do_unpack: Started
NOTE: package polkit-0.102-r0: task do_fetch: Started
NOTE: package polkit-0.102-r0: task do_fetch: Succeeded
NOTE: package systemd-systemctl-native-1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 691 of 2451 (ID: 1944, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/polkit/polkit_0.102.bb, do_unpack)
NOTE: package sqlite3-3.7.7.1-r1: task do_unpack: Succeeded
NOTE: package tzcode-native-2011i-r4.2: task do_unpack: Succeeded
NOTE: package pkgconfig-0.25-r2: task do_unpack: Started
NOTE: Running task 692 of 2451 (ID: 2066, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_patch)
NOTE: Running task 693 of 2451 (ID: 2033, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_patch)
NOTE: package hicolor-icon-theme-0.12-r1: task do_unpack: Started
NOTE: package bash-4.2-r1: task do_unpack: Succeeded
NOTE: package libgcrypt-1.5.0-r0: task do_populate_lic: Started
NOTE: Running task 694 of 2451 (ID: 1420, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_patch)
NOTE: package hicolor-icon-theme-0.12-r1: task do_unpack: Succeeded
NOTE: Running task 695 of 2451 (ID: 1967, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb, do_patch)
NOTE: package pkgconfig-0.25-r2: task do_unpack: Succeeded
NOTE: Running task 696 of 2451 (ID: 2022, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_patch)
NOTE: package systemd-systemctl-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 697 of 2451 (ID: 1832, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_populate_lic)
NOTE: package libgcrypt-1.5.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 698 of 2451 (ID: 1821, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_populate_lic)
NOTE: package tzcode-native-2011i-r4.2: task do_patch: Started
NOTE: package tzcode-native-2011i-r4.2: task do_patch: Succeeded
NOTE: package polkit-0.102-r0: task do_unpack: Started
NOTE: Running task 699 of 2451 (ID: 1051, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_populate_lic)
NOTE: package sqlite3-3.7.7.1-r1: task do_patch: Started
NOTE: package sqlite3-3.7.7.1-r1: task do_patch: Succeeded
NOTE: Running task 700 of 2451 (ID: 922, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_patch)
NOTE: package hicolor-icon-theme-0.12-r1: task do_patch: Started
NOTE: package pkgconfig-0.25-r2: task do_patch: Started
NOTE: package bash-4.2-r1: task do_patch: Started
NOTE: package hicolor-icon-theme-0.12-r1: task do_patch: Succeeded
NOTE: package polkit-0.102-r0: task do_unpack: Succeeded
NOTE: Running task 701 of 2451 (ID: 1945, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/polkit/polkit_0.102.bb, do_patch)
NOTE: Running task 702 of 2451 (ID: 914, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_fetch)
NOTE: package libtasn1-2.10-r0: task do_populate_lic: Started
NOTE: package lzo-2.05-r0: task do_populate_lic: Started
NOTE: package libdaemon-0.14-r0: task do_populate_lic: Started
NOTE: package gmp-5.0.2-r1: task do_unpack: Succeeded
NOTE: package busybox-1.18.5-r2: task do_patch: Started
NOTE: package task-boot-1.0-r56: task do_fetch: Started
NOTE: Running task 703 of 2451 (ID: 2077, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_patch)
NOTE: package libtasn1-2.10-r0: task do_populate_lic: Succeeded
NOTE: package polkit-0.102-r0: task do_patch: Started
NOTE: package task-boot-1.0-r56: task do_fetch: Succeeded
NOTE: Running task 704 of 2451 (ID: 910, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_unpack)
NOTE: Running task 705 of 2451 (ID: 1991, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_populate_sysroot)
NOTE: package lzo-2.05-r0: task do_populate_lic: Succeeded
NOTE: package libdaemon-0.14-r0: task do_populate_lic: Succeeded
NOTE: Running task 706 of 2451 (ID: 1381, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_fetch)
NOTE: Running task 707 of 2451 (ID: 1251, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_fetch)
NOTE: package pkgconfig-0.25-r2: task do_patch: Succeeded
NOTE: Running task 708 of 2451 (ID: 1139, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_populate_lic)
NOTE: package task-boot-1.0-r56: task do_unpack: Started
NOTE: package libpcap-1.1.1-r1.0: task do_populate_lic: Started
NOTE: package gconf-native-2.6.1-r1: task do_populate_sysroot: Started
NOTE: package gmp-5.0.2-r1: task do_patch: Started
NOTE: package task-boot-1.0-r56: task do_unpack: Succeeded
NOTE: Running task 709 of 2451 (ID: 911, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_patch)
NOTE: package perl-5.14.2-r0: task do_fetch: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_fetch: Started
NOTE: package polkit-0.102-r0: task do_patch: Succeeded
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_fetch: Succeeded
NOTE: Running task 710 of 2451 (ID: 1029, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_populate_lic)
NOTE: Running task 711 of 2451 (ID: 1248, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_unpack)
NOTE: package libpcap-1.1.1-r1.0: task do_populate_lic: Succeeded
NOTE: Running task 714 of 2451 (ID: 2063, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_populate_lic)
NOTE: package gconf-native-2.6.1-r1: task do_populate_sysroot: Succeeded
NOTE: package task-boot-1.0-r56: task do_patch: Started
NOTE: package task-boot-1.0-r56: task do_patch: Succeeded
NOTE: Running task 715 of 2451 (ID: 2052, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_populate_lic)
NOTE: package perl-5.14.2-r0: task do_fetch: Succeeded
NOTE: Running task 717 of 2451 (ID: 820, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_populate_lic)
NOTE: Running task 718 of 2451 (ID: 1378, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_unpack)
NOTE: package libnl-1_2.0-r6: task do_populate_lic: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_unpack: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_unpack: Succeeded
NOTE: Running task 719 of 2451 (ID: 1249, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_patch)
NOTE: package gdbm-1.8.3-r4: task do_populate_lic: Started
NOTE: package db-5.1.19-r3: task do_populate_lic: Started
NOTE: package libnl-1_2.0-r6: task do_populate_lic: Succeeded
NOTE: Running task 722 of 2451 (ID: 1986, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.3.bb, do_populate_lic)
NOTE: package gmp-5.0.2-r1: task do_patch: Succeeded
NOTE: package libcgroup-0.37.1-r0: task do_populate_lic: Started
NOTE: Running task 723 of 2451 (ID: 974, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.11.bb, do_populate_lic)
NOTE: package perl-5.14.2-r0: task do_unpack: Started
NOTE: package gdbm-1.8.3-r4: task do_populate_lic: Succeeded
NOTE: Running task 724 of 2451 (ID: 2090, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_fetch)
NOTE: package db-5.1.19-r3: task do_populate_lic: Succeeded
NOTE: Running task 725 of 2451 (ID: 1002, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_fetch)
NOTE: package libcgroup-0.37.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 726 of 2451 (ID: 980, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_fetch)
NOTE: package busybox-1.18.5-r2: task do_patch: Succeeded
NOTE: package gconf-3.2.3-r1: task do_populate_lic: Started
NOTE: Running task 727 of 2451 (ID: 958, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_fetch)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_patch: Started
NOTE: package gconf-3.2.3-r1: task do_populate_lic: Succeeded
NOTE: Running task 728 of 2451 (ID: 947, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_fetch)
NOTE: package gnutls-2.12.11-r3.0: task do_populate_lic: Started
NOTE: package dropbear-0.53.1-r0: task do_fetch: Started
NOTE: package cross-localedef-native-2.13-r1: task do_fetch: Started
NOTE: package cross-localedef-native-2.13-r1: task do_fetch: Succeeded
NOTE: package dropbear-0.53.1-r0: task do_fetch: Succeeded
NOTE: Running task 729 of 2451 (ID: 998, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_unpack)
NOTE: package iptables-1.4.12.1-r0: task do_fetch: Started
NOTE: Running task 730 of 2451 (ID: 2087, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_unpack)
NOTE: package iptables-1.4.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 731 of 2451 (ID: 954, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_unpack)
NOTE: package gnutls-2.12.11-r3.0: task do_populate_lic: Succeeded
NOTE: package ntp-4.2.6p3-r3: task do_fetch: Started
NOTE: package bash-4.2-r1: task do_patch: Succeeded
NOTE: Running task 732 of 2451 (ID: 936, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_fetch)
NOTE: Running task 733 of 2451 (ID: 372, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_populate_lic)
NOTE: package resolvconf-1.61-r0: task do_fetch: Started
NOTE: package resolvconf-1.61-r0: task do_fetch: Succeeded
NOTE: package ntp-4.2.6p3-r3: task do_fetch: Succeeded
NOTE: Running task 734 of 2451 (ID: 943, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_unpack)
NOTE: Running task 735 of 2451 (ID: 976, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_unpack)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_patch: Succeeded
NOTE: Running task 736 of 2451 (ID: 351, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.96.bb, do_populate_lic)
NOTE: package iptables-1.4.12.1-r0: task do_unpack: Started
NOTE: package cross-localedef-native-2.13-r1: task do_unpack: Started
NOTE: package dropbear-0.53.1-r0: task do_unpack: Started
NOTE: package resolvconf-1.61-r0: task do_unpack: Started
NOTE: package resolvconf-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 737 of 2451 (ID: 944, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_patch)
NOTE: package dhcp-4.2.0-r4: task do_fetch: Started
NOTE: package ppp-2.4.5-r2: task do_populate_lic: Started
NOTE: package ntp-4.2.6p3-r3: task do_unpack: Started
NOTE: package dhcp-4.2.0-r4: task do_fetch: Succeeded
NOTE: package bluez4-4.96-r4: task do_populate_lic: Started
NOTE: package iptables-1.4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 738 of 2451 (ID: 932, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_unpack)
NOTE: Running task 739 of 2451 (ID: 955, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_patch)
NOTE: package dropbear-0.53.1-r0: task do_unpack: Succeeded
NOTE: Running task 740 of 2451 (ID: 2088, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_patch)
NOTE: package ppp-2.4.5-r2: task do_populate_lic: Succeeded
NOTE: Running task 742 of 2451 (ID: 1261, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_fetch)
NOTE: package resolvconf-1.61-r0: task do_patch: Started
NOTE: package resolvconf-1.61-r0: task do_patch: Succeeded
NOTE: Running task 743 of 2451 (ID: 440, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.9p1.bb, do_fetch)
NOTE: package ntp-4.2.6p3-r3: task do_unpack: Succeeded
NOTE: Running task 744 of 2451 (ID: 977, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_patch)
NOTE: package bluez4-4.96-r4: task do_populate_lic: Succeeded
NOTE: Running task 745 of 2451 (ID: 387, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_fetch)
NOTE: package iptables-1.4.12.1-r0: task do_patch: Started
NOTE: package iptables-1.4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 746 of 2451 (ID: 303, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_fetch)
NOTE: package dhcp-4.2.0-r4: task do_unpack: Started
NOTE: package dropbear-0.53.1-r0: task do_patch: Started
NOTE: package opkg-config-base-1.0-r0: task do_fetch: Started
NOTE: package opkg-config-base-1.0-r0: task do_fetch: Succeeded
NOTE: package ntp-4.2.6p3-r3: task do_patch: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_configure: Succeeded
NOTE: Running task 747 of 2451 (ID: 1741, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_compile)
NOTE: package openssh-5.9p1-r2: task do_fetch: Started
NOTE: Running task 748 of 2451 (ID: 1258, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_unpack)
NOTE: package openssh-5.9p1-r2: task do_fetch: Succeeded
NOTE: Running task 749 of 2451 (ID: 437, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.9p1.bb, do_unpack)
NOTE: package alsa-utils-1.0.24.2-r3: task do_fetch: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_fetch: Succeeded
NOTE: package angstrom-feed-configs-1.0-r15: task do_fetch: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_fetch: Succeeded
NOTE: Running task 750 of 2451 (ID: 384, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_unpack)
NOTE: package opkg-config-base-1.0-r0: task do_unpack: Started
NOTE: Running task 751 of 2451 (ID: 300, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_unpack)
NOTE: package sgml-common-native-0.6.3-r0: task do_compile: Started
NOTE: package unzip-native-1_6.0-r1: task do_compile: Succeeded
NOTE: package opkg-config-base-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 752 of 2451 (ID: 1259, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_patch)
NOTE: package openssh-5.9p1-r2: task do_unpack: Started
NOTE: Running task 753 of 2451 (ID: 1726, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_install)
NOTE: package perl-5.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 754 of 2451 (ID: 1379, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_patch)
NOTE: package sgml-common-native-0.6.3-r0: task do_compile: Succeeded
NOTE: package angstrom-feed-configs-1.0-r15: task do_unpack: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_unpack: Succeeded
NOTE: package dhcp-4.2.0-r4: task do_unpack: Succeeded
NOTE: package alsa-utils-1.0.24.2-r3: task do_unpack: Started
NOTE: package openssh-5.9p1-r2: task do_unpack: Succeeded
NOTE: Running task 755 of 2451 (ID: 933, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_patch)
NOTE: Running task 756 of 2451 (ID: 1737, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_install)
NOTE: Running task 757 of 2451 (ID: 438, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.9p1.bb, do_patch)
NOTE: package opkg-config-base-1.0-r0: task do_patch: Started
NOTE: package opkg-config-base-1.0-r0: task do_patch: Succeeded
NOTE: Running task 758 of 2451 (ID: 301, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_patch)
NOTE: Running task 759 of 2451 (ID: 293, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_fetch)
NOTE: package ntp-4.2.6p3-r3: task do_patch: Succeeded
NOTE: Running task 760 of 2451 (ID: 268, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.30.bb, do_populate_lic)
NOTE: package unzip-native-1_6.0-r1: task do_install: Started
NOTE: package perl-5.14.2-r0: task do_patch: Started
NOTE: package dhcp-4.2.0-r4: task do_patch: Started
NOTE: package unzip-native-1_6.0-r1: task do_install: Succeeded
NOTE: package openssh-5.9p1-r2: task do_patch: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_patch: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_install: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_unpack: Succeeded
NOTE: package angstrom-feed-configs-1.0-r15: task do_patch: Succeeded
NOTE: Running task 761 of 2451 (ID: 385, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_patch)
NOTE: Running task 762 of 2451 (ID: 1727, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_populate_sysroot)
NOTE: Running task 763 of 2451 (ID: 2037, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_configure)
NOTE: package avahi-0.6.30-r10.0: task do_populate_lic: Started
NOTE: package openssh-5.9p1-r2: task do_patch: Succeeded
NOTE: Running task 764 of 2451 (ID: 413, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_populate_lic)
NOTE: package tzcode-native-2011i-r4.2: task do_configure: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_patch: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_install: Succeeded
NOTE: package tzcode-native-2011i-r4.2: task do_configure: Succeeded
NOTE: package dropbear-0.53.1-r0: task do_patch: Succeeded
NOTE: package avahi-0.6.30-r10.0: task do_populate_lic: Succeeded
NOTE: package db-native-5.1.19-r3: task do_compile: Succeeded
NOTE: Running task 765 of 2451 (ID: 1549, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_install)
NOTE: Running task 766 of 2451 (ID: 2371, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_populate_lic)
NOTE: Running task 767 of 2451 (ID: 1738, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_populate_sysroot)
NOTE: Running task 768 of 2451 (ID: 2349, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_populate_lic)
NOTE: package unzip-native-1_6.0-r1: task do_populate_sysroot: Started
NOTE: Running task 769 of 2451 (ID: 2038, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_compile)
NOTE: package module-init-tools-3.16-r0: task do_populate_lic: Started
NOTE: package dhcp-4.2.0-r4: task do_patch: Succeeded
NOTE: package gzip-native-1.4-r0: task do_configure: Succeeded
NOTE: Running task 770 of 2451 (ID: 1851, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_compile)
NOTE: Running task 771 of 2451 (ID: 1427, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_populate_lic)
NOTE: package eggdbus-0.6-r1: task do_populate_lic: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_populate_sysroot: Started
NOTE: package db-native-5.1.19-r3: task do_install: Started
NOTE: package popt-1.16-r0: task do_populate_lic: Started
NOTE: package module-init-tools-3.16-r0: task do_populate_lic: Succeeded
NOTE: package tzcode-native-2011i-r4.2: task do_compile: Started
NOTE: Running task 772 of 2451 (ID: 127, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_fetch)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_fetch: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_fetch: Succeeded
NOTE: Running task 773 of 2451 (ID: 290, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_unpack)
NOTE: package eggdbus-0.6-r1: task do_populate_lic: Succeeded
NOTE: package popt-1.16-r0: task do_populate_lic: Succeeded
NOTE: package unzip-native-1_6.0-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 774 of 2451 (ID: 767, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_unpack)
NOTE: Running task 775 of 2451 (ID: 2101, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_fetch)
NOTE: package alsa-utils-1.0.24.2-r3: task do_patch: Succeeded
NOTE: Running task 776 of 2451 (ID: 1452, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_fetch)
NOTE: Running task 777 of 2451 (ID: 1442, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_fetch)
NOTE: package gzip-native-1.4-r0: task do_compile: Started
NOTE: package bash-4.2-r1: task do_populate_lic: Started
NOTE: package task-base-1.0-r72: task do_fetch: Started
NOTE: package task-base-1.0-r72: task do_fetch: Succeeded
NOTE: Running task 778 of 2451 (ID: 123, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_unpack)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_unpack: Started
NOTE: package base-files-3.0.14-r81: task do_fetch: Started
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_unpack: Succeeded
NOTE: package bash-4.2-r1: task do_populate_lic: Succeeded
NOTE: Running task 779 of 2451 (ID: 1432, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_fetch)
NOTE: Running task 780 of 2451 (ID: 768, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_patch)
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_fetch: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_fetch: Succeeded
NOTE: package netbase-4.47-r0: task do_fetch: Started
NOTE: Running task 781 of 2451 (ID: 2098, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_unpack)
NOTE: package netbase-4.47-r0: task do_fetch: Succeeded
NOTE: Running task 782 of 2451 (ID: 1449, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_unpack)
NOTE: package cross-localedef-native-2.13-r1: task do_unpack: Succeeded
NOTE: package base-files-3.0.14-r81: task do_fetch: Succeeded
NOTE: Running task 783 of 2451 (ID: 999, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_patch)
NOTE: Running task 784 of 2451 (ID: 1439, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_unpack)
NOTE: package task-base-1.0-r72: task do_unpack: Started
NOTE: package sgml-common-native-0.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: package task-base-1.0-r72: task do_unpack: Succeeded
NOTE: Running task 785 of 2451 (ID: 1401, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_fetch)
NOTE: Running task 786 of 2451 (ID: 124, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_patch)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_patch: Started
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_patch: Succeeded
NOTE: package netbase-4.47-r0: task do_unpack: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_unpack: Started
NOTE: package coreutils-8.14-r1: task do_fetch: Started
NOTE: package coreutils-8.14-r1: task do_fetch: Succeeded
NOTE: Running task 787 of 2451 (ID: 1391, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb, do_fetch)
NOTE: Running task 788 of 2451 (ID: 772, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_configure)
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_unpack: Succeeded
NOTE: package base-files-3.0.14-r81: task do_unpack: Started
NOTE: Running task 790 of 2451 (ID: 2099, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_patch)
NOTE: package netbase-4.47-r0: task do_unpack: Succeeded
NOTE: Running task 791 of 2451 (ID: 1450, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_patch)
NOTE: package task-base-1.0-r72: task do_patch: Started
NOTE: package task-base-1.0-r72: task do_patch: Succeeded
NOTE: package netbase-4.47-r0: task do_patch: Started
NOTE: package netbase-4.47-r0: task do_patch: Succeeded
NOTE: package cross-localedef-native-2.13-r1: task do_patch: Started
NOTE: package cross-localedef-native-2.13-r1: task do_patch: Succeeded
NOTE: package python-2.7.2-r0.2: task do_fetch: Started
NOTE: package bluez-hcidump-2.1-r0: task do_fetch: Started
NOTE: package bluez-hcidump-2.1-r0: task do_fetch: Succeeded
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_configure: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_patch: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_patch: Succeeded
NOTE: Running task 792 of 2451 (ID: 1371, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_fetch)
NOTE: Running task 793 of 2451 (ID: 1361, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_fetch)
NOTE: package tzcode-native-2011i-r4.2: task do_compile: Succeeded
NOTE: Running task 794 of 2451 (ID: 2034, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_install)
NOTE: Running task 795 of 2451 (ID: 1388, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb, do_unpack)
NOTE: Running task 796 of 2451 (ID: 1351, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb, do_fetch)
NOTE: Running task 797 of 2451 (ID: 1331, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_fetch)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_configure: Succeeded
NOTE: package python-2.7.2-r0.2: task do_fetch: Succeeded
NOTE: Running task 798 of 2451 (ID: 1398, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_unpack)
NOTE: Running task 799 of 2451 (ID: 773, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_compile)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_unpack: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_unpack: Succeeded
NOTE: Running task 800 of 2451 (ID: 291, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_patch)
NOTE: package db-native-5.1.19-r3: task do_install: Succeeded
NOTE: package sysvinit-2.88dsf-r5: task do_fetch: Started
NOTE: Running task 801 of 2451 (ID: 1550, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_populate_sysroot)
NOTE: package tzcode-native-2011i-r4.2: task do_install: Started
NOTE: package bluez-hcidump-2.1-r0: task do_unpack: Started
NOTE: package htop-0.9-r1: task do_fetch: Started
NOTE: package sysvinit-2.88dsf-r5: task do_fetch: Succeeded
NOTE: package libnss-mdns-0.10-r4: task do_fetch: Started
NOTE: package libnss-mdns-0.10-r4: task do_fetch: Succeeded
NOTE: package htop-0.9-r1: task do_fetch: Succeeded
NOTE: Running task 802 of 2451 (ID: 1358, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_unpack)
NOTE: Running task 803 of 2451 (ID: 1368, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_unpack)
NOTE: package bluez-hcidump-2.1-r0: task do_unpack: Succeeded
NOTE: package dnsmasq-dbus-2.55-r0: task do_fetch: Started
NOTE: Running task 804 of 2451 (ID: 1389, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb, do_patch)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_compile: Started
NOTE: package dnsmasq-dbus-2.55-r0: task do_fetch: Succeeded
NOTE: Running task 805 of 2451 (ID: 1348, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb, do_unpack)
NOTE: Running task 806 of 2451 (ID: 1328, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_unpack)
NOTE: package python-2.7.2-r0.2: task do_unpack: Started
NOTE: package base-files-3.0.14-r81: task do_unpack: Succeeded
NOTE: package tzcode-native-2011i-r4.2: task do_install: Succeeded
NOTE: Running task 807 of 2451 (ID: 1440, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_patch)
NOTE: Running task 808 of 2451 (ID: 1311, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb, do_fetch)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_compile: Succeeded
NOTE: Running task 809 of 2451 (ID: 769, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_install)
NOTE: package db-native-5.1.19-r3: task do_populate_sysroot: Started
NOTE: package dnsmasq-dbus-2.55-r0: task do_unpack: Started
NOTE: package htop-0.9-r1: task do_unpack: Started
NOTE: package libnss-mdns-0.10-r4: task do_unpack: Started
NOTE: package sysvinit-2.88dsf-r5: task do_unpack: Started
NOTE: package base-files-3.0.14-r81: task do_patch: Started
NOTE: package base-files-3.0.14-r81: task do_patch: Succeeded
NOTE: package rsyslog-5.8.0-r1.0: task do_fetch: Started
NOTE: package rsyslog-5.8.0-r1.0: task do_fetch: Succeeded
NOTE: package bluez-hcidump-2.1-r0: task do_patch: Started
NOTE: package bluez-hcidump-2.1-r0: task do_patch: Succeeded
NOTE: Running task 810 of 2451 (ID: 1301, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_fetch)
NOTE: Running task 811 of 2451 (ID: 1291, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb, do_fetch)
NOTE: Running task 812 of 2451 (ID: 1308, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb, do_unpack)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_install: Started
NOTE: package gzip-native-1.4-r0: task do_compile: Succeeded
NOTE: package libnss-mdns-0.10-r4: task do_unpack: Succeeded
NOTE: Running task 813 of 2451 (ID: 1847, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_install)
NOTE: Running task 814 of 2451 (ID: 1369, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_patch)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_install: Succeeded
NOTE: package htop-0.9-r1: task do_unpack: Succeeded
NOTE: package dnsmasq-dbus-2.55-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 2451 (ID: 1349, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb, do_patch)
NOTE: Running task 816 of 2451 (ID: 1329, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_patch)
NOTE: Running task 817 of 2451 (ID: 770, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_populate_sysroot)
NOTE: package tzdata-2011g-r10.0: task do_fetch: Started
NOTE: package tzdata-2011g-r10.0: task do_fetch: Succeeded
NOTE: package iw-0.9.20-r0: task do_fetch: Started
NOTE: package iw-0.9.20-r0: task do_fetch: Succeeded
NOTE: package rsyslog-5.8.0-r1.0: task do_unpack: Started
NOTE: Running task 819 of 2451 (ID: 1298, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_unpack)
NOTE: Running task 820 of 2451 (ID: 1288, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb, do_unpack)
NOTE: package libnss-mdns-0.10-r4: task do_patch: Started
NOTE: package libnss-mdns-0.10-r4: task do_patch: Succeeded
NOTE: Running task 821 of 2451 (ID: 1281, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_fetch)
NOTE: package gzip-native-1.4-r0: task do_install: Started
NOTE: package dnsmasq-dbus-2.55-r0: task do_patch: Started
NOTE: package dnsmasq-dbus-2.55-r0: task do_patch: Succeeded
NOTE: package tzdata-2011g-r10.0: task do_unpack: Started
NOTE: package htop-0.9-r1: task do_patch: Started
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_populate_sysroot: Started
NOTE: Running task 822 of 2451 (ID: 1271, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_fetch)
NOTE: package sysvinit-2.88dsf-r5: task do_unpack: Succeeded
NOTE: package tzdata-2011g-r10.0: task do_unpack: Succeeded
NOTE: package iw-0.9.20-r0: task do_unpack: Started
NOTE: Running task 823 of 2451 (ID: 1359, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_patch)
NOTE: Running task 824 of 2451 (ID: 1299, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_patch)
NOTE: package iw-0.9.20-r0: task do_unpack: Succeeded
NOTE: package systemd-compat-units-1.0-r14: task do_fetch: Started
NOTE: package systemd-compat-units-1.0-r14: task do_fetch: Succeeded
NOTE: package htop-0.9-r1: task do_patch: Succeeded
NOTE: Running task 825 of 2451 (ID: 1230, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_fetch)
NOTE: Running task 826 of 2451 (ID: 1289, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb, do_patch)
NOTE: Running task 827 of 2451 (ID: 1278, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_unpack)
NOTE: package dropbear-systemd-v1-r0: task do_fetch: Started
NOTE: package dropbear-systemd-v1-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 2451 (ID: 1268, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_unpack)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_patch: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_patch: Succeeded
NOTE: Running task 829 of 2451 (ID: 1220, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_fetch)
NOTE: package systemd-serialgetty-1.0-r1: task do_fetch: Started
NOTE: package sysvinit-2.88dsf-r5: task do_patch: Started
NOTE: package tzdata-2011g-r10.0: task do_patch: Started
NOTE: package tzdata-2011g-r10.0: task do_patch: Succeeded
NOTE: package rsyslog-5.8.0-r1.0: task do_unpack: Succeeded
NOTE: Running task 830 of 2451 (ID: 1309, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb, do_patch)
NOTE: package systemd-serialgetty-1.0-r1: task do_fetch: Succeeded
NOTE: package systemd-compat-units-1.0-r14: task do_unpack: Started
NOTE: Running task 831 of 2451 (ID: 1210, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/consolekit/consolekit_0.4.5.bb, do_fetch)
NOTE: Running task 832 of 2451 (ID: 1227, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_unpack)
NOTE: package iw-0.9.20-r0: task do_patch: Started
NOTE: package systemd-compat-units-1.0-r14: task do_unpack: Succeeded
NOTE: package dropbear-systemd-v1-r0: task do_unpack: Started
NOTE: Running task 833 of 2451 (ID: 1279, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_patch)
NOTE: package dropbear-systemd-v1-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 2451 (ID: 1269, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_patch)
NOTE: package kbd-1.15.2-r2: task do_fetch: Started
NOTE: package kbd-1.15.2-r2: task do_fetch: Succeeded
NOTE: package consolekit-0.4.5-r5: task do_fetch: Started
NOTE: package consolekit-0.4.5-r5: task do_fetch: Succeeded
NOTE: package systemd-serialgetty-1.0-r1: task do_unpack: Started
NOTE: Running task 835 of 2451 (ID: 1217, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_unpack)
NOTE: Running task 836 of 2451 (ID: 1207, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/consolekit/consolekit_0.4.5.bb, do_unpack)
NOTE: package rsyslog-5.8.0-r1.0: task do_patch: Started
NOTE: package rsyslog-5.8.0-r1.0: task do_patch: Succeeded
NOTE: package systemd-serialgetty-1.0-r1: task do_unpack: Succeeded
NOTE: package systemd-compat-units-1.0-r14: task do_patch: Started
NOTE: package systemd-compat-units-1.0-r14: task do_patch: Succeeded
NOTE: Running task 837 of 2451 (ID: 614, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_fetch)
NOTE: Running task 838 of 2451 (ID: 1228, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_patch)
NOTE: Running task 839 of 2451 (ID: 548, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_fetch)
NOTE: package iw-0.9.20-r0: task do_patch: Succeeded
NOTE: Running task 840 of 2451 (ID: 460, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_fetch)
NOTE: package docbook-sgml-dtd-4.1-native-1.0-r3.0: task do_populate_sysroot: Succeeded
NOTE: Running task 841 of 2451 (ID: 450, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_fetch)
NOTE: package sysvinit-2.88dsf-r5: task do_patch: Succeeded
NOTE: Running task 842 of 2451 (ID: 403, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_populate_lic)
NOTE: package procps-3.2.8-r3: task do_fetch: Started
NOTE: package consolekit-0.4.5-r5: task do_unpack: Started
NOTE: package dropbear-systemd-v1-r0: task do_patch: Started
NOTE: package dropbear-systemd-v1-r0: task do_patch: Succeeded
NOTE: Running task 843 of 2451 (ID: 377, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_fetch)
NOTE: package kbd-1.15.2-r2: task do_unpack: Started
NOTE: package gzip-native-1.4-r0: task do_install: Succeeded
NOTE: package procps-3.2.8-r3: task do_fetch: Succeeded
NOTE: Running task 844 of 2451 (ID: 1848, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_populate_sysroot)
NOTE: Running task 845 of 2451 (ID: 457, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_unpack)
NOTE: package sysfsutils-2.1.0-r2: task do_populate_lic: Started
NOTE: package systemd-serialgetty-1.0-r1: task do_patch: Started
NOTE: package strace-4.5.20-r2: task do_fetch: Started
NOTE: package strace-4.5.20-r2: task do_fetch: Succeeded
NOTE: package binutils-native-2.21.1a-r0: task do_fetch: Started
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_fetch: Started
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_fetch: Succeeded
NOTE: package systemd-serialgetty-1.0-r1: task do_patch: Succeeded
NOTE: Running task 846 of 2451 (ID: 610, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_unpack)
NOTE: Running task 847 of 2451 (ID: 356, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_fetch)
NOTE: Running task 848 of 2451 (ID: 447, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_unpack)
NOTE: package binutils-native-2.21.1a-r0: task do_fetch: Succeeded
NOTE: package consolekit-0.4.5-r5: task do_unpack: Succeeded
NOTE: package ppp-dialin-0.1-r7: task do_fetch: Started
NOTE: Running task 849 of 2451 (ID: 1208, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/consolekit/consolekit_0.4.5.bb, do_patch)
NOTE: package ppp-dialin-0.1-r7: task do_fetch: Succeeded
NOTE: Running task 850 of 2451 (ID: 544, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_unpack)
NOTE: Running task 851 of 2451 (ID: 374, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_unpack)
NOTE: package sysfsutils-2.1.0-r2: task do_populate_lic: Succeeded
NOTE: package gzip-native-1.4-r0: task do_populate_sysroot: Started
NOTE: package procps-3.2.8-r3: task do_unpack: Started
NOTE: Running task 852 of 2451 (ID: 335, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_fetch)
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_unpack: Started
NOTE: package ncurses-native-5.9-r2.1: task do_configure: Succeeded
NOTE: Running task 853 of 2451 (ID: 1873, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_compile)
NOTE: package apmd-3.2.2-14-r1: task do_fetch: Started
NOTE: package apmd-3.2.2-14-r1: task do_fetch: Succeeded
NOTE: package strace-4.5.20-r2: task do_unpack: Started
NOTE: Running task 854 of 2451 (ID: 353, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_unpack)
NOTE: package procps-3.2.8-r3: task do_unpack: Succeeded
NOTE: Running task 855 of 2451 (ID: 458, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_patch)
NOTE: package consolekit-0.4.5-r5: task do_patch: Started
NOTE: package consolekit-0.4.5-r5: task do_patch: Succeeded
NOTE: Running task 856 of 2451 (ID: 325, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_fetch)
NOTE: package strace-4.5.20-r2: task do_unpack: Succeeded
NOTE: Running task 857 of 2451 (ID: 448, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_patch)
NOTE: package irda-utils-0.9.18-r0: task do_fetch: Started
NOTE: package kbd-1.15.2-r2: task do_unpack: Succeeded
NOTE: package apmd-3.2.2-14-r1: task do_unpack: Started
NOTE: package binutils-native-2.21.1a-r0: task do_unpack: Started
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_unpack: Succeeded
NOTE: package ppp-dialin-0.1-r7: task do_unpack: Started
NOTE: Running task 858 of 2451 (ID: 1218, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_patch)
NOTE: package irda-utils-0.9.18-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 2451 (ID: 611, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_patch)
NOTE: Running task 860 of 2451 (ID: 332, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_unpack)
NOTE: package ppp-dialin-0.1-r7: task do_unpack: Succeeded
NOTE: Running task 861 of 2451 (ID: 375, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_patch)
NOTE: package procps-3.2.8-r3: task do_patch: Started
NOTE: package ncurses-native-5.9-r2.1: task do_compile: Started
NOTE: package apmd-3.2.2-14-r1: task do_unpack: Succeeded
NOTE: Running task 862 of 2451 (ID: 354, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_patch)
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_fetch: Started
NOTE: package strace-4.5.20-r2: task do_patch: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_fetch: Succeeded
NOTE: package irda-utils-0.9.18-r0: task do_unpack: Started
NOTE: package ppp-dialin-0.1-r7: task do_patch: Started
NOTE: Running task 863 of 2451 (ID: 322, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_unpack)
NOTE: package kbd-1.15.2-r2: task do_patch: Started
NOTE: package kbd-1.15.2-r2: task do_patch: Succeeded
NOTE: package irda-utils-0.9.18-r0: task do_unpack: Succeeded
NOTE: package ppp-dialin-0.1-r7: task do_patch: Succeeded
NOTE: Running task 864 of 2451 (ID: 333, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_patch)
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_patch: Started
NOTE: Running task 865 of 2451 (ID: 283, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_fetch)
NOTE: Running task 866 of 2451 (ID: 273, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_fetch)
NOTE: package apmd-3.2.2-14-r1: task do_patch: Started
NOTE: package strace-4.5.20-r2: task do_patch: Succeeded
NOTE: Running task 867 of 2451 (ID: 257, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb, do_populate_lic)
NOTE: package portmap-6.0-r7: task do_fetch: Started
NOTE: package pcmciautils-018-r0: task do_fetch: Started
NOTE: package pcmciautils-018-r0: task do_fetch: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_unpack: Started
NOTE: package portmap-6.0-r7: task do_fetch: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_unpack: Succeeded
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_patch: Succeeded
NOTE: Running task 868 of 2451 (ID: 241, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_fetch)
NOTE: Running task 869 of 2451 (ID: 323, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_patch)
NOTE: Running task 870 of 2451 (ID: 280, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_unpack)
NOTE: Running task 871 of 2451 (ID: 270, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_unpack)
NOTE: package irda-utils-0.9.18-r0: task do_patch: Started
NOTE: package irda-utils-0.9.18-r0: task do_patch: Succeeded
NOTE: Running task 872 of 2451 (ID: 231, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_fetch)
NOTE: package gzip-native-1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 873 of 2451 (ID: 1470, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_unpack)
NOTE: package wpa-supplicant-0.7.3-r5: task do_populate_lic: Started
NOTE: package hostap-utils-0.4.7-r4: task do_fetch: Started
NOTE: package hostap-utils-0.4.7-r4: task do_fetch: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_patch: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_patch: Succeeded
NOTE: Running task 874 of 2451 (ID: 1031, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_unpack)
NOTE: Running task 875 of 2451 (ID: 238, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_unpack)
NOTE: package pcmciautils-018-r0: task do_unpack: Started
NOTE: package wireless-tools-1_29-r2: task do_fetch: Started
NOTE: package apmd-3.2.2-14-r1: task do_patch: Succeeded
NOTE: package portmap-6.0-r7: task do_unpack: Started
NOTE: Running task 876 of 2451 (ID: 1810, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_populate_lic)
NOTE: package procps-3.2.8-r3: task do_patch: Succeeded
NOTE: package pcmciautils-018-r0: task do_unpack: Succeeded
NOTE: package wpa-supplicant-0.7.3-r5: task do_populate_lic: Succeeded
NOTE: package wireless-tools-1_29-r2: task do_fetch: Succeeded
NOTE: Running task 877 of 2451 (ID: 1256, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_populate_lic)
NOTE: Running task 878 of 2451 (ID: 1013, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_fetch)
NOTE: Running task 879 of 2451 (ID: 271, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_patch)
NOTE: Running task 880 of 2451 (ID: 228, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_unpack)
NOTE: package portmap-6.0-r7: task do_unpack: Succeeded
NOTE: Running task 881 of 2451 (ID: 281, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_patch)
NOTE: package python-2.7.2-r0.2: task do_unpack: Succeeded
NOTE: Running task 882 of 2451 (ID: 1399, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_patch)
NOTE: package expat-native-2.0.1-r1: task do_unpack: Started
NOTE: package hostap-utils-0.4.7-r4: task do_unpack: Started
NOTE: package expat-native-2.0.1-r1: task do_unpack: Succeeded
NOTE: package hostap-utils-0.4.7-r4: task do_unpack: Succeeded
NOTE: Running task 883 of 2451 (ID: 1471, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_patch)
NOTE: Running task 884 of 2451 (ID: 239, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_patch)
NOTE: package portmap-6.0-r7: task do_patch: Started
NOTE: package wireless-tools-1_29-r2: task do_unpack: Started
NOTE: package expat-2.0.1-r1: task do_unpack: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_populate_lic: Started
NOTE: package bind-9.8.1-r1: task do_populate_lic: Started
NOTE: package lzo-native-2.05-r0: task do_fetch: Started
NOTE: package pcmciautils-018-r0: task do_patch: Started
NOTE: package expat-2.0.1-r1: task do_unpack: Succeeded
NOTE: package lzo-native-2.05-r0: task do_fetch: Succeeded
NOTE: Running task 885 of 2451 (ID: 1032, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_patch)
NOTE: Running task 886 of 2451 (ID: 1009, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_unpack)
NOTE: package wireless-tools-1_29-r2: task do_unpack: Succeeded
NOTE: Running task 887 of 2451 (ID: 229, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_patch)
NOTE: package python-2.7.2-r0.2: task do_patch: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_populate_lic: Succeeded
NOTE: Running task 888 of 2451 (ID: 1003, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_configure)
NOTE: package db-native-5.1.19-r3: task do_populate_sysroot: Succeeded
NOTE: package pcmciautils-018-r0: task do_patch: Succeeded
NOTE: package bind-9.8.1-r1: task do_populate_lic: Succeeded
NOTE: Running task 889 of 2451 (ID: 948, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_configure)
NOTE: Running task 896 of 2451 (ID: 2085, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_populate_lic)
NOTE: Running task 897 of 2451 (ID: 2074, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_populate_lic)
NOTE: package hostap-utils-0.4.7-r4: task do_patch: Started
NOTE: package expat-2.0.1-r1: task do_patch: Started
NOTE: package expat-native-2.0.1-r1: task do_patch: Started
NOTE: package portmap-6.0-r7: task do_patch: Succeeded
NOTE: Running task 900 of 2451 (ID: 2030, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_populate_lic)
NOTE: package wireless-tools-1_29-r2: task do_patch: Started
NOTE: package cross-localedef-native-2.13-r1: task do_configure: Started
NOTE: package lzo-native-2.05-r0: task do_unpack: Started
NOTE: package hostap-utils-0.4.7-r4: task do_patch: Succeeded
NOTE: package expat-2.0.1-r1: task do_patch: Succeeded
NOTE: Running task 901 of 2451 (ID: 1975, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb, do_populate_lic)
NOTE: Running task 902 of 2451 (ID: 1040, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_populate_lic)
NOTE: package resolvconf-1.61-r0: task do_configure: Started
NOTE: package lzo-native-2.05-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 2451 (ID: 1010, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_patch)
NOTE: package expat-native-2.0.1-r1: task do_patch: Succeeded
NOTE: Running task 904 of 2451 (ID: 1475, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_configure)
NOTE: package gmp-5.0.2-r1: task do_populate_lic: Started
WARNING: gmp: No generic license file exists for: LGPLv3&GPLv3 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package sqlite3-3.7.7.1-r1: task do_populate_lic: Started
WARNING: gmp: There is also no SPDXLICENSEMAP for this license type: LGPLv3&GPLv3 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package resolvconf-1.61-r0: task do_configure: Succeeded
NOTE: Running task 905 of 2451 (ID: 949, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_compile)
NOTE: package pkgconfig-0.25-r2: task do_populate_lic: Started
NOTE: package gmp-5.0.2-r1: task do_populate_lic: Succeeded
NOTE: package hicolor-icon-theme-0.12-r1: task do_populate_lic: Started
NOTE: package expat-2.0.1-r1: task do_populate_lic: Started
NOTE: Running task 906 of 2451 (ID: 1953, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/polkit/polkit_0.102.bb, do_populate_lic)
NOTE: package lzo-native-2.05-r0: task do_patch: Started
NOTE: package sqlite3-3.7.7.1-r1: task do_populate_lic: Succeeded
NOTE: Running task 907 of 2451 (ID: 1931, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_populate_lic)
NOTE: package wireless-tools-1_29-r2: task do_patch: Succeeded
NOTE: package expat-native-2.0.1-r1: task do_configure: Started
NOTE: package resolvconf-1.61-r0: task do_compile: Started
NOTE: package elfutils-native-0.148-r3: task do_compile: Succeeded
NOTE: Running task 908 of 2451 (ID: 535, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_install)
NOTE: Running task 909 of 2451 (ID: 1920, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_populate_lic)
NOTE: package hicolor-icon-theme-0.12-r1: task do_populate_lic: Succeeded
NOTE: package pkgconfig-0.25-r2: task do_populate_lic: Succeeded
NOTE: package polkit-0.102-r0: task do_populate_lic: Started
NOTE: package expat-2.0.1-r1: task do_populate_lic: Succeeded
NOTE: package resolvconf-1.61-r0: task do_compile: Succeeded
NOTE: Running task 911 of 2451 (ID: 930, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_populate_lic)
NOTE: Running task 912 of 2451 (ID: 919, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-boot.bb, do_populate_lic)
NOTE: Running task 915 of 2451 (ID: 1266, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_populate_lic)
NOTE: Running task 916 of 2451 (ID: 945, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_install)
NOTE: package linux-libc-headers-3.1-r1: task do_install: Succeeded
NOTE: package lzo-native-2.05-r0: task do_patch: Succeeded
NOTE: Running task 917 of 2451 (ID: 1660, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_populate_sysroot)
NOTE: Running task 918 of 2451 (ID: 615, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_configure)
NOTE: package polkit-0.102-r0: task do_populate_lic: Succeeded
NOTE: package bzip2-1.0.6-r3: task do_populate_lic: Started
WARNING: bzip2: No generic license file exists for: bzip2 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: bzip2: There is also no SPDXLICENSEMAP for this license type: bzip2 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: Running task 919 of 2451 (ID: 445, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.9p1.bb, do_populate_lic)
NOTE: package opkg-config-base-1.0-r0: task do_populate_lic: Started
NOTE: package resolvconf-1.61-r0: task do_install: Started
NOTE: package elfutils-native-0.148-r3: task do_install: Started
NOTE: package libtool-2.4-r4: task do_populate_lic: Started
NOTE: package bzip2-1.0.6-r3: task do_populate_lic: Succeeded
NOTE: package task-boot-1.0-r56: task do_populate_lic: Started
NOTE: Running task 920 of 2451 (ID: 392, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_populate_lic)
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_configure: Started
NOTE: package busybox-1.18.5-r2: task do_populate_lic: Started
WARNING: busybox: No generic license file exists for: bzip2 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: busybox: There is also no SPDXLICENSEMAP for this license type: bzip2 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package resolvconf-1.61-r0: task do_install: Succeeded
NOTE: package linux-libc-headers-3.1-r1: task do_populate_sysroot: Started
NOTE: Running task 921 of 2451 (ID: 308, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_populate_lic)
NOTE: package opkg-config-base-1.0-r0: task do_populate_lic: Succeeded
NOTE: package task-boot-1.0-r56: task do_populate_lic: Succeeded
NOTE: Running task 922 of 2451 (ID: 298, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_populate_lic)
NOTE: Running task 923 of 2451 (ID: 116, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_fetch)
NOTE: package libtool-2.4-r4: task do_populate_lic: Succeeded
NOTE: package openssh-5.9p1-r2: task do_populate_lic: Started
NOTE: package busybox-1.18.5-r2: task do_populate_lic: Succeeded
NOTE: Running task 924 of 2451 (ID: 105, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_fetch)
NOTE: Running task 925 of 2451 (ID: 83, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_fetch)
NOTE: package alsa-utils-1.0.24.2-r3: task do_populate_lic: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_populate_lic: Started
NOTE: package qemu-helper-native-1.0-r1: task do_fetch: Started
NOTE: package qemu-helper-native-1.0-r1: task do_fetch: Succeeded
NOTE: Running task 926 of 2451 (ID: 112, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_unpack)
NOTE: package openssh-5.9p1-r2: task do_populate_lic: Succeeded
NOTE: package ldconfig-native-2.12.1-r2: task do_fetch: Started
NOTE: package ldconfig-native-2.12.1-r2: task do_fetch: Succeeded
NOTE: Running task 927 of 2451 (ID: 72, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_fetch)
NOTE: package qemu-native-0.15.0-r1: task do_fetch: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_populate_lic: Succeeded
NOTE: Running task 928 of 2451 (ID: 50, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_fetch)
NOTE: Running task 929 of 2451 (ID: 79, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_unpack)
NOTE: package angstrom-feed-configs-1.0-r15: task do_populate_lic: Succeeded
NOTE: package qemu-native-0.15.0-r1: task do_fetch: Succeeded
NOTE: Running task 930 of 2451 (ID: 1014, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_configure)
NOTE: Running task 931 of 2451 (ID: 101, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_unpack)
NOTE: package linux-libc-headers-3.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 933 of 2451 (ID: 985, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_populate_lic)
NOTE: package qemu-helper-native-1.0-r1: task do_unpack: Started
NOTE: package qemu-helper-native-1.0-r1: task do_unpack: Succeeded
NOTE: Running task 934 of 2451 (ID: 113, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_patch)
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_fetch: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_fetch: Succeeded
NOTE: Running task 935 of 2451 (ID: 46, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_unpack)
NOTE: package ldconfig-native-2.12.1-r2: task do_unpack: Started
NOTE: package makedevs-native-1.0.0-r7: task do_fetch: Started
NOTE: package elfutils-native-0.148-r3: task do_install: Succeeded
NOTE: package makedevs-native-1.0.0-r7: task do_fetch: Succeeded
NOTE: Running task 936 of 2451 (ID: 536, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_populate_sysroot)
NOTE: Running task 937 of 2451 (ID: 68, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_unpack)
NOTE: package lzo-native-2.05-r0: task do_configure: Started
NOTE: package qemu-native-0.15.0-r1: task do_unpack: Started
NOTE: package python-2.7.2-r0.2: task do_patch: Succeeded
NOTE: Running task 938 of 2451 (ID: 963, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_populate_lic)
NOTE: package ntp-4.2.6p3-r3: task do_populate_lic: Started
WARNING: ntp: No generic license file exists for: ntp at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: ntp: There is also no SPDXLICENSEMAP for this license type: ntp at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package ldconfig-native-2.12.1-r2: task do_unpack: Succeeded
NOTE: Running task 939 of 2451 (ID: 80, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_patch)
NOTE: package qemu-helper-native-1.0-r1: task do_patch: Started
NOTE: package qemu-helper-native-1.0-r1: task do_patch: Succeeded
NOTE: Running task 940 of 2451 (ID: 952, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_populate_lic)
NOTE: package makedevs-native-1.0.0-r7: task do_unpack: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_unpack: Started
NOTE: package makedevs-native-1.0.0-r7: task do_unpack: Succeeded
NOTE: package ntp-4.2.6p3-r3: task do_populate_lic: Succeeded
NOTE: package iptables-1.4.12.1-r0: task do_populate_lic: Started
NOTE: package resolvconf-1.61-r0: task do_populate_lic: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_unpack: Succeeded
NOTE: Running task 941 of 2451 (ID: 941, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_populate_lic)
NOTE: Running task 942 of 2451 (ID: 47, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_patch)
NOTE: Running task 943 of 2451 (ID: 69, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_patch)
NOTE: package ldconfig-native-2.12.1-r2: task do_patch: Started
NOTE: package elfutils-native-0.148-r3: task do_populate_sysroot: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_populate_lic: Started
NOTE: package iptables-1.4.12.1-r0: task do_populate_lic: Succeeded
NOTE: package resolvconf-1.61-r0: task do_populate_lic: Succeeded
NOTE: Running noexec task 944 of 2451 (ID: 210, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_fetch)
NOTE: Running noexec task 945 of 2451 (ID: 207, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_unpack)
NOTE: Running noexec task 946 of 2451 (ID: 208, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_patch)
NOTE: Running task 947 of 2451 (ID: 200, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/connman/connman_0.77.bb, do_fetch)
NOTE: Running task 948 of 2451 (ID: 190, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_fetch)
NOTE: package file-native-5.09-r0: task do_configure: Succeeded
NOTE: Running task 949 of 2451 (ID: 649, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_compile)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_populate_lic: Succeeded
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_patch: Started
NOTE: Running task 950 of 2451 (ID: 180, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/tasks/angstrom-task-boot.bb, do_fetch)
NOTE: package dhcp-4.2.0-r4: task do_populate_lic: Started
NOTE: package connman-0.77-r4: task do_fetch: Started
NOTE: package connman-0.77-r4: task do_fetch: Succeeded
NOTE: package makedevs-native-1.0.0-r7: task do_patch: Started
NOTE: package qemu-native-0.15.0-r1: task do_unpack: Succeeded
NOTE: Running task 951 of 2451 (ID: 102, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_patch)
NOTE: Running task 952 of 2451 (ID: 197, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/connman/connman_0.77.bb, do_unpack)
NOTE: package task-basic-1.0-r3: task do_fetch: Started
NOTE: package task-basic-1.0-r3: task do_fetch: Succeeded
NOTE: Running task 953 of 2451 (ID: 187, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_unpack)
NOTE: package makedevs-native-1.0.0-r7: task do_patch: Succeeded
NOTE: package dhcp-4.2.0-r4: task do_populate_lic: Succeeded
NOTE: Running task 954 of 2451 (ID: 159, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_fetch)
NOTE: package perl-5.14.2-r0: task do_patch: Succeeded
NOTE: Running task 955 of 2451 (ID: 2106, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_populate_lic)
NOTE: package file-native-5.09-r0: task do_compile: Started
NOTE: Running task 956 of 2451 (ID: 1386, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_populate_lic)
NOTE: package angstrom-task-boot-1.0-r3: task do_fetch: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_patch: Succeeded
NOTE: package angstrom-task-boot-1.0-r3: task do_fetch: Succeeded
NOTE: Running task 957 of 2451 (ID: 2102, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_configure)
NOTE: Running task 958 of 2451 (ID: 177, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/tasks/angstrom-task-boot.bb, do_unpack)
NOTE: package qemu-native-0.15.0-r1: task do_patch: Started
NOTE: package task-basic-1.0-r3: task do_unpack: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_populate_lic: Started
WARNING: /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/qemuarm-angstrom-linux-gnueabi/sysvinit-inittab-2.88dsf-r6/sysvinit-2.88dsf/COPYING could not be copied for some reason. It may not exist. WARN for now.
NOTE: package perl-5.14.2-r0: task do_populate_lic: Started
NOTE: package task-basic-1.0-r3: task do_unpack: Succeeded
NOTE: package tinylogin-1.4-r7: task do_fetch: Started
NOTE: Running task 959 of 2451 (ID: 188, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_patch)
WARNING: perl: No generic license file exists for: Artistic|GPL at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: perl: There is also no SPDXLICENSEMAP for this license type: Artistic|GPL at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package angstrom-task-boot-1.0-r3: task do_unpack: Started
NOTE: package tinylogin-1.4-r7: task do_fetch: Succeeded
NOTE: package connman-0.77-r4: task do_unpack: Started
NOTE: Running task 960 of 2451 (ID: 156, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_unpack)
NOTE: package angstrom-task-boot-1.0-r3: task do_unpack: Succeeded
NOTE: Running task 961 of 2451 (ID: 178, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/tasks/angstrom-task-boot.bb, do_patch)
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_configure: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_populate_lic: Succeeded
NOTE: Running task 962 of 2451 (ID: 2096, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_populate_lic)
NOTE: package connman-0.77-r4: task do_unpack: Succeeded
NOTE: Running task 963 of 2451 (ID: 198, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/connman/connman_0.77.bb, do_patch)
NOTE: package perl-5.14.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 964 of 2451 (ID: 2091, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_debug_patch)
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_configure: Succeeded
NOTE: Running task 965 of 2451 (ID: 2103, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_compile)
NOTE: package angstrom-task-boot-1.0-r3: task do_patch: Started
NOTE: package tinylogin-1.4-r7: task do_unpack: Started
NOTE: package angstrom-task-boot-1.0-r3: task do_patch: Succeeded
NOTE: package ldconfig-native-2.12.1-r2: task do_patch: Succeeded
NOTE: package task-basic-1.0-r3: task do_patch: Started
NOTE: package task-basic-1.0-r3: task do_patch: Succeeded
NOTE: Running task 966 of 2451 (ID: 2035, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_populate_sysroot)
NOTE: Running task 967 of 2451 (ID: 1457, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_populate_lic)
NOTE: Running task 968 of 2451 (ID: 1447, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_populate_lic)
NOTE: package connman-0.77-r4: task do_patch: Started
NOTE: package dropbear-0.53.1-r0: task do_populate_lic: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_compile: Started
NOTE: package dropbear-0.53.1-r0: task do_debug_patch: Started
NOTE: package connman-0.77-r4: task do_patch: Succeeded
NOTE: package tinylogin-1.4-r7: task do_unpack: Succeeded
NOTE: package tzcode-native-2011i-r4.2: task do_populate_sysroot: Started
NOTE: package base-files-3.0.14-r81: task do_populate_lic: Started
NOTE: Running task 969 of 2451 (ID: 157, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_patch)
NOTE: Running task 970 of 2451 (ID: 1443, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_configure)
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_compile: Succeeded
NOTE: package dropbear-0.53.1-r0: task do_debug_patch: Succeeded
NOTE: package netbase-4.47-r0: task do_populate_lic: Started
NOTE: Running task 971 of 2451 (ID: 1406, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_populate_lic)
NOTE: Running task 972 of 2451 (ID: 2100, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_install)
NOTE: package dropbear-0.53.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 973 of 2451 (ID: 1396, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.1.bb, do_populate_lic)
NOTE: package base-files-3.0.14-r81: task do_configure: Started
NOTE: package netbase-4.47-r0: task do_populate_lic: Succeeded
NOTE: package base-files-3.0.14-r81: task do_populate_lic: Succeeded
NOTE: package elfutils-native-0.148-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 974 of 2451 (ID: 1376, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_populate_lic)
NOTE: Running task 975 of 2451 (ID: 1366, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_populate_lic)
NOTE: Running task 976 of 2451 (ID: 1356, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb, do_populate_lic)
NOTE: package base-files-3.0.14-r81: task do_configure: Succeeded
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_install: Started
NOTE: package tinylogin-1.4-r7: task do_patch: Started
NOTE: Running task 977 of 2451 (ID: 1444, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_compile)
NOTE: package bluez-hcidump-2.1-r0: task do_populate_lic: Started
NOTE: package tzcode-native-2011i-r4.2: task do_populate_sysroot: Succeeded
NOTE: package python-2.7.2-r0.2: task do_populate_lic: Started
NOTE: Running task 978 of 2451 (ID: 1336, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_populate_lic)
WARNING: python: No generic license file exists for: PSFv2 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: python: There is also no SPDXLICENSEMAP for this license type: PSFv2 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_install: Succeeded
NOTE: Running task 979 of 2451 (ID: 1316, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb, do_populate_lic)
NOTE: package sysvinit-2.88dsf-r5: task do_populate_lic: Started
NOTE: package bluez-hcidump-2.1-r0: task do_populate_lic: Succeeded
NOTE: package libnss-mdns-0.10-r4: task do_populate_lic: Started
NOTE: Running task 980 of 2451 (ID: 1306, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_populate_lic)
NOTE: package dnsmasq-dbus-2.55-r0: task do_populate_lic: Started
WARNING: dnsmasq-dbus: No generic license file exists for: GPLv2GPLv3 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package htop-0.9-r1: task do_populate_lic: Started
NOTE: package base-files-3.0.14-r81: task do_compile: Started
NOTE: package sysvinit-2.88dsf-r5: task do_populate_lic: Succeeded
WARNING: dnsmasq-dbus: There is also no SPDXLICENSEMAP for this license type: GPLv2GPLv3 at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package python-2.7.2-r0.2: task do_populate_lic: Succeeded
NOTE: Running task 981 of 2451 (ID: 1302, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_configure)
NOTE: package libnss-mdns-0.10-r4: task do_populate_lic: Succeeded
NOTE: package rsyslog-5.8.0-r1.0: task do_populate_lic: Started
NOTE: Running task 982 of 2451 (ID: 1296, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/iw/iw_0.9.20.bb, do_populate_lic)
NOTE: Running task 983 of 2451 (ID: 1286, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_populate_lic)
NOTE: package tzdata-2011g-r10.0: task do_populate_lic: Started
NOTE: package htop-0.9-r1: task do_populate_lic: Succeeded
NOTE: package base-files-3.0.14-r81: task do_compile: Succeeded
NOTE: package dnsmasq-dbus-2.55-r0: task do_populate_lic: Succeeded
NOTE: Running task 984 of 2451 (ID: 1441, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_install)
NOTE: Running task 985 of 2451 (ID: 1282, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_configure)
NOTE: Running task 986 of 2451 (ID: 1276, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_populate_lic)
NOTE: package tzdata-2011g-r10.0: task do_configure: Started
NOTE: package rsyslog-5.8.0-r1.0: task do_populate_lic: Succeeded
NOTE: Running task 987 of 2451 (ID: 1272, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_configure)
NOTE: package tzdata-2011g-r10.0: task do_configure: Succeeded
NOTE: package iw-0.9.20-r0: task do_populate_lic: Started
NOTE: Running task 988 of 2451 (ID: 1303, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_compile)
NOTE: package tzdata-2011g-r10.0: task do_populate_lic: Succeeded
NOTE: Running task 989 of 2451 (ID: 1235, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_populate_lic)
NOTE: package systemd-compat-units-1.0-r14: task do_populate_lic: Started
NOTE: package iw-0.9.20-r0: task do_populate_lic: Succeeded
NOTE: package base-files-3.0.14-r81: task do_install: Started
NOTE: Running task 990 of 2451 (ID: 1225, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_populate_lic)
NOTE: package systemd-compat-units-1.0-r14: task do_configure: Started
NOTE: package dropbear-systemd-v1-r0: task do_populate_lic: Started
NOTE: package systemd-compat-units-1.0-r14: task do_configure: Succeeded
NOTE: package dropbear-systemd-v1-r0: task do_configure: Started
NOTE: Running task 991 of 2451 (ID: 1283, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_compile)
NOTE: package systemd-compat-units-1.0-r14: task do_populate_lic: Succeeded
NOTE: package tzdata-2011g-r10.0: task do_compile: Started
NOTE: Running task 992 of 2451 (ID: 1215, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/consolekit/consolekit_0.4.5.bb, do_populate_lic)
NOTE: package shadow-native-4.1.4.3-r2: task do_configure: Succeeded
NOTE: Running task 993 of 2451 (ID: 883, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_compile)
NOTE: package systemd-serialgetty-1.0-r1: task do_populate_lic: Started
NOTE: package dropbear-systemd-v1-r0: task do_configure: Succeeded
NOTE: package dropbear-systemd-v1-r0: task do_populate_lic: Succeeded
NOTE: Running task 994 of 2451 (ID: 1161, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_populate_lic)
NOTE: Running task 995 of 2451 (ID: 1273, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_compile)
NOTE: package kbd-1.15.2-r2: task do_populate_lic: Started
NOTE: package systemd-serialgetty-1.0-r1: task do_populate_lic: Succeeded
NOTE: Running task 996 of 2451 (ID: 465, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_populate_lic)
NOTE: package systemd-compat-units-1.0-r14: task do_compile: Started
NOTE: package binutils-native-2.21.1a-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 2451 (ID: 545, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_patch)
NOTE: package dropbear-systemd-v1-r0: task do_compile: Started
NOTE: package consolekit-0.4.5-r5: task do_populate_lic: Started
NOTE: package systemd-compat-units-1.0-r14: task do_compile: Succeeded
NOTE: package shadow-native-4.1.4.3-r2: task do_compile: Started
NOTE: package procps-3.2.8-r3: task do_populate_lic: Started
NOTE: package elfutils-0.148-r3: task do_populate_lic: Started
NOTE: package kbd-1.15.2-r2: task do_populate_lic: Succeeded
NOTE: Running task 998 of 2451 (ID: 455, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_populate_lic)
NOTE: package binutils-native-2.21.1a-r0: task do_patch: Started
NOTE: Running task 999 of 2451 (ID: 1280, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_install)
NOTE: package dropbear-systemd-v1-r0: task do_compile: Succeeded
NOTE: package tinylogin-1.4-r7: task do_patch: Succeeded
NOTE: Running task 1000 of 2451 (ID: 1270, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_install)
NOTE: Running task 1001 of 2451 (ID: 382, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_populate_lic)
NOTE: package consolekit-0.4.5-r5: task do_populate_lic: Succeeded
WARNING: elfutils: No generic license file exists for: Exception at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: elfutils: There is also no SPDXLICENSEMAP for this license type: Exception at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: Running task 1002 of 2451 (ID: 361, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_populate_lic)
NOTE: package file-native-5.09-r0: task do_compile: Succeeded
NOTE: package base-files-3.0.14-r81: task do_install: Succeeded
NOTE: Running task 1003 of 2451 (ID: 645, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_install)
NOTE: Running task 1004 of 2451 (ID: 340, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_populate_lic)
NOTE: package tzdata-2011g-r10.0: task do_compile: Succeeded
NOTE: Running task 1005 of 2451 (ID: 1300, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_install)
NOTE: package elfutils-0.148-r3: task do_populate_lic: Succeeded
NOTE: Running task 1006 of 2451 (ID: 330, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_populate_lic)
NOTE: package procps-3.2.8-r3: task do_populate_lic: Succeeded
NOTE: package strace-4.5.20-r2: task do_populate_lic: Started
NOTE: Running task 1007 of 2451 (ID: 288, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_populate_lic)
NOTE: package systemd-compat-units-1.0-r14: task do_install: Started
NOTE: package dropbear-systemd-v1-r0: task do_install: Started
NOTE: package ppp-dialin-0.1-r7: task do_populate_lic: Started
NOTE: package qemu-native-0.15.0-r1: task do_patch: Succeeded
NOTE: Running task 1008 of 2451 (ID: 278, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_populate_lic)
NOTE: package dropbear-systemd-v1-r0: task do_install: Succeeded
NOTE: Running task 1009 of 2451 (ID: 246, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_populate_lic)
NOTE: package irda-utils-0.9.18-r0: task do_populate_lic: Started
NOTE: package apmd-3.2.2-14-r1: task do_populate_lic: Started
NOTE: package strace-4.5.20-r2: task do_populate_lic: Succeeded
NOTE: package tzdata-2011g-r10.0: task do_install: Started
NOTE: Running task 1010 of 2451 (ID: 236, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_populate_lic)
NOTE: package systemd-compat-units-1.0-r14: task do_install: Succeeded
NOTE: package portmap-6.0-r7: task do_populate_lic: Started
NOTE: Running task 1011 of 2451 (ID: 117, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_configure)
NOTE: package ppp-dialin-0.1-r7: task do_populate_lic: Succeeded
NOTE: Running task 1012 of 2451 (ID: 84, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_configure)
NOTE: package file-native-5.09-r0: task do_install: Started
NOTE: package apmd-3.2.2-14-r1: task do_populate_lic: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_populate_lic: Started
NOTE: package pcmciautils-018-r0: task do_populate_lic: Started
NOTE: Running task 1013 of 2451 (ID: 73, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_configure)
NOTE: package irda-utils-0.9.18-r0: task do_populate_lic: Succeeded
NOTE: package hostap-utils-0.4.7-r4: task do_populate_lic: Started
NOTE: package portmap-6.0-r7: task do_populate_lic: Succeeded
NOTE: Running task 1017 of 2451 (ID: 2383, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_populate_lic)
NOTE: Running task 1018 of 2451 (ID: 2173, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_populate_lic)
NOTE: package wireless-tools-1_29-r2: task do_populate_lic: Started
NOTE: package qemu-helper-native-1.0-r1: task do_configure: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_populate_lic: Succeeded
NOTE: package pcmciautils-018-r0: task do_populate_lic: Succeeded
NOTE: Running task 1037 of 2451 (ID: 1622, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_populate_lic)
NOTE: Running task 1054 of 2451 (ID: 946, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_populate_sysroot)
NOTE: package ldconfig-native-2.12.1-r2: task do_configure: Started
NOTE: package qemu-helper-native-1.0-r1: task do_configure: Succeeded
NOTE: Running task 1055 of 2451 (ID: 118, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_compile)
NOTE: package wireless-tools-1_29-r2: task do_populate_lic: Succeeded
NOTE: package hostap-utils-0.4.7-r4: task do_populate_lic: Succeeded
NOTE: Running task 1074 of 2451 (ID: 215, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_populate_lic)
NOTE: Running task 1075 of 2451 (ID: 205, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/connman/connman_0.77.bb, do_populate_lic)
NOTE: package ldconfig-native-2.12.1-r2: task do_configure: Succeeded
NOTE: package resolvconf-1.61-r0: task do_populate_sysroot: Started
NOTE: package makedevs-native-1.0.0-r7: task do_configure: Started
NOTE: package eglibc-initial-2.12-r27: task do_populate_lic: Started
NOTE: Running task 1076 of 2451 (ID: 85, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_compile)
NOTE: package xz-native-5.0.2-r0: task do_configure: Succeeded
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_lic: Started
WARNING: gcc-cross-initial: No generic license file exists for: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: gcc-cross-initial: There is also no SPDXLICENSEMAP for this license type: GCCRUNTIMELIBRARYEXCEPTION at /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package file-native-5.09-r0: task do_install: Succeeded
NOTE: Running task 1077 of 2451 (ID: 1191, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_compile)
NOTE: package qemu-helper-native-1.0-r1: task do_compile: Started
NOTE: Running task 1078 of 2451 (ID: 646, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_populate_sysroot)
NOTE: package makedevs-native-1.0.0-r7: task do_configure: Succeeded
NOTE: package binutils-cross-2.20.1-r9: task do_populate_lic: Started
NOTE: Running task 1079 of 2451 (ID: 74, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_compile)
NOTE: package eglibc-locale-2.12-r18: task do_populate_lic: Started
NOTE: package tzdata-2011g-r10.0: task do_install: Succeeded
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_lic: Succeeded
NOTE: package ldconfig-native-2.12.1-r2: task do_compile: Started
NOTE: package eglibc-initial-2.12-r27: task do_populate_lic: Succeeded
NOTE: package connman-0.77-r4: task do_populate_lic: Started
NOTE: Running task 1081 of 2451 (ID: 195, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_populate_lic)
NOTE: package resolvconf-1.61-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1082 of 2451 (ID: 185, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/tasks/angstrom-task-boot.bb, do_populate_lic)
NOTE: Running task 1083 of 2451 (ID: 164, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_populate_lic)
NOTE: Running task 1084 of 2451 (ID: 132, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_populate_lic)
NOTE: package qemu-helper-native-1.0-r1: task do_compile: Succeeded
NOTE: Running task 1085 of 2451 (ID: 114, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_install)
NOTE: package binutils-cross-2.20.1-r9: task do_populate_lic: Succeeded
NOTE: package eglibc-locale-2.12-r18: task do_populate_lic: Succeeded
NOTE: Running task 1111 of 2451 (ID: 1173, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_package_write_ipk)
NOTE: Running noexec task 1130 of 2451 (ID: 2436, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_package_write)
NOTE: Running noexec task 1131 of 2451 (ID: 2314, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_package_write)
NOTE: Running noexec task 1132 of 2451 (ID: 2159, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb, do_package_write)
NOTE: Running noexec task 1133 of 2451 (ID: 2148, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write)
NOTE: Running noexec task 1134 of 2451 (ID: 2115, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_package_write)
NOTE: Running noexec task 1135 of 2451 (ID: 2039, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb, do_package_write)
NOTE: Running noexec task 1136 of 2451 (ID: 1995, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb, do_package_write)
NOTE: Running noexec task 1137 of 2451 (ID: 1907, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/guilt/guilt-native_0.33.bb, do_package_write)
NOTE: Running noexec task 1138 of 2451 (ID: 1852, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gzip/gzip_1.4.bb, do_package_write)
NOTE: Running noexec task 1139 of 2451 (ID: 1742, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_package_write)
NOTE: Running noexec task 1140 of 2451 (ID: 1731, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_package_write)
NOTE: Running noexec task 1141 of 2451 (ID: 1598, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_package_write)
NOTE: Running noexec task 1142 of 2451 (ID: 1554, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_package_write)
NOTE: Running noexec task 1143 of 2451 (ID: 1532, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_package_write)
NOTE: Running noexec task 1144 of 2451 (ID: 1510, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc.bb, do_package_write)
NOTE: Running noexec task 1145 of 2451 (ID: 1415, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.16.bb, do_package_write)
NOTE: Running noexec task 1146 of 2451 (ID: 1071, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_package_write)
NOTE: Running noexec task 1147 of 2451 (ID: 994, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb, do_package_write)
NOTE: Running noexec task 1148 of 2451 (ID: 774, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb, do_package_write)
NOTE: Running noexec task 1149 of 2451 (ID: 730, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/gperf/gperf_3.0.4.bb, do_package_write)
NOTE: Running noexec task 1150 of 2451 (ID: 661, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb, do_package_write)
NOTE: Running noexec task 1151 of 2451 (ID: 650, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/file/file_5.09.bb, do_package_write)
NOTE: Running noexec task 1152 of 2451 (ID: 595, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_package_write)
NOTE: Running noexec task 1153 of 2451 (ID: 584, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb, do_package_write)
NOTE: Running noexec task 1154 of 2451 (ID: 562, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb, do_package_write)
NOTE: Running noexec task 1155 of 2451 (ID: 540, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_package_write)
NOTE: Running noexec task 1156 of 2451 (ID: 529, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb, do_package_write)
NOTE: Running noexec task 1157 of 2451 (ID: 518, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.4.bb, do_package_write)
NOTE: Running noexec task 1158 of 2451 (ID: 507, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/automake/automake_1.11.1.bb, do_package_write)
NOTE: Running noexec task 1159 of 2451 (ID: 496, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.68.bb, do_package_write)
NOTE: Running noexec task 1160 of 2451 (ID: 474, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_package_write)
NOTE: Running noexec task 1161 of 2451 (ID: 64, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb, do_package_write)
NOTE: Running noexec task 1162 of 2451 (ID: 31, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_1.2.bb, do_package_write)
NOTE: Running noexec task 1163 of 2451 (ID: 20, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.48.bb, do_package_write)
NOTE: package task-basic-1.0-r3: task do_populate_lic: Started
NOTE: package xz-native-5.0.2-r0: task do_compile: Started
NOTE: package file-native-5.09-r0: task do_populate_sysroot: Started
NOTE: package angstrom-task-boot-1.0-r3: task do_populate_lic: Started
NOTE: package connman-0.77-r4: task do_populate_lic: Succeeded
NOTE: package makedevs-native-1.0.0-r7: task do_compile: Started
NOTE: package tinylogin-1.4-r7: task do_populate_lic: Started
NOTE: package task-base-1.0-r72: task do_populate_lic: Started
NOTE: package qemu-helper-native-1.0-r1: task do_install: Started
NOTE: package task-basic-1.0-r3: task do_populate_lic: Succeeded
NOTE: package qemu-helper-native-1.0-r1: task do_install: Succeeded
NOTE: package angstrom-task-boot-1.0-r3: task do_populate_lic: Succeeded
NOTE: Running noexec task 1166 of 2451 (ID: 119, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_package_write)
NOTE: Running task 1167 of 2451 (ID: 115, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb, do_populate_sysroot)
NOTE: package tinylogin-1.4-r7: task do_populate_lic: Succeeded
NOTE: package ldconfig-native-2.12.1-r2: task do_compile: Succeeded
NOTE: package task-base-1.0-r72: task do_populate_lic: Succeeded
NOTE: Running task 1168 of 2451 (ID: 81, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_install)
NOTE: package module-init-tools-cross-3.16-r0: task do_package_write_ipk: Started
NOTE: package makedevs-native-1.0.0-r7: task do_compile: Succeeded
NOTE: Running task 1169 of 2451 (ID: 70, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_install)
NOTE: package qemu-helper-native-1.0-r1: task do_populate_sysroot: Started
NOTE: package module-init-tools-cross-3.16-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1170 of 2451 (ID: 1170, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb, do_package_write)
NOTE: package makedevs-native-1.0.0-r7: task do_install: Started
NOTE: package ldconfig-native-2.12.1-r2: task do_install: Started
NOTE: package makedevs-native-1.0.0-r7: task do_install: Succeeded
NOTE: package shadow-native-4.1.4.3-r2: task do_compile: Succeeded
NOTE: package ldconfig-native-2.12.1-r2: task do_install: Succeeded
NOTE: package file-native-5.09-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1171 of 2451 (ID: 879, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_install)
NOTE: Running noexec task 1174 of 2451 (ID: 86, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_package_write)
NOTE: Running task 1175 of 2451 (ID: 82, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb, do_populate_sysroot)
NOTE: Running noexec task 1178 of 2451 (ID: 75, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_package_write)
NOTE: Running task 1179 of 2451 (ID: 71, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb, do_populate_sysroot)
NOTE: package qemu-helper-native-1.0-r1: task do_populate_sysroot: Succeeded
NOTE: package ldconfig-native-2.12.1-r2: task do_populate_sysroot: Started
NOTE: package shadow-native-4.1.4.3-r2: task do_install: Started
NOTE: package makedevs-native-1.0.0-r7: task do_populate_sysroot: Started
NOTE: package ldconfig-native-2.12.1-r2: task do_populate_sysroot: Succeeded
NOTE: package binutils-native-2.21.1a-r0: task do_patch: Succeeded
NOTE: package makedevs-native-1.0.0-r7: task do_populate_sysroot: Succeeded
NOTE: package shadow-native-4.1.4.3-r2: task do_install: Succeeded
NOTE: Running task 1181 of 2451 (ID: 880, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_populate_sysroot)
NOTE: Running noexec task 1184 of 2451 (ID: 884, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb, do_package_write)
NOTE: package shadow-native-4.1.4.3-r2: task do_populate_sysroot: Started
NOTE: package gmp-native-5.0.2-r1: task do_configure: Succeeded
NOTE: Running task 1185 of 2451 (ID: 1641, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_compile)
NOTE: package gmp-native-5.0.2-r1: task do_compile: Started
NOTE: package ncurses-native-5.9-r2.1: task do_compile: Succeeded
NOTE: Running task 1186 of 2451 (ID: 1869, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_install)
NOTE: package cross-localedef-native-2.13-r1: task do_configure: Succeeded
NOTE: package shadow-native-4.1.4.3-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1187 of 2451 (ID: 1004, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_compile)
NOTE: package ncurses-native-5.9-r2.1: task do_install: Started
NOTE: package xz-native-5.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1188 of 2451 (ID: 1187, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_install)
NOTE: package cross-localedef-native-2.13-r1: task do_compile: Started
NOTE: package xz-native-5.0.2-r0: task do_install: Started
NOTE: package xz-native-5.0.2-r0: task do_install: Succeeded
NOTE: Running task 1189 of 2451 (ID: 1188, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_populate_sysroot)
NOTE: Running noexec task 1192 of 2451 (ID: 1192, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/xz/xz_5.0.2.bb, do_package_write)
NOTE: package xz-native-5.0.2-r0: task do_populate_sysroot: Started
NOTE: package cross-localedef-native-2.13-r1: task do_compile: Succeeded
NOTE: Running task 1193 of 2451 (ID: 1000, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_install)
NOTE: package cross-localedef-native-2.13-r1: task do_install: Started
NOTE: package cross-localedef-native-2.13-r1: task do_install: Succeeded
NOTE: Running task 1195 of 2451 (ID: 1001, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_populate_sysroot)
NOTE: Running noexec task 1197 of 2451 (ID: 1005, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eglibc/cross-localedef-native_2.13.bb, do_package_write)
NOTE: package xz-native-5.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1198 of 2451 (ID: 1999, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_unpack)
NOTE: Running task 1199 of 2451 (ID: 2010, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_unpack)
NOTE: Running task 1200 of 2451 (ID: 1429, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_unpack)
NOTE: package cross-localedef-native-2.13-r1: task do_populate_sysroot: Started
NOTE: package coreutils-8.14-r1: task do_unpack: Started
NOTE: package shared-mime-info-0.91-r3: task do_unpack: Started
NOTE: package shared-mime-info-native-0.91-r3: task do_unpack: Started
NOTE: package shared-mime-info-0.91-r3: task do_unpack: Succeeded
NOTE: package shared-mime-info-native-0.91-r3: task do_unpack: Succeeded
NOTE: Running task 1201 of 2451 (ID: 2011, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_patch)
NOTE: Running task 1202 of 2451 (ID: 2000, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_patch)
NOTE: package shared-mime-info-0.91-r3: task do_patch: Started
NOTE: package shared-mime-info-native-0.91-r3: task do_patch: Started
NOTE: package shared-mime-info-0.91-r3: task do_patch: Succeeded
NOTE: package shared-mime-info-native-0.91-r3: task do_patch: Succeeded
NOTE: Running task 1203 of 2451 (ID: 2019, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_populate_lic)
NOTE: package coreutils-8.14-r1: task do_unpack: Succeeded
NOTE: Running task 1205 of 2451 (ID: 1430, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_patch)
NOTE: package expat-native-2.0.1-r1: task do_configure: Succeeded
NOTE: Running task 1206 of 2451 (ID: 1476, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_compile)
NOTE: package shared-mime-info-0.91-r3: task do_populate_lic: Started
NOTE: package coreutils-8.14-r1: task do_patch: Started
NOTE: package shared-mime-info-0.91-r3: task do_populate_lic: Succeeded
NOTE: package expat-native-2.0.1-r1: task do_compile: Started
NOTE: package coreutils-8.14-r1: task do_patch: Succeeded
NOTE: Running task 1207 of 2451 (ID: 1437, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_populate_lic)
NOTE: package coreutils-8.14-r1: task do_populate_lic: Started
NOTE: package coreutils-8.14-r1: task do_populate_lic: Succeeded
NOTE: package gmp-native-5.0.2-r1: task do_compile: Succeeded
NOTE: Running task 1208 of 2451 (ID: 1637, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_install)
NOTE: package gmp-native-5.0.2-r1: task do_install: Started
NOTE: package perl-native-5.14.2-r0: task do_configure: Succeeded
NOTE: Running task 1209 of 2451 (ID: 861, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_compile)
NOTE: package perl-native-5.14.2-r0: task do_compile: Started
NOTE: package gmp-native-5.0.2-r1: task do_install: Succeeded
NOTE: Running task 1210 of 2451 (ID: 1638, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_populate_sysroot)
NOTE: Running noexec task 1213 of 2451 (ID: 1642, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_package_write)
NOTE: package gmp-native-5.0.2-r1: task do_populate_sysroot: Started
NOTE: package gmp-native-5.0.2-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1214 of 2451 (ID: 1629, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_configure)
NOTE: package mpfr-native-3.1.0-r0: task do_configure: Started
NOTE: package expat-native-2.0.1-r1: task do_compile: Succeeded
NOTE: Running task 1215 of 2451 (ID: 1472, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_install)
NOTE: package expat-native-2.0.1-r1: task do_install: Started
NOTE: package expat-native-2.0.1-r1: task do_install: Succeeded
NOTE: Running task 1216 of 2451 (ID: 1473, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_populate_sysroot)
NOTE: Running noexec task 1219 of 2451 (ID: 1477, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_package_write)
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_configure: Succeeded
NOTE: Running task 1220 of 2451 (ID: 616, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_compile)
NOTE: package expat-native-2.0.1-r1: task do_populate_sysroot: Started
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_compile: Started
NOTE: package expat-native-2.0.1-r1: task do_populate_sysroot: Succeeded
NOTE: package bison-native-2.5-r1: task do_configure: Succeeded
NOTE: Running task 1221 of 2451 (ID: 1487, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_compile)
NOTE: package bison-native-2.5-r1: task do_compile: Started
NOTE: package lzo-native-2.05-r0: task do_configure: Succeeded
NOTE: Running task 1222 of 2451 (ID: 1015, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_compile)
NOTE: package lzo-native-2.05-r0: task do_compile: Started
NOTE: package bison-native-2.5-r1: task do_compile: Succeeded
NOTE: Running task 1223 of 2451 (ID: 1483, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_install)
NOTE: package bison-native-2.5-r1: task do_install: Started
NOTE: package lzo-native-2.05-r0: task do_compile: Succeeded
NOTE: Running task 1224 of 2451 (ID: 1011, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_install)
NOTE: package lzo-native-2.05-r0: task do_install: Started
NOTE: package bison-native-2.5-r1: task do_install: Succeeded
NOTE: package lzo-native-2.05-r0: task do_install: Succeeded
NOTE: Running task 1225 of 2451 (ID: 1484, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_populate_sysroot)
NOTE: Running noexec task 1228 of 2451 (ID: 1488, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_package_write)
NOTE: Running task 1230 of 2451 (ID: 1012, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_populate_sysroot)
NOTE: Running noexec task 1232 of 2451 (ID: 1016, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_package_write)
NOTE: package bison-native-2.5-r1: task do_populate_sysroot: Started
NOTE: package lzo-native-2.05-r0: task do_populate_sysroot: Started
NOTE: package lzo-native-2.05-r0: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 1238 of 2451 (ID: 224, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_package_write)
NOTE: package bison-native-2.5-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1239 of 2451 (ID: 1618, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_configure)
NOTE: Running task 1240 of 2451 (ID: 549, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_configure)
NOTE: package binutils-cross-2.20.1-r9: task do_configure: Started
NOTE: package binutils-native-2.21.1a-r0: task do_configure: Started
NOTE: package binutils-native-2.21.1a-r0: task do_configure: Succeeded
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_compile: Succeeded
NOTE: Running task 1241 of 2451 (ID: 612, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_install)
NOTE: Running task 1242 of 2451 (ID: 550, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_compile)
NOTE: package binutils-cross-2.20.1-r9: task do_configure: Succeeded
NOTE: Running task 1243 of 2451 (ID: 1619, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_compile)
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_install: Started
NOTE: package binutils-native-2.21.1a-r0: task do_compile: Started
NOTE: package binutils-cross-2.20.1-r9: task do_compile: Started
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_install: Succeeded
NOTE: Running task 1244 of 2451 (ID: 613, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_populate_sysroot)
NOTE: Running noexec task 1247 of 2451 (ID: 617, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_package_write)
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_populate_sysroot: Started
NOTE: package alsa-lib-native-1.0.24.1-r1: task do_populate_sysroot: Succeeded
NOTE: package ncurses-native-5.9-r2.1: task do_install: Succeeded
NOTE: Running task 1248 of 2451 (ID: 1870, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_populate_sysroot)
NOTE: Running noexec task 1251 of 2451 (ID: 1874, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write)
NOTE: package ncurses-native-5.9-r2.1: task do_populate_sysroot: Started
NOTE: package mpfr-native-3.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1252 of 2451 (ID: 1630, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_compile)
NOTE: package mpfr-native-3.1.0-r0: task do_compile: Started
NOTE: package mpfr-native-3.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1253 of 2451 (ID: 1626, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_install)
NOTE: package mpfr-native-3.1.0-r0: task do_install: Started
NOTE: package mpfr-native-3.1.0-r0: task do_install: Succeeded
NOTE: Running task 1254 of 2451 (ID: 1627, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_populate_sysroot)
NOTE: Running noexec task 1257 of 2451 (ID: 1631, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/mpfr/mpfr_3.1.0.bb, do_package_write)
NOTE: package mpfr-native-3.1.0-r0: task do_populate_sysroot: Started
NOTE: package mpfr-native-3.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1258 of 2451 (ID: 1651, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_configure)
NOTE: package libmpc-native-0.8.2-r0: task do_configure: Started
NOTE: package ncurses-native-5.9-r2.1: task do_populate_sysroot: Succeeded
NOTE: Running task 1259 of 2451 (ID: 2135, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_configure)
NOTE: Running task 1260 of 2451 (ID: 1574, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_configure)
NOTE: package readline-native-6.2-r0: task do_configure: Started
NOTE: package attr-native-2.4.46-r2: task do_configure: Started
NOTE: package cross-localedef-native-2.13-r1: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 1261 of 2451 (ID: 211, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_configure)
NOTE: Running noexec task 1262 of 2451 (ID: 212, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_compile)
NOTE: package libmpc-native-0.8.2-r0: task do_configure: Succeeded
NOTE: Running task 1263 of 2451 (ID: 1652, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_compile)
NOTE: package libmpc-native-0.8.2-r0: task do_compile: Started
NOTE: package libmpc-native-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1264 of 2451 (ID: 1648, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_install)
NOTE: package libmpc-native-0.8.2-r0: task do_install: Started
NOTE: package libmpc-native-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 1265 of 2451 (ID: 1649, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_populate_sysroot)
NOTE: Running noexec task 1268 of 2451 (ID: 1653, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libmpc/libmpc_0.8.2.bb, do_package_write)
NOTE: package libmpc-native-0.8.2-r0: task do_populate_sysroot: Started
NOTE: package libmpc-native-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: package readline-native-6.2-r0: task do_configure: Succeeded
NOTE: Running task 1269 of 2451 (ID: 2136, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_compile)
NOTE: package readline-native-6.2-r0: task do_compile: Started
NOTE: package perl-native-5.14.2-r0: task do_compile: Succeeded
NOTE: Running task 1270 of 2451 (ID: 857, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_install)
NOTE: package perl-native-5.14.2-r0: task do_install: Started
NOTE: package binutils-cross-2.20.1-r9: task do_compile: Succeeded
NOTE: Running task 1271 of 2451 (ID: 1615, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_install)
NOTE: package attr-native-2.4.46-r2: task do_configure: Succeeded
NOTE: package binutils-cross-2.20.1-r9: task do_install: Started
NOTE: package binutils-native-2.21.1a-r0: task do_compile: Succeeded
NOTE: Running task 1272 of 2451 (ID: 546, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_install)
NOTE: Running task 1273 of 2451 (ID: 1575, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_compile)
NOTE: package readline-native-6.2-r0: task do_compile: Succeeded
NOTE: Running task 1274 of 2451 (ID: 2132, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_install)
NOTE: package binutils-native-2.21.1a-r0: task do_install: Started
NOTE: package attr-native-2.4.46-r2: task do_compile: Started
NOTE: package readline-native-6.2-r0: task do_install: Started
NOTE: package readline-native-6.2-r0: task do_install: Succeeded
NOTE: Running task 1275 of 2451 (ID: 2133, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_populate_sysroot)
NOTE: Running noexec task 1278 of 2451 (ID: 2137, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write)
NOTE: package readline-native-6.2-r0: task do_populate_sysroot: Started
NOTE: package binutils-native-2.21.1a-r0: task do_install: Succeeded
NOTE: Running task 1279 of 2451 (ID: 547, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_populate_sysroot)
NOTE: Running noexec task 1282 of 2451 (ID: 551, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/binutils/binutils_2.21.1a.bb, do_package_write)
NOTE: package attr-native-2.4.46-r2: task do_compile: Succeeded
NOTE: Running task 1283 of 2451 (ID: 1571, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_install)
NOTE: package binutils-cross-2.20.1-r9: task do_install: Succeeded
NOTE: Running task 1284 of 2451 (ID: 1616, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_populate_sysroot)
NOTE: Running task 1285 of 2451 (ID: 1621, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_package)
NOTE: package readline-native-6.2-r0: task do_populate_sysroot: Succeeded
NOTE: package binutils-native-2.21.1a-r0: task do_populate_sysroot: Started
NOTE: Running task 1286 of 2451 (ID: 1563, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_configure)
NOTE: package attr-native-2.4.46-r2: task do_install: Started
NOTE: package binutils-cross-2.20.1-r9: task do_populate_sysroot: Started
NOTE: package binutils-cross-2.20.1-r9: task do_package: Started
NOTE: package attr-native-2.4.46-r2: task do_install: Succeeded
NOTE: package libpcre-native-8.20-r0: task do_configure: Started
NOTE: Running task 1287 of 2451 (ID: 1572, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_populate_sysroot)
NOTE: Running noexec task 1290 of 2451 (ID: 1576, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write)
NOTE: package binutils-cross-2.20.1-r9: task do_package: Succeeded
NOTE: package binutils-native-2.21.1a-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1291 of 2451 (ID: 1623, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_package_write_ipk)
NOTE: package attr-native-2.4.46-r2: task do_populate_sysroot: Started
NOTE: package binutils-cross-2.20.1-r9: task do_package_write_ipk: Started
NOTE: package binutils-cross-2.20.1-r9: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1292 of 2451 (ID: 1620, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_package_write)
NOTE: package attr-native-2.4.46-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1293 of 2451 (ID: 1585, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_configure)
NOTE: package curl-native-7.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1294 of 2451 (ID: 572, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_compile)
NOTE: package acl-native-2.2.51-r2: task do_configure: Started
NOTE: package curl-native-7.22.0-r0: task do_compile: Started
NOTE: package binutils-cross-2.20.1-r9: task do_populate_sysroot: Succeeded
NOTE: package openssl-native-1.0.0e-r14.4: task do_compile: Succeeded
NOTE: Running task 1295 of 2451 (ID: 1461, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_install)
NOTE: package openssl-native-1.0.0e-r14.4: task do_install: Started
NOTE: package curl-native-7.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1296 of 2451 (ID: 568, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_install)
NOTE: package curl-native-7.22.0-r0: task do_install: Started
NOTE: package curl-native-7.22.0-r0: task do_install: Succeeded
NOTE: Running task 1297 of 2451 (ID: 569, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_populate_sysroot)
NOTE: Running noexec task 1300 of 2451 (ID: 573, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/curl/curl_7.22.0.bb, do_package_write)
NOTE: package curl-native-7.22.0-r0: task do_populate_sysroot: Started
NOTE: package curl-native-7.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1301 of 2451 (ID: 51, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_configure)
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_configure: Started
NOTE: package acl-native-2.2.51-r2: task do_configure: Succeeded
NOTE: Running task 1302 of 2451 (ID: 1586, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_compile)
NOTE: package acl-native-2.2.51-r2: task do_compile: Started
NOTE: package acl-native-2.2.51-r2: task do_compile: Succeeded
NOTE: Running task 1303 of 2451 (ID: 1582, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_install)
NOTE: package acl-native-2.2.51-r2: task do_install: Started
NOTE: package acl-native-2.2.51-r2: task do_install: Succeeded
NOTE: Running task 1304 of 2451 (ID: 1583, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_populate_sysroot)
NOTE: Running noexec task 1307 of 2451 (ID: 1587, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_package_write)
NOTE: package acl-native-2.2.51-r2: task do_populate_sysroot: Started
NOTE: package libpcre-native-8.20-r0: task do_configure: Succeeded
NOTE: Running task 1308 of 2451 (ID: 1564, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_compile)
NOTE: package acl-native-2.2.51-r2: task do_populate_sysroot: Succeeded
NOTE: package libpcre-native-8.20-r0: task do_compile: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_configure: Succeeded
NOTE: Running task 1309 of 2451 (ID: 52, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_compile)
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_compile: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_compile: Succeeded
NOTE: Running task 1310 of 2451 (ID: 48, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_install)
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_install: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_install: Succeeded
NOTE: Running noexec task 1313 of 2451 (ID: 53, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write)
NOTE: Running task 1314 of 2451 (ID: 49, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_populate_sysroot)
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_populate_sysroot: Started
NOTE: package opkg-native-1_0.1.8+svnr625-r4: task do_populate_sysroot: Succeeded
NOTE: package perl-native-5.14.2-r0: task do_install: Succeeded
NOTE: Running task 1315 of 2451 (ID: 858, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_populate_sysroot)
NOTE: Running noexec task 1318 of 2451 (ID: 862, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_package_write)
NOTE: package perl-native-5.14.2-r0: task do_populate_sysroot: Started
NOTE: package openssl-native-1.0.0e-r14.4: task do_install: Succeeded
NOTE: Running task 1319 of 2451 (ID: 1462, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_populate_sysroot)
NOTE: Running noexec task 1322 of 2451 (ID: 1466, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_package_write)
NOTE: package openssl-native-1.0.0e-r14.4: task do_populate_sysroot: Started
NOTE: package libpcre-native-8.20-r0: task do_compile: Succeeded
NOTE: Running task 1323 of 2451 (ID: 1560, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_install)
NOTE: package libpcre-native-8.20-r0: task do_install: Started
NOTE: package libpcre-native-8.20-r0: task do_install: Succeeded
NOTE: Running task 1324 of 2451 (ID: 1561, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_populate_sysroot)
NOTE: Running noexec task 1327 of 2451 (ID: 1565, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libpcre/libpcre_8.20.bb, do_package_write)
NOTE: package libpcre-native-8.20-r0: task do_populate_sysroot: Started
NOTE: package openssl-native-1.0.0e-r14.4: task do_populate_sysroot: Succeeded
NOTE: Running task 1328 of 2451 (ID: 1607, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_configure)
NOTE: package libpcre-native-8.20-r0: task do_populate_sysroot: Succeeded
NOTE: package python-native-2.7.2-r0.0: task do_configure: Started
NOTE: package perl-native-5.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1329 of 2451 (ID: 483, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_configure)
NOTE: Running task 1330 of 2451 (ID: 1861, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_configure)
NOTE: package git-native-1.7.7-r1: task do_configure: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_configure: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_configure: Succeeded
NOTE: Running task 1331 of 2451 (ID: 1862, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_compile)
NOTE: package libxml-parser-perl-native-2.41-r1: task do_compile: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_compile: Succeeded
NOTE: Running task 1332 of 2451 (ID: 1858, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_install)
NOTE: package libxml-parser-perl-native-2.41-r1: task do_install: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_install: Succeeded
NOTE: Running task 1333 of 2451 (ID: 1859, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_populate_sysroot)
NOTE: Running noexec task 1336 of 2451 (ID: 1863, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_package_write)
NOTE: package libxml-parser-perl-native-2.41-r1: task do_populate_sysroot: Started
NOTE: package libxml-parser-perl-native-2.41-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1337 of 2451 (ID: 1058, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_configure)
NOTE: package intltool-native-0.40.6-r5: task do_configure: Started
NOTE: package git-native-1.7.7-r1: task do_configure: Succeeded
NOTE: Running task 1338 of 2451 (ID: 484, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_compile)
NOTE: package git-native-1.7.7-r1: task do_compile: Started
NOTE: package intltool-native-0.40.6-r5: task do_configure: Succeeded
NOTE: Running task 1339 of 2451 (ID: 1059, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_compile)
NOTE: package git-native-1.7.7-r1: task do_compile: Succeeded
NOTE: Running task 1340 of 2451 (ID: 480, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_install)
NOTE: package intltool-native-0.40.6-r5: task do_compile: Started
NOTE: package intltool-native-0.40.6-r5: task do_compile: Succeeded
NOTE: package python-native-2.7.2-r0.0: task do_configure: Succeeded
NOTE: Running task 1341 of 2451 (ID: 1608, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_compile)
NOTE: package git-native-1.7.7-r1: task do_install: Started
NOTE: Running task 1342 of 2451 (ID: 1055, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_install)
NOTE: package python-native-2.7.2-r0.0: task do_compile: Started
NOTE: package intltool-native-0.40.6-r5: task do_install: Started
NOTE: package intltool-native-0.40.6-r5: task do_install: Succeeded
NOTE: Running task 1343 of 2451 (ID: 1056, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_populate_sysroot)
NOTE: Running noexec task 1346 of 2451 (ID: 1060, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/intltool/intltool_0.40.6.bb, do_package_write)
NOTE: package intltool-native-0.40.6-r5: task do_populate_sysroot: Started
NOTE: package intltool-native-0.40.6-r5: task do_populate_sysroot: Succeeded
NOTE: package git-native-1.7.7-r1: task do_install: Succeeded
NOTE: Running task 1347 of 2451 (ID: 481, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_populate_sysroot)
NOTE: Running noexec task 1350 of 2451 (ID: 485, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/git/git_1.7.7.bb, do_package_write)
NOTE: package git-native-1.7.7-r1: task do_populate_sysroot: Started
NOTE: package git-native-1.7.7-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1351 of 2451 (ID: 94, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_fetch)
NOTE: Running task 1352 of 2451 (ID: 421, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_fetch)
NOTE: Running task 1353 of 2451 (ID: 1145, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_fetch)
NOTE: Running task 1354 of 2451 (ID: 138, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb, do_fetch)
NOTE: Running task 1355 of 2451 (ID: 1341, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_fetch)
NOTE: Running task 1356 of 2451 (ID: 149, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd_git.bb, do_fetch)
NOTE: Running task 1357 of 2451 (ID: 1321, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_fetch)
NOTE: Running task 1358 of 2451 (ID: 39, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_fetch)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_fetch: Started
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_fetch: Started
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_fetch: Succeeded
NOTE: Running task 1359 of 2451 (ID: 1141, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_unpack)
NOTE: package update-rc.d-native-0.7-r5: task do_fetch: Started
NOTE: package update-rc.d-native-0.7-r5: task do_fetch: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_fetch: Succeeded
NOTE: package udev-175-r0: task do_fetch: Started
NOTE: package udev-175-r0: task do_fetch: Succeeded
NOTE: package update-rc.d-0.7-r5: task do_fetch: Started
NOTE: package update-rc.d-0.7-r5: task do_fetch: Succeeded
NOTE: package systemd-git-r6: task do_fetch: Started
NOTE: package systemd-git-r6: task do_fetch: Succeeded
NOTE: package cpufrequtils-008-r1: task do_fetch: Started
NOTE: package cpufrequtils-008-r1: task do_fetch: Succeeded
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_fetch: Started
NOTE: Running task 1360 of 2451 (ID: 90, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_unpack)
NOTE: Running task 1361 of 2451 (ID: 417, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_unpack)
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_fetch: Succeeded
NOTE: Running task 1362 of 2451 (ID: 134, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb, do_unpack)
NOTE: Running task 1363 of 2451 (ID: 1338, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_unpack)
NOTE: Running task 1364 of 2451 (ID: 145, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd_git.bb, do_unpack)
NOTE: Running task 1365 of 2451 (ID: 1318, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_unpack)
NOTE: Running task 1366 of 2451 (ID: 35, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_unpack)
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_unpack: Started
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_unpack: Succeeded
NOTE: Running task 1367 of 2451 (ID: 1142, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_patch)
NOTE: package update-rc.d-native-0.7-r5: task do_unpack: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_unpack: Started
NOTE: package udev-175-r0: task do_unpack: Started
NOTE: package update-rc.d-0.7-r5: task do_unpack: Started
NOTE: package cpufrequtils-008-r1: task do_unpack: Started
NOTE: package update-rc.d-native-0.7-r5: task do_unpack: Succeeded
NOTE: package update-rc.d-0.7-r5: task do_unpack: Succeeded
NOTE: package systemd-git-r6: task do_unpack: Started
NOTE: package cpufrequtils-008-r1: task do_unpack: Succeeded
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_unpack: Started
NOTE: Running task 1368 of 2451 (ID: 91, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_patch)
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_patch: Started
NOTE: Running task 1369 of 2451 (ID: 1339, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_patch)
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_patch: Succeeded
NOTE: Running task 1370 of 2451 (ID: 1319, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_patch)
NOTE: Running task 1371 of 2451 (ID: 1146, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_configure)
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_unpack: Succeeded
NOTE: package update-rc.d-native-0.7-r5: task do_patch: Started
NOTE: package update-rc.d-0.7-r5: task do_patch: Started
NOTE: package cpufrequtils-008-r1: task do_patch: Started
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_configure: Started
NOTE: package systemd-git-r6: task do_unpack: Succeeded
NOTE: Running task 1373 of 2451 (ID: 146, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd_git.bb, do_patch)
NOTE: Running task 1374 of 2451 (ID: 36, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_patch)
NOTE: package update-rc.d-native-0.7-r5: task do_patch: Succeeded
NOTE: package update-rc.d-0.7-r5: task do_patch: Succeeded
NOTE: package cpufrequtils-008-r1: task do_patch: Succeeded
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_configure: Succeeded
NOTE: Running task 1375 of 2451 (ID: 95, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_configure)
NOTE: Running task 1377 of 2451 (ID: 1346, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_populate_lic)
NOTE: Running task 1378 of 2451 (ID: 1342, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_configure)
NOTE: Running task 1379 of 2451 (ID: 1326, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_populate_lic)
NOTE: Running task 1380 of 2451 (ID: 1147, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_compile)
NOTE: package systemd-git-r6: task do_patch: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_unpack: Succeeded
NOTE: package udev-175-r0: task do_unpack: Succeeded
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_patch: Started
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_patch: Succeeded
NOTE: package update-rc.d-native-0.7-r5: task do_configure: Started
NOTE: package update-rc.d-0.7-r5: task do_populate_lic: Started
NOTE: package update-rc.d-0.7-r5: task do_configure: Started
NOTE: package update-rc.d-0.7-r5: task do_configure: Succeeded
NOTE: Running task 1381 of 2451 (ID: 416, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_kernel_checkout)
NOTE: Running task 1382 of 2451 (ID: 135, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb, do_patch)
NOTE: package update-rc.d-native-0.7-r5: task do_configure: Succeeded
NOTE: Running task 1383 of 2451 (ID: 40, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_configure)
NOTE: Running task 1385 of 2451 (ID: 96, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_compile)
NOTE: package systemd-git-r6: task do_patch: Succeeded
NOTE: package cpufrequtils-008-r1: task do_populate_lic: Started
NOTE: Running task 1386 of 2451 (ID: 154, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd_git.bb, do_populate_lic)
NOTE: package update-rc.d-0.7-r5: task do_populate_lic: Succeeded
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_compile: Started
NOTE: Running task 1387 of 2451 (ID: 1343, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_compile)
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_compile: Succeeded
NOTE: Running task 1388 of 2451 (ID: 1143, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_install)
NOTE: package udev-175-r0: task do_patch: Started
NOTE: package cpufrequtils-008-r1: task do_populate_lic: Succeeded
NOTE: package update-rc.d-native-0.7-r5: task do_compile: Started
NOTE: package update-rc.d-native-0.7-r5: task do_compile: Succeeded
NOTE: package update-rc.d-0.7-r5: task do_compile: Started
NOTE: package update-rc.d-0.7-r5: task do_compile: Succeeded
NOTE: Running task 1389 of 2451 (ID: 92, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_install)
NOTE: Running task 1390 of 2451 (ID: 1340, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_install)
NOTE: package udev-175-r0: task do_patch: Succeeded
NOTE: package systemd-git-r6: task do_populate_lic: Started
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_configure: Started
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_install: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_checkout: Started
NOTE: Running task 1391 of 2451 (ID: 143, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_175.bb, do_populate_lic)
NOTE: package update-rc.d-native-0.7-r5: task do_install: Started
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_install: Succeeded
NOTE: Running task 1392 of 2451 (ID: 1144, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_populate_sysroot)
NOTE: Running noexec task 1395 of 2451 (ID: 1148, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb, do_package_write)
NOTE: package systemd-git-r6: task do_populate_lic: Succeeded
NOTE: package update-rc.d-native-0.7-r5: task do_install: Succeeded
NOTE: package update-rc.d-0.7-r5: task do_install: Started
NOTE: Running task 1396 of 2451 (ID: 93, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_populate_sysroot)
NOTE: Running noexec task 1399 of 2451 (ID: 97, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_package_write)
NOTE: package udev-175-r0: task do_populate_lic: Started
NOTE: package update-rc.d-0.7-r5: task do_install: Succeeded
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_populate_sysroot: Started
NOTE: package udev-175-r0: task do_populate_lic: Succeeded
NOTE: package update-rc.d-native-0.7-r5: task do_populate_sysroot: Started
NOTE: package update-rc.d-native-0.7-r5: task do_populate_sysroot: Succeeded
NOTE: package kern-tools-native-0.1+git1+364437739c45a5e771d1f7b3ac73c35f1328fd97-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1400 of 2451 (ID: 1519, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_configure)
NOTE: package dbus-native-1.4.16-r0: task do_configure: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_checkout: Succeeded
NOTE: Running task 1401 of 2451 (ID: 415, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_validate_branches)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_validate_branches: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_validate_branches: Succeeded
NOTE: Running task 1402 of 2451 (ID: 418, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_patch)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_patch: Started
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_configure: Succeeded
NOTE: Running task 1403 of 2451 (ID: 41, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_compile)
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_compile: Started
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_compile: Succeeded
NOTE: Running task 1404 of 2451 (ID: 37, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_install)
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_install: Started
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_install: Succeeded
NOTE: Running noexec task 1407 of 2451 (ID: 42, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_package_write)
NOTE: Running task 1408 of 2451 (ID: 38, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_populate_sysroot)
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_populate_sysroot: Started
NOTE: package prelink-native-1.0+git1+3e3f9b0876aa5ac83a783a95b8bab52cb38ed785-r7: task do_populate_sysroot: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_patch: Succeeded
NOTE: Running task 1409 of 2451 (ID: 422, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_kernel_configme)
NOTE: Running task 1410 of 2451 (ID: 435, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_populate_lic)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_configme: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_populate_lic: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_populate_lic: Succeeded
NOTE: package dbus-native-1.4.16-r0: task do_configure: Succeeded
NOTE: Running task 1411 of 2451 (ID: 1520, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_compile)
NOTE: package dbus-native-1.4.16-r0: task do_compile: Started
NOTE: package dbus-native-1.4.16-r0: task do_compile: Succeeded
NOTE: Running task 1412 of 2451 (ID: 1516, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_install)
NOTE: package dbus-native-1.4.16-r0: task do_install: Started
NOTE: package dbus-native-1.4.16-r0: task do_install: Succeeded
NOTE: Running task 1413 of 2451 (ID: 1517, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_populate_sysroot)
NOTE: Running noexec task 1416 of 2451 (ID: 1521, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.16.bb, do_package_write)
NOTE: package dbus-native-1.4.16-r0: task do_populate_sysroot: Started
NOTE: package dbus-native-1.4.16-r0: task do_populate_sysroot: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_configme: Succeeded
NOTE: package python-native-2.7.2-r0.0: task do_compile: Succeeded
NOTE: Running task 1417 of 2451 (ID: 1604, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_install)
NOTE: package python-native-2.7.2-r0.0: task do_install: Started
NOTE: package python-native-2.7.2-r0.0: task do_install: Succeeded
NOTE: Running task 1418 of 2451 (ID: 1605, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_populate_sysroot)
NOTE: Running noexec task 1421 of 2451 (ID: 1609, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-native_2.7.2.bb, do_package_write)
NOTE: package python-native-2.7.2-r0.0: task do_populate_sysroot: Started
NOTE: package python-native-2.7.2-r0.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1422 of 2451 (ID: 1497, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_configure)
NOTE: Running task 1423 of 2451 (ID: 2124, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_configure)
NOTE: Running task 1424 of 2451 (ID: 637, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_configure)
NOTE: Running task 1425 of 2451 (ID: 2412, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_configure)
NOTE: package libxml2-native-2.7.8-r4: task do_configure: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_configure: Started
NOTE: package rpm-native-5.4.0-r24: task do_configure: Started
NOTE: package xcb-proto-native-1.6-r4: task do_configure: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_configure: Succeeded
NOTE: Running task 1426 of 2451 (ID: 2125, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_compile)
NOTE: package python-setuptools-native-0.6c11-ml3: task do_compile: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_compile: Succeeded
NOTE: Running task 1427 of 2451 (ID: 2121, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_install)
NOTE: package python-setuptools-native-0.6c11-ml3: task do_install: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_install: Succeeded
NOTE: Running task 1428 of 2451 (ID: 2122, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_populate_sysroot)
NOTE: Running noexec task 1431 of 2451 (ID: 2126, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb, do_package_write)
NOTE: package python-setuptools-native-0.6c11-ml3: task do_populate_sysroot: Started
NOTE: package python-setuptools-native-0.6c11-ml3: task do_populate_sysroot: Succeeded
NOTE: Running task 1432 of 2451 (ID: 1541, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_configure)
NOTE: package python-argparse-native-1.2.1-r1: task do_configure: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_configure: Succeeded
NOTE: Running task 1433 of 2451 (ID: 1542, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_compile)
NOTE: package python-argparse-native-1.2.1-r1: task do_compile: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_compile: Succeeded
NOTE: Running task 1434 of 2451 (ID: 1538, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_install)
NOTE: package python-argparse-native-1.2.1-r1: task do_install: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_install: Succeeded
NOTE: Running task 1435 of 2451 (ID: 1539, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_populate_sysroot)
NOTE: Running noexec task 1438 of 2451 (ID: 1543, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python-argparse_1.2.1.bb, do_package_write)
NOTE: package python-argparse-native-1.2.1-r1: task do_populate_sysroot: Started
NOTE: package python-argparse-native-1.2.1-r1: task do_populate_sysroot: Succeeded
NOTE: package xcb-proto-native-1.6-r4: task do_configure: Succeeded
NOTE: Running task 1439 of 2451 (ID: 2413, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_compile)
NOTE: package xcb-proto-native-1.6-r4: task do_compile: Started
NOTE: package xcb-proto-native-1.6-r4: task do_compile: Succeeded
NOTE: Running task 1440 of 2451 (ID: 2409, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_install)
NOTE: package xcb-proto-native-1.6-r4: task do_install: Started
NOTE: package xcb-proto-native-1.6-r4: task do_install: Succeeded
NOTE: Running task 1441 of 2451 (ID: 2410, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_populate_sysroot)
NOTE: Running noexec task 1444 of 2451 (ID: 2414, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_package_write)
NOTE: package xcb-proto-native-1.6-r4: task do_populate_sysroot: Started
NOTE: package xcb-proto-native-1.6-r4: task do_populate_sysroot: Succeeded
NOTE: package libxml2-native-2.7.8-r4: task do_configure: Succeeded
NOTE: Running task 1445 of 2451 (ID: 1498, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_compile)
NOTE: package libxml2-native-2.7.8-r4: task do_compile: Started
NOTE: package libxml2-native-2.7.8-r4: task do_compile: Succeeded
NOTE: Running task 1446 of 2451 (ID: 1494, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_install)
NOTE: package libxml2-native-2.7.8-r4: task do_install: Started
NOTE: package libxml2-native-2.7.8-r4: task do_install: Succeeded
NOTE: Running task 1447 of 2451 (ID: 1495, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_populate_sysroot)
NOTE: Running noexec task 1450 of 2451 (ID: 1499, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_package_write)
NOTE: package libxml2-native-2.7.8-r4: task do_populate_sysroot: Started
NOTE: package libxml2-native-2.7.8-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1451 of 2451 (ID: 604, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_configure)
NOTE: Running task 1452 of 2451 (ID: 2401, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_configure)
NOTE: package gettext-native-0.18.1.1-r5: task do_configure: Started
NOTE: package libxslt-native-1.1.26-r4: task do_configure: Started
NOTE: package libxslt-native-1.1.26-r4: task do_configure: Succeeded
NOTE: Running task 1453 of 2451 (ID: 2402, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_compile)
NOTE: package libxslt-native-1.1.26-r4: task do_compile: Started
NOTE: package libxslt-native-1.1.26-r4: task do_compile: Succeeded
NOTE: Running task 1454 of 2451 (ID: 2398, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_install)
NOTE: package libxslt-native-1.1.26-r4: task do_install: Started
NOTE: package rpm-native-5.4.0-r24: task do_configure: Succeeded
NOTE: Running task 1455 of 2451 (ID: 638, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_compile)
NOTE: package libxslt-native-1.1.26-r4: task do_install: Succeeded
NOTE: package rpm-native-5.4.0-r24: task do_compile: Started
NOTE: Running task 1456 of 2451 (ID: 2399, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_populate_sysroot)
NOTE: Running noexec task 1459 of 2451 (ID: 2403, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.26.bb, do_package_write)
NOTE: package libxslt-native-1.1.26-r4: task do_populate_sysroot: Started
NOTE: package libxslt-native-1.1.26-r4: task do_populate_sysroot: Succeeded
NOTE: package rpm-native-5.4.0-r24: task do_compile: Succeeded
NOTE: Running task 1460 of 2451 (ID: 634, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_install)
NOTE: package rpm-native-5.4.0-r24: task do_install: Started
NOTE: package rpm-native-5.4.0-r24: task do_install: Succeeded
NOTE: Running task 1461 of 2451 (ID: 635, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_populate_sysroot)
NOTE: Running noexec task 1464 of 2451 (ID: 639, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_package_write)
NOTE: package rpm-native-5.4.0-r24: task do_populate_sysroot: Started
NOTE: package rpm-native-5.4.0-r24: task do_populate_sysroot: Succeeded
NOTE: package gettext-native-0.18.1.1-r5: task do_configure: Succeeded
NOTE: Running task 1465 of 2451 (ID: 605, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_compile)
NOTE: package gettext-native-0.18.1.1-r5: task do_compile: Started
NOTE: package gettext-native-0.18.1.1-r5: task do_compile: Succeeded
NOTE: Running task 1466 of 2451 (ID: 601, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_install)
NOTE: package gettext-native-0.18.1.1-r5: task do_install: Started
NOTE: package gettext-native-0.18.1.1-r5: task do_install: Succeeded
NOTE: Running task 1467 of 2451 (ID: 602, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_populate_sysroot)
NOTE: Running noexec task 1470 of 2451 (ID: 606, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_package_write)
NOTE: package gettext-native-0.18.1.1-r5: task do_populate_sysroot: Started
NOTE: package gettext-native-0.18.1.1-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 1471 of 2451 (ID: 2379, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_configure)
NOTE: Running task 1472 of 2451 (ID: 626, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_configure)
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_configure: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_configure: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_configure: Succeeded
NOTE: Running task 1473 of 2451 (ID: 2380, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_compile)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_compile: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_configure: Succeeded
NOTE: Running task 1474 of 2451 (ID: 627, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_compile)
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_compile: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_compile: Succeeded
NOTE: Running task 1475 of 2451 (ID: 2376, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_install)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_install: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_install: Succeeded
NOTE: Running task 1476 of 2451 (ID: 2377, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_populate_sysroot)
NOTE: Running task 1477 of 2451 (ID: 2382, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_package)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_sysroot: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_package: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_package: Succeeded
NOTE: Running task 1478 of 2451 (ID: 2384, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_package_write_ipk)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_package_write_ipk: Started
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1479 of 2451 (ID: 2381, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_package_write)
NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_sysroot: Succeeded
NOTE: Running task 1480 of 2451 (ID: 2169, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_configure)
NOTE: package eglibc-initial-2.12-r27: task do_configure: Started
NOTE: package eglibc-initial-2.12-r27: task do_configure: Succeeded
NOTE: Running task 1481 of 2451 (ID: 2170, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_compile)
NOTE: package eglibc-initial-2.12-r27: task do_compile: Started
NOTE: package eglibc-initial-2.12-r27: task do_compile: Succeeded
NOTE: Running task 1482 of 2451 (ID: 2166, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_install)
NOTE: package eglibc-initial-2.12-r27: task do_install: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_compile: Succeeded
NOTE: Running task 1483 of 2451 (ID: 623, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_install)
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_install: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_install: Succeeded
NOTE: Running task 1484 of 2451 (ID: 624, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_populate_sysroot)
NOTE: Running noexec task 1487 of 2451 (ID: 628, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb, do_package_write)
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_populate_sysroot: Started
NOTE: package glib-2.0-native-1_2.30.0-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1488 of 2451 (ID: 670, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_configure)
NOTE: Running task 1489 of 2451 (ID: 1894, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_configure)
NOTE: Running task 1490 of 2451 (ID: 2004, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_configure)
NOTE: Running task 1491 of 2451 (ID: 849, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_configure)
NOTE: Running task 1492 of 2451 (ID: 106, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_configure)
NOTE: package desktop-file-utils-native-0.15-r0: task do_configure: Started
NOTE: package dbus-glib-native-0.92-r1: task do_configure: Started
NOTE: package shared-mime-info-native-0.91-r3: task do_configure: Started
NOTE: package vala-native-0.12.1-r0: task do_configure: Started
NOTE: package qemu-native-0.15.0-r1: task do_configure: Started
NOTE: package qemu-native-0.15.0-r1: task do_configure: Succeeded
NOTE: Running task 1493 of 2451 (ID: 107, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_compile)
NOTE: package qemu-native-0.15.0-r1: task do_compile: Started
NOTE: package shared-mime-info-native-0.91-r3: task do_configure: Succeeded
NOTE: Running task 1494 of 2451 (ID: 2005, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_compile)
NOTE: package shared-mime-info-native-0.91-r3: task do_compile: Started
NOTE: package shared-mime-info-native-0.91-r3: task do_compile: Succeeded
NOTE: Running task 1495 of 2451 (ID: 2001, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_install)
NOTE: package shared-mime-info-native-0.91-r3: task do_install: Started
NOTE: package shared-mime-info-native-0.91-r3: task do_install: Succeeded
NOTE: Running task 1496 of 2451 (ID: 2002, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_populate_sysroot)
NOTE: Running noexec task 1499 of 2451 (ID: 2006, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb, do_package_write)
NOTE: package shared-mime-info-native-0.91-r3: task do_populate_sysroot: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 2451 (ID: 671, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_compile)
NOTE: package shared-mime-info-native-0.91-r3: task do_populate_sysroot: Succeeded
NOTE: package desktop-file-utils-native-0.15-r0: task do_compile: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 2451 (ID: 667, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_install)
NOTE: package desktop-file-utils-native-0.15-r0: task do_install: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_install: Succeeded
NOTE: Running task 1502 of 2451 (ID: 668, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_populate_sysroot)
NOTE: Running noexec task 1505 of 2451 (ID: 672, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb, do_package_write)
NOTE: package desktop-file-utils-native-0.15-r0: task do_populate_sysroot: Started
NOTE: package desktop-file-utils-native-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1506 of 2451 (ID: 1665, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_package)
NOTE: Running task 1507 of 2451 (ID: 1963, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_package)
NOTE: Running task 1508 of 2451 (ID: 1345, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_package)
NOTE: Running task 1509 of 2451 (ID: 1182, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_package)
NOTE: Running task 1510 of 2451 (ID: 951, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_package)
NOTE: Running task 1511 of 2451 (ID: 2105, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_package)
NOTE: Running task 1512 of 2451 (ID: 1446, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_package)
NOTE: Running task 1513 of 2451 (ID: 1305, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_package)
NOTE: Running task 1514 of 2451 (ID: 1285, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_package)
NOTE: Running task 1515 of 2451 (ID: 1275, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb, do_package)
NOTE: package linux-libc-headers-3.1-r1: task do_package: Started
NOTE: package update-rc.d-0.7-r5: task do_package: Started
NOTE: package update-modules-1.0-r10: task do_package: Started
NOTE: package systemd-compat-units-1.0-r14: task do_package: Started
NOTE: package tzdata-2011g-r10.0: task do_package: Started
NOTE: package gnome-common-2.28.0-r1: task do_package: Started
NOTE: package resolvconf-1.61-r0: task do_package: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_package: Started
NOTE: package base-files-3.0.14-r81: task do_package: Started
NOTE: package dropbear-systemd-v1-r0: task do_package: Started
WARNING: For recipe resolvconf, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/sbin
NOTE: package update-rc.d-0.7-r5: task do_package: Succeeded
NOTE: Running task 1516 of 2451 (ID: 1347, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_package_write_ipk)
NOTE: package update-modules-1.0-r10: task do_package: Succeeded
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_package: Succeeded
NOTE: Running task 1517 of 2451 (ID: 2107, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_package_write_ipk)
NOTE: package gnome-common-2.28.0-r1: task do_package: Succeeded
NOTE: package dropbear-systemd-v1-r0: task do_package: Succeeded
NOTE: Running task 1518 of 2451 (ID: 1965, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_package_write_ipk)
NOTE: package update-rc.d-0.7-r5: task do_package_write_ipk: Started
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_package_write_ipk: Started
NOTE: package resolvconf-1.61-r0: task do_package: Succeeded
NOTE: package systemd-compat-units-1.0-r14: task do_package: Succeeded
NOTE: Running task 1519 of 2451 (ID: 1287, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_package_write_ipk)
NOTE: package gnome-common-2.28.0-r1: task do_package_write_ipk: Started
NOTE: package vala-native-0.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 2451 (ID: 850, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_compile)
NOTE: package systemd-compat-units-1.0-r14: task do_package_write_ipk: Started
NOTE: package vala-native-0.12.1-r0: task do_compile: Started
NOTE: package base-files-3.0.14-r81: task do_package: Succeeded
NOTE: Running task 1521 of 2451 (ID: 1448, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_package_write_ipk)
NOTE: package dbus-glib-native-0.92-r1: task do_configure: Succeeded
NOTE: Running task 1522 of 2451 (ID: 1895, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_compile)
NOTE: package base-files-3.0.14-r81: task do_package_write_ipk: Started
NOTE: package update-rc.d-0.7-r5: task do_package_write_ipk: Succeeded
NOTE: package sysvinit-inittab-2.88dsf-r6: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1523 of 2451 (ID: 1344, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_package_write)
NOTE: package dbus-glib-native-0.92-r1: task do_compile: Started
NOTE: Running noexec task 1524 of 2451 (ID: 2104, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb, do_package_write)
NOTE: package systemd-compat-units-1.0-r14: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1525 of 2451 (ID: 1284, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-compat-units.bb, do_package_write)
NOTE: package gnome-common-2.28.0-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1526 of 2451 (ID: 1962, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb, do_package_write)
NOTE: package base-files-3.0.14-r81: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1527 of 2451 (ID: 1445, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_package_write)
NOTE: package dbus-glib-native-0.92-r1: task do_compile: Succeeded
NOTE: Running task 1528 of 2451 (ID: 1891, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_install)
NOTE: package dbus-glib-native-0.92-r1: task do_install: Started
NOTE: package dbus-glib-native-0.92-r1: task do_install: Succeeded
NOTE: Running task 1529 of 2451 (ID: 1892, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_populate_sysroot)
NOTE: Running noexec task 1532 of 2451 (ID: 1896, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.92.bb, do_package_write)
NOTE: package dbus-glib-native-0.92-r1: task do_populate_sysroot: Started
NOTE: package dbus-glib-native-0.92-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1533 of 2451 (ID: 2445, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_configure)
NOTE: package eggdbus-native-0.6-r1: task do_configure: Started
NOTE: package vala-native-0.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1534 of 2451 (ID: 846, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_install)
NOTE: package vala-native-0.12.1-r0: task do_install: Started
NOTE: package vala-native-0.12.1-r0: task do_install: Succeeded
NOTE: Running task 1535 of 2451 (ID: 847, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_populate_sysroot)
NOTE: Running noexec task 1538 of 2451 (ID: 851, virtual:native:/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.12.1.bb, do_package_write)
NOTE: package vala-native-0.12.1-r0: task do_populate_sysroot: Started
NOTE: package vala-native-0.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: package eggdbus-native-0.6-r1: task do_configure: Succeeded
NOTE: Running task 1539 of 2451 (ID: 2446, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_compile)
NOTE: package eggdbus-native-0.6-r1: task do_compile: Started
NOTE: package eglibc-initial-2.12-r27: task do_install: Succeeded
NOTE: Running task 1540 of 2451 (ID: 2165, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_install_locale)
NOTE: package eglibc-initial-2.12-r27: task do_install_locale: Started
NOTE: package eglibc-initial-2.12-r27: task do_install_locale: Succeeded
NOTE: Running task 1541 of 2451 (ID: 2167, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_populate_sysroot)
NOTE: Running task 1542 of 2451 (ID: 2172, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_package)
NOTE: package eglibc-initial-2.12-r27: task do_populate_sysroot: Started
NOTE: package eglibc-initial-2.12-r27: task do_package: Started
NOTE: package eglibc-initial-2.12-r27: task do_package: Succeeded
NOTE: Running task 1543 of 2451 (ID: 2174, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_package_write_ipk)
NOTE: package eglibc-initial-2.12-r27: task do_populate_sysroot: Succeeded
NOTE: Running task 1544 of 2451 (ID: 1685, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_configure)
NOTE: package eglibc-initial-2.12-r27: task do_package_write_ipk: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_configure: Started
NOTE: package eglibc-initial-2.12-r27: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1545 of 2451 (ID: 2171, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb, do_package_write)
NOTE: package qemu-native-0.15.0-r1: task do_compile: Succeeded
NOTE: Running task 1546 of 2451 (ID: 103, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_install)
NOTE: package qemu-native-0.15.0-r1: task do_install: Started
NOTE: package qemu-native-0.15.0-r1: task do_install: Succeeded
NOTE: Running noexec task 1549 of 2451 (ID: 108, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_package_write)
NOTE: Running task 1550 of 2451 (ID: 104, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.0.bb, do_populate_sysroot)
NOTE: package qemu-native-0.15.0-r1: task do_populate_sysroot: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_configure: Succeeded
NOTE: Running task 1551 of 2451 (ID: 1686, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_compile)
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_compile: Started
NOTE: package linux-libc-headers-3.1-r1: task do_package: Succeeded
NOTE: Running task 1552 of 2451 (ID: 1667, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_package_write_ipk)
NOTE: package linux-libc-headers-3.1-r1: task do_package_write_ipk: Started
NOTE: package linux-libc-headers-3.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1553 of 2451 (ID: 1664, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb, do_package_write)
NOTE: package qemu-native-0.15.0-r1: task do_populate_sysroot: Succeeded
NOTE: package eggdbus-native-0.6-r1: task do_compile: Succeeded
NOTE: Running task 1554 of 2451 (ID: 2442, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_install)
NOTE: package eggdbus-native-0.6-r1: task do_install: Started
NOTE: package eggdbus-native-0.6-r1: task do_install: Succeeded
NOTE: Running task 1555 of 2451 (ID: 2443, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_populate_sysroot)
NOTE: Running noexec task 1558 of 2451 (ID: 2447, virtual:native:/media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/eggdbus/eggdbus_0.6.bb, do_package_write)
NOTE: package eggdbus-native-0.6-r1: task do_populate_sysroot: Started
NOTE: package eggdbus-native-0.6-r1: task do_populate_sysroot: Succeeded
NOTE: package tzdata-2011g-r10.0: task do_package: Succeeded
NOTE: Running task 1559 of 2451 (ID: 1307, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_package_write_ipk)
NOTE: package tzdata-2011g-r10.0: task do_package_write_ipk: Started
NOTE: package tzdata-2011g-r10.0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1560 of 2451 (ID: 1304, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb, do_package_write)
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_compile: Succeeded
NOTE: Running task 1561 of 2451 (ID: 1682, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_install)
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_install: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_install: Succeeded
NOTE: Running task 1562 of 2451 (ID: 1683, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_populate_sysroot)
NOTE: Running task 1563 of 2451 (ID: 1688, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_package)
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_populate_sysroot: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_package: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_package: Succeeded
NOTE: Running task 1564 of 2451 (ID: 1690, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_package_write_ipk)
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_package_write_ipk: Started
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1565 of 2451 (ID: 1687, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_package_write)
NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_populate_sysroot: Succeeded
NOTE: Running task 1566 of 2451 (ID: 706, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_configure)
NOTE: package eglibc-2.12-r27: task do_configure: Started
NOTE: package eglibc-2.12-r27: task do_configure: Succeeded
NOTE: Running task 1567 of 2451 (ID: 707, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_compile)
NOTE: package eglibc-2.12-r27: task do_compile: Started
NOTE: package eglibc-2.12-r27: task do_compile: Succeeded
NOTE: Running task 1568 of 2451 (ID: 703, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_install)
NOTE: package eglibc-2.12-r27: task do_install: Started
NOTE: package eglibc-2.12-r27: task do_install: Succeeded
NOTE: Running task 1569 of 2451 (ID: 702, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_install_locale)
NOTE: package eglibc-2.12-r27: task do_install_locale: Started
NOTE: package eglibc-2.12-r27: task do_install_locale: Succeeded
NOTE: Running task 1570 of 2451 (ID: 704, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_populate_sysroot)
NOTE: Running task 1571 of 2451 (ID: 709, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_package)
NOTE: package eglibc-2.12-r27: task do_populate_sysroot: Started
NOTE: package eglibc-2.12-r27: task do_package: Started
NOTE: package eglibc-2.12-r27: task do_populate_sysroot: Succeeded
NOTE: Running task 1572 of 2451 (ID: 682, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_configure)
NOTE: Running task 1573 of 2451 (ID: 209, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_install)
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_configure: Started
NOTE: package eglibc-locale-2.12-r18: task do_install: Started
NOTE: package eglibc-locale-2.12-r18: task do_install: Succeeded
NOTE: Running task 1574 of 2451 (ID: 214, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_package)
NOTE: package eglibc-locale-2.12-r18: task do_package: Started
WARNING: For recipe eglibc, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/locale
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_configure: Succeeded
NOTE: Running task 1575 of 2451 (ID: 683, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_compile)
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_compile: Started
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_compile: Succeeded
NOTE: Running task 1576 of 2451 (ID: 679, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_install)
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_install: Started
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_install: Succeeded
NOTE: Running task 1577 of 2451 (ID: 680, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_populate_sysroot)
NOTE: Running task 1578 of 2451 (ID: 685, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_package)
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_populate_sysroot: Started
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_package: Started
NOTE: package eglibc-2.12-r27: task do_package: Succeeded
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 1579 of 2451 (ID: 1673, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_configure)
NOTE: Running noexec task 1580 of 2451 (ID: 1674, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_compile)
NOTE: Running task 1581 of 2451 (ID: 1670, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_install)
NOTE: Running task 1582 of 2451 (ID: 423, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_configure)
NOTE: package libgcc-4.5-r43+svnr178923: task do_install: Started
NOTE: package libgcc-4.5-r43+svnr178923: task do_install: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_configure: Started
NOTE: Running task 1583 of 2451 (ID: 1671, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_populate_sysroot)
NOTE: package libgcc-4.5-r43+svnr178923: task do_populate_sysroot: Started
NOTE: package libgcc-4.5-r43+svnr178923: task do_populate_sysroot: Succeeded
NOTE: Running task 1584 of 2451 (ID: 694, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_configure)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_configure: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_configure: Succeeded
NOTE: Running task 1585 of 2451 (ID: 424, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_kernel_configcheck)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_configcheck: Started
NOTE: validating kernel configuration
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_package: Succeeded
NOTE: Running task 1586 of 2451 (ID: 1676, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_package)
NOTE: Running task 1587 of 2451 (ID: 687, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_package_write_ipk)
NOTE: package libgcc-4.5-r43+svnr178923: task do_package: Started
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_package_write_ipk: Started
WARNING: For recipe libgcc, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/src/debug
NOTE: package gcc-cross-4.5-r43+svnr178923: task do_package_write_ipk: Succeeded

NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_configcheck: Succeeded
NOTE: Running task 1588 of 2451 (ID: 425, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_compile)
NOTE: Running noexec task 1589 of 2451 (ID: 684, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.5.bb, do_package_write)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_compile: Started
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libgcc-4.5-r43+svnr178923/packages-split/libgcc/lib/libgcc_s.so.1'
NOTE: package libgcc-4.5-r43+svnr178923: task do_package: Succeeded
NOTE: Running task 1590 of 2451 (ID: 1678, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_package_write_ipk)
NOTE: package libgcc-4.5-r43+svnr178923: task do_package_write_ipk: Started
NOTE: package libgcc-4.5-r43+svnr178923: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1591 of 2451 (ID: 1675, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb, do_package_write)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_configure: Succeeded
NOTE: Running task 1592 of 2451 (ID: 695, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_compile)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_compile: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_compile: Succeeded
NOTE: Running task 1593 of 2451 (ID: 430, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_compile_kernelmodules)
NOTE: Running task 1594 of 2451 (ID: 429, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_sizecheck)
NOTE: Running task 1595 of 2451 (ID: 428, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_uboot_mkimage)
NOTE: Running task 1596 of 2451 (ID: 427, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_kernel_link_vmlinux)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_compile_kernelmodules: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_uboot_mkimage: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_uboot_mkimage: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_link_vmlinux: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_kernel_link_vmlinux: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_sizecheck: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_sizecheck: Succeeded
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_compile: Succeeded
NOTE: Running task 1597 of 2451 (ID: 691, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_install)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_install: Started
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_install: Succeeded
NOTE: Running task 1598 of 2451 (ID: 692, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_populate_sysroot)
NOTE: Running task 1599 of 2451 (ID: 697, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_package)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_package: Started
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_populate_sysroot: Started
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_populate_sysroot: Succeeded
NOTE: Running task 1600 of 2451 (ID: 717, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_configure)
NOTE: Running task 1601 of 2451 (ID: 1707, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_configure)
NOTE: Running task 1602 of 2451 (ID: 1938, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_configure)
NOTE: Running task 1603 of 2451 (ID: 1916, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_configure)
NOTE: Running task 1604 of 2451 (ID: 827, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_configure)
NOTE: Running task 1605 of 2451 (ID: 926, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_configure)
NOTE: Running task 1606 of 2451 (ID: 128, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_configure)
NOTE: Running task 1607 of 2451 (ID: 1262, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_configure)
NOTE: Running task 1608 of 2451 (ID: 304, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_configure)
NOTE: Running task 1609 of 2451 (ID: 294, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_configure)
NOTE: Running task 1610 of 2451 (ID: 1453, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_configure)
NOTE: Running task 1611 of 2451 (ID: 1362, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_configure)
NOTE: Running task 1612 of 2451 (ID: 1231, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_configure)
NOTE: Running task 1613 of 2451 (ID: 326, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_configure)
NOTE: Running task 1614 of 2451 (ID: 242, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_configure)
NOTE: Running task 1615 of 2451 (ID: 232, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_configure)
NOTE: Running task 1616 of 2451 (ID: 191, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_configure)
NOTE: Running task 1617 of 2451 (ID: 160, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_configure)
NOTE: package libtool-cross-2.4-r5: task do_configure: Started
NOTE: package zip-3.0-r0: task do_configure: Started
NOTE: package ocf-linux-20100325-r3.0: task do_configure: Started
NOTE: package tcp-wrappers-7.6-r7: task do_configure: Started
NOTE: package libtool-2.4-r4: task do_configure: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_configure: Started
NOTE: package sysvinit-2.88dsf-r5: task do_configure: Started
NOTE: package busybox-1.18.5-r2: task do_configure: Started
NOTE: package task-base-1.0-r72: task do_configure: Started
NOTE: package netbase-4.47-r0: task do_configure: Started
NOTE: package systemd-serialgetty-1.0-r1: task do_configure: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_configure: Started
NOTE: package hostap-utils-0.4.7-r4: task do_configure: Started
NOTE: package tinylogin-1.4-r7: task do_configure: Started
NOTE: package zip-3.0-r0: task do_configure: Succeeded
NOTE: package ocf-linux-20100325-r3.0: task do_configure: Succeeded
NOTE: package tcp-wrappers-7.6-r7: task do_configure: Succeeded
NOTE: package opkg-config-base-1.0-r0: task do_configure: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_configure: Succeeded
NOTE: package sysvinit-2.88dsf-r5: task do_configure: Succeeded
NOTE: package wireless-tools-1_29-r2: task do_configure: Started
NOTE: package task-basic-1.0-r3: task do_configure: Started
NOTE: Running task 1618 of 2451 (ID: 1708, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_compile)
NOTE: Running task 1619 of 2451 (ID: 1939, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_compile)
NOTE: package netbase-4.47-r0: task do_configure: Succeeded
NOTE: package systemd-serialgetty-1.0-r1: task do_configure: Succeeded
NOTE: Running task 1620 of 2451 (ID: 828, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_compile)
NOTE: package task-basic-1.0-r3: task do_configure: Succeeded
NOTE: package tinylogin-1.4-r7: task do_configure: Succeeded
NOTE: Running task 1621 of 2451 (ID: 305, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_compile)
NOTE: package task-base-1.0-r72: task do_configure: Succeeded
NOTE: package opkg-config-base-1.0-r0: task do_configure: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_configure: Succeeded
NOTE: package wireless-tools-1_29-r2: task do_configure: Succeeded
NOTE: Running task 1622 of 2451 (ID: 129, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_compile)
NOTE: package hostap-utils-0.4.7-r4: task do_configure: Succeeded
NOTE: Running task 1623 of 2451 (ID: 1263, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_compile)
NOTE: Running task 1624 of 2451 (ID: 1454, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_compile)
NOTE: Running task 1625 of 2451 (ID: 1363, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_compile)
NOTE: Running task 1626 of 2451 (ID: 1232, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_compile)
NOTE: Running task 1627 of 2451 (ID: 327, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_compile)
NOTE: Running task 1628 of 2451 (ID: 243, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_compile)
NOTE: Running task 1629 of 2451 (ID: 233, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_compile)
NOTE: Running task 1630 of 2451 (ID: 192, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_compile)
NOTE: Running task 1631 of 2451 (ID: 161, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_compile)
NOTE: package zip-3.0-r0: task do_compile: Started
NOTE: package ocf-linux-20100325-r3.0: task do_compile: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_compile: Started
NOTE: package tcp-wrappers-7.6-r7: task do_compile: Started
NOTE: package tinylogin-1.4-r7: task do_compile: Started
NOTE: package ocf-linux-20100325-r3.0: task do_compile: Succeeded
NOTE: package angstrom-feed-configs-1.0-r15: task do_compile: Succeeded
NOTE: package netbase-4.47-r0: task do_compile: Started
NOTE: Running task 1632 of 2451 (ID: 302, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_install)
NOTE: package task-base-1.0-r72: task do_compile: Started
NOTE: package opkg-config-base-1.0-r0: task do_compile: Started
NOTE: package systemd-serialgetty-1.0-r1: task do_compile: Started
NOTE: Running task 1633 of 2451 (ID: 1935, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_install)
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_compile: Started
NOTE: package task-basic-1.0-r3: task do_compile: Started
NOTE: package task-base-1.0-r72: task do_compile: Succeeded
NOTE: package netbase-4.47-r0: task do_compile: Succeeded
NOTE: package systemd-serialgetty-1.0-r1: task do_compile: Succeeded
NOTE: package wireless-tools-1_29-r2: task do_compile: Started
NOTE: Running task 1634 of 2451 (ID: 125, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_install)
NOTE: package sysvinit-2.88dsf-r5: task do_compile: Started
NOTE: package hostap-utils-0.4.7-r4: task do_compile: Started
NOTE: Running task 1635 of 2451 (ID: 1451, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_install)
NOTE: Running task 1636 of 2451 (ID: 1229, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_install)
NOTE: package task-basic-1.0-r3: task do_compile: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1637 of 2451 (ID: 324, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_install)
NOTE: package opkg-config-base-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1638 of 2451 (ID: 1260, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_install)
NOTE: Running task 1639 of 2451 (ID: 189, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_install)
NOTE: package angstrom-feed-configs-1.0-r15: task do_install: Started
NOTE: package ocf-linux-20100325-r3.0: task do_install: Started
NOTE: package netbase-4.47-r0: task do_install: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_install: Started
NOTE: package task-base-1.0-r72: task do_install: Started
NOTE: package opkg-config-base-1.0-r0: task do_install: Started
NOTE: package systemd-serialgetty-1.0-r1: task do_install: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_install: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_install: Succeeded
NOTE: package task-base-1.0-r72: task do_install: Succeeded
NOTE: package task-basic-1.0-r3: task do_install: Started
NOTE: package ocf-linux-20100325-r3.0: task do_install: Succeeded
NOTE: Running task 1640 of 2451 (ID: 1936, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_populate_sysroot)
NOTE: Running task 1641 of 2451 (ID: 126, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_populate_sysroot)
NOTE: package task-basic-1.0-r3: task do_install: Succeeded
NOTE: package netbase-4.47-r0: task do_install: Succeeded
NOTE: package systemd-serialgetty-1.0-r1: task do_install: Succeeded
NOTE: package opkg-config-base-1.0-r0: task do_install: Succeeded
NOTE: package ocf-linux-20100325-r3.0: task do_populate_sysroot: Started
NOTE: package task-base-1.0-r72: task do_populate_sysroot: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_configure: Started
NOTE: package hostap-utils-0.4.7-r4: task do_compile: Succeeded
NOTE: Running task 1642 of 2451 (ID: 240, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_install)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_configure: Succeeded
NOTE: package wireless-tools-1_29-r2: task do_compile: Succeeded
NOTE: Running task 1643 of 2451 (ID: 295, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_compile)
NOTE: Running task 1644 of 2451 (ID: 230, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_install)
NOTE: package ocf-linux-20100325-r3.0: task do_populate_sysroot: Succeeded
NOTE: package task-base-1.0-r72: task do_populate_sysroot: Succeeded
NOTE: package sysvinit-2.88dsf-r5: task do_compile: Succeeded
NOTE: package hostap-utils-0.4.7-r4: task do_install: Started
NOTE: Running task 1645 of 2451 (ID: 1360, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_install)
NOTE: Running task 1646 of 2451 (ID: 1201, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_configure)
NOTE: Running noexec task 1652 of 2451 (ID: 9, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-images/angstrom/console-image.bb, do_package_write)
NOTE: package wireless-tools-1_29-r2: task do_install: Started
NOTE: package hostap-utils-0.4.7-r4: task do_install: Succeeded
NOTE: package sysvinit-2.88dsf-r5: task do_install: Started
NOTE: package openssl-1.0.0e-r14.4: task do_configure: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_compile: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_compile: Succeeded
NOTE: Running task 1654 of 2451 (ID: 292, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_install)
NOTE: package sysvinit-2.88dsf-r5: task do_install: Succeeded
NOTE: package tinylogin-1.4-r7: task do_compile: Succeeded
NOTE: Running task 1655 of 2451 (ID: 158, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_install)
NOTE: package tinylogin-1.4-r7: task do_install: Started
NOTE: package tcp-wrappers-7.6-r7: task do_compile: Succeeded
NOTE: Running task 1656 of 2451 (ID: 824, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_install)
NOTE: package tinylogin-1.4-r7: task do_install: Succeeded
NOTE: package tcp-wrappers-7.6-r7: task do_install: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_install: Started
NOTE: package tcp-wrappers-7.6-r7: task do_install: Succeeded
NOTE: Running task 1657 of 2451 (ID: 825, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_populate_sysroot)
NOTE: package zip-3.0-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 2451 (ID: 1704, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_install)
NOTE: package tcp-wrappers-7.6-r7: task do_populate_sysroot: Started
NOTE: package openssl-1.0.0e-r14.4: task do_configure: Succeeded
NOTE: Running task 1659 of 2451 (ID: 1202, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_compile)
NOTE: package zip-3.0-r0: task do_install: Started
NOTE: package zip-3.0-r0: task do_install: Succeeded
NOTE: Running task 1660 of 2451 (ID: 1705, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_populate_sysroot)
NOTE: package tcp-wrappers-7.6-r7: task do_populate_sysroot: Succeeded
NOTE: package openssl-1.0.0e-r14.4: task do_compile: Started
NOTE: Running task 1661 of 2451 (ID: 284, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_configure)
NOTE: package zip-3.0-r0: task do_populate_sysroot: Started
NOTE: package portmap-6.0-r7: task do_configure: Started
NOTE: package portmap-6.0-r7: task do_configure: Succeeded
NOTE: Running task 1662 of 2451 (ID: 285, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_compile)
NOTE: package zip-3.0-r0: task do_populate_sysroot: Succeeded
NOTE: package portmap-6.0-r7: task do_compile: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_install: Succeeded
NOTE: package portmap-6.0-r7: task do_compile: Succeeded
NOTE: Running task 1663 of 2451 (ID: 282, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_install)
NOTE: package portmap-6.0-r7: task do_install: Started
NOTE: package portmap-6.0-r7: task do_install: Succeeded
NOTE: package busybox-1.18.5-r2: task do_configure: Succeeded
NOTE: Running task 1664 of 2451 (ID: 927, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_compile)
NOTE: package busybox-1.18.5-r2: task do_compile: Started
NOTE: package wireless-tools-1_29-r2: task do_install: Succeeded
NOTE: package libtool-cross-2.4-r5: task do_configure: Succeeded
NOTE: Running task 1665 of 2451 (ID: 718, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_compile)
NOTE: package libtool-2.4-r4: task do_configure: Succeeded
NOTE: Running task 1666 of 2451 (ID: 1917, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_compile)
NOTE: package libtool-cross-2.4-r5: task do_compile: Started
NOTE: package libtool-2.4-r4: task do_compile: Started
NOTE: package libtool-cross-2.4-r5: task do_compile: Succeeded
NOTE: Running task 1667 of 2451 (ID: 714, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_install)
NOTE: package libtool-cross-2.4-r5: task do_install: Started
NOTE: package libtool-2.4-r4: task do_compile: Succeeded
NOTE: package libtool-cross-2.4-r5: task do_install: Succeeded
NOTE: Running task 1668 of 2451 (ID: 1913, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_install)
NOTE: Running task 1669 of 2451 (ID: 715, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_populate_sysroot)
NOTE: Running task 1670 of 2451 (ID: 720, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_package)
NOTE: package libtool-cross-2.4-r5: task do_populate_sysroot: Started
NOTE: package libtool-cross-2.4-r5: task do_package: Started
NOTE: package libtool-2.4-r4: task do_install: Started
NOTE: package libtool-cross-2.4-r5: task do_package: Succeeded
NOTE: package eglibc-locale-2.12-r18: task do_package: Succeeded
NOTE: Running task 1671 of 2451 (ID: 216, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_package_write_ipk)
NOTE: Running task 1672 of 2451 (ID: 722, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_package_write_ipk)
NOTE: package libtool-cross-2.4-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 1673 of 2451 (ID: 1091, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_configure)
NOTE: Running task 1674 of 2451 (ID: 2180, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_configure)
NOTE: Running task 1675 of 2451 (ID: 1036, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_configure)
NOTE: Running task 1676 of 2451 (ID: 871, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_configure)
NOTE: Running task 1677 of 2451 (ID: 1080, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_configure)
NOTE: Running task 1678 of 2451 (ID: 2423, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_configure)
NOTE: Running task 1679 of 2451 (ID: 2390, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_configure)
NOTE: Running task 1680 of 2451 (ID: 1718, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_configure)
NOTE: Running task 1681 of 2451 (ID: 1883, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_configure)
NOTE: Running task 1682 of 2451 (ID: 1927, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_configure)
NOTE: Running task 1683 of 2451 (ID: 1102, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_configure)
NOTE: Running task 1684 of 2451 (ID: 1828, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_configure)
NOTE: Running task 1685 of 2451 (ID: 1817, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_configure)
NOTE: Running task 1686 of 2451 (ID: 1135, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_configure)
NOTE: Running task 1687 of 2451 (ID: 1047, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_configure)
NOTE: Running task 1688 of 2451 (ID: 1025, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_configure)
NOTE: Running task 1689 of 2451 (ID: 2059, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_configure)
NOTE: package eglibc-locale-2.12-r18: task do_package_write_ipk: Started
NOTE: package libtool-cross-2.4-r5: task do_package_write_ipk: Started
NOTE: package ncurses-5.9-r2.1: task do_configure: Started
NOTE: package expat-2.0.1-r1: task do_configure: Started
NOTE: package base-passwd-3.5.22-r9: task do_configure: Started
NOTE: package util-macros-1_1.15.0-r0: task do_configure: Started
NOTE: package bzip2-1.0.6-r3: task do_configure: Started
NOTE: package libtool-2.4-r4: task do_install: Succeeded
NOTE: package zlib-1.2.5-r1: task do_configure: Started
NOTE: package libpthread-stubs-0.3-r0: task do_configure: Started
NOTE: package libffi-3.0.9-r2: task do_configure: Started
NOTE: package lzo-2.05-r0: task do_configure: Started
NOTE: package libpcap-1.1.1-r1.0: task do_configure: Started
NOTE: Running task 1690 of 2451 (ID: 1914, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_populate_sysroot)
NOTE: package gdbm-1.8.3-r4: task do_configure: Started
NOTE: package xcb-proto-1.6-r4: task do_configure: Started
NOTE: package libtool-cross-2.4-r5: task do_package_write_ipk: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_configure: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_configure: Started
NOTE: package libtasn1-2.10-r0: task do_configure: Started
NOTE: package libnl-1_2.0-r6: task do_configure: Started
NOTE: Running task 1691 of 2451 (ID: 2048, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_configure)
NOTE: package libdaemon-0.14-r0: task do_configure: Started
NOTE: package libtool-2.4-r4: task do_populate_sysroot: Started
NOTE: package busybox-1.18.5-r2: task do_compile: Succeeded
NOTE: Running task 1692 of 2451 (ID: 399, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_configure)
NOTE: package db-5.1.19-r3: task do_configure: Started
NOTE: package sysfsutils-2.1.0-r2: task do_configure: Started
NOTE: package libtool-2.4-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1693 of 2451 (ID: 2081, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_configure)
NOTE: package gmp-5.0.2-r1: task do_configure: Started
NOTE: package base-passwd-3.5.22-r9: task do_configure: Succeeded
NOTE: Running task 1694 of 2451 (ID: 872, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_compile)
NOTE: package base-passwd-3.5.22-r9: task do_compile: Started
NOTE: package base-passwd-3.5.22-r9: task do_compile: Succeeded
NOTE: Running task 1695 of 2451 (ID: 868, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_install)
NOTE: package base-passwd-3.5.22-r9: task do_install: Started
NOTE: package util-macros-1_1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 2451 (ID: 2181, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_compile)
NOTE: package base-passwd-3.5.22-r9: task do_install: Succeeded
NOTE: Running task 1697 of 2451 (ID: 869, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_populate_sysroot)
NOTE: package util-macros-1_1.15.0-r0: task do_compile: Started
NOTE: package util-macros-1_1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 2451 (ID: 2177, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_install)
NOTE: package xcb-proto-1.6-r4: task do_configure: Succeeded
NOTE: package base-passwd-3.5.22-r9: task do_populate_sysroot: Started
NOTE: Running task 1699 of 2451 (ID: 2391, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_compile)
NOTE: package xcb-proto-1.6-r4: task do_compile: Started
NOTE: package util-macros-1_1.15.0-r0: task do_install: Started
NOTE: package xcb-proto-1.6-r4: task do_compile: Succeeded
NOTE: package util-macros-1_1.15.0-r0: task do_install: Succeeded
NOTE: package base-passwd-3.5.22-r9: task do_populate_sysroot: Succeeded
NOTE: Running task 1700 of 2451 (ID: 893, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_configure)
NOTE: Running task 1701 of 2451 (ID: 2178, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_populate_sysroot)
NOTE: Running task 1702 of 2451 (ID: 2387, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_install)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_configure: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_configure: Succeeded
NOTE: package util-macros-1_1.15.0-r0: task do_populate_sysroot: Started
NOTE: package xcb-proto-1.6-r4: task do_install: Started
NOTE: Running task 1703 of 2451 (ID: 894, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_compile)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_compile: Started
NOTE: package util-macros-1_1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1704 of 2451 (ID: 2235, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_configure)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 2451 (ID: 2279, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_configure)
NOTE: package xproto-1_7.0.22-r0: task do_configure: Started
NOTE: package xcb-proto-1.6-r4: task do_install: Succeeded
NOTE: Running task 1706 of 2451 (ID: 2388, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_populate_sysroot)
NOTE: package kbproto-1_1.0.5-r0: task do_configure: Started
NOTE: package xcb-proto-1.6-r4: task do_populate_sysroot: Started
NOTE: package xcb-proto-1.6-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1707 of 2451 (ID: 2268, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_configure)
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_configure: Started
NOTE: package libpcap-1.1.1-r1.0: task do_configure: Succeeded
NOTE: Running task 1708 of 2451 (ID: 2257, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_configure)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_configure: Started
NOTE: package gdbm-1.8.3-r4: task do_configure: Succeeded
NOTE: package expat-2.0.1-r1: task do_configure: Succeeded
NOTE: package bzip2-1.0.6-r3: task do_configure: Succeeded
NOTE: Running task 1709 of 2451 (ID: 1037, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_compile)
NOTE: Running task 1710 of 2451 (ID: 2224, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_configure)
NOTE: Running task 1711 of 2451 (ID: 890, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_install)
NOTE: package zlib-1.2.5-r1: task do_configure: Succeeded
NOTE: Running task 1712 of 2451 (ID: 1081, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_compile)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_configure: Started
NOTE: package expat-2.0.1-r1: task do_compile: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_install: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_install: Succeeded
NOTE: Running task 1713 of 2451 (ID: 891, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_populate_sysroot)
NOTE: package zlib-1.2.5-r1: task do_compile: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_populate_sysroot: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_configure: Succeeded
NOTE: Running task 1714 of 2451 (ID: 2269, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_compile)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_compile: Started
NOTE: Running task 1715 of 2451 (ID: 1928, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_compile)
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_compile: Succeeded
NOTE: Running task 1716 of 2451 (ID: 2265, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_install)
NOTE: package bzip2-1.0.6-r3: task do_compile: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_install: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_install: Succeeded
NOTE: Running task 1717 of 2451 (ID: 2266, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_populate_sysroot)
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_populate_sysroot: Started
NOTE: package kbproto-1_1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1718 of 2451 (ID: 2280, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_compile)
NOTE: package kbproto-1_1.0.5-r0: task do_compile: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1719 of 2451 (ID: 1136, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_compile)
NOTE: package kbproto-1_1.0.5-r0: task do_compile: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1720 of 2451 (ID: 1884, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_compile)
NOTE: Running task 1721 of 2451 (ID: 2276, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_install)
NOTE: package zlib-1.2.5-r1: task do_compile: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_compile: Started
NOTE: Running task 1722 of 2451 (ID: 1077, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_install)
NOTE: package libusb1-1.0.8-r0: task do_compile: Started
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_package: Succeeded
NOTE: Running task 1723 of 2451 (ID: 2183, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_package)
NOTE: package zlib-1.2.5-r1: task do_install: Started
NOTE: package kbproto-1_1.0.5-r0: task do_install: Started
NOTE: package util-macros-1_1.15.0-r0: task do_package: Started
NOTE: package kbproto-1_1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1724 of 2451 (ID: 2277, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_populate_sysroot)
NOTE: package zlib-1.2.5-r1: task do_install: Succeeded
NOTE: Running task 1725 of 2451 (ID: 1078, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_populate_sysroot)
NOTE: package libpthread-stubs-0.3-r0: task do_configure: Succeeded
NOTE: Running task 1726 of 2451 (ID: 2424, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_compile)
NOTE: package zlib-1.2.5-r1: task do_populate_sysroot: Started
NOTE: package kbproto-1_1.0.5-r0: task do_populate_sysroot: Started
NOTE: package libpthread-stubs-0.3-r0: task do_compile: Started
NOTE: package libpthread-stubs-0.3-r0: task do_compile: Succeeded
NOTE: Running task 1727 of 2451 (ID: 2420, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_install)
NOTE: package sysfsutils-2.1.0-r2: task do_configure: Succeeded
NOTE: Running task 1728 of 2451 (ID: 874, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_package)
NOTE: package xproto-1_7.0.22-r0: task do_configure: Succeeded
NOTE: Running task 1729 of 2451 (ID: 2236, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_compile)
NOTE: package kbproto-1_1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1730 of 2451 (ID: 1083, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_package)
NOTE: package libpthread-stubs-0.3-r0: task do_install: Started
NOTE: package util-macros-1_1.15.0-r0: task do_package: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_compile: Succeeded
NOTE: Running task 1731 of 2451 (ID: 2393, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_package)
NOTE: Running task 1732 of 2451 (ID: 2282, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_package)
NOTE: package xproto-1_7.0.22-r0: task do_compile: Started
NOTE: package base-passwd-3.5.22-r9: task do_package: Started
NOTE: package libpthread-stubs-0.3-r0: task do_install: Succeeded
NOTE: package zlib-1.2.5-r1: task do_package: Started
NOTE: Running task 1733 of 2451 (ID: 2421, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_populate_sysroot)
NOTE: package xproto-1_7.0.22-r0: task do_compile: Succeeded
NOTE: Running task 1734 of 2451 (ID: 2232, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_install)
NOTE: package xcb-proto-1.6-r4: task do_package: Started
NOTE: package kbproto-1_1.0.5-r0: task do_package: Started
NOTE: package libpthread-stubs-0.3-r0: task do_populate_sysroot: Started
NOTE: package libusb1-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1735 of 2451 (ID: 2426, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_package)
NOTE: package xproto-1_7.0.22-r0: task do_install: Started
NOTE: package libpthread-stubs-0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1736 of 2451 (ID: 2271, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_package)
NOTE: package libffi-3.0.9-r2: task do_configure: Succeeded
NOTE: Running task 1737 of 2451 (ID: 1719, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_compile)
NOTE: package libpthread-stubs-0.3-r0: task do_package: Started
NOTE: package xproto-1_7.0.22-r0: task do_install: Succeeded
NOTE: Running task 1738 of 2451 (ID: 2233, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_populate_sysroot)
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_package: Started
NOTE: package libnl-1_2.0-r6: task do_configure: Succeeded
NOTE: Running task 1739 of 2451 (ID: 2238, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_package)
NOTE: package xproto-1_7.0.22-r0: task do_populate_sysroot: Started
NOTE: package libffi-3.0.9-r2: task do_compile: Started
NOTE: package kbproto-1_1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1740 of 2451 (ID: 1880, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_install)
NOTE: package xproto-1_7.0.22-r0: task do_package: Started
NOTE: package base-passwd-3.5.22-r9: task do_package: Succeeded
NOTE: Running task 1741 of 2451 (ID: 896, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package)
NOTE: package xproto-1_7.0.22-r0: task do_populate_sysroot: Succeeded
NOTE: package bzip2-1.0.6-r3: task do_compile: Succeeded
NOTE: Running task 1742 of 2451 (ID: 1710, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_package)
NOTE: Running task 1743 of 2451 (ID: 1924, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_install)
NOTE: package libusb1-1.0.8-r0: task do_install: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1744 of 2451 (ID: 2258, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_compile)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_package: Started
NOTE: package libpthread-stubs-0.3-r0: task do_package: Succeeded
NOTE: Running task 1745 of 2451 (ID: 1132, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_install)
NOTE: package zip-3.0-r0: task do_package: Started
NOTE: package bzip2-1.0.6-r3: task do_install: Started
NOTE: package expat-2.0.1-r1: task do_compile: Succeeded
NOTE: Running task 1746 of 2451 (ID: 1033, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_install)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_compile: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_package: Succeeded
NOTE: Running task 1747 of 2451 (ID: 1026, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_compile)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_compile: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_install: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_install: Started
NOTE: package zlib-1.2.5-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1748 of 2451 (ID: 2356, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_configure)
NOTE: Running task 1749 of 2451 (ID: 1881, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_populate_sysroot)
NOTE: Running task 1750 of 2451 (ID: 2254, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_install)
NOTE: package libnl-1_2.0-r6: task do_compile: Started
NOTE: package expat-2.0.1-r1: task do_install: Started
NOTE: package libusb1-1.0.8-r0: task do_populate_sysroot: Started
NOTE: package zlib-1.2.5-r1: task do_package: Succeeded
NOTE: package libxml2-2.7.8-r4: task do_configure: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_install: Started
NOTE: Running task 1751 of 2451 (ID: 1886, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_package)
NOTE: package bzip2-1.0.6-r3: task do_install: Succeeded
NOTE: Running task 1752 of 2451 (ID: 1925, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_populate_sysroot)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_package: Succeeded
NOTE: Running task 1753 of 2451 (ID: 2060, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_compile)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1754 of 2451 (ID: 2255, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_populate_sysroot)
NOTE: package libusb1-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: package expat-2.0.1-r1: task do_install: Succeeded
NOTE: Running task 1755 of 2451 (ID: 1034, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_populate_sysroot)
NOTE: Running task 1756 of 2451 (ID: 1039, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_package)
NOTE: package libusb1-1.0.8-r0: task do_package: Started
NOTE: package bzip2-1.0.6-r3: task do_populate_sysroot: Started
NOTE: package gdbm-1.8.3-r4: task do_compile: Started
NOTE: package expat-2.0.1-r1: task do_populate_sysroot: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: package libffi-3.0.9-r2: task do_compile: Succeeded
NOTE: Running task 1757 of 2451 (ID: 1715, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_install)
NOTE: package expat-2.0.1-r1: task do_package: Started
NOTE: package bzip2-1.0.6-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 1758 of 2451 (ID: 2260, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_package)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1759 of 2451 (ID: 1113, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_configure)
NOTE: package libffi-3.0.9-r2: task do_install: Started
NOTE: package xproto-1_7.0.22-r0: task do_package: Succeeded
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipcloak'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipsplit'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zip'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/zip-3.0-r0/packages-split/zip/usr/bin/zipnote'
NOTE: package expat-2.0.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 2451 (ID: 1941, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_package)
NOTE: Running task 1761 of 2451 (ID: 830, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_package: Started
NOTE: package gdbm-1.8.3-r4: task do_compile: Succeeded
NOTE: package db-5.1.19-r3: task do_configure: Succeeded
NOTE: Running task 1762 of 2451 (ID: 2049, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_compile)
NOTE: Running task 1763 of 2451 (ID: 2056, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_install)
NOTE: package libusb-compat-1_0.1.3-r0: task do_configure: Started
NOTE: package libpcap-1.1.1-r1.0: task do_install: Succeeded
NOTE: Running task 1764 of 2451 (ID: 1133, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_populate_sysroot)
NOTE: package ocf-linux-20100325-r3.0: task do_package: Started
NOTE: package tcp-wrappers-7.6-r7: task do_package: Started
NOTE: package xcb-proto-1.6-r4: task do_package: Succeeded
NOTE: Running task 1765 of 2451 (ID: 1138, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_package)
NOTE: package libffi-3.0.9-r2: task do_install: Succeeded
NOTE: package zip-3.0-r0: task do_package: Succeeded
NOTE: Running task 1766 of 2451 (ID: 400, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_compile)
NOTE: Running task 1767 of 2451 (ID: 1716, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_populate_sysroot)
NOTE: package db-5.1.19-r3: task do_compile: Started
NOTE: package libpcap-1.1.1-r1.0: task do_populate_sysroot: Started
NOTE: package gdbm-1.8.3-r4: task do_install: Started
NOTE: package sysfsutils-2.1.0-r2: task do_compile: Started
NOTE: package libpcap-1.1.1-r1.0: task do_package: Started
NOTE: package libffi-3.0.9-r2: task do_populate_sysroot: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1768 of 2451 (ID: 1721, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_package)
NOTE: package gdbm-1.8.3-r4: task do_install: Succeeded
NOTE: Running task 1769 of 2451 (ID: 2062, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_package)
NOTE: package ocf-linux-20100325-r3.0: task do_package: Succeeded
NOTE: Running task 1770 of 2451 (ID: 2057, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_populate_sysroot)
NOTE: package libffi-3.0.9-r2: task do_populate_sysroot: Succeeded
NOTE: package bigreqsproto-1_1.1.1-r0: task do_configure: Succeeded
NOTE: package libpcap-1.1.1-r1.0: task do_populate_sysroot: Succeeded
NOTE: Running task 1771 of 2451 (ID: 2225, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_compile)
NOTE: package alsa-lib-1.0.24.1-r1: task do_configure: Succeeded
NOTE: Running task 1772 of 2451 (ID: 409, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_configure)
NOTE: Running task 1773 of 2451 (ID: 1103, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_compile)
NOTE: Running task 1774 of 2451 (ID: 368, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_configure)
NOTE: package gdbm-1.8.3-r4: task do_package: Started
NOTE: package libffi-3.0.9-r2: task do_package: Started
NOTE: package libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 2451 (ID: 1048, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_compile)
NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_compile: Started
NOTE: package module-init-tools-3.16-r0: task do_configure: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_compile: Started
NOTE: package ppp-2.4.5-r2: task do_configure: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 2451 (ID: 2221, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_install)
NOTE: package libdaemon-0.14-r0: task do_compile: Started
NOTE: package libusb1-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1777 of 2451 (ID: 923, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_install)
NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot: Succeeded
NOTE: Running task 1778 of 2451 (ID: 1252, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_configure)
NOTE: package ppp-2.4.5-r2: task do_configure: Succeeded
NOTE: Running task 1779 of 2451 (ID: 369, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_compile)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_install: Started
NOTE: package busybox-1.18.5-r2: task do_install: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_configure: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1780 of 2451 (ID: 2222, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_populate_sysroot)
NOTE: package ppp-2.4.5-r2: task do_compile: Started
NOTE: package sysfsutils-2.1.0-r2: task do_compile: Succeeded
NOTE: Running task 1781 of 2451 (ID: 2227, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_package)
NOTE: package expat-2.0.1-r1: task do_package: Succeeded
NOTE: Running task 1782 of 2451 (ID: 396, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_install)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_package: Started
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gdbm-1.8.3-r4/packages-split/gdbm/usr/lib/libgdbm.so.3.0.0'
NOTE: package sysfsutils-2.1.0-r2: task do_install: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1783 of 2451 (ID: 981, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_configure)
NOTE: package libnl-1_2.0-r6: task do_compile: Succeeded
NOTE: package busybox-1.18.5-r2: task do_install: Succeeded
NOTE: Running task 1784 of 2451 (ID: 1022, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_install)
NOTE: Running task 1785 of 2451 (ID: 959, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_configure)
NOTE: package libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1786 of 2451 (ID: 1044, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_install)
NOTE: package ntp-4.2.6p3-r3: task do_configure: Started
NOTE: package iptables-1.4.12.1-r0: task do_configure: Started
NOTE: package gdbm-1.8.3-r4: task do_package: Succeeded
NOTE: Running task 1787 of 2451 (ID: 1930, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package)
NOTE: package libnl-1_2.0-r6: task do_install: Started
NOTE: package libffi-3.0.9-r2: task do_package: Succeeded
NOTE: package libdaemon-0.14-r0: task do_install: Started
NOTE: Running task 1788 of 2451 (ID: 1919, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_package)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1789 of 2451 (ID: 929, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_package)
NOTE: package libpcap-1.1.1-r1.0: task do_package: Succeeded
NOTE: Running task 1790 of 2451 (ID: 1265, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_package)
NOTE: package bzip2-1.0.6-r3: task do_package: Started
NOTE: package sysfsutils-2.1.0-r2: task do_install: Succeeded
NOTE: Running task 1791 of 2451 (ID: 402, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package)
NOTE: package libtool-2.4-r4: task do_package: Started
NOTE: package busybox-1.18.5-r2: task do_package: Started
NOTE: package libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1792 of 2451 (ID: 1050, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package)
NOTE: package opkg-config-base-1.0-r0: task do_package: Started
NOTE: package tcp-wrappers-7.6-r7: task do_package: Succeeded
NOTE: Running task 1793 of 2451 (ID: 1045, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_populate_sysroot)
NOTE: package sysfsutils-2.1.0-r2: task do_package: Started
NOTE: package libdaemon-0.14-r0: task do_package: Started
NOTE: package libnl-1_2.0-r6: task do_install: Succeeded
NOTE: Running task 1794 of 2451 (ID: 1028, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_package)
NOTE: package libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: package opkg-config-base-1.0-r0: task do_package: Succeeded
NOTE: Running task 1795 of 2451 (ID: 1023, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_populate_sysroot)
NOTE: package libnl-1_2.0-r6: task do_package: Started
NOTE: package libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1796 of 2451 (ID: 307, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_package)
NOTE: package libnl-1_2.0-r6: task do_populate_sysroot: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_package: Started
NOTE: package lzo-2.05-r0: task do_configure: Succeeded
NOTE: Running task 1797 of 2451 (ID: 1818, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_compile)
NOTE: package lzo-2.05-r0: task do_compile: Started
NOTE: package libnl-1_2.0-r6: task do_populate_sysroot: Succeeded
NOTE: Running task 1798 of 2451 (ID: 297, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_package)
NOTE: package libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1799 of 2451 (ID: 1456, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_package)
NOTE: package ppp-2.4.5-r2: task do_compile: Succeeded
NOTE: Running task 1800 of 2451 (ID: 365, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_install)
NOTE: package netbase-4.47-r0: task do_package: Started
NOTE: package bzip2-1.0.6-r3: task do_package: Succeeded
NOTE: Running task 1801 of 2451 (ID: 1365, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package)
NOTE: package ppp-2.4.5-r2: task do_install: Started
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_package: Started
WARNING: For recipe netbase, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/sbin
WARNING: For recipe angstrom-version, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/src
WARNING:   /usr/src/debug
NOTE: package sysvinit-2.88dsf-r5: task do_package: Started
NOTE: package lzo-2.05-r0: task do_compile: Succeeded
NOTE: Running task 1802 of 2451 (ID: 1814, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_install)
NOTE: package ppp-2.4.5-r2: task do_install: Succeeded
NOTE: Running task 1803 of 2451 (ID: 371, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_package)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_package: Succeeded
NOTE: Running task 1804 of 2451 (ID: 366, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_populate_sysroot)
NOTE: package sysfsutils-2.1.0-r2: task do_package: Succeeded
NOTE: package db-5.1.19-r3: task do_compile: Succeeded
NOTE: package lzo-2.05-r0: task do_install: Started
NOTE: package busybox-1.18.5-r2: task do_package: Succeeded
NOTE: Running task 1805 of 2451 (ID: 2045, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_install)
NOTE: Running task 1806 of 2451 (ID: 1322, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_configure)
NOTE: Running task 1807 of 2451 (ID: 1234, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/systemd-serialgetty.bb, do_package)
NOTE: package ppp-2.4.5-r2: task do_populate_sysroot: Started
NOTE: package ppp-2.4.5-r2: task do_package: Started
NOTE: package module-init-tools-3.16-r0: task do_configure: Succeeded
NOTE: Running task 1808 of 2451 (ID: 410, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_compile)
NOTE: package lzo-2.05-r0: task do_install: Succeeded
NOTE: package db-5.1.19-r3: task do_install: Started
NOTE: package cpufrequtils-008-r1: task do_configure: Started
NOTE: package systemd-serialgetty-1.0-r1: task do_package: Started
NOTE: Running task 1809 of 2451 (ID: 1815, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_populate_sysroot)
NOTE: package cpufrequtils-008-r1: task do_configure: Succeeded
NOTE: package module-init-tools-3.16-r0: task do_compile: Started
NOTE: package netbase-4.47-r0: task do_package: Succeeded
NOTE: Running task 1810 of 2451 (ID: 1820, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_package)
NOTE: Running task 1811 of 2451 (ID: 1323, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_compile)
NOTE: package ppp-2.4.5-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1812 of 2451 (ID: 451, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_configure)
NOTE: package lzo-2.05-r0: task do_populate_sysroot: Started
NOTE: package cpufrequtils-008-r1: task do_compile: Started
NOTE: package strace-4.5.20-r2: task do_configure: Started
NOTE: package lzo-2.05-r0: task do_package: Started
NOTE: package lzo-2.05-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1813 of 2451 (ID: 397, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_populate_sysroot)
NOTE: package systemd-serialgetty-1.0-r1: task do_package: Succeeded
NOTE: package ncurses-5.9-r2.1: task do_configure: Succeeded
NOTE: Running task 1814 of 2451 (ID: 1092, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_compile)
NOTE: Running task 1815 of 2451 (ID: 378, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_configure)
NOTE: package libtool-2.4-r4: task do_package: Succeeded
NOTE: Running task 1816 of 2451 (ID: 357, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_configure)
NOTE: package sysfsutils-2.1.0-r2: task do_populate_sysroot: Started
NOTE: package ncurses-5.9-r2.1: task do_compile: Started
NOTE: package ppp-dialin-0.1-r7: task do_configure: Started
NOTE: package ppp-dialin-0.1-r7: task do_configure: Succeeded
NOTE: Running task 1817 of 2451 (ID: 379, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_compile)
NOTE: package apmd-3.2.2-14-r1: task do_configure: Started
NOTE: package ppp-dialin-0.1-r7: task do_compile: Started
NOTE: package apmd-3.2.2-14-r1: task do_configure: Succeeded
NOTE: package cpufrequtils-008-r1: task do_compile: Succeeded
NOTE: package module-init-tools-3.16-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 2451 (ID: 407, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_install)
NOTE: Running task 1819 of 2451 (ID: 1320, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_install)
NOTE: Running task 1820 of 2451 (ID: 358, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_compile)
NOTE: package ppp-dialin-0.1-r7: task do_compile: Succeeded
NOTE: Running task 1821 of 2451 (ID: 376, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_install)
NOTE: package sysfsutils-2.1.0-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1822 of 2451 (ID: 336, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_configure)
NOTE: package ppp-dialin-0.1-r7: task do_install: Started
NOTE: package module-init-tools-3.16-r0: task do_install: Started
NOTE: package cpufrequtils-008-r1: task do_install: Started
NOTE: package irda-utils-0.9.18-r0: task do_configure: Started
NOTE: package apmd-3.2.2-14-r1: task do_compile: Started
NOTE: package ppp-dialin-0.1-r7: task do_install: Succeeded
NOTE: Running task 1823 of 2451 (ID: 329, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_package)
NOTE: package irda-utils-0.9.18-r0: task do_configure: Succeeded
NOTE: Running task 1824 of 2451 (ID: 337, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_compile)
NOTE: package module-init-tools-3.16-r0: task do_install: Succeeded
NOTE: Running task 1825 of 2451 (ID: 412, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_package)
NOTE: package cpufrequtils-008-r1: task do_install: Succeeded
NOTE: Running task 1826 of 2451 (ID: 1325, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_package)
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_package: Started
NOTE: package irda-utils-0.9.18-r0: task do_compile: Started
NOTE: package module-init-tools-3.16-r0: task do_package: Started
NOTE: package cpufrequtils-008-r1: task do_package: Started
NOTE: package db-5.1.19-r3: task do_install: Succeeded
NOTE: Running task 1827 of 2451 (ID: 2051, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_package)
NOTE: package irda-utils-0.9.18-r0: task do_compile: Succeeded
NOTE: Running task 1828 of 2451 (ID: 2046, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_populate_sysroot)
NOTE: package db-5.1.19-r3: task do_package: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_package: Succeeded
NOTE: Running task 1829 of 2451 (ID: 334, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_install)
NOTE: package db-5.1.19-r3: task do_populate_sysroot: Started
NOTE: package irda-utils-0.9.18-r0: task do_install: Started
NOTE: package apmd-3.2.2-14-r1: task do_compile: Succeeded
NOTE: Running task 1830 of 2451 (ID: 355, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_install)
NOTE: package irda-utils-0.9.18-r0: task do_install: Succeeded
NOTE: Running task 1831 of 2451 (ID: 339, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_package)
NOTE: package apmd-3.2.2-14-r1: task do_install: Started
NOTE: package irda-utils-0.9.18-r0: task do_package: Started
NOTE: package lzo-2.05-r0: task do_package: Succeeded
NOTE: Running task 1832 of 2451 (ID: 287, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_package)
NOTE: package apmd-3.2.2-14-r1: task do_install: Succeeded
NOTE: Running task 1833 of 2451 (ID: 360, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_package)
NOTE: package portmap-6.0-r7: task do_package: Started
NOTE: package apmd-3.2.2-14-r1: task do_package: Started
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/irattach'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/irdaping'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/irda-utils-0.9.18-r0/packages-split/irda-utils/usr/sbin/dongle_attach'
NOTE: package irda-utils-0.9.18-r0: task do_package: Succeeded
NOTE: Running task 1834 of 2451 (ID: 274, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_configure)
NOTE: package sysvinit-2.88dsf-r5: task do_package: Succeeded
NOTE: Running task 1835 of 2451 (ID: 245, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_package)
NOTE: package cpufrequtils-008-r1: task do_package: Succeeded
NOTE: package alsa-lib-1.0.24.1-r1: task do_compile: Succeeded
NOTE: Running task 1836 of 2451 (ID: 1099, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_install)
NOTE: Running task 1837 of 2451 (ID: 235, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package)
NOTE: package libtasn1-2.10-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 2451 (ID: 1829, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_compile)
NOTE: package libusb-compat-1_0.1.3-r0: task do_configure: Succeeded
NOTE: package pcmciautils-018-r0: task do_configure: Started
NOTE: Running task 1839 of 2451 (ID: 1114, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_compile)
NOTE: package portmap-6.0-r7: task do_package: Succeeded
NOTE: Running task 1840 of 2451 (ID: 924, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_populate_sysroot)
NOTE: package hostap-utils-0.4.7-r4: task do_package: Started
NOTE: package pcmciautils-018-r0: task do_configure: Succeeded
NOTE: package wireless-tools-1_29-r2: task do_package: Started
NOTE: Running task 1841 of 2451 (ID: 275, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_compile)
NOTE: package alsa-lib-1.0.24.1-r1: task do_install: Started
NOTE: package apmd-3.2.2-14-r1: task do_package: Succeeded
NOTE: Running task 1842 of 2451 (ID: 194, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/tasks/task-basic.bb, do_package)
NOTE: package libtasn1-2.10-r0: task do_compile: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_compile: Started
NOTE: package busybox-1.18.5-r2: task do_populate_sysroot: Started
NOTE: package pcmciautils-018-r0: task do_compile: Started
NOTE: package task-basic-1.0-r3: task do_package: Started
NOTE: package busybox-1.18.5-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 1843 of 2451 (ID: 163, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_package)
NOTE: package tinylogin-1.4-r7: task do_package: Started
NOTE: package module-init-tools-3.16-r0: task do_package: Succeeded
NOTE: Running task 1844 of 2451 (ID: 131, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tasks/task-base.bb, do_package)
NOTE: package task-basic-1.0-r3: task do_package: Succeeded
NOTE: Running task 1845 of 2451 (ID: 2428, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_package_write_ipk)
NOTE: package libnl-1_2.0-r6: task do_package: Succeeded
NOTE: package angstrom-feed-configs-1.0-r15: task do_package: Succeeded
NOTE: Running task 1846 of 2451 (ID: 2395, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_package_write_ipk)
NOTE: Running task 1847 of 2451 (ID: 2284, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_package_write_ipk)
NOTE: package task-base-1.0-r72: task do_package: Started
NOTE: package xcb-proto-1.6-r4: task do_package_write_ipk: Started
NOTE: package libpthread-stubs-0.3-r0: task do_package_write_ipk: Started
NOTE: package kbproto-1_1.0.5-r0: task do_package_write_ipk: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1848 of 2451 (ID: 1110, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_install)
NOTE: package db-5.1.19-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 1849 of 2451 (ID: 1382, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_configure)
NOTE: package ppp-2.4.5-r2: task do_package: Succeeded
NOTE: Running task 1850 of 2451 (ID: 381, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_package)
NOTE: package libusb-compat-1_0.1.3-r0: task do_install: Started
NOTE: package pcmciautils-018-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 2451 (ID: 272, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_install)
NOTE: package perl-5.14.2-r0: task do_configure: Started
NOTE: package ppp-dialin-0.1-r7: task do_package: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_install: Succeeded
NOTE: package alsa-lib-1.0.24.1-r1: task do_install: Succeeded
NOTE: Running task 1852 of 2451 (ID: 1100, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_populate_sysroot)
NOTE: Running task 1853 of 2451 (ID: 1111, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_populate_sysroot)
NOTE: package pcmciautils-018-r0: task do_install: Started
NOTE: package libpthread-stubs-0.3-r0: task do_package_write_ipk: Succeeded
NOTE: package alsa-lib-1.0.24.1-r1: task do_populate_sysroot: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1854 of 2451 (ID: 1116, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_package)
NOTE: package kbproto-1_1.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1855 of 2451 (ID: 1105, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_package)
NOTE: package task-base-1.0-r72: task do_package: Succeeded
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/wireless-tools-1_29-r2/packages-split/libiw/usr/lib/libiw.so.29'
NOTE: Running task 1856 of 2451 (ID: 2273, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_package_write_ipk)
NOTE: package tinylogin-1.4-r7: task do_package: Succeeded
NOTE: Running task 1857 of 2451 (ID: 2262, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_package_write_ipk)
NOTE: package libusb-compat-1_0.1.3-r0: task do_package: Started
NOTE: package pcmciautils-018-r0: task do_install: Succeeded
NOTE: package ppp-dialin-0.1-r7: task do_package: Succeeded
NOTE: Running task 1858 of 2451 (ID: 277, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb, do_package)
NOTE: Running task 1859 of 2451 (ID: 2240, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_package_write_ipk)
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_package_write_ipk: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_package: Started
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_diag'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_io_debug'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/hostap-utils-0.4.7-r4/packages-split/hostap-utils/usr/sbin/hostap_rid'
NOTE: package xcb-proto-1.6-r4: task do_package_write_ipk: Succeeded
NOTE: package libusb-compat-1_0.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1860 of 2451 (ID: 2229, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_package_write_ipk)
NOTE: Running task 1861 of 2451 (ID: 739, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_configure)
NOTE: package xcmiscproto-1_1.2.1-r0: task do_package_write_ipk: Started
NOTE: package pcmciautils-018-r0: task do_package: Started
NOTE: package xproto-1_7.0.22-r0: task do_package_write_ipk: Started
NOTE: package alsa-lib-1.0.24.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1862 of 2451 (ID: 2185, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_package_write_ipk)
NOTE: package bigreqsproto-1_1.1.1-r0: task do_package_write_ipk: Started
NOTE: package hostap-utils-0.4.7-r4: task do_package: Succeeded
NOTE: Running task 1863 of 2451 (ID: 2064, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_package_write_ipk)
NOTE: package usbutils-0.91-r3: task do_configure: Started
NOTE: package perl-5.14.2-r0: task do_configure: Succeeded
NOTE: Running task 1864 of 2451 (ID: 1383, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_compile)
NOTE: package wireless-tools-1_29-r2: task do_package: Succeeded
NOTE: Running task 1865 of 2451 (ID: 1943, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_package_write_ipk)
NOTE: package util-macros-1_1.15.0-r0: task do_package_write_ipk: Started
NOTE: package gdbm-1.8.3-r4: task do_package_write_ipk: Started
NOTE: package perl-5.14.2-r0: task do_compile: Started
NOTE: package xf86bigfontproto-1_1.2.0-r1: task do_package_write_ipk: Succeeded
NOTE: Running task 1866 of 2451 (ID: 1932, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write_ipk)
NOTE: package ocf-linux-20100325-r3.0: task do_package_write_ipk: Started
NOTE: package xproto-1_7.0.22-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1867 of 2451 (ID: 1921, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_package_write_ipk)
NOTE: package bzip2-1.0.6-r3: task do_package_write_ipk: Started
NOTE: package xcmiscproto-1_1.2.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1868 of 2451 (ID: 1888, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_package_write_ipk)
NOTE: package libtool-2.4-r4: task do_package_write_ipk: Started
NOTE: package bigreqsproto-1_1.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: package libusb1-1.0.8-r0: task do_package_write_ipk: Started
NOTE: Running task 1869 of 2451 (ID: 1822, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_package_write_ipk)
NOTE: package lzo-2.05-r0: task do_package_write_ipk: Started
NOTE: package util-macros-1_1.15.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1870 of 2451 (ID: 1723, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_package_write_ipk)
NOTE: package libtasn1-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 2451 (ID: 1825, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_install)
NOTE: package libffi-3.0.9-r2: task do_package_write_ipk: Started
NOTE: package libtasn1-2.10-r0: task do_install: Started
NOTE: package pcmciautils-018-r0: task do_package: Succeeded
NOTE: Running task 1872 of 2451 (ID: 1712, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_package_write_ipk)
NOTE: package libusb-compat-1_0.1.3-r0: task do_package: Succeeded
NOTE: Running task 1873 of 2451 (ID: 1458, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_package_write_ipk)
NOTE: package gdbm-1.8.3-r4: task do_package_write_ipk: Succeeded
NOTE: Running task 1874 of 2451 (ID: 1367, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_write_ipk)
NOTE: package zip-3.0-r0: task do_package_write_ipk: Started
NOTE: package netbase-4.47-r0: task do_package_write_ipk: Started
NOTE: package ncurses-5.9-r2.1: task do_compile: Succeeded
NOTE: package sysvinit-2.88dsf-r5: task do_package_write_ipk: Started
NOTE: Running task 1875 of 2451 (ID: 1088, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_install)
NOTE: package ocf-linux-20100325-r3.0: task do_package_write_ipk: Succeeded
NOTE: package bzip2-1.0.6-r3: task do_package_write_ipk: Succeeded
NOTE: Running task 1876 of 2451 (ID: 1327, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_package_write_ipk)
NOTE: Running task 1877 of 2451 (ID: 1267, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_package_write_ipk)
NOTE: package libusb1-1.0.8-r0: task do_package_write_ipk: Succeeded
NOTE: package ncurses-5.9-r2.1: task do_install: Started
NOTE: Running task 1878 of 2451 (ID: 1184, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_package_write_ipk)
NOTE: package opkg-config-base-1.0-r0: task do_package_write_ipk: Started
NOTE: package cpufrequtils-008-r1: task do_package_write_ipk: Started
NOTE: package iptables-1.4.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 2451 (ID: 960, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_compile)
NOTE: package update-modules-1.0-r10: task do_package_write_ipk: Started
NOTE: package lzo-2.05-r0: task do_package_write_ipk: Succeeded
NOTE: package libtasn1-2.10-r0: task do_install: Succeeded
NOTE: package iptables-1.4.12.1-r0: task do_compile: Started
NOTE: Running task 1880 of 2451 (ID: 1140, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_package_write_ipk)
NOTE: Running task 1881 of 2451 (ID: 1826, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_populate_sysroot)
NOTE: package libffi-3.0.9-r2: task do_package_write_ipk: Succeeded
NOTE: Running task 1882 of 2451 (ID: 1831, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_package)
NOTE: package netbase-4.47-r0: task do_package_write_ipk: Succeeded
NOTE: package libtool-2.4-r4: task do_package_write_ipk: Succeeded
NOTE: Running task 1883 of 2451 (ID: 1118, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_package_write_ipk)
NOTE: package libtasn1-2.10-r0: task do_populate_sysroot: Started
NOTE: Running task 1884 of 2451 (ID: 1085, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_package_write_ipk)
NOTE: package libpcap-1.1.1-r1.0: task do_package_write_ipk: Started
NOTE: package zip-3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1885 of 2451 (ID: 1052, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_write_ipk)
NOTE: package libtasn1-2.10-r0: task do_package: Started
NOTE: package libusb-compat-1_0.1.3-r0: task do_package_write_ipk: Started
NOTE: package zlib-1.2.5-r1: task do_package_write_ipk: Started
NOTE: package libdaemon-0.14-r0: task do_package_write_ipk: Started
NOTE: package opkg-config-base-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1886 of 2451 (ID: 1041, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_package_write_ipk)
NOTE: package libtasn1-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1887 of 2451 (ID: 1030, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_package_write_ipk)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_configure: Succeeded
NOTE: package update-modules-1.0-r10: task do_package_write_ipk: Succeeded
NOTE: Running task 1888 of 2451 (ID: 1253, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_compile)
NOTE: Running task 1889 of 2451 (ID: 931, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_package_write_ipk)
NOTE: package expat-2.0.1-r1: task do_package_write_ipk: Started
NOTE: package libnl-1_2.0-r6: task do_package_write_ipk: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_compile: Started
NOTE: package busybox-1.18.5-r2: task do_package_write_ipk: Started
NOTE: package sysvinit-2.88dsf-r5: task do_package_write_ipk: Succeeded
NOTE: Running task 1890 of 2451 (ID: 898, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_write_ipk)
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_package_write_ipk: Started
NOTE: package strace-4.5.20-r2: task do_configure: Succeeded
NOTE: Running task 1891 of 2451 (ID: 452, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_compile)
NOTE: package libxml2-2.7.8-r4: task do_configure: Succeeded
NOTE: package libusb-compat-1_0.1.3-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1892 of 2451 (ID: 876, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_package_write_ipk)
NOTE: package strace-4.5.20-r2: task do_compile: Started
NOTE: Running task 1893 of 2451 (ID: 2357, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_compile)
NOTE: package libpcap-1.1.1-r1.0: task do_package_write_ipk: Succeeded
NOTE: package base-passwd-3.5.22-r9: task do_package_write_ipk: Started
NOTE: package libxml2-2.7.8-r4: task do_compile: Started
NOTE: Running task 1894 of 2451 (ID: 832, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_write_ipk)
NOTE: package zlib-1.2.5-r1: task do_package_write_ipk: Succeeded
NOTE: Running task 1895 of 2451 (ID: 699, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_package_write_ipk)
NOTE: package cpufrequtils-008-r1: task do_package_write_ipk: Succeeded
NOTE: Running task 1896 of 2451 (ID: 414, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_package_write_ipk)
NOTE: package libdaemon-0.14-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1897 of 2451 (ID: 404, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_write_ipk)
NOTE: package tcp-wrappers-7.6-r7: task do_package_write_ipk: Started
NOTE: package shadow-sysroot-4.1.4.3-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1898 of 2451 (ID: 383, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_package_write_ipk)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_package_write_ipk: Started
NOTE: package strace-4.5.20-r2: task do_compile: Succeeded
NOTE: package module-init-tools-3.16-r0: task do_package_write_ipk: Started
NOTE: Running task 1899 of 2451 (ID: 449, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_install)
NOTE: package sysfsutils-2.1.0-r2: task do_package_write_ipk: Started
NOTE: package expat-2.0.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running task 1900 of 2451 (ID: 373, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_package_write_ipk)
NOTE: package ppp-dialin-0.1-r7: task do_package_write_ipk: Started
NOTE: package strace-4.5.20-r2: task do_install: Started
NOTE: package strace-4.5.20-r2: task do_install: Succeeded
NOTE: Running task 1901 of 2451 (ID: 454, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/strace/strace_4.5.20.bb, do_package)
NOTE: package ppp-2.4.5-r2: task do_package_write_ipk: Started
NOTE: package strace-4.5.20-r2: task do_package: Started
NOTE: package iptables-1.4.12.1-r0: task do_compile: Succeeded
NOTE: package busybox-1.18.5-r2: task do_package_write_ipk: Succeeded
NOTE: Running task 1902 of 2451 (ID: 956, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_install)
NOTE: Running task 1903 of 2451 (ID: 362, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_package_write_ipk)
NOTE: package libtasn1-2.10-r0: task do_package: Succeeded
NOTE: Running task 1904 of 2451 (ID: 1833, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_package_write_ipk)
NOTE: package apmd-3.2.2-14-r1: task do_package_write_ipk: Started
NOTE: package base-passwd-3.5.22-r9: task do_package_write_ipk: Succeeded
NOTE: package libnl-1_2.0-r6: task do_package_write_ipk: Succeeded
NOTE: package iptables-1.4.12.1-r0: task do_install: Started
NOTE: Running task 1905 of 2451 (ID: 341, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_package_write_ipk)
NOTE: Running task 1906 of 2451 (ID: 331, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_package_write_ipk)
NOTE: package libtasn1-2.10-r0: task do_package_write_ipk: Started
NOTE: package ppp-dialin-0.1-r7: task do_package_write_ipk: Succeeded
NOTE: Running task 1907 of 2451 (ID: 299, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_package_write_ipk)
NOTE: package irda-utils-0.9.18-r0: task do_package_write_ipk: Started
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_package_write_ipk: Started
NOTE: package tcp-wrappers-7.6-r7: task do_package_write_ipk: Succeeded
NOTE: Running task 1908 of 2451 (ID: 289, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_package_write_ipk)
NOTE: package iptables-1.4.12.1-r0: task do_install: Succeeded
NOTE: Running task 1909 of 2451 (ID: 962, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_package)
NOTE: package portmap-6.0-r7: task do_package_write_ipk: Started
NOTE: package gmp-5.0.2-r1: task do_configure: Succeeded
NOTE: Running task 1910 of 2451 (ID: 2082, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_compile)
NOTE: package sysfsutils-2.1.0-r2: task do_package_write_ipk: Succeeded
NOTE: package iptables-1.4.12.1-r0: task do_package: Started
NOTE: package module-init-tools-3.16-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1911 of 2451 (ID: 957, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/iptables/iptables_1.4.12.1.bb, do_populate_sysroot)
NOTE: Running task 1912 of 2451 (ID: 247, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_package_write_ipk)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_compile: Succeeded
NOTE: Running task 1913 of 2451 (ID: 1250, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_install)
NOTE: package strace-4.5.20-r2: task do_package: Succeeded
NOTE: Running task 1914 of 2451 (ID: 237, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_write_ipk)
NOTE: package hostap-utils-0.4.7-r4: task do_package_write_ipk: Started
NOTE: package iptables-1.4.12.1-r0: task do_populate_sysroot: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_install: Started
NOTE: package wireless-tools-1_29-r2: task do_package_write_ipk: Started
NOTE: package gmp-5.0.2-r1: task do_compile: Started
NOTE: package irda-utils-0.9.18-r0: task do_package_write_ipk: Succeeded
NOTE: package angstrom-libc-fixup-hack-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1915 of 2451 (ID: 165, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_package_write_ipk)
NOTE: Running noexec task 1916 of 2451 (ID: 2425, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb, do_package_write)
NOTE: Running noexec task 1917 of 2451 (ID: 2392, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/xcb-proto_1.6.bb, do_package_write)
NOTE: Running noexec task 1918 of 2451 (ID: 2281, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb, do_package_write)
NOTE: Running noexec task 1919 of 2451 (ID: 2270, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xf86bigfontproto_1.2.0.bb, do_package_write)
NOTE: Running noexec task 1920 of 2451 (ID: 2259, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.1.bb, do_package_write)
NOTE: Running noexec task 1921 of 2451 (ID: 2237, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb, do_package_write)
NOTE: Running noexec task 1922 of 2451 (ID: 2226, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.1.bb, do_package_write)
NOTE: Running noexec task 1923 of 2451 (ID: 2182, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb, do_package_write)
NOTE: Running noexec task 1924 of 2451 (ID: 2061, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gdbm/gdbm_1.8.3.bb, do_package_write)
NOTE: Running noexec task 1925 of 2451 (ID: 1940, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/ocf-linux_20100325.bb, do_package_write)
NOTE: Running noexec task 1926 of 2451 (ID: 1929, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write)
NOTE: Running noexec task 1927 of 2451 (ID: 1918, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool_2.4.bb, do_package_write)
NOTE: Running noexec task 1928 of 2451 (ID: 1885, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.8.bb, do_package_write)
NOTE: Running noexec task 1929 of 2451 (ID: 1819, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/lzo/lzo_2.05.bb, do_package_write)
NOTE: Running noexec task 1930 of 2451 (ID: 1720, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.9.bb, do_package_write)
NOTE: Running noexec task 1931 of 2451 (ID: 1709, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb, do_package_write)
NOTE: Running noexec task 1932 of 2451 (ID: 1455, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/netbase/netbase_4.47.bb, do_package_write)
NOTE: Running noexec task 1933 of 2451 (ID: 1364, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_write)
NOTE: Running noexec task 1934 of 2451 (ID: 1324, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb, do_package_write)
NOTE: Running noexec task 1935 of 2451 (ID: 1264, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb, do_package_write)
NOTE: Running noexec task 1936 of 2451 (ID: 1181, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/update-modules/update-modules_1.0.bb, do_package_write)
NOTE: Running noexec task 1937 of 2451 (ID: 1137, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb, do_package_write)
NOTE: Running noexec task 1938 of 2451 (ID: 1115, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.3.bb, do_package_write)
NOTE: Running noexec task 1939 of 2451 (ID: 1082, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/zlib/zlib_1.2.5.bb, do_package_write)
NOTE: Running noexec task 1940 of 2451 (ID: 1049, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_write)
NOTE: Running noexec task 1941 of 2451 (ID: 1038, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/expat/expat_2.0.1.bb, do_package_write)
NOTE: Running noexec task 1942 of 2451 (ID: 1027, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libnl/libnl_2.0.bb, do_package_write)
NOTE: Running noexec task 1943 of 2451 (ID: 928, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/busybox/busybox_1.18.5.bb, do_package_write)
NOTE: Running noexec task 1944 of 2451 (ID: 895, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_write)
NOTE: Running noexec task 1945 of 2451 (ID: 873, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb, do_package_write)
NOTE: Running noexec task 1946 of 2451 (ID: 829, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_write)
NOTE: Running noexec task 1947 of 2451 (ID: 719, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_package_write)
NOTE: Running noexec task 1948 of 2451 (ID: 411, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb, do_package_write)
NOTE: Running noexec task 1949 of 2451 (ID: 401, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_write)
NOTE: Running noexec task 1950 of 2451 (ID: 380, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb, do_package_write)
NOTE: Running noexec task 1951 of 2451 (ID: 338, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb, do_package_write)
NOTE: Running noexec task 1952 of 2451 (ID: 328, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-libc-fixup-hack.bb, do_package_write)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_package_write_ipk: Started
NOTE: package tinylogin-1.4-r7: task do_package_write_ipk: Started
NOTE: package iptables-1.4.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: package apmd-3.2.2-14-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1953 of 2451 (ID: 359, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb, do_package_write)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_install: Succeeded
NOTE: Running task 1954 of 2451 (ID: 1255, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package)
NOTE: package angstrom-version-2_v2011.12-core-r11: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1955 of 2451 (ID: 296, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb, do_package_write)
NOTE: package libtasn1-2.10-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1956 of 2451 (ID: 1830, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.10.bb, do_package_write)
NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1957 of 2451 (ID: 696, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb, do_package_write)
NOTE: package hostap-utils-0.4.7-r4: task do_package_write_ipk: Succeeded
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_package: Started
NOTE: Running noexec task 1958 of 2451 (ID: 244, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb, do_package_write)
NOTE: package portmap-6.0-r7: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1959 of 2451 (ID: 286, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/portmap/portmap_6.0.bb, do_package_write)
NOTE: package ppp-2.4.5-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1960 of 2451 (ID: 370, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb, do_package_write)
NOTE: package alsa-lib-1.0.24.1-r1: task do_package: Succeeded
NOTE: Running task 1961 of 2451 (ID: 1107, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_package_write_ipk)
NOTE: package tinylogin-1.4-r7: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1962 of 2451 (ID: 162, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/tinylogin/tinylogin_1.4.bb, do_package_write)
NOTE: package alsa-lib-1.0.24.1-r1: task do_package_write_ipk: Started
NOTE: package wireless-tools-1_29-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1963 of 2451 (ID: 234, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_write)
NOTE: package alsa-lib-1.0.24.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1964 of 2451 (ID: 1104, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb, do_package_write)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_package: Succeeded
NOTE: Running task 1965 of 2451 (ID: 1257, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write_ipk)
NOTE: Running task 1966 of 2451 (ID: 309, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_package_write_ipk)
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_package_write_ipk: Started
NOTE: package angstrom-feed-configs-1.0-r15: task do_package_write_ipk: Started
NOTE: package gmp-5.0.2-r1: task do_compile: Succeeded
NOTE: Running task 1967 of 2451 (ID: 2078, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_install)
NOTE: package gmp-5.0.2-r1: task do_install: Started
NOTE: package opkg-1_0.1.8+svnr625-r4: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1968 of 2451 (ID: 1254, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write)
NOTE: package gmp-5.0.2-r1: task do_install: Succeeded
NOTE: Running task 1969 of 2451 (ID: 2084, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_package)
NOTE: Running task 1970 of 2451 (ID: 2079, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_populate_sysroot)
NOTE: package gmp-5.0.2-r1: task do_package: Started
NOTE: package gmp-5.0.2-r1: task do_populate_sysroot: Started
NOTE: package gmp-5.0.2-r1: task do_populate_sysroot: Succeeded
NOTE: package db-5.1.19-r3: task do_package: Succeeded
NOTE: Running task 1971 of 2451 (ID: 2053, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_package_write_ipk)
NOTE: package db-5.1.19-r3: task do_package_write_ipk: Started
NOTE: package usbutils-0.91-r3: task do_configure: Succeeded
NOTE: Running task 1972 of 2451 (ID: 740, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_compile)
NOTE: package usbutils-0.91-r3: task do_compile: Started
NOTE: package gmp-5.0.2-r1: task do_package: Succeeded
NOTE: Running task 1973 of 2451 (ID: 2086, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_package_write_ipk)
NOTE: package gmp-5.0.2-r1: task do_package_write_ipk: Started
NOTE: package usbutils-0.91-r3: task do_compile: Succeeded
NOTE: Running task 1974 of 2451 (ID: 736, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_install)
NOTE: package usbutils-0.91-r3: task do_install: Started
NOTE: package usbutils-0.91-r3: task do_install: Succeeded
NOTE: Running task 1975 of 2451 (ID: 737, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_populate_sysroot)
NOTE: Running task 1976 of 2451 (ID: 742, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_package)
NOTE: package usbutils-0.91-r3: task do_package: Started
NOTE: package usbutils-0.91-r3: task do_populate_sysroot: Started
NOTE: package usbutils-0.91-r3: task do_populate_sysroot: Succeeded
NOTE: package gmp-5.0.2-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1977 of 2451 (ID: 2083, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/gmp/gmp_5.0.2.bb, do_package_write)
NOTE: package usbutils-0.91-r3: task do_package: Succeeded
NOTE: package db-5.1.19-r3: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1978 of 2451 (ID: 2050, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/db/db_5.1.19.bb, do_package_write)
NOTE: package ncurses-5.9-r2.1: task do_install: Succeeded
NOTE: Running task 1979 of 2451 (ID: 1089, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_populate_sysroot)
NOTE: Running task 1980 of 2451 (ID: 1094, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package)
NOTE: package ncurses-5.9-r2.1: task do_populate_sysroot: Started
NOTE: package ncurses-5.9-r2.1: task do_package: Started
NOTE: package libxml2-2.7.8-r4: task do_compile: Succeeded
NOTE: Running task 1981 of 2451 (ID: 2353, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_install)
NOTE: package libxml2-2.7.8-r4: task do_install: Started
NOTE: package libxml2-2.7.8-r4: task do_install: Succeeded
NOTE: Running task 1982 of 2451 (ID: 2354, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_populate_sysroot)
NOTE: Running task 1983 of 2451 (ID: 2359, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_package)
NOTE: package ntp-4.2.6p3-r3: task do_configure: Succeeded
NOTE: Running task 1984 of 2451 (ID: 982, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_compile)
NOTE: package libxml2-2.7.8-r4: task do_populate_sysroot: Started
NOTE: package libxml2-2.7.8-r4: task do_package: Started
NOTE: package ntp-4.2.6p3-r3: task do_compile: Started
NOTE: package libxml2-2.7.8-r4: task do_populate_sysroot: Succeeded
NOTE: package angstrom-feed-configs-1.0-r15: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1985 of 2451 (ID: 306, /media/SSD/OE_core/setup-scripts/sources/meta-angstrom/recipes-angstrom/angstrom/angstrom-feed-configs.bb, do_package_write)
NOTE: package ncurses-5.9-r2.1: task do_populate_sysroot: Succeeded
NOTE: Running task 1986 of 2451 (ID: 904, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_configure)
NOTE: Running task 1987 of 2451 (ID: 783, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_configure)
NOTE: Running task 1988 of 2451 (ID: 1332, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_configure)
NOTE: Running task 1989 of 2451 (ID: 461, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_configure)
NOTE: package gettext-0.18.1.1-r5: task do_configure: Started
NOTE: package readline-6.2-r0: task do_configure: Started
NOTE: package htop-0.9-r1: task do_configure: Started
NOTE: package procps-3.2.8-r3: task do_configure: Started
NOTE: package procps-3.2.8-r3: task do_configure: Succeeded
NOTE: Running task 1990 of 2451 (ID: 462, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_compile)
NOTE: package procps-3.2.8-r3: task do_compile: Started
NOTE: package procps-3.2.8-r3: task do_compile: Succeeded
NOTE: Running task 1991 of 2451 (ID: 459, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_install)
NOTE: package procps-3.2.8-r3: task do_install: Started
WARNING: For recipe ncurses, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/terminfo
NOTE: package libxml2-2.7.8-r4: task do_package: Succeeded
NOTE: Running task 1992 of 2451 (ID: 2361, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_package_write_ipk)
NOTE: package libxml2-2.7.8-r4: task do_package_write_ipk: Started
NOTE: package procps-3.2.8-r3: task do_install: Succeeded
NOTE: package iptables-1.4.12.1-r0: task do_package: Succeeded
NOTE: package openssl-1.0.0e-r14.4: task do_compile: Succeeded
NOTE: Running task 1993 of 2451 (ID: 1198, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_install)
NOTE: package openssl-1.0.0e-r14.4: task do_install: Started
NOTE: package libxml2-2.7.8-r4: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1994 of 2451 (ID: 2358, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb, do_package_write)
NOTE: package readline-6.2-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2451 (ID: 784, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_compile)
NOTE: package readline-6.2-r0: task do_compile: Started
NOTE: package readline-6.2-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2451 (ID: 780, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_install)
NOTE: package readline-6.2-r0: task do_install: Started
NOTE: package readline-6.2-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2451 (ID: 781, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_populate_sysroot)
NOTE: package readline-6.2-r0: task do_populate_sysroot: Started
NOTE: package readline-6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1998 of 2451 (ID: 2070, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_configure)
NOTE: package sqlite3-3.7.7.1-r1: task do_configure: Started
NOTE: package htop-0.9-r1: task do_configure: Succeeded
NOTE: Running task 1999 of 2451 (ID: 1333, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_compile)
NOTE: package htop-0.9-r1: task do_compile: Started
NOTE: package htop-0.9-r1: task do_compile: Succeeded
NOTE: Running task 2000 of 2451 (ID: 1330, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_install)
NOTE: package htop-0.9-r1: task do_install: Started
NOTE: package htop-0.9-r1: task do_install: Succeeded
NOTE: package sqlite3-3.7.7.1-r1: task do_configure: Succeeded
NOTE: Running task 2001 of 2451 (ID: 2071, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_compile)
NOTE: package sqlite3-3.7.7.1-r1: task do_compile: Started
NOTE: package ntp-4.2.6p3-r3: task do_compile: Succeeded
NOTE: Running task 2002 of 2451 (ID: 978, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_install)
NOTE: package ntp-4.2.6p3-r3: task do_install: Started
NOTE: package openssl-1.0.0e-r14.4: task do_install: Succeeded
NOTE: Running task 2003 of 2451 (ID: 1199, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_populate_sysroot)
NOTE: Running task 2004 of 2451 (ID: 1204, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_package)
NOTE: package openssl-1.0.0e-r14.4: task do_package: Started
NOTE: package openssl-1.0.0e-r14.4: task do_populate_sysroot: Started
NOTE: package openssl-1.0.0e-r14.4: task do_populate_sysroot: Succeeded
NOTE: Running task 2005 of 2451 (ID: 1806, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_configure)
NOTE: package bind-9.8.1-r1: task do_configure: Started
WARNING: For recipe openssl, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/engines
WARNING:   /usr/lib/ssl/private
WARNING:   /usr/lib/ssl/certs
NOTE: package ntp-4.2.6p3-r3: task do_install: Succeeded
NOTE: Running task 2006 of 2451 (ID: 984, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_package)
NOTE: Running task 2007 of 2451 (ID: 979, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_populate_sysroot)
NOTE: package ntp-4.2.6p3-r3: task do_package: Started
NOTE: package ntp-4.2.6p3-r3: task do_populate_sysroot: Started
NOTE: package ntp-4.2.6p3-r3: task do_populate_sysroot: Succeeded
WARNING: For recipe ntp, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/sbin
NOTE: package bind-9.8.1-r1: task do_configure: Succeeded
NOTE: Running task 2008 of 2451 (ID: 1807, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_compile)
NOTE: package bind-9.8.1-r1: task do_compile: Started
NOTE: package ntp-4.2.6p3-r3: task do_package: Succeeded
NOTE: Running task 2009 of 2451 (ID: 986, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_package_write_ipk)
NOTE: package ntp-4.2.6p3-r3: task do_package_write_ipk: Started
NOTE: package sqlite3-3.7.7.1-r1: task do_compile: Succeeded
NOTE: Running task 2010 of 2451 (ID: 2067, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_install)
NOTE: package sqlite3-3.7.7.1-r1: task do_install: Started
NOTE: package openssl-1.0.0e-r14.4: task do_package: Succeeded
NOTE: package sqlite3-3.7.7.1-r1: task do_install: Succeeded
NOTE: Running task 2011 of 2451 (ID: 1206, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_package_write_ipk)
NOTE: Running task 2012 of 2451 (ID: 2068, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_populate_sysroot)
NOTE: package sqlite3-3.7.7.1-r1: task do_populate_sysroot: Started
NOTE: package openssl-1.0.0e-r14.4: task do_package_write_ipk: Started
NOTE: package ntp-4.2.6p3-r3: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2013 of 2451 (ID: 983, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb, do_package_write)
NOTE: package sqlite3-3.7.7.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2014 of 2451 (ID: 1402, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_configure)
NOTE: package python-2.7.2-r0.2: task do_configure: Started
NOTE: package openssl-1.0.0e-r14.4: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2015 of 2451 (ID: 1203, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_package_write)
NOTE: package python-2.7.2-r0.2: task do_configure: Succeeded
NOTE: Running task 2016 of 2451 (ID: 1403, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_compile)
NOTE: package python-2.7.2-r0.2: task do_compile: Started
NOTE: package ncurses-5.9-r2.1: task do_package: Succeeded
NOTE: Running task 2017 of 2451 (ID: 786, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package)
NOTE: Running task 2018 of 2451 (ID: 1335, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_package)
NOTE: Running task 2019 of 2451 (ID: 464, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_package)
NOTE: Running task 2020 of 2451 (ID: 1096, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write_ipk)
NOTE: package readline-6.2-r0: task do_package: Started
NOTE: package htop-0.9-r1: task do_package: Started
NOTE: package procps-3.2.8-r3: task do_package: Started
NOTE: package ncurses-5.9-r2.1: task do_package_write_ipk: Started
WARNING: For recipe readline, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/bin
NOTE: package gettext-0.18.1.1-r5: task do_configure: Succeeded
NOTE: package htop-0.9-r1: task do_package: Succeeded
NOTE: Running task 2021 of 2451 (ID: 905, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_compile)
NOTE: Running task 2022 of 2451 (ID: 1337, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_package_write_ipk)
NOTE: package htop-0.9-r1: task do_package_write_ipk: Started
NOTE: package gettext-0.18.1.1-r5: task do_compile: Started
WARNING: QA Issue: readline: /work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libreadline.so.6 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6.2 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/armv5te-angstrom-linux-gnueabi/readline-6.2-r0/packages-split/readline/usr/lib/libreadline.so.6.2 contains probably-redundant RPATH /usr/lib
NOTE: package htop-0.9-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2023 of 2451 (ID: 1334, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_0.9.bb, do_package_write)
NOTE: package readline-6.2-r0: task do_package: Succeeded
NOTE: Running task 2024 of 2451 (ID: 2073, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_package)
NOTE: Running task 2025 of 2451 (ID: 788, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write_ipk)
NOTE: package sqlite3-3.7.7.1-r1: task do_package: Started
NOTE: package readline-6.2-r0: task do_package_write_ipk: Started
NOTE: package ncurses-5.9-r2.1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2026 of 2451 (ID: 1093, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write)
NOTE: package readline-6.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2027 of 2451 (ID: 785, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write)
NOTE: package procps-3.2.8-r3: task do_package: Succeeded
NOTE: Running task 2028 of 2451 (ID: 466, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_package_write_ipk)
NOTE: package procps-3.2.8-r3: task do_package_write_ipk: Started
NOTE: package sqlite3-3.7.7.1-r1: task do_package: Succeeded
NOTE: Running task 2029 of 2451 (ID: 2075, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_package_write_ipk)
NOTE: package sqlite3-3.7.7.1-r1: task do_package_write_ipk: Started
NOTE: package procps-3.2.8-r3: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2030 of 2451 (ID: 463, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/procps/procps_3.2.8.bb, do_package_write)
NOTE: package sqlite3-3.7.7.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2031 of 2451 (ID: 2072, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb, do_package_write)
NOTE: package eglibc-locale-2.12-r18: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2032 of 2451 (ID: 213, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb, do_package_write)
NOTE: package gettext-0.18.1.1-r5: task do_compile: Succeeded
NOTE: Running task 2033 of 2451 (ID: 901, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_install)
NOTE: package gettext-0.18.1.1-r5: task do_install: Started
NOTE: package python-2.7.2-r0.2: task do_compile: Succeeded
NOTE: Running task 2034 of 2451 (ID: 1400, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_install)
NOTE: package python-2.7.2-r0.2: task do_install: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_compile_kernelmodules: Succeeded
NOTE: package gettext-0.18.1.1-r5: task do_install: Succeeded
NOTE: Running task 2035 of 2451 (ID: 902, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_populate_sysroot)
NOTE: Running task 2036 of 2451 (ID: 907, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_package)
NOTE: package python-2.7.2-r0.2: task do_install: Succeeded
NOTE: Running task 2037 of 2451 (ID: 1405, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/python/python_2.7.2.bb, do_package)
NOTE: package gettext-0.18.1.1-r5: task do_package: Started
NOTE: package gettext-0.18.1.1-r5: task do_populate_sysroot: Started
NOTE: package python-2.7.2-r0.2: task do_package: Started
NOTE: package gettext-0.18.1.1-r5: task do_populate_sysroot: Succeeded
NOTE: Running task 2038 of 2451 (ID: 2191, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_configure)
NOTE: Running task 2039 of 2451 (ID: 2213, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_configure)
NOTE: Running task 2040 of 2451 (ID: 2202, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_configure)
NOTE: Running task 2041 of 2451 (ID: 1795, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_configure)
NOTE: Running task 2042 of 2451 (ID: 1784, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_configure)
NOTE: Running task 2043 of 2451 (ID: 1773, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_configure)
NOTE: Running task 2044 of 2451 (ID: 316, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_configure)
NOTE: Running task 2045 of 2451 (ID: 2290, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_configure)
NOTE: Running task 2046 of 2451 (ID: 2246, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_configure)
NOTE: Running task 2047 of 2451 (ID: 1696, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_configure)
NOTE: Running task 2048 of 2451 (ID: 2334, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_configure)
NOTE: Running task 2049 of 2451 (ID: 1157, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_configure)
NOTE: Running task 2050 of 2451 (ID: 2367, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_configure)
NOTE: Running task 2051 of 2451 (ID: 1423, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_configure)
NOTE: Running task 2052 of 2451 (ID: 388, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_configure)
NOTE: Running task 2053 of 2451 (ID: 1433, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_configure)
NOTE: Running task 2054 of 2451 (ID: 1221, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_configure)
NOTE: package xtrans-1_1.2.6-r0: task do_configure: Started
NOTE: package libxau-1_1.0.6-r0: task do_configure: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_configure: Started
NOTE: package bash-4.2-r1: task do_configure: Started
NOTE: package cracklib-2.8.18-r1: task do_configure: Started
NOTE: package flex-2.5.35-r2: task do_configure: Started
NOTE: package util-linux-2.19.1-r11: task do_configure: Started
NOTE: package xextproto-1_7.2.0-r0: task do_configure: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_configure: Started
NOTE: package bison-2.5-r1: task do_configure: Started
NOTE: package inputproto-1_2.0.2-r0: task do_configure: Started
NOTE: package elfutils-0.148-r3: task do_configure: Started
NOTE: package attr-2.4.46-r2: task do_configure: Started
NOTE: package libgpg-error-1.10-r1: task do_configure: Started
NOTE: package popt-1.16-r0: task do_configure: Started
NOTE: package coreutils-8.14-r1: task do_configure: Started
NOTE: package kbd-1.15.2-r2: task do_configure: Started
NOTE: package xextproto-1_7.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2055 of 2451 (ID: 2247, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_compile)
NOTE: package xextproto-1_7.2.0-r0: task do_compile: Started
NOTE: package inputproto-1_2.0.2-r0: task do_configure: Succeeded
NOTE: package xextproto-1_7.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2056 of 2451 (ID: 2243, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_install)
NOTE: Running task 2057 of 2451 (ID: 2291, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_compile)
NOTE: package xtrans-1_1.2.6-r0: task do_configure: Succeeded
NOTE: Running task 2058 of 2451 (ID: 2192, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_compile)
NOTE: package xextproto-1_7.2.0-r0: task do_install: Started
NOTE: package inputproto-1_2.0.2-r0: task do_compile: Started
NOTE: package inputproto-1_2.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2059 of 2451 (ID: 2287, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_install)
NOTE: package xtrans-1_1.2.6-r0: task do_compile: Started
NOTE: package xextproto-1_7.2.0-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2451 (ID: 2244, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_populate_sysroot)
NOTE: package xtrans-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Running task 2061 of 2451 (ID: 2188, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_install)
NOTE: package inputproto-1_2.0.2-r0: task do_install: Started
NOTE: package xextproto-1_7.2.0-r0: task do_populate_sysroot: Started
NOTE: package inputproto-1_2.0.2-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2451 (ID: 2288, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_populate_sysroot)
NOTE: package xtrans-1_1.2.6-r0: task do_install: Started
NOTE: package inputproto-1_2.0.2-r0: task do_populate_sysroot: Started
NOTE: package xextproto-1_7.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: package xtrans-1_1.2.6-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2451 (ID: 2189, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_populate_sysroot)
NOTE: package inputproto-1_2.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: package xtrans-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: package xtrans-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2064 of 2451 (ID: 2323, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_configure)
NOTE: package libice-1_1.0.7-r0: task do_configure: Started
NOTE: package elfutils-0.148-r3: task do_configure: Succeeded
NOTE: Running task 2065 of 2451 (ID: 1158, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_compile)
NOTE: package elfutils-0.148-r3: task do_compile: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_configure: Succeeded
NOTE: Running task 2066 of 2451 (ID: 389, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_compile)
NOTE: package alsa-utils-1.0.24.2-r3: task do_compile: Started
NOTE: package attr-2.4.46-r2: task do_configure: Succeeded
NOTE: Running task 2067 of 2451 (ID: 1697, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_compile)
NOTE: package attr-2.4.46-r2: task do_compile: Started
NOTE: package kbd-1.15.2-r2: task do_configure: Succeeded
NOTE: Running task 2068 of 2451 (ID: 1222, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_compile)
NOTE: package bind-9.8.1-r1: task do_compile: Succeeded
NOTE: Running task 2069 of 2451 (ID: 1803, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_install)
NOTE: package kbd-1.15.2-r2: task do_compile: Started
NOTE: package bind-9.8.1-r1: task do_install: Started
NOTE: package libxau-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2070 of 2451 (ID: 2214, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_compile)
NOTE: package libxau-1_1.0.6-r0: task do_compile: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2071 of 2451 (ID: 2203, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_compile)
NOTE: package libxdmcp-1_1.1.0-r0: task do_compile: Started
NOTE: package attr-2.4.46-r2: task do_compile: Succeeded
NOTE: package kbd-1.15.2-r2: task do_compile: Succeeded
NOTE: Running task 2072 of 2451 (ID: 1693, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_install)
NOTE: Running task 2073 of 2451 (ID: 1219, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_install)
NOTE: package attr-2.4.46-r2: task do_install: Started
NOTE: package kbd-1.15.2-r2: task do_install: Started
NOTE: package libxau-1_1.0.6-r0: task do_compile: Succeeded
NOTE: package libxdmcp-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2451 (ID: 2210, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_install)
NOTE: Running task 2075 of 2451 (ID: 2199, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_install)
NOTE: package libxdmcp-1_1.1.0-r0: task do_install: Started
NOTE: package libxau-1_1.0.6-r0: task do_install: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_install: Succeeded
NOTE: package libxau-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2076 of 2451 (ID: 2211, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_populate_sysroot)
NOTE: Running task 2077 of 2451 (ID: 2200, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_populate_sysroot)
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: package libxau-1_1.0.6-r0: task do_populate_sysroot: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: package libxau-1_1.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: package attr-2.4.46-r2: task do_install: Succeeded
NOTE: Running task 2078 of 2451 (ID: 1694, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_populate_sysroot)
NOTE: Running task 2079 of 2451 (ID: 2301, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_configure)
NOTE: package attr-2.4.46-r2: task do_populate_sysroot: Started
NOTE: package flex-2.5.35-r2: task do_configure: Succeeded
NOTE: Running task 2080 of 2451 (ID: 1785, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_compile)
NOTE: package libxcb-1.7-r2: task do_configure: Started
NOTE: package flex-2.5.35-r2: task do_compile: Started
NOTE: package attr-2.4.46-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 2081 of 2451 (ID: 750, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_configure)
NOTE: package acl-2.2.51-r2: task do_configure: Started
NOTE: package kbd-1.15.2-r2: task do_install: Succeeded
NOTE: package cracklib-2.8.18-r1: task do_configure: Succeeded
NOTE: Running task 2082 of 2451 (ID: 1796, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_compile)
NOTE: package libgpg-error-1.10-r1: task do_configure: Succeeded
NOTE: Running task 2083 of 2451 (ID: 2335, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_compile)
NOTE: package cracklib-2.8.18-r1: task do_compile: Started
NOTE: package libgpg-error-1.10-r1: task do_compile: Started
NOTE: package popt-1.16-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2451 (ID: 2368, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_compile)
NOTE: package popt-1.16-r0: task do_compile: Started
NOTE: package flex-2.5.35-r2: task do_compile: Succeeded
NOTE: Running task 2085 of 2451 (ID: 1781, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_install)
NOTE: package cracklib-2.8.18-r1: task do_compile: Succeeded
NOTE: Running task 2086 of 2451 (ID: 1792, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_install)
NOTE: package libgpg-error-1.10-r1: task do_compile: Succeeded
NOTE: Running task 2087 of 2451 (ID: 2331, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_install)
NOTE: package flex-2.5.35-r2: task do_install: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_compile: Succeeded
NOTE: package libgpg-error-1.10-r1: task do_install: Started
NOTE: package cracklib-2.8.18-r1: task do_install: Started
NOTE: Running task 2088 of 2451 (ID: 386, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_install)
NOTE: package alsa-utils-1.0.24.2-r3: task do_install: Started
NOTE: package popt-1.16-r0: task do_compile: Succeeded
NOTE: Running task 2089 of 2451 (ID: 2364, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_install)
NOTE: package libgpg-error-1.10-r1: task do_install: Succeeded
NOTE: Running task 2090 of 2451 (ID: 2332, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_populate_sysroot)
NOTE: package popt-1.16-r0: task do_install: Started
NOTE: package libgpg-error-1.10-r1: task do_populate_sysroot: Started
NOTE: package libgpg-error-1.10-r1: task do_populate_sysroot: Succeeded
NOTE: package flex-2.5.35-r2: task do_install: Succeeded
NOTE: Running task 2091 of 2451 (ID: 1782, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_populate_sysroot)
NOTE: package alsa-utils-1.0.24.2-r3: task do_install: Succeeded
NOTE: package cracklib-2.8.18-r1: task do_install: Succeeded
NOTE: package flex-2.5.35-r2: task do_populate_sysroot: Started
NOTE: Running task 2092 of 2451 (ID: 1793, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_populate_sysroot)
NOTE: package popt-1.16-r0: task do_install: Succeeded
NOTE: Running task 2093 of 2451 (ID: 2365, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_populate_sysroot)
NOTE: package flex-2.5.35-r2: task do_populate_sysroot: Succeeded
NOTE: package cracklib-2.8.18-r1: task do_populate_sysroot: Started
NOTE: package popt-1.16-r0: task do_populate_sysroot: Started
NOTE: package cracklib-2.8.18-r1: task do_populate_sysroot: Succeeded
NOTE: package popt-1.16-r0: task do_populate_sysroot: Succeeded
NOTE: package elfutils-0.148-r3: task do_compile: Succeeded
NOTE: Running task 2094 of 2451 (ID: 1154, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_install)
NOTE: package libice-1_1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2451 (ID: 2324, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_compile)
NOTE: package elfutils-0.148-r3: task do_install: Started
NOTE: package libice-1_1.0.7-r0: task do_compile: Started
NOTE: package elfutils-0.148-r3: task do_install: Succeeded
NOTE: Running task 2096 of 2451 (ID: 1155, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_populate_sysroot)
NOTE: package elfutils-0.148-r3: task do_populate_sysroot: Started
NOTE: package libice-1_1.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2097 of 2451 (ID: 2320, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_install)
NOTE: package elfutils-0.148-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 2098 of 2451 (ID: 426, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_compile_perf)
NOTE: package libice-1_1.0.7-r0: task do_install: Started
NOTE: package libice-1_1.0.7-r0: task do_install: Succeeded
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_compile_perf: Started
NOTE: Running task 2099 of 2451 (ID: 2321, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_populate_sysroot)
NOTE: package bash-4.2-r1: task do_configure: Succeeded
NOTE: Running task 2100 of 2451 (ID: 1424, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_compile)
NOTE: package libice-1_1.0.7-r0: task do_populate_sysroot: Started
NOTE: package bash-4.2-r1: task do_compile: Started
NOTE: package libice-1_1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: package bind-9.8.1-r1: task do_install: Succeeded
NOTE: Running task 2101 of 2451 (ID: 1809, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_package)
NOTE: Running task 2102 of 2451 (ID: 1804, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_populate_sysroot)
NOTE: package acl-2.2.51-r2: task do_configure: Succeeded
NOTE: package bind-9.8.1-r1: task do_package: Started
NOTE: package bind-9.8.1-r1: task do_populate_sysroot: Started
NOTE: Running task 2103 of 2451 (ID: 751, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_compile)
NOTE: package acl-2.2.51-r2: task do_compile: Started
NOTE: package util-linux-2.19.1-r11: task do_configure: Succeeded
NOTE: Running task 2104 of 2451 (ID: 317, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_compile)
NOTE: package bind-9.8.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2105 of 2451 (ID: 937, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_configure)
NOTE: package util-linux-2.19.1-r11: task do_compile: Started
NOTE: package dhcp-4.2.0-r4: task do_configure: Started
NOTE: package acl-2.2.51-r2: task do_compile: Succeeded
NOTE: Running task 2106 of 2451 (ID: 747, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_install)
NOTE: package acl-2.2.51-r2: task do_install: Started
NOTE: package libxcb-1.7-r2: task do_configure: Succeeded
NOTE: Running task 2107 of 2451 (ID: 2302, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_compile)
NOTE: package libxcb-1.7-r2: task do_compile: Started
NOTE: package acl-2.2.51-r2: task do_install: Succeeded
NOTE: Running task 2108 of 2451 (ID: 748, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_populate_sysroot)
NOTE: package acl-2.2.51-r2: task do_populate_sysroot: Started
NOTE: package acl-2.2.51-r2: task do_populate_sysroot: Succeeded
NOTE: package gettext-0.18.1.1-r5: task do_package: Succeeded
NOTE: Running task 2109 of 2451 (ID: 2194, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_package)
NOTE: Running task 2110 of 2451 (ID: 2216, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_package)
NOTE: Running task 2111 of 2451 (ID: 2205, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_package)
NOTE: Running task 2112 of 2451 (ID: 1798, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_package)
NOTE: Running task 2113 of 2451 (ID: 1787, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_package)
NOTE: Running task 2114 of 2451 (ID: 2293, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_package)
NOTE: Running task 2115 of 2451 (ID: 2249, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_package)
NOTE: Running task 2116 of 2451 (ID: 1699, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package)
NOTE: Running task 2117 of 2451 (ID: 2337, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package)
NOTE: Running task 2118 of 2451 (ID: 2370, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_package)
NOTE: Running task 2119 of 2451 (ID: 391, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_package)
NOTE: Running task 2120 of 2451 (ID: 1224, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_package)
NOTE: Running task 2121 of 2451 (ID: 1160, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_package)
NOTE: Running task 2122 of 2451 (ID: 909, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_package_write_ipk)
NOTE: package xtrans-1_1.2.6-r0: task do_package: Started
NOTE: package libxau-1_1.0.6-r0: task do_package: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_package: Started
NOTE: package cracklib-2.8.18-r1: task do_package: Started
NOTE: package libgpg-error-1.10-r1: task do_package: Started
NOTE: package xextproto-1_7.2.0-r0: task do_package: Started
NOTE: package popt-1.16-r0: task do_package: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_package: Started
NOTE: package elfutils-0.148-r3: task do_package: Started
NOTE: package flex-2.5.35-r2: task do_package: Started
NOTE: package inputproto-1_2.0.2-r0: task do_package: Started
NOTE: package kbd-1.15.2-r2: task do_package: Started
NOTE: package gettext-0.18.1.1-r5: task do_package_write_ipk: Started
NOTE: package attr-2.4.46-r2: task do_package: Started
NOTE: package inputproto-1_2.0.2-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2451 (ID: 2295, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_package_write_ipk)
NOTE: package xtrans-1_1.2.6-r0: task do_package: Succeeded
NOTE: Running task 2124 of 2451 (ID: 2326, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_package)
NOTE: package libice-1_1.0.7-r0: task do_package: Started
WARNING: For recipe cracklib, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/python2.7
WARNING:   /usr/lib/python2.7/site-packages
NOTE: package inputproto-1_2.0.2-r0: task do_package_write_ipk: Started
NOTE: package flex-2.5.35-r2: task do_package: Succeeded
NOTE: Running task 2125 of 2451 (ID: 2196, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_package_write_ipk)
NOTE: package libxau-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2126 of 2451 (ID: 2218, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_package_write_ipk)
NOTE: package libxdmcp-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2451 (ID: 2207, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_package_write_ipk)
NOTE: package xtrans-1_1.2.6-r0: task do_package_write_ipk: Started
NOTE: package xextproto-1_7.2.0-r0: task do_package: Succeeded
NOTE: Running task 2128 of 2451 (ID: 2251, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_package_write_ipk)
NOTE: package libxau-1_1.0.6-r0: task do_package_write_ipk: Started
NOTE: package libxdmcp-1_1.1.0-r0: task do_package_write_ipk: Started
NOTE: package inputproto-1_2.0.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2129 of 2451 (ID: 1789, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_package_write_ipk)
NOTE: package xextproto-1_7.2.0-r0: task do_package_write_ipk: Started
WARNING: For recipe alsa-utils, the following files/directories were installed but not shipped in any package:
WARNING:   /var
WARNING:   /var/lib
WARNING:   /var/lib/alsa
NOTE: package flex-2.5.35-r2: task do_package_write_ipk: Started
NOTE: package popt-1.16-r0: task do_package: Succeeded
NOTE: Running task 2130 of 2451 (ID: 2372, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_package_write_ipk)
NOTE: package popt-1.16-r0: task do_package_write_ipk: Started
NOTE: package libgpg-error-1.10-r1: task do_package: Succeeded
NOTE: Running task 2131 of 2451 (ID: 2339, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_write_ipk)
NOTE: package xtrans-1_1.2.6-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2132 of 2451 (ID: 2292, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb, do_package_write)
NOTE: Running noexec task 2133 of 2451 (ID: 2193, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb, do_package_write)
NOTE: package libgpg-error-1.10-r1: task do_package_write_ipk: Started
NOTE: package libice-1_1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2134 of 2451 (ID: 2328, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_package_write_ipk)
NOTE: package xextproto-1_7.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2135 of 2451 (ID: 2248, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-proto/xextproto_7.2.0.bb, do_package_write)
NOTE: package attr-2.4.46-r2: task do_package: Succeeded
NOTE: Running task 2136 of 2451 (ID: 753, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_package)
NOTE: Running task 2137 of 2451 (ID: 1701, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write_ipk)
NOTE: package libice-1_1.0.7-r0: task do_package_write_ipk: Started
NOTE: package acl-2.2.51-r2: task do_package: Started
NOTE: package attr-2.4.46-r2: task do_package_write_ipk: Started
NOTE: package dhcp-4.2.0-r4: task do_configure: Succeeded
NOTE: Running task 2138 of 2451 (ID: 938, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_compile)
NOTE: package libxdmcp-1_1.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: package libxau-1_1.0.6-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2139 of 2451 (ID: 2204, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb, do_package_write)
NOTE: Running noexec task 2140 of 2451 (ID: 2215, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb, do_package_write)
NOTE: package dhcp-4.2.0-r4: task do_compile: Started
NOTE: package cracklib-2.8.18-r1: task do_package: Succeeded
NOTE: Running task 2141 of 2451 (ID: 1800, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_package_write_ipk)
NOTE: package cracklib-2.8.18-r1: task do_package_write_ipk: Started
NOTE: package libice-1_1.0.7-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2142 of 2451 (ID: 2325, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb, do_package_write)
NOTE: package acl-2.2.51-r2: task do_package: Succeeded
NOTE: Running task 2143 of 2451 (ID: 755, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_package_write_ipk)
NOTE: package libgpg-error-1.10-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2144 of 2451 (ID: 2336, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_write)
NOTE: package acl-2.2.51-r2: task do_package_write_ipk: Started
NOTE: package alsa-utils-1.0.24.2-r3: task do_package: Succeeded
NOTE: Running task 2145 of 2451 (ID: 393, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_package_write_ipk)
NOTE: package alsa-utils-1.0.24.2-r3: task do_package_write_ipk: Started
NOTE: package perl-5.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2451 (ID: 1380, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_install)
NOTE: package attr-2.4.46-r2: task do_package_write_ipk: Succeeded
NOTE: package perl-5.14.2-r0: task do_install: Started
NOTE: Running noexec task 2147 of 2451 (ID: 1698, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write)
NOTE: package util-linux-2.19.1-r11: task do_compile: Succeeded
NOTE: Running task 2148 of 2451 (ID: 312, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_install)
NOTE: package util-linux-2.19.1-r11: task do_install: Started
NOTE: package flex-2.5.35-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2149 of 2451 (ID: 1786, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/flex/flex_2.5.35.bb, do_package_write)
NOTE: package bison-2.5-r1: task do_configure: Succeeded
NOTE: Running task 2150 of 2451 (ID: 1774, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_compile)
NOTE: package bison-2.5-r1: task do_compile: Started
NOTE: package acl-2.2.51-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2151 of 2451 (ID: 752, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/attr/acl_2.2.51.bb, do_package_write)
NOTE: package dhcp-4.2.0-r4: task do_compile: Succeeded
NOTE: Running task 2152 of 2451 (ID: 934, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_install)
NOTE: package dhcp-4.2.0-r4: task do_install: Started
NOTE: package dhcp-4.2.0-r4: task do_install: Succeeded
NOTE: Running task 2153 of 2451 (ID: 935, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_populate_sysroot)
NOTE: package bison-2.5-r1: task do_compile: Succeeded
NOTE: Running task 2154 of 2451 (ID: 1770, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_install)
NOTE: package dhcp-4.2.0-r4: task do_populate_sysroot: Started
NOTE: package bison-2.5-r1: task do_install: Started
NOTE: package dhcp-4.2.0-r4: task do_populate_sysroot: Succeeded
NOTE: package alsa-utils-1.0.24.2-r3: task do_package_write_ipk: Succeeded
NOTE: package popt-1.16-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2155 of 2451 (ID: 2369, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/popt/popt_1.16.bb, do_package_write)
NOTE: Running noexec task 2156 of 2451 (ID: 390, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb, do_package_write)
NOTE: package util-linux-2.19.1-r11: task do_install: Succeeded
NOTE: Running task 2157 of 2451 (ID: 313, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_populate_sysroot)
NOTE: Running task 2158 of 2451 (ID: 319, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_package)
NOTE: package util-linux-2.19.1-r11: task do_populate_sysroot: Started
NOTE: package util-linux-2.19.1-r11: task do_package: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_compile_perf: Succeeded
NOTE: Running task 2159 of 2451 (ID: 419, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.0.bb, do_install)
NOTE: package bison-2.5-r1: task do_install: Succeeded
NOTE: Running task 2160 of 2451 (ID: 1771, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_populate_sysroot)
NOTE: Running task 2161 of 2451 (ID: 1776, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_package)
NOTE: package cracklib-2.8.18-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2162 of 2451 (ID: 1797, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.8.18.bb, do_package_write)
NOTE: package bison-2.5-r1: task do_populate_sysroot: Started
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_install: Started
NOTE: package bison-2.5-r1: task do_package: Started
NOTE: package gettext-0.18.1.1-r5: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2163 of 2451 (ID: 906, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/gettext/gettext_0.18.1.1.bb, do_package_write)
NOTE: package util-linux-2.19.1-r11: task do_populate_sysroot: Succeeded
NOTE: Running task 2164 of 2451 (ID: 1242, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_configure)
NOTE: package bison-2.5-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2165 of 2451 (ID: 838, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_configure)
NOTE: package libpam-1.1.4-r2: task do_configure: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_configure: Started
NOTE: package libxcb-1.7-r2: task do_compile: Succeeded
NOTE: Running task 2166 of 2451 (ID: 2298, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_install)
NOTE: package libxcb-1.7-r2: task do_install: Started
NOTE: package bison-2.5-r1: task do_package: Succeeded
NOTE: Running task 2167 of 2451 (ID: 1778, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_package_write_ipk)
NOTE: package bison-2.5-r1: task do_package_write_ipk: Started
NOTE: package libxcb-1.7-r2: task do_install: Succeeded
NOTE: package elfutils-0.148-r3: task do_package: Succeeded
NOTE: Running task 2168 of 2451 (ID: 2299, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_populate_sysroot)
NOTE: Running task 2169 of 2451 (ID: 2304, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_package)
NOTE: Running task 2170 of 2451 (ID: 1162, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_package_write_ipk)
NOTE: package libxcb-1.7-r2: task do_populate_sysroot: Started
NOTE: package libxcb-1.7-r2: task do_package: Started
NOTE: package elfutils-0.148-r3: task do_package_write_ipk: Started
NOTE: package perl-5.14.2-r0: task do_install: Succeeded
NOTE: Running task 2171 of 2451 (ID: 1385, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb, do_package)
NOTE: package perl-5.14.2-r0: task do_package: Started
NOTE: package libxcb-1.7-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 2172 of 2451 (ID: 1751, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_configure)
NOTE: package libx11-1.4.4-r0: task do_configure: Started
NOTE: package elfutils-0.148-r3: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2173 of 2451 (ID: 1159, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_package_write)
NOTE: package bison-2.5-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2174 of 2451 (ID: 1775, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/bison/bison_2.5.bb, do_package_write)
NOTE: package bind-9.8.1-r1: task do_package: Succeeded
NOTE: Running task 2175 of 2451 (ID: 940, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_package)
NOTE: Running task 2176 of 2451 (ID: 1811, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_package_write_ipk)
NOTE: package dhcp-4.2.0-r4: task do_package: Started
NOTE: package bind-9.8.1-r1: task do_package_write_ipk: Started
NOTE: package kbd-1.15.2-r2: task do_package: Succeeded
NOTE: package bash-4.2-r1: task do_compile: Succeeded
NOTE: Running task 2177 of 2451 (ID: 1421, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_install)
NOTE: Running task 2178 of 2451 (ID: 1226, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_package_write_ipk)
NOTE: package bash-4.2-r1: task do_install: Started
NOTE: package kbd-1.15.2-r2: task do_package_write_ipk: Started
NOTE: package bash-4.2-r1: task do_install: Succeeded
NOTE: Running task 2179 of 2451 (ID: 1426, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package)
NOTE: package bash-4.2-r1: task do_package: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_configure: Succeeded
NOTE: Running task 2180 of 2451 (ID: 1243, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_compile)
NOTE: package e2fsprogs-1.41.14-r3: task do_compile: Started
NOTE: package kbd-1.15.2-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2181 of 2451 (ID: 1223, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/kbd/kbd_1.15.2.bb, do_package_write)
NOTE: package bash-4.2-r1: task do_package: Succeeded
NOTE: Running task 2182 of 2451 (ID: 1428, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_write_ipk)
NOTE: Running task 2183 of 2451 (ID: 953, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_package_write_ipk)
NOTE: Running task 2184 of 2451 (ID: 744, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_package_write_ipk)
NOTE: Running task 2185 of 2451 (ID: 711, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_package_write_ipk)
NOTE: package bash-4.2-r1: task do_package_write_ipk: Started
NOTE: package resolvconf-1.61-r0: task do_package_write_ipk: Started
NOTE: package usbutils-0.91-r3: task do_package_write_ipk: Started
NOTE: package eglibc-2.12-r27: task do_package_write_ipk: Started
NOTE: package dhcp-4.2.0-r4: task do_package: Succeeded
NOTE: Running task 2186 of 2451 (ID: 942, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_package_write_ipk)
NOTE: package bind-9.8.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2187 of 2451 (ID: 1808, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/bind/bind_9.8.1.bb, do_package_write)
NOTE: package dhcp-4.2.0-r4: task do_package_write_ipk: Started
NOTE: package resolvconf-1.61-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2188 of 2451 (ID: 950, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb, do_package_write)
NOTE: package usbutils-0.91-r3: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2189 of 2451 (ID: 741, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-bsp/usbutils/usbutils_0.91.bb, do_package_write)
NOTE: package libx11-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2451 (ID: 1752, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_compile)
NOTE: package libx11-1.4.4-r0: task do_compile: Started
NOTE: package libpam-1.1.4-r2: task do_configure: Succeeded
NOTE: Running task 2191 of 2451 (ID: 839, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_compile)
NOTE: package libpam-1.1.4-r2: task do_compile: Started
NOTE: package dhcp-4.2.0-r4: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2192 of 2451 (ID: 939, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb, do_package_write)
NOTE: package coreutils-8.14-r1: task do_configure: Succeeded
NOTE: Running task 2193 of 2451 (ID: 1434, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_compile)
NOTE: package coreutils-8.14-r1: task do_compile: Started
NOTE: package bash-4.2-r1: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2194 of 2451 (ID: 1425, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_write)
NOTE: package libxcb-1.7-r2: task do_package: Succeeded
NOTE: Running task 2195 of 2451 (ID: 2306, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_package_write_ipk)
NOTE: package libxcb-1.7-r2: task do_package_write_ipk: Started
WARNING: For recipe perl, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/perl/site_perl
WARNING:   /usr/lib/perl/site_perl/5.14.2
NOTE: package coreutils-8.14-r1: task do_compile: Succeeded
NOTE: Running task 2196 of 2451 (ID: 1431, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_install)
NOTE: package coreutils-8.14-r1: task do_install: Started
NOTE: package libxcb-1.7-r2: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2197 of 2451 (ID: 2303, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb, do_package_write)
NOTE: package eglibc-2.12-r27: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2198 of 2451 (ID: 708, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/eglibc/eglibc_2.12.bb, do_package_write)
NOTE: package coreutils-8.14-r1: task do_install: Succeeded
NOTE: package libx11-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2451 (ID: 1748, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_install)
NOTE: Running task 2200 of 2451 (ID: 1436, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/coreutils/coreutils_8.14.bb, do_package)
NOTE: package coreutils-8.14-r1: task do_package: Started
NOTE: package util-linux-2.19.1-r11: task do_package: Succeeded
NOTE: package libx11-1.4.4-r0: task do_install: Started
NOTE: package libpam-1.1.4-r2: task do_compile: Succeeded
NOTE: Running task 2201 of 2451 (ID: 835, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_install)
NOTE: package libpam-1.1.4-r2: task do_install: Started
NOTE: package libx11-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2202 of 2451 (ID: 1749, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_populate_sysroot)
NOTE: Running task 2203 of 2451 (ID: 1754, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_package)
NOTE: package libx11-1.4.4-r0: task do_populate_sysroot: Started
NOTE: package libx11-1.4.4-r0: task do_package: Started
NOTE: package libpam-1.1.4-r2: task do_install: Succeeded
NOTE: Running task 2204 of 2451 (ID: 836, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_populate_sysroot)
NOTE: Running task 2205 of 2451 (ID: 841, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/pam/libpam_1.1.4.bb, do_package)
NOTE: package libpam-1.1.4-r2: task do_populate_sysroot: Started
NOTE: package libpam-1.1.4-r2: task do_package: Started
NOTE: package libx11-1.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: package libpam-1.1.4-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 2206 of 2451 (ID: 171, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_configure)
NOTE: Running task 2207 of 2451 (ID: 805, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_configure)
NOTE: Running task 2208 of 2451 (ID: 816, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_configure)
NOTE: Running task 2209 of 2451 (ID: 2092, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_configure)
NOTE: package libcgroup-0.37.1-r0: task do_configure: Started
NOTE: package shadow-4.1.4.3-r5: task do_configure: Started
NOTE: package libcap-2.22-r2: task do_configure: Started
NOTE: package dropbear-0.53.1-r0: task do_configure: Started
NOTE: package libcap-2.22-r2: task do_configure: Succeeded
NOTE: Running task 2210 of 2451 (ID: 806, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_compile)
NOTE: package libcap-2.22-r2: task do_compile: Started
NOTE: package libcap-2.22-r2: task do_compile: Succeeded
NOTE: Running task 2211 of 2451 (ID: 802, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_install)
NOTE: package libcap-2.22-r2: task do_install: Started
NOTE: package libcap-2.22-r2: task do_install: Succeeded
NOTE: Running task 2212 of 2451 (ID: 803, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_populate_sysroot)
NOTE: package libcap-2.22-r2: task do_populate_sysroot: Started
NOTE: package libcap-2.22-r2: task do_populate_sysroot: Succeeded
NOTE: Running task 2213 of 2451 (ID: 1839, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_configure)
NOTE: package libgcrypt-1.5.0-r0: task do_configure: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_compile: Succeeded
NOTE: Running task 2214 of 2451 (ID: 1239, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_install)
NOTE: package e2fsprogs-1.41.14-r3: task do_install: Started
NOTE: package dropbear-0.53.1-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2451 (ID: 2093, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_compile)
NOTE: package dropbear-0.53.1-r0: task do_compile: Started
NOTE: package dropbear-0.53.1-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2451 (ID: 2089, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.53.1.bb, do_install)
NOTE: package dropbear-0.53.1-r0: task do_install: Started
NOTE: package dropbear-0.53.1-r0: task do_install: Succeeded
NOTE: package libcgroup-0.37.1-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2451 (ID: 817, /media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_compile)
NOTE: package libcgroup-0.37.1-r0: task do_compile: Started
NOTE: package libx11-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2451 (ID: 1756, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb, do_package_write_ipk)
NOTE: package libx11-1.4.4-r0: task do_package_write_ipk: Started
NOTE: package shadow-4.1.4.3-r5: task do_configure: Succeeded
NOTE: Running task 2219 of 2451 (ID: 172, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_compile)
NOTE: package libgcrypt-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2220 of 2451 (ID: 1840, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_compile)
NOTE: package shadow-4.1.4.3-r5: task do_compile: Started
NOTE: package libgcrypt-1.5.0-r0: task do_compile: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_install: Succeeded
NOTE: Running task 2221 of 2451 (ID: 1240, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_populate_sysroot)
NOTE: Running task 2222 of 2451 (ID: 1245, /media/SSD/OE_core/setup-scripts/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb, do_package)
NOTE: package e2fsprogs-1.41.14-r3: task do_populate_sysroot: Started
NOTE: package e2fsprogs-1.41.14-r3: task do_package: Started
ERROR: Function 'do_compile' failed (see /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/temp/log.do_compile.3390 for further information)
ERROR: Logfile of failure stored in: /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/temp/log.do_compile.3390
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| + cd /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile ']'
| + oe_runmake
| + '[' xmake = x ']'
| + bbnote make
| + echo 'NOTE: make'
| NOTE: make
| + make
| make  all-recursive
| make[1]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1'
| Making all in dist
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/dist'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/dist'
| Making all in doc
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
| Making all in man
| make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc/man'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc/man'
| make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
| make[3]: Nothing to be done for `all-am'.
| make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
| Making all in include
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/include'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/include'
| Making all in samples
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/samples'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/samples'
| Making all in scripts
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/scripts'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/scripts'
| Making all in src
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
| Making all in .
| make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
| \
| #	source='parse.c' object='parse.lo' libtool=yes
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o parse.lo parse.c
| arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c parse.c  -fPIC -DPIC -o .libs/parse.o
| \
| #	source='lex.c' object='lex.lo' libtool=yes
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o lex.lo lex.c
| arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c lex.c  -fPIC -DPIC -o .libs/lex.o
| lex.c:1605:13: warning: 'yy_fatal_error' defined but not used
| \
| #	source='api.c' object='api.lo' libtool=yes
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o api.lo api.c
| arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c api.c  -fPIC -DPIC -o .libs/api.o
| \
| #	source='config.c' object='config.lo' libtool=yes
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o config.lo config.c
| arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c config.c  -fPIC -DPIC -o .libs/config.o
| \
| #	source='wrapper.c' object='wrapper.lo' libtool=yes
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o wrapper.lo wrapper.c
| arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c wrapper.c  -fPIC -DPIC -o .libs/wrapper.o
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,--version-script,./libcgroup.map -version-number 1:0:37 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libcgroup.la -rpath /usr/lib parse.lo lex.lo api.lo config.lo wrapper.lo -lpthread
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/parse.o .libs/lex.o .libs/api.o .libs/config.o .libs/wrapper.o   -lpthread  -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -Wl,--version-script -Wl,./libcgroup.map -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libcgroup.so.1 -o .libs/libcgroup.so.1.0.37
| arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libcgroup.so.1" && ln -s "libcgroup.so.1.0.37" "libcgroup.so.1")
| arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libcgroup.so" && ln -s "libcgroup.so.1.0.37" "libcgroup.so")
| arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libcgroup.la" && ln -s "../libcgroup.la" "libcgroup.la" )
| make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
| Making all in daemon
| make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/daemon'
| \
| #	source='cgrulesengd.c' object='cgrulesengd.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I ../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgrulesengd.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall -L../../src/.libs -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgrulesengd cgrulesengd.o ../../src/.libs/libcgroup.la -lrt
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgrulesengd cgrulesengd.o  -L../../src/.libs ../../src/.libs/libcgroup.so -lpthread -lrt
| make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/daemon'
| Making all in pam
| make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/pam'
| \
| #	source='pam_cgroup.c' object='pam_cgroup.lo' libtool=yes
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I ../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o pam_cgroup.lo pam_cgroup.c
| arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I ../../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c pam_cgroup.c  -fPIC -DPIC -o .libs/pam_cgroup.o
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall -module -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o pam_cgroup.la -rpath /lib/security pam_cgroup.lo ../../src/.libs/libcgroup.la -lpam
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/pam_cgroup.o   ../../src/.libs/libcgroup.so -lpthread /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm/lib/libpam.so -ldl  -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,pam_cgroup.so.0 -o .libs/pam_cgroup.so.0.0.0
| arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "pam_cgroup.so.0" && ln -s "pam_cgroup.so.0.0.0" "pam_cgroup.so.0")
| arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "pam_cgroup.so" && ln -s "pam_cgroup.so.0.0.0" "pam_cgroup.so")
| arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "pam_cgroup.la" && ln -s "../pam_cgroup.la" "pam_cgroup.la" )
| make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/pam'
| Making all in tools
| make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/tools'
| \
| #	source='cgexec.c' object='cgexec.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgexec.c
| \
| #	source='tools-common.c' object='tools-common.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c tools-common.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgexec cgexec.o tools-common.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgexec cgexec.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgclassify.c' object='cgclassify.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgclassify.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgclassify cgclassify.o tools-common.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgclassify cgclassify.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgcreate.c' object='cgcreate.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgcreate.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgcreate cgcreate.o tools-common.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgcreate cgcreate.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgset.c' object='cgset.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgset.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgset cgset.o tools-common.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgset cgset.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgget.c' object='cgget.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgget.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgget cgget.o tools-common.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgget cgget.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgdelete.c' object='cgdelete.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgdelete.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgdelete cgdelete.o tools-common.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgdelete cgdelete.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='lssubsys.c' object='lssubsys.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c lssubsys.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o lssubsys lssubsys.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/lssubsys lssubsys.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='lscgroup.c' object='lscgroup.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c lscgroup.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o lscgroup tools-common.o lscgroup.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/lscgroup tools-common.o lscgroup.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgsnapshot.c' object='cgsnapshot.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgsnapshot.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgsnapshot cgsnapshot.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgsnapshot cgsnapshot.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgconfig.c' object='cgconfig.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgconfig.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgconfigparser cgconfig.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgconfigparser cgconfig.o  ../../src/.libs/libcgroup.so -lpthread
| \
| #	source='cgclear.c' object='cgclear.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgclear.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgclear cgclear.o ../../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-tERROR: Function 'do_compile' failed (see /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/temp/log.do_compile.3390 for further information)
| ypes -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgclear cgclear.o  ../../src/.libs/libcgroup.so -lpthread
| make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/tools'
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
| Making all in tests
| make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
| \
| #	source='libcgrouptest01.c' object='libcgrouptest01.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c libcgrouptest01.c
| \
| #	source='test_functions.c' object='test_functions.o' libtool=no
| arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c test_functions.c
| ../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libcgrouptest01 libcgrouptest01.o test_functions.o ../src/.libs/libcgroup.la
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/libcgrouptest01 libcgrouptest01.o test_functions.o  ../src/.libs/libcgroup.so -lpthread
| \
| #	source='libcg_ba.cpp' object='libcg_ba.o' libtool=no
| arm-angstrom-linux-gnueabi-g++  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp
| libcg_ba.cpp:18:18: fatal error: string: No such file or directory
| compilation terminated.
| make[2]: *** [libcg_ba.o] Error 1
| make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package libcgroup-0.37.1-r0: task do_compile: Failed
NOTE: package shadow-4.1.4.3-r5: task do_compile: Succeeded
ERROR: Task 817 (/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb, do_compile) failed with exit code '1'
Waiting for 9 active tasks to finish:
0: coreutils-8.14-r1 do_package (pid 967)
1: e2fsprogs-1.41.14-r3 do_populate_sysroot (pid 16841)
2: python-2.7.2-r0.2 do_package (pid 22666)
3: perl-5.14.2-r0 do_package (pid 32323)
4: libx11-1.4.4-r0 do_package_write_ipk (pid 10392)
5: e2fsprogs-1.41.14-r3 do_package (pid 16866)
6: libgcrypt-1.5.0-r0 do_compile (pid 13999)
7: linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2 do_install (pid 22769)
8: libpam-1.1.4-r2 do_package (pid 8510)
Waiting for 8 active tasks to finish:
0: coreutils-8.14-r1 do_package (pid 967)
1: python-2.7.2-r0.2 do_package (pid 22666)
2: perl-5.14.2-r0 do_package (pid 32323)
3: libx11-1.4.4-r0 do_package_write_ipk (pid 10392)
4: e2fsprogs-1.41.14-r3 do_package (pid 16866)
5: libgcrypt-1.5.0-r0 do_compile (pid 13999)
6: linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2 do_install (pid 22769)
7: libpam-1.1.4-r2 do_package (pid 8510)
NOTE: package e2fsprogs-1.41.14-r3: task do_populate_sysroot: Succeeded
Waiting for 7 active tasks to finish:
0: coreutils-8.14-r1 do_package (pid 967)
1: python-2.7.2-r0.2 do_package (pid 22666)
2: perl-5.14.2-r0 do_package (pid 32323)
3: e2fsprogs-1.41.14-r3 do_package (pid 16866)
4: libgcrypt-1.5.0-r0 do_compile (pid 13999)
5: linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2 do_install (pid 22769)
6: libpam-1.1.4-r2 do_package (pid 8510)
NOTE: package libx11-1.4.4-r0: task do_package_write_ipk: Succeeded
Waiting for 6 active tasks to finish:
0: coreutils-8.14-r1 do_package (pid 967)
1: python-2.7.2-r0.2 do_package (pid 22666)
2: perl-5.14.2-r0 do_package (pid 32323)
3: e2fsprogs-1.41.14-r3 do_package (pid 16866)
4: linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2 do_install (pid 22769)
5: libpam-1.1.4-r2 do_package (pid 8510)
NOTE: package libgcrypt-1.5.0-r0: task do_compile: Succeeded
Waiting for 5 active tasks to finish:
0: python-2.7.2-r0.2 do_package (pid 22666)
1: perl-5.14.2-r0 do_package (pid 32323)
2: e2fsprogs-1.41.14-r3 do_package (pid 16866)
3: linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2 do_install (pid 22769)
4: libpam-1.1.4-r2 do_package (pid 8510)
NOTE: package coreutils-8.14-r1: task do_package: Succeeded
Waiting for 4 active tasks to finish:
0: python-2.7.2-r0.2 do_package (pid 22666)
1: perl-5.14.2-r0 do_package (pid 32323)
2: linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2 do_install (pid 22769)
3: libpam-1.1.4-r2 do_package (pid 8510)
NOTE: package e2fsprogs-1.41.14-r3: task do_package: Succeeded
Waiting for 3 active tasks to finish:
0: python-2.7.2-r0.2 do_package (pid 22666)
1: perl-5.14.2-r0 do_package (pid 32323)
2: libpam-1.1.4-r2 do_package (pid 8510)
NOTE: package linux-yocto-3.0.8+git1+ae3e64c077972fe87f09946bd215620df68ca327_1+d2f4973505e9cebcf2fc0058434214927deed5e6-r2: task do_install: Succeeded
Waiting for 2 active tasks to finish:
0: python-2.7.2-r0.2 do_package (pid 22666)
1: perl-5.14.2-r0 do_package (pid 32323)
NOTE: package libpam-1.1.4-r2: task do_package: Succeeded
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-lib/usr/lib/libperl.so.5.14.2'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-tw/usr/lib/perl/5.14.2/auto/Encode/TW/TW.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-kr/usr/lib/perl/5.14.2/auto/Encode/KR/KR.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-jp/usr/lib/perl/5.14.2/auto/Encode/JP/JP.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-byte/usr/lib/perl/5.14.2/auto/Encode/Byte/Byte.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-cn/usr/lib/perl/5.14.2/auto/Encode/CN/CN.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-ebcdic/usr/lib/perl/5.14.2/auto/Encode/EBCDIC/EBCDIC.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-unicode/usr/lib/perl/5.14.2/auto/Encode/Unicode/Unicode.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode-symbol/usr/lib/perl/5.14.2/auto/Encode/Symbol/Symbol.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-digest/usr/lib/perl/5.14.2/auto/Digest/SHA/SHA.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-digest/usr/lib/perl/5.14.2/auto/Digest/MD5/MD5.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-mime/usr/lib/perl/5.14.2/auto/MIME/Base64/Base64.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-opcode/usr/lib/perl/5.14.2/auto/Opcode/Opcode.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-sdbm-file/usr/lib/perl/5.14.2/auto/SDBM_File/SDBM_File.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-ipc/usr/lib/perl/5.14.2/auto/IPC/SysV/SysV.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-socket/usr/lib/perl/5.14.2/auto/Socket/Socket.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-io/usr/lib/perl/5.14.2/auto/IO/IO.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/PPPort/PPPort.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/Peek/Peek.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-devel/usr/lib/perl/5.14.2/auto/Devel/DProf/DProf.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-mro/usr/lib/perl/5.14.2/auto/mro/mro.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-time/usr/lib/perl/5.14.2/auto/Time/HiRes/HiRes.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-time/usr/lib/perl/5.14.2/auto/Time/Piece/Piece.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-filter/usr/lib/perl/5.14.2/auto/Filter/Util/Call/Call.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-attributes/usr/lib/perl/5.14.2/auto/attributes/attributes.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-storable/usr/lib/perl/5.14.2/auto/Storable/Storable.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-threads/usr/lib/perl/5.14.2/auto/threads/threads.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-threads/usr/lib/perl/5.14.2/auto/threads/shared/shared.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-cwd/usr/lib/perl/5.14.2/auto/Cwd/Cwd.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-b/usr/lib/perl/5.14.2/auto/B/B.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-sys/usr/lib/perl/5.14.2/auto/Sys/Syslog/Syslog.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-sys/usr/lib/perl/5.14.2/auto/Sys/Hostname/Hostname.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-fcntl/usr/lib/perl/5.14.2/auto/Fcntl/Fcntl.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-math/usr/lib/perl/5.14.2/auto/Math/BigInt/FastCalc/FastCalc.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-file/usr/lib/perl/5.14.2/auto/File/Glob/Glob.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-data/usr/lib/perl/5.14.2/auto/Data/Dumper/Dumper.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-posix/usr/lib/perl/5.14.2/auto/POSIX/POSIX.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-encode/usr/lib/perl/5.14.2/auto/Encode/Encode.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-list/usr/lib/perl/5.14.2/auto/List/Util/Util.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/via/via.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/scalar/scalar.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-perlio/usr/lib/perl/5.14.2/auto/PerlIO/encoding/encoding.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-gdbm-file/usr/lib/perl/5.14.2/auto/GDBM_File/GDBM_File.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-i18n/usr/lib/perl/5.14.2/auto/I18N/Langinfo/Langinfo.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-re/usr/lib/perl/5.14.2/auto/re/re.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-compress/usr/lib/perl/5.14.2/auto/Compress/Raw/Bzip2/Bzip2.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-compress/usr/lib/perl/5.14.2/auto/Compress/Raw/Zlib/Zlib.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-hash/usr/lib/perl/5.14.2/auto/Hash/Util/Util.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-hash/usr/lib/perl/5.14.2/auto/Hash/Util/FieldHash/FieldHash.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-unicode/usr/lib/perl/5.14.2/auto/Unicode/Normalize/Normalize.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-unicode/usr/lib/perl/5.14.2/auto/Unicode/Collate/Collate.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/perl-5.14.2-r0/packages-split/perl-module-text/usr/lib/perl/5.14.2/auto/Text/Soundex/Soundex.so'
Waiting for 1 active tasks to finish:
0: python-2.7.2-r0.2 do_package (pid 22666)
NOTE: package perl-5.14.2-r0: task do_package: Succeeded
NOTE: package python-2.7.2-r0.2: task do_package: Succeeded
ERROR: '/media/SSD/OE_core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb' failed


--------------080004000302050607040803
Content-Type: text/plain;
 name="log.do_compile.3390"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_compile.3390"

DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
+ cd /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1
+ do_compile
+ base_do_compile
+ '[' -e Makefile -o -e makefile ']'
+ oe_runmake
+ '[' xmake = x ']'
+ bbnote make
+ echo 'NOTE: make'
NOTE: make
+ make
make  all-recursive
make[1]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1'
Making all in dist
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/dist'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/dist'
Making all in doc
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
Making all in man
make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc/man'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc/man'
make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
make[3]: Nothing to be done for `all-am'.
make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/doc'
Making all in include
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/include'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/include'
Making all in samples
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/samples'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/samples'
Making all in scripts
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/scripts'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/scripts'
Making all in src
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
Making all in .
make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
\
#	source='parse.c' object='parse.lo' libtool=yes 
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o parse.lo parse.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c parse.c  -fPIC -DPIC -o .libs/parse.o
\
#	source='lex.c' object='lex.lo' libtool=yes 
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o lex.lo lex.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c lex.c  -fPIC -DPIC -o .libs/lex.o
lex.c:1605:13: warning: 'yy_fatal_error' defined but not used
\
#	source='api.c' object='api.lo' libtool=yes 
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o api.lo api.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c api.c  -fPIC -DPIC -o .libs/api.o
\
#	source='config.c' object='config.lo' libtool=yes 
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o config.lo config.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c config.c  -fPIC -DPIC -o .libs/config.o
\
#	source='wrapper.c' object='wrapper.lo' libtool=yes 
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o wrapper.lo wrapper.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c wrapper.c  -fPIC -DPIC -o .libs/wrapper.o
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,--version-script,./libcgroup.map -version-number 1:0:37 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libcgroup.la -rpath /usr/lib parse.lo lex.lo api.lo config.lo wrapper.lo -lpthread 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/parse.o .libs/lex.o .libs/api.o .libs/config.o .libs/wrapper.o   -lpthread  -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -Wl,--version-script -Wl,./libcgroup.map -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libcgroup.so.1 -o .libs/libcgroup.so.1.0.37
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libcgroup.so.1" && ln -s "libcgroup.so.1.0.37" "libcgroup.so.1")
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libcgroup.so" && ln -s "libcgroup.so.1.0.37" "libcgroup.so")
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libcgroup.la" && ln -s "../libcgroup.la" "libcgroup.la" )
make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
Making all in daemon
make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/daemon'
\
#	source='cgrulesengd.c' object='cgrulesengd.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I ../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgrulesengd.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall -L../../src/.libs -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgrulesengd cgrulesengd.o ../../src/.libs/libcgroup.la -lrt 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgrulesengd cgrulesengd.o  -L../../src/.libs ../../src/.libs/libcgroup.so -lpthread -lrt
make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/daemon'
Making all in pam
make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/pam'
\
#	source='pam_cgroup.c' object='pam_cgroup.lo' libtool=yes 
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I ../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c -o pam_cgroup.lo pam_cgroup.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I ../../include -O2 -pipe -g -feliminate-unused-debug-types -Wall -c pam_cgroup.c  -fPIC -DPIC -o .libs/pam_cgroup.o
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall -module -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o pam_cgroup.la -rpath /lib/security pam_cgroup.lo ../../src/.libs/libcgroup.la -lpam 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/pam_cgroup.o   ../../src/.libs/libcgroup.so -lpthread /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm/lib/libpam.so -ldl  -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,pam_cgroup.so.0 -o .libs/pam_cgroup.so.0.0.0
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "pam_cgroup.so.0" && ln -s "pam_cgroup.so.0.0.0" "pam_cgroup.so.0")
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "pam_cgroup.so" && ln -s "pam_cgroup.so.0.0.0" "pam_cgroup.so")
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "pam_cgroup.la" && ln -s "../pam_cgroup.la" "pam_cgroup.la" )
make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/pam'
Making all in tools
make[3]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/tools'
\
#	source='cgexec.c' object='cgexec.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgexec.c
\
#	source='tools-common.c' object='tools-common.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c tools-common.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgexec cgexec.o tools-common.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgexec cgexec.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgclassify.c' object='cgclassify.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgclassify.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgclassify cgclassify.o tools-common.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgclassify cgclassify.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgcreate.c' object='cgcreate.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgcreate.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgcreate cgcreate.o tools-common.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgcreate cgcreate.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgset.c' object='cgset.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgset.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgset cgset.o tools-common.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgset cgset.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgget.c' object='cgget.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgget.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgget cgget.o tools-common.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgget cgget.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgdelete.c' object='cgdelete.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgdelete.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgdelete cgdelete.o tools-common.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgdelete cgdelete.o tools-common.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='lssubsys.c' object='lssubsys.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c lssubsys.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o lssubsys lssubsys.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/lssubsys lssubsys.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='lscgroup.c' object='lscgroup.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c lscgroup.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o lscgroup tools-common.o lscgroup.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/lscgroup tools-common.o lscgroup.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgsnapshot.c' object='cgsnapshot.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgsnapshot.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgsnapshot cgsnapshot.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgsnapshot cgsnapshot.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgconfig.c' object='cgconfig.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgconfig.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgconfigparser cgconfig.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgconfigparser cgconfig.o  ../../src/.libs/libcgroup.so -lpthread
\
#	source='cgclear.c' object='cgclear.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I../.. -I../../src -I../../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c cgclear.c
../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o cgclear cgclear.o ../../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-tERROR: Function 'do_compile' failed (see /media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/temp/log.do_compile.3390 for further information)
ypes -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/cgclear cgclear.o  ../../src/.libs/libcgroup.so -lpthread
make[3]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src/tools'
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/src'
Making all in tests
make[2]: Entering directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
\
#	source='libcgrouptest01.c' object='libcgrouptest01.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c libcgrouptest01.c
\
#	source='test_functions.c' object='test_functions.o' libtool=no 
arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c test_functions.c
../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -Wall  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libcgrouptest01 libcgrouptest01.o test_functions.o ../src/.libs/libcgroup.la 
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb -mthumb-interwork -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/libcgrouptest01 libcgrouptest01.o test_functions.o  ../src/.libs/libcgroup.so -lpthread
\
#	source='libcg_ba.cpp' object='libcg_ba.o' libtool=no 
arm-angstrom-linux-gnueabi-g++  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp
libcg_ba.cpp:18:18: fatal error: string: No such file or directory
compilation terminated.
make[2]: *** [libcg_ba.o] Error 1
make[2]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ bbfatal 'oe_runmake failed'
+ echo 'ERROR: oe_runmake failed'
ERROR: oe_runmake failed
+ exit 1

--------------080004000302050607040803--
