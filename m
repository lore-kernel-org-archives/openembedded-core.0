Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RgI17-0004mb-5v
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 16:35:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Dec 2011 07:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107017086"
Received: from unknown (HELO helios.localnet) ([10.252.122.61])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2011 07:28:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Garman <scott.a.garman@intel.com>
Date: Thu, 29 Dec 2011 15:28:23 +0000
Message-ID: <2928272.ngRFCSvnHg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4EFC81D0.1010402@intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
	<4EFB6201.7010900@linux.intel.com> <4EFC81D0.1010402@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Upgrade chrpath and libevent
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
X-List-Received-Date: Thu, 29 Dec 2011 15:35:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 29 December 2011 10:05:52 Scott Garman wrote:
> On 12/28/2011 01:37 PM, Saul Wold wrote:
> > This will probably require a PR bump for nfs-utils then.
> 
> Are you sure? I thought this was handled automatically as long as the
> recipe in question includes the build dependency in DEPENDS, as
> nfs-utils does for libevent.

Yes, if you want nfs-utils to be rebuilt you'll need to bump its PR. When we 
eventually move over to the PR server that won't be necessary.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


