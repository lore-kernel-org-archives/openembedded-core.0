Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TbSqk-00063L-Vw
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 10:13:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2012 00:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,299,1352102400"; d="scan'208";a="222992797"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2012 00:59:19 -0800
Message-ID: <50ADE966.4060300@intel.com>
Date: Thu, 22 Nov 2012 10:59:18 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net> <50ADE2F7.4070904@intel.com>
	<20121122083735.GU12637@jama.jama.net>
In-Reply-To: <20121122083735.GU12637@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Thu, 22 Nov 2012 09:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> 
> Does qemuarm include this driver? I guess not. I don't know what exactly
> is "autobuilder nightlies" but did it include xf86-video-omap explicitly
> or just some generic image?
The autobuilder nightly for arm (for example) does, among other things,
the following:
* Builds core-image-sato, core-image-sato-dev, core-image-sato-sdk,
core-image-minimal, core-image-minimal-dev for qemuarm
* Builds core-image-sato, core-image-sato-sdk, core-image-minimal for
beagleboard
* Builds the meta-toolchain-gmae

Here's a link to one of the latest arm nightly builds. You can see that,
for beagleboard, it includes xf86-video-omap driver:

http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/727

This is the production autobuilder. The autobuilder server I used to
test the patches is internal and cannot be accessed from outside.
> 
> Also I cannot find this commit in oe-core as well as poky (I'm using
> oe-core).
Here's the link:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=78983e939ab17f02f8911c8b0d0e326b419856b9

Thanks,
Laurentiu


