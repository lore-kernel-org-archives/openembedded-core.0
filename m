Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1UMdct-0001gH-6q; Mon, 01 Apr 2013 14:14:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2013 04:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,385,1363158000"; d="scan'208";a="311691455"
Received: from unknown (HELO helios.localnet) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2013 04:57:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Mon, 01 Apr 2013 12:57:03 +0100
Message-ID: <1410613.FPl62IiBfB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <20130401104758.GB9978@windriver.com>
References: <3982011.Guen6pOcoq@helios> <20130401104758.GB9978@windriver.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: New OE layer index now available
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
X-List-Received-Date: Mon, 01 Apr 2013 12:14:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 April 2013 06:47:59 Joe MacDonald wrote:
> I like it, though I have a couple of questions about the accounts
> themselves.
> 
>    - Any chance we could have them connected (or use the same
>      credentials as) the patchworks ones?

Seems like they are both based on Django so I guess it would be possible; the 
only impediment (assuming there was no Django version mismatch) would be that 
patchwork is currently on different infrastructure.

>    - If not, what options can we set on accounts?  Right now I just see
>      "log out" and "change password".  Both pretty important, but I'd
>      also like to add alternate email addresses, for example, since I
>      use two quite regularly and update meta-networking from both.

There's no alternate email address field; one could be added I suppose but the 
question is, how would you like this to be used within the index?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


