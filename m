Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 13A3C6D156
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 11:58:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Oct 2013 04:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,570,1378882800"; d="scan'208";a="422643025"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.58])
	([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2013 04:58:49 -0700
Message-ID: <526A5D4C.4060807@intel.com>
Date: Fri, 25 Oct 2013 15:00:12 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1382610728-7026-1-git-send-email-valentin.popa@intel.com>
	<1382610728-7026-2-git-send-email-valentin.popa@intel.com>
	<CAJTo0LYJ4OH7SPmhXF9LPCSjKLePjULTUzDiBLzuxU4JGnsGCQ@mail.gmail.com>
	<5269209B.3080901@intel.com>
	<CAJTo0Lb6ZrEgcjeQR6qss_RcfOO6e_cH_jzO2hGkZnKFydN_fQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb6ZrEgcjeQR6qss_RcfOO6e_cH_jzO2hGkZnKFydN_fQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 Oct 2013 11:58:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested without X on core-image-weston (+ libGLESv2)
and works great.


On 10/24/2013 04:30 PM, Burton, Ross wrote:
> Hi,
>
> x11 is a default DISTRO_FEATURE in oe-core (as otherwise sato won't
> build...), so you'll have to remove it to test builds without X.
>
> Ross
>
> On 24 October 2013 14:28, Valentin Popa <valentin.popa@intel.com> wrote:
>> I thought that if I don't specify DISTRO_FEATURES_append = " x11"
>> it will not include it. I will try with DISTRO_FEATURES_remove="x11"
>> end see what's happening.
>>
>>
>>
>> On 10/24/2013 04:11 PM, Burton, Ross wrote:
>>> Hi Valentin,
>>>
>>> Did you try a weston build without X11, i.e. core-image-weston with
>>> DISTRO_FEATURES_remove="x11"?
>>>
>>> Ross
>>>
>>> On 24 October 2013 11:32, Valentin Popa <valentin.popa@intel.com> wrote:
>>>> Tested with core-image-sato core-image-weston core-image-clutter;
>>>> All cogl and weston examples run successfully.
>>>>
>>>> Valentin Popa (1):
>>>>     Mesa: upgrade to 9.2.2
>>>>
>>>>    ...ate-NativeDisplayType-depending-on-config.patch |   0
>>>>    ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
>>>>    .../mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb}    |   0
>>>>    meta/recipes-graphics/mesa/mesa.inc                |   2 +-
>>>>    ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
>>>>    ...ate-NativeDisplayType-depending-on-config.patch | 359
>>>> ---------------------
>>>>    ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ----
>>>>    .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
>>>>    .../mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}          |   9 +-
>>>>    9 files changed, 3 insertions(+), 528 deletions(-)
>>>>    rename meta/recipes-graphics/mesa/{mesa-9.1.6 =>
>>>> mesa-9.2.2}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>>>> (100%)
>>>>    rename meta/recipes-graphics/mesa/{mesa-9.1.6 =>
>>>> mesa-9.2.2}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
>>>> (100%)
>>>>    rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb =>
>>>> mesa-gl_9.2.2.bb} (100%)
>>>>    delete mode 100644
>>>> meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
>>>>    delete mode 100644
>>>> meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>>>>    delete mode 100644
>>>> meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
>>>>    delete mode 100644
>>>> meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>>>>    rename meta/recipes-graphics/mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}
>>>> (34%)
>>>>
>>>> --
>>>> 1.8.3.2
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


