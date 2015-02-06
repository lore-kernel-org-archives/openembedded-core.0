Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 71D79605F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 21:05:46 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id f15so20295184lbj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 13:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HlrHqKewzZQHxm3kDWcyPuOLyk7nmY1TxPV8fwz2arE=;
	b=g76t9vc+T98FzZinRU76Jz844b15SskHjoyF+GFV2kGALIu29hc0+2JC1jc4Yqscbv
	snk5dDejucQZ/fdBpOjxpINSPzqDYmeCHIkv5nqwQBZDmqTpa1BVcSCHgiq5XM1tN1Tl
	9iiaHkjKGUBKlvwV2xRBeqNCyanQm6drHiaNMgWaTeL8ziv7a33EZKkApEELahD0c9KQ
	a83jk+F6qLTL42NZfkGJ+3XbUbQtMyPH6CS9paAPwBkWmPHfAZBRFJjpQ3VETLnutoPc
	5AzEDCwZCCSb6WQUFxPTx8WHxj2MLmRbNTiiPADeYs+bS6QWCso+IZ8ibQ+M5kh4C5yE
	oMow==
MIME-Version: 1.0
X-Received: by 10.112.135.196 with SMTP id pu4mr4769846lbb.41.1423256746357;
	Fri, 06 Feb 2015 13:05:46 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Fri, 6 Feb 2015 13:05:46 -0800 (PST)
In-Reply-To: <f705b60cd5082a5a68d502aebe093d27b79f2ce4.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
	<f705b60cd5082a5a68d502aebe093d27b79f2ce4.1423237494.git.bruce.ashfield@windriver.com>
Date: Fri, 6 Feb 2015 16:05:46 -0500
Message-ID: <CADkTA4MKRQHWQsHW=Ev__rSnHZDkhRV0oNafqt2smfFF2TsKNw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] linux-yocto/3.14: update to 3.14.29
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
X-List-Received-Date: Fri, 06 Feb 2015 21:05:53 -0000
Content-Type: text/plain; charset=UTF-8

This triggered a build issue with qemumips, so I've pushed another branch
to my zedd/kernel-dev contrib branch that fixes the issue.

Cheers,

Bruce

On Fri, Feb 6, 2015 at 11:31 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Updating to the latest korg -stable release for 3.14.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 20 ++++++++++----------
>  3 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
> index 7dbf82c3e691..fbd331f38e74 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
> @@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -SRCREV_machine ?= "7f0712d10247ffca8e48e944f49707bcf9117ead"
> -SRCREV_machine_qemuppc ?= "8bed2a975d491c963cff56496f7e35f5bcff926f"
> -SRCREV_meta ?= "a227f20eff056e511d504b2e490f3774ab260d6f"
> +SRCREV_machine ?= "367c3b9712a6e469aed0cb5deebd5d3bfab12b79"
> +SRCREV_machine_qemuppc ?= "4e827a9b658b6381f6706490e40b6a069a0c4b64"
> +SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>
> -LINUX_VERSION ?= "3.14.24"
> +LINUX_VERSION ?= "3.14.29"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> index 67bf4624f833..2d1bc2117145 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> @@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?= "3.14.24"
> +LINUX_VERSION ?= "3.14.29"
>
>  KMETA = "meta"
>
> -SRCREV_machine ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
> -SRCREV_meta ?= "a227f20eff056e511d504b2e490f3774ab260d6f"
> +SRCREV_machine ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
> +SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> index 5f0a09e97331..f218a91b48f0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> @@ -11,19 +11,19 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
>  KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "6166316d47b859aa38bfecc61f4808828af03937"
> -SRCREV_machine_qemuarm64 ?= "902f34d36102a4b2008b776ecae686f80d307e12"
> -SRCREV_machine_qemumips ?= "4ececcc09c6550a0896728163907e729d817c2fd"
> -SRCREV_machine_qemuppc ?= "1cc5b09f8bb7f40b289d149d370c62dcc8109501"
> -SRCREV_machine_qemux86 ?= "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
> -SRCREV_machine_qemux86-64 ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
> -SRCREV_machine_qemumips64 ?= "737272b1dfd361d9ea19812a9717e2798e3c4576"
> -SRCREV_machine ?= "02120556b0ebc20c30374ccf211e8e4ceac2bb1c"
> -SRCREV_meta ?= "a227f20eff056e511d504b2e490f3774ab260d6f"
> +SRCREV_machine_qemuarm ?= "c0ed33beda334dcd387dff89da9804c03e24d648"
> +SRCREV_machine_qemuarm64 ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
> +SRCREV_machine_qemumips ?= "808071c5f72dc98ed2192de28bdd4e9ba2f7e820"
> +SRCREV_machine_qemuppc ?= "0f93713ce91cc93f055ae6bcf1bf728d4036d097"
> +SRCREV_machine_qemux86 ?= "f6aa7aaca80e8532316bfb6e8dd2fbf9ab4f8b8e"
> +SRCREV_machine_qemux86-64 ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
> +SRCREV_machine_qemumips64 ?= "f44eb151dc53822f4f94f50b2ec67a0a1aab041b"
> +SRCREV_machine ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
> +SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>
> -LINUX_VERSION ?= "3.14.24"
> +LINUX_VERSION ?= "3.14.29"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

