Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7B26060609
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 21:30:32 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id r10so873758lbi.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/ujK7lsXpyuB+1+0bnyOQ2u8Zj3awgN22zHIXuYPMA8=;
	b=Bieqzgr1NWCaqH3WNlQiiZzDSq7MFOytMViiP9BCv1NFfNWSyH3Cp4wFfnoCCbYx4y
	wzeWA5K1Oe+YDX/Oqg6lfR8zZVGE6wrJUIKCDeAyugmrPs1pVXk2wCUCLJgSy38Lu91e
	LahRK784hUNNEAYMLEB//3sTMl9pYE/7wPTQdGgBUIO17hWl1PlImmsnZSW3F5XUHrFI
	Vopa4uLwxRgPtkfpfXzZnGdzRflg+qpTqNAHcHD4iJqqwSN9juqtm+uSq1F4whEVP2LJ
	pzqLhFOXf60T+bYvRbXqwjHPn4FrPt7TWve2s/mAocwiQDx7nfUBbS34t7oSYP+4QjLv
	i2Tw==
MIME-Version: 1.0
X-Received: by 10.112.0.173 with SMTP id 13mr702105lbf.8.1377293431361; Fri,
	23 Aug 2013 14:30:31 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 23 Aug 2013 14:30:31 -0700 (PDT)
In-Reply-To: <cover.1377280429.git.bruce.ashfield@windriver.com>
References: <cover.1377280429.git.bruce.ashfield@windriver.com>
Date: Fri, 23 Aug 2013 17:30:31 -0400
Message-ID: <CADkTA4NVg6U9PJdcxqJe2_=rmt4-nXnpxY93UJuE5aV+4Ao8Lg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 23 Aug 2013 21:30:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 23, 2013 at 2:08 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Here's my consolidated set of changes that represent the biggest chunk
> of work for the Yocto 1.5 release. The obvious change is that the 3.10
> kernel is now the latest linux-yocto kernel (and linux-yocto-dev will
> mark on). I've built and booted core-image-sato for all the oe-core
> qemu machines.
>
> 3.10 also the latest LTSI and will be updated with that content when it
> becomes available.
>
> Other features of the 3.10 kernel include:
>
>   - refreshed -rt support
>   - refreshed yaffs2, aufs3
>   - cryptodev
>   - bfs, edf, and OCF staged features
>   - scrubbed and updated meta data for v3.10
>   - improved tools support for meta data updates and queue maintenance
>   - patch carry forward from all previous linux-yocto kernels and
>     configuration.
>
> I've also tested linux-yocto-rt and linux-yocto-tiny for the new, shiny tree.
>
> I've also bumped the linux-libc-headers to 3.10 and have fixed gst-plugins-good
> to adapt to a changed #define in the exported headers.
>
> Other parts of this update include an uprev of guilt, and in fact, a
> restoration of "normal" guil operations, since the kernel tree is now
> manipulated and maintained via a smaller, more contained script. This
> was necessary for both usability reasons and the fact that all of guilts
> protections were being removed for the kernel's use .. which makes you
> ask the quesetion "why use it". It was time for a change.
>
> The patches are pretty self explanitory and all contain detailed long
> logs .. but the summary is:
>
>    [PATCH 1/5] kern-tools: usability, bug fixes and no guilt
>    [PATCH 2/5] guilt: update to latest git version
>    [PATCH 3/5] linux-libc-headers: update to v3.10
>    [PATCH 4/5] gst-plugins-good: fix 3.10 libc-headers build failure
>    [PATCH 5/5] linux-yocto: introduce v3.10
>
> ** There is one pending activity. As part of thsi update to 3.10, we want
> to move to the 3.4 and 3.10 kernel, dropping 3.8 support. But the
> routerstationpro BSP is still using it as its preferred version. I'm
> a one man show on this update, and I wasn't able to get the 100+ patches
> ported to 3.10 AND get this update out before the M4 cutoff.

Good news on this front. The routerstation pro (and it's replacement after
1.5) are working on 3.10 with the patches rebased. I'll follow up later with
the update of the rsp and the removal of the 3.8 recipe.

The beagleboard and fsl board will follow after that as well, pending some
boot testing.

Cheers,

Bruce

>
> ** I'm still attempting to udpate all the reference boards, and
> once done, I'll send a follow up patch.
>
> ** Please test, I've done my best, but things can slip through. We'll
> work issues in the stabilization period.
>
> Cheers,
>
> Bruce
>
>
> The following changes since commit 501e1a321d15abd712e3a6ee6ccdb8e21c3d4ea4:
>
>   bitbake: prserv/serv: Fix pid file removal (2013-08-23 17:43:40 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (5):
>   kern-tools: usability, bug fixes and no guilt
>   guilt: update to latest git version
>   linux-libc-headers: update to v3.10
>   gst-plugins-good: fix 3.10 libc-headers build failure
>   linux-yocto: introduce v3.10
>
>  meta/classes/kernel-yocto.bbclass                  |    2 +
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  .../guilt/files/guilt-import-commit.patch          |   96 ------
>  meta/recipes-devtools/guilt/files/guilt-init.patch |   25 --
>  meta/recipes-devtools/guilt/files/guilt-pop.patch  |   73 -----
>  .../guilt/files/guilt-push-no-series.patch         |   29 --
>  meta/recipes-devtools/guilt/files/guilt-push.patch |   42 ---
>  .../guilt/files/guilt-set-git_exec_path.patch      |   29 --
>  ...lt-update-supported-git-versions-to-1.8.x.patch |   28 --
>  meta/recipes-devtools/guilt/files/guilt.patch      |  319 --------------------
>  .../guilt/files/improve_auto_header_gen.patch      |   71 -----
>  .../files/make_git_commands_conditional.patch      |   48 ---
>  .../guilt/files/optional_head_check.patch          |   60 ----
>  .../guilt/files/uninstall_force.patch              |   14 -
>  .../{guilt-native_0.33.bb => guilt-native_git.bb}  |   21 +-
>  .../kern-tools/kern-tools-native_git.bb            |    6 +-
>  .../linux-libc-headers/linux-libc-headers_3.10.bb  |    7 +
>  .../linux-libc-headers/linux-libc-headers_3.8.bb   |    8 -
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   30 ++
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   25 ++
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   30 ++
>  ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 +++
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    1 +
>  23 files changed, 150 insertions(+), 861 deletions(-)
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-import-commit.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-init.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-pop.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-push.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/guilt.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/optional_head_check.patch
>  delete mode 100644 meta/recipes-devtools/guilt/files/uninstall_force.patch
>  rename meta/recipes-devtools/guilt/{guilt-native_0.33.bb => guilt-native_git.bb} (45%)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.10.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

