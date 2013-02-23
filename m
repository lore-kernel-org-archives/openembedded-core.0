Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U9DZ6-0000IB-RH
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Feb 2013 12:47:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2013 03:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,721,1355126400"; d="scan'208";a="290922856"
Received: from unknown (HELO helios.localnet) ([10.252.120.141])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2013 03:30:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk, openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2013 11:30:34 +0000
Message-ID: <3284634.41HXpyBOqa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <5128858F.1030107@communistcode.co.uk>
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
	<7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
	<5128858F.1030107@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH] connman: enable connman client
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
X-List-Received-Date: Sat, 23 Feb 2013 11:47:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 23 February 2013 09:02:07 Jack Mitchell wrote:
> On 02/23/13 08:34, Ross Burton wrote:
> > Also the fact that you have to do this is depressing.  I wonder why
> > upstream doesn't want to install any of the tools?
>
> Connmanctl is a helper, even though I have connman in my image, I
> wouldn't want connmanctl. I assume this is why they don't ship it by
> default; as my use case is fairly normal for connman.

I would have thought if you had asked for the client to be built (or not asked 
for it not to be built, as the case may be) then surely you would want it 
installed (as far as make install goes anyway)?

> Which leads to the next point, this should be a seperate package.

Probably should be I think yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


