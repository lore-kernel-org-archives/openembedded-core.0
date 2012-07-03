Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SlrZo-0001zP-Ui
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 03:06:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2012 17:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="160743104"
Received: from unknown (HELO envy.home) ([10.255.13.50])
	by orsmga001.jf.intel.com with ESMTP; 02 Jul 2012 17:55:45 -0700
Message-ID: <4FF242B8.1000401@linux.intel.com>
Date: Mon, 02 Jul 2012 17:54:16 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
	<CAMKF1srEBy_rLPp_DGr9zQ9WwRqma5JX6qRd6szBPQOf-AOv1A@mail.gmail.com>
In-Reply-To: <CAMKF1srEBy_rLPp_DGr9zQ9WwRqma5JX6qRd6szBPQOf-AOv1A@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] grub-efi: Do not use help2man
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
X-List-Received-Date: Tue, 03 Jul 2012 01:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/02/2012 04:42 PM, Khem Raj wrote:
> On Mon, Jul 2, 2012 at 1:09 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> Fixes [YOCTO #2527]
>>
>> Modify configure.ac and the generated configure script to avoid using
>> help2man during the compilation process. For grub-efi we are only
>> deploying the EFI payload and are not installing grub on the target
>> root filesystem. Therefor, we do not need the man pages.
>>
> 
> what if you do export HELP2MAN='true' in say do_configure ?
> 

I added HELP2MAN='true' to EXTRA_OECONF and it failed in the same way.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




