Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB446D3AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 13:30:59 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz11so1321226vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 06:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mhxs3LbZDMe8YY87uKmEe6LRL75bCyODoVM43z4a7eA=;
	b=XjhWbuT/tv/LsMn47Q2n9rXty1X0xOgnezl1OocoVgQ1adhvWPGoB1UiTPpQkUycIw
	skOrQ+ZgKiQYbxdPuqzJpBth2dpEj46jW/z75smAxkcnysjTBml0mJpOvYzrLaNlSvR9
	1Msx7DSwTmR3rMoNRbOm/06Ndig3HeMjEW54piep/QRXh1oCHXcW2oeoUvwgfofj04AN
	iKJV4+1rVo4MK+JPkwhkJqNYGJXQD+r3KpaI1nLd7xHlxeqhgUw1bn6YS/UoLk1cr1j1
	qRfp5xst3NyNFCmafbXyFMZzThLKtOUoWfWo68hAX1bKyptdPslE1XfhzQ9fqnE5TWjd
	nEOQ==
X-Gm-Message-State: ALoCoQlgxOth6C3kJoHM4OmkbVDasercbbVzNliNOIYXlahq9Pv+ezh7IeFMZeVMzsyCQW6Vjx9o
X-Received: by 10.52.26.69 with SMTP id j5mr1206981vdg.21.1382621460833; Thu,
	24 Oct 2013 06:31:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 24 Oct 2013 06:30:40 -0700 (PDT)
In-Reply-To: <5269209B.3080901@intel.com>
References: <1382610728-7026-1-git-send-email-valentin.popa@intel.com>
	<1382610728-7026-2-git-send-email-valentin.popa@intel.com>
	<CAJTo0LYJ4OH7SPmhXF9LPCSjKLePjULTUzDiBLzuxU4JGnsGCQ@mail.gmail.com>
	<5269209B.3080901@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Oct 2013 14:30:40 +0100
Message-ID: <CAJTo0Lb6ZrEgcjeQR6qss_RcfOO6e_cH_jzO2hGkZnKFydN_fQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2013 13:30:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

x11 is a default DISTRO_FEATURE in oe-core (as otherwise sato won't
build...), so you'll have to remove it to test builds without X.

Ross

On 24 October 2013 14:28, Valentin Popa <valentin.popa@intel.com> wrote:
> I thought that if I don't specify DISTRO_FEATURES_append = " x11"
> it will not include it. I will try with DISTRO_FEATURES_remove="x11"
> end see what's happening.
>
>
>
> On 10/24/2013 04:11 PM, Burton, Ross wrote:
>>
>> Hi Valentin,
>>
>> Did you try a weston build without X11, i.e. core-image-weston with
>> DISTRO_FEATURES_remove="x11"?
>>
>> Ross
>>
>> On 24 October 2013 11:32, Valentin Popa <valentin.popa@intel.com> wrote:
>>>
>>> Tested with core-image-sato core-image-weston core-image-clutter;
>>> All cogl and weston examples run successfully.
>>>
>>> Valentin Popa (1):
>>>    Mesa: upgrade to 9.2.2
>>>
>>>   ...ate-NativeDisplayType-depending-on-config.patch |   0
>>>   ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
>>>   .../mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb}    |   0
>>>   meta/recipes-graphics/mesa/mesa.inc                |   2 +-
>>>   ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
>>>   ...ate-NativeDisplayType-depending-on-config.patch | 359
>>> ---------------------
>>>   ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ----
>>>   .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
>>>   .../mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}          |   9 +-
>>>   9 files changed, 3 insertions(+), 528 deletions(-)
>>>   rename meta/recipes-graphics/mesa/{mesa-9.1.6 =>
>>> mesa-9.2.2}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>>> (100%)
>>>   rename meta/recipes-graphics/mesa/{mesa-9.1.6 =>
>>> mesa-9.2.2}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
>>> (100%)
>>>   rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb =>
>>> mesa-gl_9.2.2.bb} (100%)
>>>   delete mode 100644
>>> meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
>>>   delete mode 100644
>>> meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>>>   delete mode 100644
>>> meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
>>>   delete mode 100644
>>> meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>>>   rename meta/recipes-graphics/mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}
>>> (34%)
>>>
>>> --
>>> 1.8.3.2
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

