Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RWX0E-0008KJ-Pi
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 18:34:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 09:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,284,1320652800"; d="scan'208";a="81589485"
Received: from unknown (HELO helios.localnet) ([10.252.121.254])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 09:27:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 02 Dec 2011 17:27:41 +0000
Message-ID: <1477738.LtqQ04SYOs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CAEsOVNdALC9P7rqrDpo4upMiT_VX6BaE5nJY0c0OrkWW+Bmusg@mail.gmail.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
	<2fe1910927e5741631767ed3611e361749c75d3c.1322812458.git.edwin.zhai@intel.com>
	<CAEsOVNdALC9P7rqrDpo4upMiT_VX6BaE5nJY0c0OrkWW+Bmusg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] x11vnc: Upgrade to 0.9.13
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
X-List-Received-Date: Fri, 02 Dec 2011 17:34:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 December 2011 17:21:57 McClintock Matthew-B29882 wrote:
> On Fri, Dec 2, 2011 at 1:55 AM,  <edwin.zhai@intel.com> wrote:
> > -PR = "r2"
> > +PR = "r0"
> 
> Isn't this wrong?

In this case since PV has been increased at the same time (by renaming the 
recipe) it's not only OK, it's recommended practice.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


