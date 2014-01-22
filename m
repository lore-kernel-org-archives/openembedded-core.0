Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B50D16C921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 12:27:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2014 04:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,699,1384329600"; d="scan'208";a="470683751"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2014 04:27:56 -0800
Message-ID: <52DFB95F.5080206@intel.com>
Date: Wed, 22 Jan 2014 14:28:15 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20140108173801.GB3709@jama>
In-Reply-To: <20140108173801.GB3709@jama>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 22 Jan 2014 12:27:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2014 07:38 PM, Martin Jansa wrote:
> Hi,
>
> since this patch:
> commit 263e654e5d28fa7f6b0c8cc23f57a31448e88a40
> Author: Valentin Popa <valentin.popa@intel.com>
> Date:   Wed Oct 30 12:27:39 2013 +0200
>
>      Mesa: upgrade to 9.2.2
>
>      * License is still MIT
>      * removed patches were already merged or
>        another solution was backported.
>
> I have to define MESA_EGL_NO_X11_HEADERS in qtbase and qtwebkit again to
> build them without xlib.h available (DISTRO without x11 in
> DISTRO_FEATURES).
>
> Are you sure that
> meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> was resolved in upstream?
>
> Regards,
Hi,
Sorry for this late response,
I removed that patch after testing wayland without X and worked.
I've tried yesterday to build qtbase  (meta-qt5) to see exactly what's 
the problem and determine if indeed part of that patch has to be 
upstream, but it was failing for not finding libGL (which of course, we 
don't build with mesa when DISTRO_FEATURES_remove="x11". Just not having 
X11 in DISTRO_FEATURES doesn't mean you'll not have it).
Can you please give me some info about your config vars or your 
environment so I find out what's the problem!? (I'm trying to reproduce 
the issue).

Thanks for rising the issue!

