Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SWpQE-0000XX-La
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 15:46:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 May 2012 06:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146251240"
Received: from unknown (HELO helios.localnet) ([10.252.120.151])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 06:36:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Tue, 22 May 2012 14:36:34 +0100
Message-ID: <1823492.ykGXyerc6j@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FBB9471.6040905@opendreambox.org>
References: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
	<2080721.YZu0iU2L4T@helios> <4FBB9471.6040905@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qt4(-embedded).inc: create variables to ease overriding
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
X-List-Received-Date: Tue, 22 May 2012 13:46:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 22 May 2012 15:28:17 you wrote:
> On 22.05.2012 14:51, Paul Eggleton wrote:
> > I think when we start getting to this level, especially because some of
> > these options imply extra DEPENDS, we should try to use PACKAGECONFIG
> > rather than specific variables.
> 
> Introducing PACKAGECONFIG is a more complex change. It can still be done
> in a later patch. 

It could be, but then we're introducing variables that will potentially go 
into people's distro configs only to take them away in the near future. I'm not 
especially keen on doing that.

> This patch just follows the semantics introduced by
> QT_SQL_DRIVER_FLAGS 

Right, and when that was introduced some time ago we did not have 
PACKAGECONFIG at all.

I realise this puts extra burden upon you, sorry about that. I can perhaps 
offer to do the PACKAGECONFIG changes for you, but I won't be able to get to 
them until next week at the earliest.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


