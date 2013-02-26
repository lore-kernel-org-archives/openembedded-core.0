Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UAShp-0004DG-ED
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:09:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 13:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="290886914"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.55])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2013 13:52:39 -0800
Message-ID: <512D2EA6.7090700@linux.intel.com>
Date: Tue, 26 Feb 2013 13:52:38 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<CAHUNapS415=P=zzNjkHfv5dF2ptUdpad8A74Hcxm=9eaQ588bw@mail.gmail.com>
In-Reply-To: <CAHUNapS415=P=zzNjkHfv5dF2ptUdpad8A74Hcxm=9eaQ588bw@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Create ext* filesystems using debugfs
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
X-List-Received-Date: Tue, 26 Feb 2013 22:09:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/26/2013 09:53 AM, Trevor Woerner wrote:
> On Tue, Feb 26, 2013 at 4:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> * Summary:
>>   [...]now we use the mkfs.ext3/ext4 to create the image, and use mkdebugfs.sh
>>   to copy the files to the image.
> 
> For a while this had me confused because I somehow thought you were
> proposing using the Linux kernel's debugfs to create filesystems (i.e.
> mount -t debugfs none /sys/kernel/debug). Maybe I'm still confused,
> but if not I think, perhaps, it would be nice to come up with a better
> name for this script since the name clash will probably trip others up
> too.

It is confusing, unfortunately, debugfs is provided by e2fsprogs, not
something of our making. If you would prefer another name for
mkdebugfs.sh, that's fine. What would you propose?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


