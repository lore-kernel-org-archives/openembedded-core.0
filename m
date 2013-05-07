Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UZbpQ-0005Bi-4D
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 08:56:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 May 2013 23:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="237884709"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by AZSMGA002.ch.intel.com with ESMTP; 06 May 2013 23:38:45 -0700
Message-ID: <5188A175.5020001@linux.intel.com>
Date: Mon, 06 May 2013 23:38:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Randy MacLeod <rwmacleod@gmail.com>
References: <CAK6=ix4EGtoEd0JqEBC6tNt+nXVEw5=F_Mf3vUFCzKeCEq8kzg@mail.gmail.com>
	<51882798.9080208@linux.intel.com>
	<CAK6=ix4tT9WpDy0HXBQdKBtVE9anCJJjTntP+QYY=vSMOiQbng@mail.gmail.com>
In-Reply-To: <CAK6=ix4tT9WpDy0HXBQdKBtVE9anCJJjTntP+QYY=vSMOiQbng@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 May 2013 06:56:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Top Post:

My bad, I pushed the wrong local branch to sgw/wip, it's updated now.

Sorry.

	Sau!


On 05/06/2013 08:53 PM, Randy MacLeod wrote:
>
>
>
> On Mon, May 6, 2013 at 5:58 PM, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>     On 05/06/2013 01:59 PM, Randy MacLeod wrote:
>
>         On 13-04-24 05:37 PM, Saul Wold wrote:> Signed-off-by: Saul Wold
>         <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
>         <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>>
>
>           > ---
>           >   meta/recipes-devtools/__pkgconfig/pkgconfig.inc     | 8
>         +-------
>           >   meta/recipes-devtools/__pkgconfig/pkgconfig_0.25.bb
>         <http://pkgconfig_0.25.bb>
>         <http://pkgconfig_0.25.bb> | 7 +++++++
>
>           >   2 files changed, 8 insertions(+), 7 deletions(-)
>
>         Saul,
>
>         Any news on pkgconfig-0.28 ? I'm trying to compile c-i-m
>         using clang for the -native tools and glib-1.2.10 shipped with
>         pkgconfig-0.25 is causing the build error below.
>         pkgconfig-0.28 and later includes version of glib-2.32.4
>
>     Got caught up in 1.4 finalization and planning for 1.5, I was going
>     to look at it again this week.
>
>
>         If you are about to push this uprev, I'll wait a while and try
>         again. Do you want help?
>
>     I would appreciate help with the update if you can provide a tested
>     pkgconfig update, I was thinking about providing the update for
>     testing before enabling it similar to what we do with gcc, that's
>     why I split the recipe.
>
>     I have an untested version (it builds) in my poky-contrib/sgw/wip
>     branch with you want to finish/test it more.
>
>
> I only see 0.25:
>
> $ cd .../poky/poky-contrib.git
> $ git pull
> Already up-to-date.
> $ git status
> # On branch sgw/wip
> nothing to commit, working directory clean
> $ find meta -name "pkgcon*bb"
> meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb <http://pkgconfig_0.25.bb>
> meta/recipes-devtools/pkgconfig/pkgconfig_git.bb <http://pkgconfig_git.bb>
>
> Did I miss something?
>
> I think you want me to provide a commit for 0.28 as an additional recipe
> with the
> preferred provider being 0.25 until 0.28 is tested and stable. Is that
> right?
>
>     Thanks for your help.
>
>
> Let's not get ahead of ourselves. :)
> I'm also in the middle of planning so we'll see how much time I have to
> work on this. :) I've made some progress on groking the existing patches
> and determining which ones should be kept, adjusted and tossed. More
> tomorrow night - I hope.
>
>
> Current status:
> - removed all the pkgconfig-0.28/*patches - I'm not sure I can really
> get away with that.
> - configure is failing as shown below.
>
>
> // Randy
>
> $ bitbake -c configure pkgconfig-native
> ....
> | system_include_path='/usr/include'
> | system_library_path='/usr/lib:/lib'
> | target_alias='x86_64-linux'
> | use_indirect_deps='no'
> |
> | configure: exit 1
> | ERROR: oe_runconf failed
> | ERROR: Function failed: do_configure (see
> /home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.28-r0/temp/log.do_configure.15370
> for further information)
> ERROR: Task 26
> (virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
> <http://pkgconfig_0.28.bb>, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 46 tasks of which 42 didn't need to be
> rerun and 1 failed.
> No currently running tasks (46 of 63)
>
> Summary: 1 task failed:
>
> virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
> <http://pkgconfig_0.28.bb>, do_configure
>
>
> --
> ../Randy/..


