Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Syk6E-0003pB-4R
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 15:45:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Aug 2012 06:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131157635"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Aug 2012 06:33:42 -0700
Message-ID: <502119AB.7090800@intel.com>
Date: Tue, 07 Aug 2012 16:35:39 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5020BDDF.8090900@intel.com>
	<CADkTA4OXS8D_pr_2Ufd1O4UcQb7+p9n2DtKr52iOX00=D9s-aQ@mail.gmail.com>
In-Reply-To: <CADkTA4OXS8D_pr_2Ufd1O4UcQb7+p9n2DtKr52iOX00=D9s-aQ@mail.gmail.com>
Subject: Re: ocf-linux package
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
X-List-Received-Date: Tue, 07 Aug 2012 13:45:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/07/2012 03:50 PM, Bruce Ashfield wrote:
> On Tue, Aug 7, 2012 at 3:03 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>> Do we need ocf-linux for something other than headers? The current recipe
>> looks like all it's doing is to install the headers. However, the README
>> file from the package talks about some kernel modules it provides and
>> patching the kernel for embedded systems. I don't have any experience with
>> this package, so, if somebody does, some additional info about how we use it
>> (or planning to use it) would be greatly appreciated.
> There are a series of kernel patches, I've been carrying them in various trees
> since 2.6.27. I do have a set of OCF patches that have been tested against
> the 3.4 kernel, so if there's interest, it's easy enough for me to make them
> available.
>
> The test steps for OCF can be found within the kernel patches, which
> is basically
> exercising /dev/cryptodev via a test application, and using it with
> openssl/ssh for
> acceleration. That being said, it is coupled to the BSP such that you
> need appropriate
> hardware, and kernel options enabled for any acceleration to happen.
>
> I've also seen everything from SMP to module loading kernel traps in
> the past, so it
> is definitely something that needs to be done in coordination with a
> use case, and
> a particular board.
>
> If we don't have a use case, or a board in mind, I'd suggest that it
> stay latent for
> now, or I could enable the base plumbing in the kernel and it remain
> "buyer beware".

Thanks Bruce for this info. I agree, if there is not immediate necessity 
we should leave it aside for now.

radu


