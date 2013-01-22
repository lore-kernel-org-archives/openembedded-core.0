Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Txlya-00076i-T0
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 23:06:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2013 13:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,516,1355126400"; d="scan'208";a="275356928"
Received: from unknown (HELO envy.home) ([10.255.15.29])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2013 13:50:20 -0800
Message-ID: <50FF099C.5080203@linux.intel.com>
Date: Tue, 22 Jan 2013 13:50:20 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<50FEFA22.2090008@linux.intel.com>
	<CAMKF1spq_du8mB2nAvqcYQG7izORFHTkZFTBhUCE3SrJZ3KU2Q@mail.gmail.com>
In-Reply-To: <CAMKF1spq_du8mB2nAvqcYQG7izORFHTkZFTBhUCE3SrJZ3KU2Q@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 22 Jan 2013 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/22/2013 01:44 PM, Khem Raj wrote:
> On Tue, Jan 22, 2013 at 12:44 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>> Makes me nervous... only because I'm not well versed enough across the
>> architectures to catch some little gotchas. How much testing has this
>> seen? Which architectures?
> 
> little but then I did not propose it for inclusion into master yet so
> why worry ?

I assumed that would be the target eventually - is that not the case?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


