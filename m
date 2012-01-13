Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlivK-0003Qj-6S
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 16:20:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jan 2012 07:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106801738"
Received: from unknown (HELO envy.home) ([10.255.13.179])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2012 07:12:33 -0800
Message-ID: <4F1049CD.7070101@linux.intel.com>
Date: Fri, 13 Jan 2012 07:12:13 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
	<CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
	<1326096548.3234.3.camel@lenovo.internal.reciva.com>
	<4F0B153D.4000602@windriver.com>
	<CAP9ODKqGRj3DyZwwxCQrAGPX8mufX4NDAaMr2LiEHy1w6tHfPA@mail.gmail.com>
In-Reply-To: <CAP9ODKqGRj3DyZwwxCQrAGPX8mufX4NDAaMr2LiEHy1w6tHfPA@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2012 15:20:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/09/2012 08:52 AM, Otavio Salvador wrote:
> On Mon, Jan 9, 2012 at 14:26, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 1/9/12 2:09 AM, Phil Blundell wrote:
> 
>         You could take a look at the busybox-config.inc stuff in
>         oe-classic as a
>         starting point.  It doesn't do PACKAGECONFIG (since oe-classic
>         doesn't
>         have that) but it can do the equivalent with DISTRO_FEATURES.
> 
> 
>     At Wind River we've discussed using the kernel configuration
>     fragment patching process as a way to control busybox.  This would
>     allow the recipe to provide a default fragment (configuration), with
>     machines, architectures, and other configurations providing
>     additional fragments -- that together would produce the busybox that
>     the end use wants.
> 
>     I think this is a better long term approach then hacking the
>     defconfig file each time it's not quite right for a system.  (We may
>     still need to modify it over time, but the modifications need to be
>     considered "generic" based on the use of busybox in say
>     core-image-minimal...)
> 
> 
> I agree with the concept of the idea and long term solution however I
> also think it needs to be well documented otherwise it is going to be a
> problem, instead of a solution.
> 
> When I tried to use the kernel configuration fragment from Yocto I
> couldn't figure it out by myself and it seems very undocumented thus its
> learn curve is not as good as I'd hope for...

The need for something like this was also highlighted during my
poky-tiny work for Yocto. We need a config fragment manager for busybox,
although the yocto-kernel tools may be overkill. We also need something
that adjusts those fragments based on DISTRO_FEATURES, especially the
libc bits.

I can see the value of busybox "profiles", such as tiny and standard for
a start. The yocto-kernel tooling might be a good fit for this, but it
could also be accomplished with a couple busybox recipes and the
PREFERRED_PROVIDER mechanism.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


