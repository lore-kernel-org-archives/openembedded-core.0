Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tj3zN-00065S-Kh
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 09:17:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2012 00:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,273,1355126400"; d="scan'208";a="233289704"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2012 00:03:16 -0800
Message-ID: <50C98BC4.8000706@linux.intel.com>
Date: Thu, 13 Dec 2012 00:03:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1355224219-16454-1-git-send-email-Martin.Jansa@gmail.com>
	<1355224219-16454-2-git-send-email-Martin.Jansa@gmail.com>
	<50C7E2C9.3010100@linux.intel.com>
	<20121212212745.GD1756@jama.jama.net>
In-Reply-To: <20121212212745.GD1756@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools: copy also remove-potcdate.sin from ${STAGING_DATADIR_NATIVE}/gettext/po
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
X-List-Received-Date: Thu, 13 Dec 2012 08:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2012 01:27 PM, Martin Jansa wrote:
> On Tue, Dec 11, 2012 at 05:50:01PM -0800, Saul Wold wrote:
>> On 12/11/2012 03:10 AM, Martin Jansa wrote:
>>> * some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
>>>     don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
>>>     supplied by autotools.bbclass depends on it and fails without like this:
>>>     | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
>>>     | make[3]: *** No rule to make target `remove-potcdate.sin', needed by `remove-potcdate.sed'.  Stop.
>>>     | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
>>>     | make[2]: *** [uptime.pot] Error 2
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>    meta/classes/autotools.bbclass | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>>> index ca981ec..3154435 100644
>>> --- a/meta/classes/autotools.bbclass
>>> +++ b/meta/classes/autotools.bbclass
>>> @@ -193,6 +193,7 @@ autotools_do_configure() {
>>>    				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>>>    				if [ -d ${S}/po/ ]; then
>>>    					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
>>> +					cp ${STAGING_DATADIR_NATIVE}/gettext/po/reOn 12/12/2012 01:27 PM, Martin Jansa wrote:> On Tue, Dec 11, 2012 at 05:50:01PM -0800, Saul Wold wrote:
>> On 12/11/2012 03:10 AM, Martin Jansa wrote:
>>> * some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
>>>     don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
>>>     supplied by autotools.bbclass depends on it and fails without like this:
>>>     | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
>>>     | make[3]: *** No rule to make target `remove-potcdate.sin', needed by `remove-potcdate.sed'.  Stop.
>>>     | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
>>>     | make[2]: *** [uptime.pot] Error 2
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>    meta/classes/autotools.bbclass | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>>> index ca981ec..3154435 100644
>>> --- a/meta/classes/autotools.bbclass
>>> +++ b/meta/classes/autotools.bbclass
>>> @@ -193,6 +193,7 @@ autotools_do_configure() {
>>>    				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>>>    				if [ -d ${S}/po/ ]; then
>>>    					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
>>> +					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
>>>    				fi
>>>    				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
>>>    					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
>>>
>> This patch seems to have an adverse affect on a number of other packages
>> some how. I saw a number patch failures and configure failures with this
>> patch.
>>
>> See the Autobuilder for examples.
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/830/steps/shell_29/logs/stdio
>
> I got only one error caused by this in whole world build (with 19
> layers) and that was in bash:
>
> NOTE: Running task 4203 of 22403 (ID: 11399, /OE/jansa-test/shr-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_configure)
> NOTE: recipe bash-4.2-r6: task do_configure: Started
> ERROR: Function failed: do_configure (see /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923 for
> further information)
> ERROR: Logfile of failure stored in: /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.5
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot create regular file '/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin': Permission denied
> | ERROR: Function failed: do_configure (see /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923 for further information)
> NOTE: recipe bash-4.2-r6: task do_configure: Failed
>
> $ ls -lah /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin
> -r--r--r-- 1 bitbake bitbake 432 Dec  9  2003 /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin
>
> This can be fixed in bash itself or I can add if to copy remove-potcdate.sin only if it doesn't exist.
>

This still seems to be  problem, I thought you fixed this with the 
latest verion.

See > 
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/756/steps/shell_56/logs/stdio


Sau!

> Cheers,
>move-potcdate.sin ${S}/po/
>>>    				fi
>>>    				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
>>>    					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
>>>
>> This patch seems to have an adverse affect on a number of other packages
>> some how. I saw a number patch failures and configure failures with this
>> patch.
>>
>> See the Autobuilder for examples.
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/830/steps/shell_29/logs/stdio
>
> I got only one error caused by this in whole world build (with 19
> layers) and that was in bash:
>
> NOTE: Running task 4203 of 22403 (ID: 11399, /OE/jansa-test/shr-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_configure)
> NOTE: recipe bash-4.2-r6: task do_configure: Started
> ERROR: Function failed: do_configure (see /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923 for
> further information)
> ERROR: Logfile of failure stored in: /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.5
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot create regular file '/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin': Permission denied
> | ERROR: Function failed: do_configure (see /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923 for further information)
> NOTE: recipe bash-4.2-r6: task do_configure: Failed
>
> $ ls -lah /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin
> -r--r--r-- 1 bitbake bitbake 432 Dec  9  2003 /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin
>
> This can be fixed in bash itself or I can add if to copy remove-potcdate.sin only if it doesn't exist.
>
> Cheers,
>


