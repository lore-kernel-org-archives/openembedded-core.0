Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm5xq-0000dp-Od
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 18:28:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 09:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166401541"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 09:17:31 -0700
Message-ID: <4FF31B1B.2090105@linux.intel.com>
Date: Tue, 03 Jul 2012 09:17:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207031150230.31710@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207031150230.31710@oneiric>
Subject: Re: what's the easiest way to download *all* recipe-referenced tarballs?
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
X-List-Received-Date: Tue, 03 Jul 2012 16:28:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 08:54 AM, Robert P. J. Day wrote:
>
>    followup to once upon a time post of mine, i'm prepping to give a
> tutorial in OE/yocto, and it would be nice if the client could, ahead
> of time, set up a premirror of every conceivable tarball that is used
> by any recipe in oe-core.
>
>    can that be done?  easily?  i can see configuring for a build,
> selecting a MACHINE, then doing "bitbake -c fetchall world", or some
> variation thereof.  but that would be MACHINE-specific.
>
We added a "universe" target for fetching and stats gathering, but it's 
not appropriate for building, it should get everthing, unless there is a 
MACHINE-specific variable in SRC_URI, which I don't think we have.

Sau!

>    is there a better way?  i just want a stash of tarballs ready to go
> so we don't waste a lot of time downloading.
>
> rday
>


