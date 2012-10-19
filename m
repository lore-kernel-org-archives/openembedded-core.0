Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TPF53-0008RS-Ph
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 18:05:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Oct 2012 08:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,613,1344236400"; d="scan'208";a="236032122"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2012 08:52:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2012 16:52:25 +0100
Message-ID: <2996317.jWZoZdIPNY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
MIME-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>, Mike Crowe <mac@mcrowe.com>
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 16:05:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 October 2012 08:46:23 Chris Larson wrote:
> On Fri, Oct 19, 2012 at 8:38 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > I'm having trouble using SSTATE_MIRRORS as suggested at
> > https://wiki.yoctoproject.org/wiki/Enable_sstate_cache :
> > 
> > SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/"
> 
> SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/PATH"

Note: with master / danny, but not denzil or earlier.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


