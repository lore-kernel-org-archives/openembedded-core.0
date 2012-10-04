Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJttp-0006tw-Dk
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 00:28:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Oct 2012 15:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,537,1344236400"; d="scan'208";a="230133554"
Received: from unknown (HELO helios.localnet) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2012 15:15:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 04 Oct 2012 23:15:04 +0100
Message-ID: <2802325.XThoIn675D@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAMKF1spHjobcVYF=0kNgfUooo7nwQveKRZ6OLGaZ3HmcVMjxPg@mail.gmail.com>
References: <1349352468.32611.164.camel@phil-desktop>
	<20121004122716.GE3005@jama.jama.net>
	<CAMKF1spHjobcVYF=0kNgfUooo7nwQveKRZ6OLGaZ3HmcVMjxPg@mail.gmail.com>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: Only one copy of bitbake should be run against a build directory
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
X-List-Received-Date: Thu, 04 Oct 2012 22:28:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 October 2012 09:52:45 Khem Raj wrote:
> On Thu, Oct 4, 2012 at 5:27 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > The same does apply to bitbake-diffsigs now after IIRC this patch
> > http://git.openembedded.org/bitbake/commit/?id=cc70181659c07e04c205e178328
> > 46acf1ff31d28 before that I could use bitbake-diffsigs from any directory
> > (not only TOPDIR) and also when build in the same directory was still
> > running.
>
> and also to use runqemu

Leaving the issue of devshell aside for a second, I agree that this is fairly 
unnecessary for the utilities; if we can avoid the checks for those we should. 
I'll look into this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


