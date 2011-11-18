Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RRUh2-0004BA-7D
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 21:05:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2011 11:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="77480256"
Received: from unknown (HELO [10.7.199.102]) ([10.7.199.102])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2011 11:59:20 -0800
Message-ID: <4EC6B917.90007@linux.intel.com>
Date: Fri, 18 Nov 2011 11:59:19 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EC6B45A.9060107@intel.com>
	<CAMKF1spQ5roygTCMRtZ5nhfhV+S9520tJYdV5Lyt-MB-Je1XZA@mail.gmail.com>
In-Reply-To: <CAMKF1spQ5roygTCMRtZ5nhfhV+S9520tJYdV5Lyt-MB-Je1XZA@mail.gmail.com>
Subject: Re: qemu needs > 2 GB of RAM to build?
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
X-List-Received-Date: Fri, 18 Nov 2011 20:05:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 18/11/11 11:49, Khem Raj wrote:
> On Fri, Nov 18, 2011 at 11:39 AM, Scott Garman <scott.a.garman@intel.com> wrote:
>> Hi all,
>>
>> I'm testing building core-image-minimal in a resource-constrained
>> environment (a VirtualBox VM with 2300 MB of RAM allocated to it). With
>> PARALLEL_MAKE set to -j4 (the VM does have two CPUs allocated), I'm finding
>> that the build of qemu-native fails because the OOM killer steps in and
>> kills gcc. This is happening during the linking phase of building qemu.

What's BB_NUMBER_THREADS set to? I had to reduce to 1 to build
qemu-native on a laptop with 2GB RAM. iirc it had a habit of linking
something equally large such as eglibc, qt or the kernel at the same time.


> what distro are you running on guest ? it could be something wrong
> with the distro gcc or system

I've seen this on F14 (Gnome 2.x) and F15 (Gnome 3) with a laptop with
only 2GB RAM.

> 
>> If this is true, I assume it would pretty much mean that no one can build
>> our images without more than 2 GB of RAM. Is this true? Is this something
>> for us to be concerned about?
> 
> I have not seen such an error on a system which has 2G RAM all builds
> qemu-native fine here

I think BB_NUMBER_THREADS is the key here. And whether you're running
much in the way of a desktop environment.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


