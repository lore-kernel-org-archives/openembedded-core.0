Received: from dd19416.kasserver.com ([85.13.139.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>)
	id 1UZKjp-0000mx-HJ; Mon, 06 May 2013 14:41:58 +0200
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 34E341840EC9;
	Mon,  6 May 2013 14:23:56 +0200 (CEST)
Message-ID: <5187A0D3.2080607@herbrechtsmeier.net>
Date: Mon, 06 May 2013 14:23:47 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<5183C9CF.3060304@herbrechtsmeier.net>
In-Reply-To: <5183C9CF.3060304@herbrechtsmeier.net>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 12:42:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.05.2013 16:29, schrieb Stefan Herbrechtsmeier:
> Am 02.05.2013 17:18, schrieb Martin Jansa:
>> On Sat, Apr 27, 2013 at 12:54:00PM +0200, Martin Jansa wrote:
>>> Updated status, but only change IIRC is fixed php, tbb,
>>> android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
>>> fix build on qemuarm again)
>>>
>>> qemuarm Summary: 19 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130426_185942.log/ 
>>>
>>> qemux86 Summary: 20 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130427_002532.log/ 
>>>
>>> qemux86-64 Summary: 22 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130427_044751.log/ 
>>>
>> Updated list, there were some nice fixes especially for gnome stuff, 
>> but this time it was
>> built with gcc-4.8 and binutils-2.23.2 so we have a lot more issues,
>> most of them were already reported in
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037715.html 
>>
>> so those are caused by gcc-4.8 not binutils-2.23.2
>>
>>> common (8):
>>>    I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc 
>>> to nonworking
>>>    and exclude compat-wireless-all, samsung-rfs-mgr from world + 
>>> check aurora-daemon (probably debugedit issue)
>>>
>>> meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb, 
>>> do_configure
> I have a patch for it to use linux-libc-headers instead of the 
> LINUX_KERNEL_DIR  which fix the build. I will send a patch next week.
Patch 'media-ctl: Use linux-libc-headers instead of linux kernel 
sources' should fix the issues with media-ctl on qemu.



