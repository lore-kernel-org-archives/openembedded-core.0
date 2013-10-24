Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id E73C16D3AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 13:11:46 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz11so1304264vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 06:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LNGXulBI3K2PzVQm3HEc2QJFSYIkcQ7dKBwIIHxbDLw=;
	b=lWwOII/sRcyNPhojvNxclgFKhsuhIoWvFG3NrS+4LdNV/cJYfMFnpBR8z7AfxeE+N2
	BN8XC/L6ZI1o3FgJUWhu/dlKG2PfyRDYaD7K0qSEFG/rQqhMNMNT4Hzu+EFNiTKU+xYc
	Fq+7oGBzjXPU3Fztjvb+rziq5zoyc8XYxU75TAjpqI4aenwJz8uJ1g7nk0twv/Zrp5Oz
	43ulFnVDaz8B0FvkZvoik/J9IfeQbbYmhVWGr8awzEpEg03UwmC6KIhu7fXCGMb0RQVR
	FIWC54PMvB5ELbg02bMnPUUhT2LUHsIz81iA2lqde6MpVknbMCbKDT7c6A8o8vELV3dg
	jiQw==
X-Gm-Message-State: ALoCoQl0/Ou/YQ3FwNB4j7qpKBBfdYT/VTse0nBsWtt4iuKVFncYaWkXSAqdgmZeM8jQyBocnN9w
X-Received: by 10.221.16.200 with SMTP id pz8mr12064vcb.53.1382620308498; Thu,
	24 Oct 2013 06:11:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 24 Oct 2013 06:11:28 -0700 (PDT)
In-Reply-To: <1382610728-7026-2-git-send-email-valentin.popa@intel.com>
References: <1382610728-7026-1-git-send-email-valentin.popa@intel.com>
	<1382610728-7026-2-git-send-email-valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Oct 2013 14:11:28 +0100
Message-ID: <CAJTo0LYJ4OH7SPmhXF9LPCSjKLePjULTUzDiBLzuxU4JGnsGCQ@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Thu, 24 Oct 2013 13:11:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi Valentin,

Did you try a weston build without X11, i.e. core-image-weston with
DISTRO_FEATURES_remove="x11"?

Ross

On 24 October 2013 11:32, Valentin Popa <valentin.popa@intel.com> wrote:
> Tested with core-image-sato core-image-weston core-image-clutter;
> All cogl and weston examples run successfully.
>
> Valentin Popa (1):
>   Mesa: upgrade to 9.2.2
>
>  ...ate-NativeDisplayType-depending-on-config.patch |   0
>  ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
>  .../mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb}    |   0
>  meta/recipes-graphics/mesa/mesa.inc                |   2 +-
>  ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
>  ...ate-NativeDisplayType-depending-on-config.patch | 359 ---------------------
>  ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ----
>  .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
>  .../mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}          |   9 +-
>  9 files changed, 3 insertions(+), 528 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-9.1.6 => mesa-9.2.2}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
>  rename meta/recipes-graphics/mesa/{mesa-9.1.6 => mesa-9.2.2}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
>  rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb} (100%)
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>  rename meta/recipes-graphics/mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb} (34%)
>
> --
> 1.8.3.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

