Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QPhwF-0008M0-3f
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:17:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 14:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="9583149"
Received: from unknown (HELO helios.localnet) ([10.255.12.82])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 14:14:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 22:14:44 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1306218459.git.sgw@linux.intel.com>
	<1306443683.5911.1.camel@vorpal.jf.intel.com>
	<4DDEC006.30701@linux.intel.com>
In-Reply-To: <4DDEC006.30701@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201105262214.44529.paul.eggleton@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [RFC 1/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Thu, 26 May 2011 21:17:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 26 May 2011 22:03:02 Darren Hart wrote:
> Yeah, this wasn't clear to me either. And my question in 2/2 still
> stands - what is the goal of the overhead factor?

I think the thinking was that the more software you have installed to begin 
with the more user data you're likely to need to store. Personally I think it 
would be simpler if we just set some additional overhead as an absolute value 
rather than a factor - if it needs to be different per image type then it 
easily can be.

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre


