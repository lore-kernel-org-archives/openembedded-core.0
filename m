Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TxKvf-00022C-0s
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 18:13:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2013 08:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,507,1355126400"; d="scan'208";a="274728153"
Received: from unknown (HELO [10.255.15.40]) ([10.255.15.40])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2013 08:57:32 -0800
Message-ID: <50FD737C.9030003@linux.intel.com>
Date: Mon, 21 Jan 2013 08:57:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<1358739008.2945.29.camel@jethro.cheepee.homedns.org>
	<CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
In-Reply-To: <CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 17:13:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2013 04:12 AM, Burton, Ross wrote:
> On 21 January 2013 03:30, Ciprian Ciubotariu <cheepeero@gmx.net> wrote:
>> However, with oe-core/meta providing a default embedded policy, higher
>> layers need to remove sysvinit or systemd stuff from base recipes, which is
>> against bitbake's additive language design (only append/prepend functions,
>> no -= operator) and against separating concerns.
>
> If you don't do a systemd build, you won't get any of the systemd
> files.  Ditto, sysvinit (well, that's the goal - as it was an
> assumption until now that needs work still).
>
> An oe-core without *any* init system will be very cumbersome - every
> service will need a bbappend to actually work, with the subsequent
> maintenance costs.
>
Ouch, I thought that this was one of the goals of the select your init 
system, ie don't use either sysvinit or systemd.  Poky-Tiny has a single 
file rc.local script to do the initialization of the system.

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


