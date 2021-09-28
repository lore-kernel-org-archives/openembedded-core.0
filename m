Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e42aa3d1705a7c3ddf14bfba73a902bdfdb019fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: fix CVE-2021-3778
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Sep 2021 11:41:44 +0100
In-Reply-To: <17932.1632814615730834966@lists.openembedded.org>
References: <16202.1632812323492474010@lists.openembedded.org>
	 <17932.1632814615730834966@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Minjae Kim <flowergom@gmail.com>, openembedded-core@lists.openembedded.org

On Tue, 2021-09-28 at 00:36 -0700, Minjae Kim wrote:
> Hi Richard,
> 
> When I tried to rebuild this patch on the latest master branch,
> I could not get any patch errors as below.
> 
> poky/master/poky$ bitbake vim -c cleanall; bitbake vim -C compile
> Loading cache: 100% |                                                         
>                                                                              
>                | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100%
> |#############################################################################
> #########################################################################|
> Time: 0:00:03
> Parsing of 828 .bb files complete (0 cached, 828 parsed). 1469 targets, 44
> skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>  
> Build Configuration:
> BB_VERSION           = "1.51.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.3+snapshot-a1e31bb8d625bf4531347e7cff6de89f104800c7"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta                 
> meta-poky            
> meta-yocto-bsp       = "master:a1e31bb8d625bf4531347e7cff6de89f104800c7"
>  
> Initialising tasks: 100%
> |#############################################################################
> ######################################################################| Time:
> 0:00:00
> Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0%
> complete)
> NOTE: No setscene tasks
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and
> all succeeded.
> Loading cache: 100%
> |#############################################################################
> ###########################################################################|
> Time: 0:00:00
> Loaded 1469 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>  
> Build Configuration:
> BB_VERSION           = "1.51.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.3+snapshot-a1e31bb8d625bf4531347e7cff6de89f104800c7"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta                 
> meta-poky            
> meta-yocto-bsp       = "master:a1e31bb8d625bf4531347e7cff6de89f104800c7"
>  
> NOTE: Tainting hash to force rebuild of task
> /home/webos_build/upstream/poky/master/poky/meta/recipes-
> support/vim/vim_8.2.bb, do_compile                                     | ETA: 
> 0:00:00
> WARNING: /home/webos_build/upstream/poky/master/poky/meta/recipes-
> support/vim/vim_8.2.bb:do_compile is tainted from a forced run               
>                              | ETA:  0:00:00
> Initialising tasks: 100%
> |#############################################################################
> ######################################################################| Time:
> 0:00:01
> Sstate summary: Wanted 10 Local 0 Network 0 Missed 10 Current 549 (0% match,
> 98% complete)
> Removing 3 stale sstate objects for arch qemux86_64: 100%
> |#############################################################################
> #####################################| Time: 0:00:00
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 1964 tasks of which 1945 didn't need to be
> rerun and all succeeded.
>  
> Summary: There was 1 WARNING message shown.
> upstream/poky/master/poky$ 

I checked again and the patch definitely does not work. I think the whitespace
is being corrupted on the trip through the mailing list.

I've manually refreshed the patch locally to fix it but I think something about
your email setup is causing problems with patch corruption :(.

Cheers,

Richard





