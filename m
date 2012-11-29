Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Te2Jj-00064y-TM
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 12:30:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 03:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,184,1355126400"; d="scan'208";a="224194272"
Received: from unknown (HELO helios.localnet) ([10.252.122.249])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 03:15:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Thu, 29 Nov 2012 11:15:49 +0000
Message-ID: <1410350.L5GQZe9fm8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAF6bG8erj9dh95+FKNzX_Fx7Ujm0VcMRCRO9tNFLkw6Jo033_Q@mail.gmail.com>
References: <1354127226-24827-1-git-send-email-cazfi74@gmail.com>
	<50B66559.5010402@linux.intel.com>
	<CAF6bG8erj9dh95+FKNzX_Fx7Ujm0VcMRCRO9tNFLkw6Jo033_Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] readline: apply upstream patches
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
X-List-Received-Date: Thu, 29 Nov 2012 11:30:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 November 2012 21:31:44 Marko Lindqvist wrote:
> On 28 November 2012 21:26, Saul Wold <sgw@linux.intel.com> wrote:
> > I was going to add that I think the apply=yes is default and therefore not
> > required here.
> 
>  Is it for files that do not have .patch suffix? With my first quick
> test it didn't work.

Correct, it is still needed in the case where there is no .patch or .diff 
extension.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


