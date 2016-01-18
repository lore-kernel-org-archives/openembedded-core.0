Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AACBB65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:28:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 08:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,313,1449561600"; d="scan'208";a="729579012"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 18 Jan 2016 08:28:11 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id E3EC02C8001; Mon, 18 Jan 2016 09:16:07 -0800 (PST)
Received: from 10.252.12.252
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Mon, 18 Jan 2016 19:16:07 +0200 (EET)
Message-ID: <56864.10.252.12.252.1453137367.squirrel@linux.intel.com>
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
Date: Mon, 18 Jan 2016 19:16:07 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Yuqing Zhu" <b54851@freescale.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky][PATCH 00/13] Add patches for gstreamer 1.6
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
X-List-Received-Date: Mon, 18 Jan 2016 16:28:12 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> ---gstreamer1.0
>    Correct the setting for FLAG_DISCONT when push to adapter.
>
> ---gstreamer1.0-plugins-base
>    Fix taglist not being sent to down stream issue.
>    Fix audio/video decoder error.
>    Make gstaudiobasesink print warning instead of returning ERROR.
>    Disable orc optimization for lib video.
>    Add video crop supporting when convert frame.
>
> ---gstreamer1.0-plugins-bad
>    Fix mpegtsmux get wrong pid.
>    Add code type checking in mpeg4videoparse when draining.
>    Detect picture coding type when draining.
>    Fix frame rate info lost when fixating caps.
>    Add video stitching support based on Open CV.
>    Fix memory leak of navigation thread in glwindow.
>    Fix loop test hang in glimagesink.

Please explain what is the benefit of having these patches in oe-core
right now, instead of just getting the fixes automatically from future
upstream releases. Why are you submitting these patches in particular, are
they something that a lot of people will benefit from?

These patches add significantly to the maintenance burden of oe-core
recipes, and if they're difficult to forward port, they will simply be
dropped from the recipes when new versions of gstreamer are out.

Generally, we prefer to take patches that:
a) fix build issues, particularly those exposed by cross-compilation or
less common architectures.
b) fix issues that are embedded-specific.


Alex

