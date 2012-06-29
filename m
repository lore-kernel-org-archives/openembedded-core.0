Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SkbDe-0006Tk-EC
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 15:26:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5TDFhTg018548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jun 2012 06:15:43 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jun 2012 06:15:42 -0700
Message-ID: <4FEDAA70.3070009@windriver.com>
Date: Fri, 29 Jun 2012 09:15:28 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
	<4FED4226.30700@linux.intel.com>
	<CAMKF1sojfidUA9mne_RfXz+tE8d3pRboHbGxJL-dLD5wkeKVRw@mail.gmail.com>
	<4FED47D7.7080107@linux.intel.com>
	<CAMKF1sqm=A5za70vND38jdyUdUUyB017+OuoCWwpwBX3w6WWqA@mail.gmail.com>
In-Reply-To: <CAMKF1sqm=A5za70vND38jdyUdUUyB017+OuoCWwpwBX3w6WWqA@mail.gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel: Add kernel-headers package for target module build
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
X-List-Received-Date: Fri, 29 Jun 2012 13:26:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-29 03:22 AM, Khem Raj wrote:
> On Thu, Jun 28, 2012 at 11:14 PM, Darren Hart<dvhart@linux.intel.com>  wrote:
>>
>>
>> On 06/28/2012 11:04 PM, Khem Raj wrote:
>>> On Thu, Jun 28, 2012 at 10:50 PM, Darren Hart<dvhart@linux.intel.com>  wrote:
>>>>
>>>> However, I don't have a strong opinion here, I'll happily call it
>>>> kernel-devel if that is strongly preferred by some.
>>>
>>> in oe terminology it will be -dev
>>
>> THe other reason I didn't go that route is that we already have a
>> kernel-dev (although I don't much like the way it is used):
>>
>>  From kernel.bbclass:
>>
>> PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev \
>>             kernel-misc kernel-headers"
>> FILES = ""
>> FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>> FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
>> FILES_kernel-vmlinux = "/boot/vmlinux*"
>> # misc is a package to contain files we need in staging
>> FILES_kernel-misc = "/kernel/include/config /kernel/scripts
>> /kernel/drivers/crypto /kernel/drivers/media"
>> FILES_kernel-headers = "/usr/src/kernel-headers"
>>
>> And looking at that it appears I broke kernel-misc by moving things to
>> /usr/src (didn't notice that in my testing).
>>
>> How would you propose we redefine the above in order to use "kernel-dev"
>> for the new package?
>
> hmmm interesting so I guess, linux-dev being already taken, you might
> call it linux-kernel-headers as you were doing. So we have
> linux-libc-headers and linux-kernel-headers to differentiate between
> raw and sanitized headers

What would break if the new files were simply added to the existing 
kernel-dev
package ? I'm already putting System.map and others on targets in
different environments for dev/debug, so would adding enough to build
kernel modules on the target be a big problem ?

But I probably just don't understand *what* the existing -dev package
is used for, and my comment makes no sense :)

Outside of that, I also like linux-kernel-headers as the package name.

Cheers,

Bruce

>
>>
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>> Yocto Project - Linux Kernel
>>
>>



