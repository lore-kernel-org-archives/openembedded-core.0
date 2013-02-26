Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UATlT-0006Hc-9W
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 00:16:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2013 15:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="292207015"
Received: from unknown (HELO envy.home) ([10.255.12.203])
	by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2013 15:00:29 -0800
Message-ID: <512D3E8D.8050500@linux.intel.com>
Date: Tue, 26 Feb 2013 15:00:29 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<CAHUNapS415=P=zzNjkHfv5dF2ptUdpad8A74Hcxm=9eaQ588bw@mail.gmail.com>
	<512D2EA6.7090700@linux.intel.com>
	<CAHUNapR+Zgsw59+M0fAYv35BaA5Evc=+N2XJHUwzFn-KgDVYXw@mail.gmail.com>
In-Reply-To: <CAHUNapR+Zgsw59+M0fAYv35BaA5Evc=+N2XJHUwzFn-KgDVYXw@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Feb 2013 23:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/26/2013 02:37 PM, Trevor Woerner wrote:
> On Tue, Feb 26, 2013 at 4:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> On 02/26/2013 09:53 AM, Trevor Woerner wrote:
>>> On Tue, Feb 26, 2013 at 4:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> * Summary:
>>>>   [...]now we use the mkfs.ext3/ext4 to create the image, and use mkdebugfs.sh
>>>>   to copy the files to the image.
>>>
>>> For a while this had me confused because I somehow thought you were
>>> proposing using the Linux kernel's debugfs to create filesystems (i.e.
>>> mount -t debugfs none /sys/kernel/debug).
>>
>> It is confusing, unfortunately, debugfs is provided by e2fsprogs, not
>> something of our making. If you would prefer another name for
>> mkdebugfs.sh, that's fine. What would you propose?
> 
> mkextXfs.sh ?

Likely to be confused with mke2fs itself. Perhaps:

populate-extfs.sh ?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


