Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QDvbK-0002ZZ-PE
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Apr 2011 11:27:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2011 02:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,262,1301900400"; d="scan'208";a="737632206"
Received: from unknown (HELO helios.localnet) ([10.255.12.207])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2011 02:25:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Apr 2011 10:25:03 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.1; i686; ; )
References: <201104211704.37707.paul.eggleton@linux.intel.com>
	<1303413680.5518.359.camel@rex>
	<BANLkTime-0+ye-PRrZW5F9zSu9WNvSERYg@mail.gmail.com>
In-Reply-To: <BANLkTime-0+ye-PRrZW5F9zSu9WNvSERYg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201104241025.03973.paul.eggleton@linux.intel.com>
Subject: Re: [RFC] meta-handheld
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
X-List-Received-Date: Sun, 24 Apr 2011 09:27:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 23 April 2011 00:09:38 Andrea Adami wrote:
> I agree with Richard, for keeping it as meta- group.
> About expectations, at least for Zaurus I don't see problems: vanilla
> 2.6.38 kernel, actual udev, imminent move to xorg-xserver if kdrive is
> finally doomed.
>
> Ipaq's seem suffering more bitrot...

This is a problem, yes. Most of the iPAQs require 2.6.21-hh which is ancient 
and unmaintained and as we know presents difficulties with modern udev. Some of 
the iPAQs will work with mainline but many functions will be unavailable. This 
is something I hope can be sorted out - surely by now a lot of the "ip blocks" 
used within iPAQs and other PDAs are now in mainline already and all that's 
necessary is some plumbing...?

Anyway, I'm concerned that if these machines get pushed out to some random 
repo it's only going to make things worse. I think we can mitigate the 
concerns about people rushing in only to find that the level of support for 
their device is less than they hoped simply by being crystal clear about each 
device's status in documentation (e.g. a wiki page), something which we have 
not been good at recently. (Am I volunteering to maintain this information as 
well? Naturally :) )

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre (UK)


