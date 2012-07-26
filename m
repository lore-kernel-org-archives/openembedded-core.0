Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuLdS-00058O-L0
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:49:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2012 03:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186682988"
Received: from unknown (HELO helios.localnet) ([10.252.121.37])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 03:38:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 11:38:03 +0100
Message-ID: <1348620.0mAYnT0NtN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <98409DD0-BDE3-4F7D-B766-7B7B3E29F6AB@dominion.thruhere.net>
References: <1343297075-29312-1-git-send-email-paul.eggleton@linux.intel.com>
	<98409DD0-BDE3-4F7D-B766-7B7B3E29F6AB@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: [PATCH] usbutils: avoid dependency on bash
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
X-List-Received-Date: Thu, 26 Jul 2012 10:49:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 July 2012 12:24:44 Koen Kooi wrote:
> Op 26 jul. 2012, om 12:04 heeft Paul Eggleton het volgende geschreven:
> > By virtue of having #!/bin/bash, the usb-devices script declared that it
> > requires bash, however manual examinasion, checkbashisms and tests with
> > dash and busybox show that it doesn't contain any bashisms, so change
> > the script's header and remove the RDEPENDS on bash.
> 
> Is the update-usbids ash/dash safe as well nowadays?

Manual examination shows no bashisms, checkbashisms reports nothing, and it 
works fine with ash here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


