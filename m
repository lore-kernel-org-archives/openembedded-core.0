Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 787CC6FF69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 12:22:55 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id j29so15227863qtj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QyiWLOETiYQ+4GwiwpbxEZ6a84KyZPBM7B+7O2OmI9g=;
	b=hWjXDorWd1iSd5/Db6oLUTkypwRS9KDpJbT/qM1LuX3DdRSGU/uQMKW4fwOv/HeY53
	yrjNdJM30hELOMCzu8HMoTXr8nucC0UXaSXxpsvKl52tV6vJ5YzcEOEphlNV70YW9T9D
	+PE9EAbOvfQUKzLIktx7V1WSxRWPJBS5SKjcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QyiWLOETiYQ+4GwiwpbxEZ6a84KyZPBM7B+7O2OmI9g=;
	b=JgNTpY1Rq+YNhp75uyg14jpHdz7XuO1+yJIoyb5YNm3MGwPtg4Ool0tjag8OKxUBCC
	DIF4sq/uxZXc1zpfsbehKTSDuP1c74xTuJ8WLwVpP2y0nbO6YnOHl4oLFuCr2v3gA4/R
	cGhFhAAS550BIZnBs67KMuG69lkPNsH8c/lZyL+228IzfsxPRdIg3/Tbc4VFeNODLWjD
	kriH/uH14QARSgXOepv7avnR0cU5t8wXP9PYzfD64AvMjvccrK/uGezEZmx46e6xeuqV
	DTVK05tgSGoYasa3J+vZN8cCOxSZOnlneOUP6q8QppFivjna+yMdktTAHStY5HIBq2b4
	LIJA==
X-Gm-Message-State: AODbwcBUuhsDX/igKzDcy66cXOzNc7zrnGJC/imZmjiiZKdwciMztAlr
	CRDh8vhpPGjsWR64+y8tWbYev00WqART
X-Received: by 10.200.3.79 with SMTP id w15mr6079qtg.203.1494505376364; Thu,
	11 May 2017 05:22:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Thu, 11 May 2017 05:22:35 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1705110623380.31743@localhost.localdomain>
References: <alpine.LFD.2.20.1705110623380.31743@localhost.localdomain>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 11 May 2017 14:22:35 +0200
Message-ID: <CAP71WjzrOsmind=t8wE+9HRDyxDBnc3SMMx9RM=8sbhX0Yg9Sg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OT?] where to start building for qualcomm snapdragon APQ8016E dragonboard 410C?
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
X-List-Received-Date: Thu, 11 May 2017 12:22:57 -0000
Content-Type: text/plain; charset="UTF-8"

hi Robert,

On Thu, May 11, 2017 at 12:48 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
>   (i'm sure there's a more appropriate forum to ask this, but i'm just
> going to throw myself on the mercy of the general OE list.)
>
>   i've been asked to help out with lashing together an OE build for a
> target board that will be based on qualcomm's snapdragon 410 APQ8016E,
> so the obvious choice for an initial reference system would be the
> 96boards.org-approved dragonboard 410c from arrow (i'm open to other
> suggestions for more fully-featured boards supported by OE):
>
>  http://www.96boards.org/product/dragonboard410c/
>
> but, wow, are there a bunch of places to start pulling content from.
>
>   i picked out the meta-qcom layer immediately:
>
>  http://git.yoctoproject.org/cgit/cgit.cgi/meta-qcom

As a disclaimer... I am the maintainer for the above layer (and also
very much involved with what Linaro/96boards does with dragonboard in
general).

Note that the layer is more generally maintained on github, and
mirror'd on YP git. So if you want to contribute you should use github
instead:

https://github.com/ndechesne/meta-qcom

>
> which has a machine definition for that very board, and i built a
> core-image-minimal image for that target with no trouble (have not
> loaded and tested yet, board supposedly arrives tomorrow). so far, so
> good. but when i perused further, i found all sorts of URLs with more
> info/content/layers, depending on what you were after:
>
>  git://git.linaro.org/landing-teams/working/qualcomm/kernel.git

This is the kernel tree maintained by Linaro. Everything that we do is
intended to end up in mainline kernel at some point, and in the mean
time we have development and release branches that we maintained for
our own builds.

At Linaro we are doing/supporting "linux" builds (based on Debian or
OE) and we  also have experimental Android builds based on AOSP.

Canonical has been using this tree as a starting point for their
Ubuntu Core port for the board as well. Several other distros are
doing similar things..

The kernel is *very* different from what you would find in shipping
Qualcomm products. Qualcomm has their own kernel tree for each SoC
that they support, and they *never* upgrade kernel. For MSM8916
chipset they shipped with a 3.10 based kernel. For the Linaro/96boards
builds, our kernel is being upgraded once a year, we track LTS
releases, so we currently support 4.9.

For reference the Qualcomm 'product/vendor' tree can be found here:

https://source.codeaurora.org/quic/la/kernel/msm-3.10/

>  https://www.codeaurora.org/openembedded-mass-market-and-ioe-qualcomm-snapdragon

This is a build from Qualcomm, which is derived from the Linaro Open
Embedded builds for Dragonboard. There aren't many differences between
what you can get from this build, vs what you can get from Linaro OE
builds for this board. In fact, you can consider this product as a
'downstream' of ours.

>  https://developer.qualcomm.com/hardware/dragonboard-410c

This is Qualcomm official developer page for the board. With chipset
documentation (h/w) and s/w documentation. The s/w documentation is
mostly about Qualcomm Android builds and the vendor kernel. You can
also find there the proprietary bootloader and firmware blob, which we
use even in our Linux builds.

>  https://github.com/96boards/

This is the home for some of the 96boards related projects, it's
mostly irrelevant in your situtation, most of what you expect/want can
be found in meta-qcom.

>  https://createpoint.qti.qualcomm.com/

this is a documentation data base from QCOM. You need to be authorized
for access , here. And based on your level of authorization, you will
have access to more or less documentation..

>
> and i'm not sure that's even the entire list i've seen.

in fact I believe there is also a Linux/OE based 'setup' that exists
somewhere, from Qualcomm, but using their very own vendor (e.g. 3.10)
kernel. I am not sure what this is about, and I don't have any detail
about this one.

>
>   specifically, i'm wondering where the canonical code base is for
> what i'm doing, and i was told that it's at that qualcomm location,
> for which one needs an account. a colleague has an account and let me
> peruse the qualcomm createpoint repo, but it seems that whatever i see
> there is available publicly, particularly at codeaurora.org.
>
>   can someone clarify how all these sites hang together, and where one
> starts? as i said, right now, the meta-qcom layer works right out of
> the box to build an image for that target. is it necessary to get
> access to qualcomm's createpoint repo? or is everything i might need
> available publicly at github and codeaurora?

meta-qcom can be used if what you want to rely *only* on open source
user space (including GPU driver from mesa/freedreno). If you are
required to use the Qualcomm vendor code, it will come with a custom
(and proprietary) user space (and I am not familiar with it).

meta-qcom will only pull the proprietary firmware for the board
(firmware-qcom-dragonboard410c .bb file).

>
>   thanks for any pointers.

I am happy to continue the discussion further.. I just tried to share
a few pointers. If you decide to spend more time with meta-qcom and/or
our linaro OE builds, we can continue the discussion here, or on our
dedicated ML, at
https://lists.linaro.org/mailman/listinfo/openembedded.

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

