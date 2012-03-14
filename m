Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S7pkz-0002Ch-BE
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:04:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2012 07:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128915045"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 07:56:06 -0700
Message-ID: <4F60B159.6010809@linux.intel.com>
Date: Wed, 14 Mar 2012 07:55:21 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<2970280.1QavEf7R15@helios>
	<CADkTA4OdMwB4gPNaYF7paaY9TLZV5YuQgqAVXzK4wT1pCxtrCw@mail.gmail.com>
	<1464522.1Gj9RCK92m@helios>
	<CADkTA4OjJgjGHVPB-qCFcrVyUXBoBApfmK+NCiAa8t9tH=ce9w@mail.gmail.com>
In-Reply-To: <CADkTA4OjJgjGHVPB-qCFcrVyUXBoBApfmK+NCiAa8t9tH=ce9w@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 15:04:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/14/2012 06:12 AM, Bruce Ashfield wrote:
> On Wed, Mar 14, 2012 at 9:03 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Wednesday 14 March 2012 08:59:34 Bruce Ashfield wrote:
>>> You could audit the constructed .config as well, since that's the final word
>>> on whether it actually makes it into the kernel build, but also not really
>>> required here.
>>
>> This is what I wanted to do, but I'm assuming the config construction happens
>> far too late to add the dependency.
> 
> Hmm. probably, I admit to not looking too deeply while trying to get enough
> coffee into my system to properly think :)

Paul is correct here. He would have to wait until kernel_configme
completes before he could be sure that LZMA was needed. Adding to
specific recipes is the best approach in this case.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


