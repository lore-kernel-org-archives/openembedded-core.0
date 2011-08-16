Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QtHRp-0004HA-A5
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 13:04:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2011 03:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,379,1309762800"; 
   d="scan'208";a="7696362"
Received: from unknown (HELO helios.localnet) ([10.255.18.69])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2011 03:59:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 16 Aug 2011 11:59:50 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4E450925.7060101@windriver.com>
	<201108160956.02075.paul.eggleton@linux.intel.com>
	<4E4A4864.5020801@windriver.com>
In-Reply-To: <4E4A4864.5020801@windriver.com>
MIME-Version: 1.0
Message-Id: <201108161159.50642.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] Performance Issue: Build time increases
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
X-List-Received-Date: Tue, 16 Aug 2011 11:04:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 16 August 2011 11:37:24 Robert Yang wrote:
> I'm sorry to say that I have tried it, but I don't know its principle,
> and it made my git repo have too many untracked or modified files.

Is this when you specified a list of revisions to be applied to the repository 
prior to building? If so, I'm wondering if the script needs to do these in a 
different way - perhaps using a branch?

I'd like to know how you ran the script when you tried it. If you have any 
questions I'm happy to answer them, and I'd also be happy to spend some more 
time improving the scripts. Personally I think it would be useful to do this 
rather than using manual methods that are difficult to reproduce. The major 
benefit of the scripts is that you can start a bisect operation and "walk 
away", rather than having to monitor it constantly.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


