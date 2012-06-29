Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkkNz-0002lx-PD
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 01:14:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2012 16:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171807503"
Received: from unknown (HELO envy.home) ([10.255.13.25])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2012 16:03:02 -0700
Message-ID: <4FEE33CB.3010609@linux.intel.com>
Date: Fri, 29 Jun 2012 16:01:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
	<53ce203eec118e3d5b0faac4c8e71f69c9857146.1340998763.git.dvhart@linux.intel.com>
	<CAMKF1sqrg5O7A1Tt=XjTzc0PfV5ZKcETe1tJfHOP460NNmpojw@mail.gmail.com>
In-Reply-To: <CAMKF1sqrg5O7A1Tt=XjTzc0PfV5ZKcETe1tJfHOP460NNmpojw@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Poky <poky@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 4/5] tasl-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS
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
X-List-Received-Date: Fri, 29 Jun 2012 23:14:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/29/2012 02:59 PM, Khem Raj wrote:

>>  ALLOW_EMPTY = "1"
>>  #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
>> @@ -46,7 +46,8 @@ RDEPENDS_task-core-sdk = "\
>>     distcc \
>>     ldd \
>>     file \
>> -    tcl"
>> +    tcl \
>> +    kernel-dev"
> 
> Doesn't this.make sdk to be machine specific now

It does indeed as the kernel-dev contains the system map, config, and
possibly even modified headers dependingon the KBRANCH.

Is task-core-sdk intended to be only architecture specific?

If so, I can just add kernel-dev to the -sdk image recipes directly
rather than modifying task-core-sdk.

Jessica, any opinion here?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




