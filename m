Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TbSQ6-0004th-B5
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 09:46:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2012 00:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,299,1352102400"; d="scan'208";a="250959391"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2012 00:31:52 -0800
Message-ID: <50ADE2F7.4070904@intel.com>
Date: Thu, 22 Nov 2012 10:31:51 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net>
In-Reply-To: <20121121162051.GK12637@jama.jama.net>
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
X-List-Received-Date: Thu, 22 Nov 2012 08:46:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/21/2012 06:20 PM, Martin Jansa wrote:
> On Wed, Nov 14, 2012 at 03:21:10PM +0200, Laurentiu Palcu wrote:
>> > This new recipe is needed because the old driver is unmaintained. This
>> > new recipe will follow the new repo.
> On which MACHINE did you test this? Here it fails in do_configure with:
> | configure:18796: result: yes
> | configure:18808: checking whether to include DRI support
> | configure:18812: checking for /usr/include/xorg/dri.h
> | configure:18818: error: cannot check for file existence when cross compiling
> 
> So I'm wondering if it was tested at all.
> 
Martin,

I remember that I clearly mentioned, in the cover letter, the commit
upon which I applied the patches before compiling the nightlies for all
architectures. Here it is:

"The yocto autobuilder nightlies (x86/x86_64/ppc/arm/mips) compiled
successfully. Compilations were done on top of the following commit:
78983e939ab17f02f8911c8b0d0e326b419856b9."

At the moment I was working on the xorg upgrades this was the last
commit... Did you try the patches on top of this commit? Does the
compilation fail?

Thanks,
Laurentiu



