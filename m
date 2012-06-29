Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkUfi-0005vH-FJ
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 08:27:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 23:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="164382295"
Received: from unknown (HELO envy.home) ([10.255.12.71])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 23:16:17 -0700
Message-ID: <4FED47D7.7080107@linux.intel.com>
Date: Thu, 28 Jun 2012 23:14:47 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
	<4FED4226.30700@linux.intel.com>
	<CAMKF1sojfidUA9mne_RfXz+tE8d3pRboHbGxJL-dLD5wkeKVRw@mail.gmail.com>
In-Reply-To: <CAMKF1sojfidUA9mne_RfXz+tE8d3pRboHbGxJL-dLD5wkeKVRw@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 29 Jun 2012 06:27:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/28/2012 11:04 PM, Khem Raj wrote:
> On Thu, Jun 28, 2012 at 10:50 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>> However, I don't have a strong opinion here, I'll happily call it
>> kernel-devel if that is strongly preferred by some.
> 
> in oe terminology it will be -dev

THe other reason I didn't go that route is that we already have a
kernel-dev (although I don't much like the way it is used):

From kernel.bbclass:

PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev \
            kernel-misc kernel-headers"
FILES = ""
FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
FILES_kernel-vmlinux = "/boot/vmlinux*"
# misc is a package to contain files we need in staging
FILES_kernel-misc = "/kernel/include/config /kernel/scripts
/kernel/drivers/crypto /kernel/drivers/media"
FILES_kernel-headers = "/usr/src/kernel-headers"

And looking at that it appears I broke kernel-misc by moving things to
/usr/src (didn't notice that in my testing).

How would you propose we redefine the above in order to use "kernel-dev"
for the new package?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




