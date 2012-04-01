Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEJay-0003lM-5P
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 14:09:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Apr 2012 05:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125773300"
Received: from unknown (HELO helios.localnet) ([10.252.123.252])
	by azsmga001.ch.intel.com with ESMTP; 01 Apr 2012 05:00:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sun, 01 Apr 2012 13:00:09 +0100
Message-ID: <1967286.NbkyaBu6kN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F77BE14.6000304@windriver.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<2905489.oBl1N3jSJA@helios> <4F77BE14.6000304@windriver.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Sun, 01 Apr 2012 12:09:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 01 April 2012 10:31:48 Robert Yang wrote:
> On 04/01/2012 08:47 AM, Paul Eggleton wrote:
> > usr/bin/icemaker: No such file or directory
> 
> This is a known issue, there is an work around, it seems that the MACHINE is
> qemux86, and host is x86_64, we can:
> 
> cp
> tmp/work/i586-poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e9
> 6d2ed61fc-r0/git/build/bin/icemaker
> tmp/sysroots/x86_64-linux/usr/bin/icemaker
> 
> The problem is that we don't have a kdelibs4-native, and it seems it is not
> easy to add it.

Ah, I see I neglected to install kdelibs-devel; but on the version of Fedora I 
am building on when I do install it that executable is not provided (at 
version 4.6.5 perhaps it is too old). I've copied it as you suggested but then 
I run into the lack of kconfig_compiler. On this machine "yum whatprovides" 
tells me that the only package that provides kconfig_compiler is kdelibs3-devel 
which is clearly not what is needed.

I can't help feeling we need to have kdelibs4-native and forget the 
consequences of having to extend qt4-native if that's what's required; 
otherwise it's just too hard for people to build.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


