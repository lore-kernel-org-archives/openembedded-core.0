Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UZTiN-0001ob-VB
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 00:17:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 May 2013 14:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,624,1363158000"; d="scan'208";a="298508200"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by azsmga001.ch.intel.com with ESMTP; 06 May 2013 14:58:48 -0700
Message-ID: <51882798.9080208@linux.intel.com>
Date: Mon, 06 May 2013 14:58:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Randy MacLeod <rwmacleod@gmail.com>
References: <CAK6=ix4EGtoEd0JqEBC6tNt+nXVEw5=F_Mf3vUFCzKeCEq8kzg@mail.gmail.com>
In-Reply-To: <CAK6=ix4EGtoEd0JqEBC6tNt+nXVEw5=F_Mf3vUFCzKeCEq8kzg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/18] pkgconfig: Move patches in prep for 0.28 update
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
X-List-Received-Date: Mon, 06 May 2013 22:17:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2013 01:59 PM, Randy MacLeod wrote:
> On 13-04-24 05:37 PM, Saul Wold wrote:> Signed-off-by: Saul Wold
> <sgw@linux.intel.com <mailto:sgw@linux.intel.com>>
>  > ---
>  >   meta/recipes-devtools/pkgconfig/pkgconfig.inc     | 8 +-------
>  >   meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
> <http://pkgconfig_0.25.bb> | 7 +++++++
>  >   2 files changed, 8 insertions(+), 7 deletions(-)
>
> Saul,
>
> Any news on pkgconfig-0.28 ? I'm trying to compile c-i-m
> using clang for the -native tools and glib-1.2.10 shipped with
> pkgconfig-0.25 is causing the build error below.
> pkgconfig-0.28 and later includes version of glib-2.32.4
>
Got caught up in 1.4 finalization and planning for 1.5, I was going to 
look at it again this week.

> If you are about to push this uprev, I'll wait a while and try
> again. Do you want help?
>
I would appreciate help with the update if you can provide a tested 
pkgconfig update, I was thinking about providing the update for testing 
before enabling it similar to what we do with gcc, that's why I split 
the recipe.

I have an untested version (it builds) in my poky-contrib/sgw/wip branch 
with you want to finish/test it more.

Thanks for your help.

Sau!

>
> BTW, I just set
>    /usr/bin/gcc -> clang manually and used update-alternatives
> to set:
>    /usr/bin/c++ -> /etc/alternative/c++ ~=>
>                    Ubuntu clang version 3.2-1~exp9ubuntu1
>                    (tags/RELEASE_32/final) (based on LLVM 3.2)
>
> my host is Ubuntu-13.04. I guess I should figure out
>
> Is there a better way to make oe-core use clang for native tools?
> I did glance at:
> http://www.openembedded.org/wiki/Adding_a_secondary_toolchain
>
> // Randy
>
>
>
>   testglib.o:testglib.c:(.text+0x0): first defined here
> | ./.libs/libglib.a(gutils.o): In function `g_bit_nth_msf':
> | gutils.c:(.text+0x30): multiple definition of `g_bit_nth_msf'
> | testglib.o:testglib.c:(.text+0x30): first defined here
> | ./.libs/libglib.a(gutils.o): In function `g_bit_storage':
> | gutils.c:(.text+0x60): multiple definition of `g_bit_storage'
> | testglib.o:testglib.c:(.text+0x60): first defined here
> | clang: error: linker command failed with exit code 1 (use -v to see
> invocation)
> | make[4]: *** [testglib] Error 1
> | make[4]: Leaving directory
> `/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10'
> | make[3]: *** [all-recursive] Error 1
> | make[3]: Leaving directory
> `/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10'
> | make[2]: *** [all] Error 2
> | make[2]: Leaving directory
> `/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see
> /home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/temp/log.do_compile.32446
> for further information)
> ERROR: Task 27
> (virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
> <http://pkgconfig_0.25.bb>, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 47 tasks of which 46 didn't need to be
> rerun and 1 failed.
> No currently running tasks (47 of 63)
>
>
> --
> ../Randy/..
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


