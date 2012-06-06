Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1ScJHV-0001fM-L0
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 18:40:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Jun 2012 09:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108587687"
Received: from unknown (HELO envy.home) ([10.255.12.60])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jun 2012 09:29:56 -0700
Message-ID: <4FCF8540.9000000@linux.intel.com>
Date: Wed, 06 Jun 2012 09:28:48 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <4FCE71F6.3060001@linux.intel.com>
	<CAJTo0LawLH56WhV8KcXXKxzP6b4MnrpQHrkoQ2q2PJ3BR+-8OQ@mail.gmail.com>
In-Reply-To: <CAJTo0LawLH56WhV8KcXXKxzP6b4MnrpQHrkoQ2q2PJ3BR+-8OQ@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: damien.lespiau@intel.com, "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
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
X-List-Received-Date: Wed, 06 Jun 2012 16:40:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/06/2012 05:39 AM, Burton, Ross wrote:
> Hi,
> 
> On 5 June 2012 21:54, Darren Hart <dvhart@linux.intel.com> wrote:
>>  * Disk Image
>>    - create partitioned images (not just volume images)
>>    - intended to be written to USB sticks, MMC drives, or SATA disks
>>    - may require a script to assemble the image for specific target
>>      devices.
> 
> Can we get an option to specify the size of the target device?  I've a
> 4GB stick that I'm using with .hddimg (being the lucky owner of a box
> that actually boots them!) and it's sad to see the rootfs being only a
> little bigger than the contents when there is about 3.5G of empty disk
> space available.

I believe this is a better fit for the diskimage type with proper
partitions. I don't have data regarding performance of a loop mounted
filesystem versus a proper block device, but my gut feel is that using
block devices for large partitions will provide a better experience.

If we did want to allow for the use of the entire disk, we should find a
way to do so without bloating the image files themselves with empty
filesystem space. Does anyone know if we can use sparse files to
accomplish this with rootfs.img?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


