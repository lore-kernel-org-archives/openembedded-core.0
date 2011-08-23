Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvxKK-00019S-QE
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 22:12:01 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2011 13:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,271,1312182000"; d="scan'208";a="10300019"
Received: from unknown (HELO helios.localnet) ([10.255.18.108])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 13:07:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Tue, 23 Aug 2011 21:07:11 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<201108191127.48228.paul.eggleton@linux.intel.com>
	<4E53FA98.1060909@linux.intel.com>
In-Reply-To: <4E53FA98.1060909@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201108232107.11656.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 20:12:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 23 August 2011 20:08:08 you wrote:
> On 08/19/2011 03:27 AM, Paul Eggleton wrote:
> > I guess it would, but I'm not sure we really want to be encouraging users
> > to use -f.
> 
> I don't see it as having the same negative conotation as the force
> options to things like rpm and dpkg. Here it just means "I really want
> to run this specific task again, even if you already ran it, likely
> because I know I did something to undo what you just did." :-)

My concern is that not all tasks are repeatable; people could run into all 
sorts of trouble using this option under the wrong circumstances and it might 
be difficult to debug after the fact.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


