Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QeWnt-0000Fw-G8
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 20:26:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2011 11:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,488,1304319600"; d="scan'208";a="26990115"
Received: from unknown (HELO [10.255.14.20]) ([10.255.14.20])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2011 11:22:37 -0700
Message-ID: <4E14A7EB.4030104@linux.intel.com>
Date: Wed, 06 Jul 2011 11:22:35 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Anders Darander <anders@chargestorm.se>
References: <cover.1309867242.git.anders@chargestorm.se>
	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
	<1309869846.2410.3.camel@phil-desktop>
	<201107051454.04409.anders@chargestorm.se>
	<1309871340.20015.700.camel@rex>
	<ECF13383-E711-4CE2-8E50-222852DC392D@chargestorm.se>
	<4E148F5C.4020902@linux.intel.com>
	<CADF341D-7B4B-416D-BAEE-38A5FC373788@chargestorm.se>
In-Reply-To: <CADF341D-7B4B-416D-BAEE-38A5FC373788@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module compile
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
X-List-Received-Date: Wed, 06 Jul 2011 18:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/06/2011 10:31 AM, Anders Darander wrote:
> Hi Darren,
> 
> On 6 jul 2011, at 18:37, "Darren Hart" <dvhart@linux.intel.com>
> wrote:
>> Please see the following commit log:
>> 
>> commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58 Author: Darren Hart
>> <dvhart@linux.intel.com> Date:   Tue Mar 8 17:09:10 2011 -0800
>> 
>> kernel/bbclass: rework kernel and module classes to allow for
>> building out-of-tree modul
>> 
>> 
>> In particular, the following:
>> 
>> Care is also taken to clean the hostprogs in scripts, and the
>> modules are responsible for building them as needed. Although it is
>> unclear to me if this is really necessary, especially considering
>> that modules put these bits back as soon as they compile. If we are
>> not generating an sstate package, I suspect we can ignore these.
>> 
>> The scripts are recreated during the build of module.bbclass
>> derived recipes. Are you trying to build modules independently of
>> this method? Richard expressed concerns about not including host
>> specific binaries in the sstate, which was part of the reason this
>> approach was taken.
> 
> Thanks for pointing out this, especially the first sentence in this
> paragraph. No matter how many times I've looked at both the recipes
> in question, as well as the meta/classes directory, I haven't noticed
> that the old, inherited recipes were not using module.bbclass, but
> rather inherited module-base.bbclass directly. I'll assume that once
> I change that, and fix the recipes properly all my issues will go
> away.
> 
> Once more, thanks for pointing me to the real problem.

Excellent, please keep us posted!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


