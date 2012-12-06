Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgdL7-0006iH-BT for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 16:26:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6FBo9g030052;
	Thu, 6 Dec 2012 15:11:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29127-06; Thu,  6 Dec 2012 15:11:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6FBg7V030045
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 15:11:44 GMT
Message-ID: <1354806692.25268.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 06 Dec 2012 15:11:32 +0000
In-Reply-To: <cover.1354779942.git.sgw@linux.intel.com>
References: <cover.1354779942.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/71] Updates and Patches (cover letter only)
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
X-List-Received-Date: Thu, 06 Dec 2012 15:26:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-05 at 23:52 -0800, Saul Wold wrote:
> Richard,
> 
> This has been brewing for a few days now, I have built this locally and
> done some testing as well as a run on the Autobuilder and I have either
> address the failures (backed out pseudo change) 
> 
> High Level Items:  
> 
> SMART: 
> I have included some of Marks initial SMART changes, but not the changes
> that pull the lever to convert to SMART, there are still some issues there 
> that need resolving.
> 
> Package Updates:
> They are tested and look good.
> 
> BinUtils:
> Things are building and behaving correctly.
> 
> PR Server changes:
> I have not reviewed or tested, but they build I need more information 
> myself on reviewing and testing these.
> 
> 
> Overall I think this is a good set to take in early M2, I have replied to
> patches that caused problems with the build.
> 
> Please do a final review and take what you see as appropriate.

There are patches in here which have never been posted on the mailing
list as far as I can tell :/.

I've ended up tweaking some patches since I really don't want to
overhead of rejecting and getting them back again...

> Andrei Dinu (1):
>   Added regex functionality to distrodata.bbclass

This one has "import os" and "import bb" statements which are unneeded.
I've removed them.

> Khem Raj (6):
>   kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC

I've pushed back on this one again. There are some things I want to
double check.

>   util-linux: Package systemd files correctly

This has a weird commented out line in it. I removed it.

> Mark Hatle (12):
>   update-alternatives.bbclass: Add missing runtime dependency

I've replied to this patch.

> 
> Martin Jansa (5):
>   scripts/sstate-diff-machines.sh: add simple script to compare sstate
>     checksums between MACHINEs
>   scripts/sstate-sysroot-cruft.sh: add simple script to find files in
>     sysroots not tracked by sstate

Further discussion looks to be happening about one of these so I held
off for now.

>   git: fix unpackaged python files

This was superceeded.

> Otavio Salvador (1):
>   initramfs-framework: init: Stop mount warnings during boot

This just has a PR bump in it? Corrupted?

> Ross Burton (1):
>   mesa: merge internal libraries into mesa-dri package

Dropped at Ross' request.

> Saul Wold (3):
>   sstate: fetch .siginfo files from SSTATE_MIRROR

I tweaked this one ;-).


Cheers,

Richard





