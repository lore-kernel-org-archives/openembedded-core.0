Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SFXho-0004Bq-42
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 23:25:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6A06B315AD6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 23:16:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id mpE+tRotkwPO
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 23:16:12 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d0147c1.pool.mediaWays.net [77.1.71.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B5D29315AD69
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 23:16:11 +0200 (CEST)
Message-ID: <4F7CBA1A.3040506@opendreambox.org>
Date: Wed, 04 Apr 2012 23:16:10 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120403131537.5CE3310218@opal>
	<20120404165943.GE4181@jama.jama.net>
	<4F7C8796.9070705@opendreambox.org>
	<20120404174521.GF4181@jama.jama.net>
	<4F7C8B6A.1000008@opendreambox.org>
	<20120404180615.GG4181@jama.jama.net>
	<20120404182250.GH4181@jama.jama.net>
In-Reply-To: <20120404182250.GH4181@jama.jama.net>
Subject: Re: [oe-commits] Andreas Oberritter : gdb: build with expat, add missing RRECOMMENDS_gdbserver
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 04 Apr 2012 21:25:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04.04.2012 20:22, Martin Jansa wrote:
> On Wed, Apr 04, 2012 at 08:06:15PM +0200, Martin Jansa wrote:
>> On Wed, Apr 04, 2012 at 07:56:58PM +0200, Andreas Oberritter wrote:
>>> On 04.04.2012 19:45, Martin Jansa wrote:
>>>> On Wed, Apr 04, 2012 at 07:40:38PM +0200, Andreas Oberritter wrote:
>>>>> On 04.04.2012 18:59, Martin Jansa wrote:
>>>>>> On Tue, Apr 03, 2012 at 01:15:37PM +0000, git@git.openembedded.org wrote:
>>>>>>> Module: openembedded-core.git
>>>>>>> Branch: master
>>>>>>> Commit: 38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
>>>>>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
>>>>>>>
>>>>>>> Author: Andreas Oberritter <obi@opendreambox.org>
>>>>>>> Date:   Tue Apr  3 00:23:55 2012 +0200
>>>>>>>
>>>>>>> gdb: build with expat, add missing RRECOMMENDS_gdbserver
>>>>>>>
>>>>>>> * Fixes communication between gdbserver and gdb-cross
>>>>>>>   by using the same expat settings for both recipes.
>>>>>>> * Adds missing build dependencies for expat/expat-native.
>>>>>>> * Adds missing glibc-thread-db runtime recommendation
>>>>>>>   to gdbserver, which was set only for gdb.
>>>>>>>
>>>>>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>>>
>>>>>> Here it's trying to use host's expat when building target gdb and fails...
>>>>>>
>>>>>> | checking for libexpat... no
>>>>>> | configure: error: expat is missing or unusable
>>>>>> | make[1]: *** [configure-gdb] Error 1
>>>>>> | make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gdb/gdb-7.4-r7.0/build-arm-oe-linux-gnueabi'
>>>>>> | make: *** [all] Error 2
>>>>>> | ERROR: oe_runmake failed
>>>>>> NOTE: package gdb-7.4-r7.0: task do_compile: Failed
>>>>>> ERROR: Task 3561 (/OE/shr-core/openembedded-core/meta/recipes-devtools/gdb/gdb_7.4.bb, do_compile) failed with exit code '1'
>>>>>>
>>>>>> from config.log:
>>>>>> configure:10704: checking for libexpat
>>>>>> configure:10723: arm-oe-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/OE/shr-core/tmp-eglibc/sysroots/om-gta04 -o conftest -O2 -pipe -g -feliminate-unused-debug-types    -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c -ldl -lncurses -lz -lm    /usr/lib/libexpat.so >&5
>>>>>> /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.4/ld: error: /usr/lib/libexpat.so: incompatible target
>>>>>> conftest.c:98: error: undefined reference to 'XML_ParserCreate'
>>>>>> collect2: ld returned 1 exit status
>>>>>
>>>>> Does "bitbake expat" help? Here I have:
>>>>
>>>> expat was built already, so no doesn't help.
>>>>
>>>>
>>>> -EXPAT = "--with-expat"
>>>> +EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
>>>>
>>>> helps..
>>>
>>> OK. Can you please submit an incremental patch? I wonder why it didn't
>>> happen on my system, although I have libexpat-dev installed (Ubuntu).
>>
>> I've tested it only with target gdb (so I don't feel comfortable to send
>> patch before testing -cross-canadian and -cross, but I don't have time
>> for it now).
>>
>>> Which Linux distribution are you using?
>>
>> Gentoo minimal chroot
>> http://git.shr-project.org/git/?p=shr-chroot.git;a=summary
> 
> confirmed on other host also using shr-chroot.. if you want to test it
> yourself, here is patch (or somewhere there if reabased already)
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=shr&id=ef16c225a564d465ebab800204434b0d684c4069

I've built gdb-cross with your patch applied without problems.
gdb-cross-canadian-mipsel is still compiling. However, since the problem
you discovered didn't show on my machine, this may not be meaningful at all.

Regards,
Andreas


