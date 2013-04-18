Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USlmK-0002tI-Mz
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 12:09:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Apr 2013 02:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,500,1363158000"; d="scan'208";a="296845180"
Received: from unknown (HELO helios.localnet) ([10.255.13.215])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2013 02:51:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Date: Thu, 18 Apr 2013 10:51:45 +0100
Message-ID: <4106612.QA7bhjolks@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <3703314.99C4OZ7x1c@yiqingliang-pc>
References: <1366270160.10502.18.camel@ted> <3703314.99C4OZ7x1c@yiqingliang-pc>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd/sysvinit in the 1.4 release
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
X-List-Received-Date: Thu, 18 Apr 2013 10:09:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 April 2013 17:27:50 Yi Qingliang wrote:
> Who need hybrid mode?

The most reasonable use-case is for using systemd in the main root filesystem 
and sysvinit within a rescue/initramfs image (without having to use two 
separate distro configurations).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


