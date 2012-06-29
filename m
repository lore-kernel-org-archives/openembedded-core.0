Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkUKq-0005N4-Uq
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 08:05:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2012 22:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171502522"
Received: from unknown (HELO envy.home) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2012 22:54:44 -0700
Message-ID: <4FED42C9.6010402@linux.intel.com>
Date: Thu, 28 Jun 2012 22:53:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<e5738406d99b07701d77d873a5a6c9ea95b4adb2.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sqpt2uONWcXBM2mH8otYE2XXoGSGW1uDwi-3VCLcV033Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqpt2uONWcXBM2mH8otYE2XXoGSGW1uDwi-3VCLcV033Q@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 2/4] linux-yocto: Use INC_PR and move kernel require to linux-yocto.inc
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
X-List-Received-Date: Fri, 29 Jun 2012 06:05:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/28/2012 09:50 PM, Khem Raj wrote:
> On Thu, Jun 28, 2012 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> +INC_PR = "r0"
>> +
> 
> it is diverting a recipe which once had PR = "r2"
> back to "r0" this should instead be
> 
> INC_PR = "r3" here which is largest pr value + 1

Duh. Fixed in the branch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=dvhart/modules&id=2de1e7bb6fba137fe2ef7047f16a63c4824551c1

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




