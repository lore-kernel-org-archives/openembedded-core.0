Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tlhp1-0006Yf-L3
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:14:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2012 06:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="267752439"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2012 06:59:21 -0800
Message-ID: <50D327C8.4040703@intel.com>
Date: Thu, 20 Dec 2012 16:59:20 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
	<1356009340-15874-2-git-send-email-laurentiu.palcu@intel.com>
	<CAJTo0LbMxNc4JJMw+F+sUnsQAWiBorty_Tfbyw+ZWuU0UPVg0Q@mail.gmail.com>
In-Reply-To: <CAJTo0LbMxNc4JJMw+F+sUnsQAWiBorty_Tfbyw+ZWuU0UPVg0Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] qemu.bbclass: add qemu_run_binary() function
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
X-List-Received-Date: Thu, 20 Dec 2012 15:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/20/2012 04:45 PM, Burton, Ross wrote:
> On 20 December 2012 13:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> dynamic_loader = rootfs_path + '$(readelf -l ' + rootfs_path + \
>>       binary + '| grep "Requesting program interpreter"|sed -e \'s/^.*\[.*: \(.*\)\]/\\1/\')'
> 
> Would it be easier to do the string manipulation in python?  Spawning
> grep and sed when Python can do string manipulation seems excessive.
Ok, I agree. But how do you call python routines from the postinstall
scriptlets which run in do_rootfs context? readelf needs to run at
postinstall time because the binary we run through qemu does not
necessarily belong to the same package. Let's take, for example, the
current patchset. You can have a recipe that provides an input method
module and call gtk-query-modules-2.0 binary to create the cache.

If you know a method to do it, feel free to share.

Thanks,
Laurentiu

> 
> Nice addition to the class though.
> 
> Ross
> 


