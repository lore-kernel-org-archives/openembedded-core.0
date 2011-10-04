Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RBCT3-0006PN-0j
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 23:24:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Oct 2011 14:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,487,1312182000"; d="scan'208";a="74582310"
Received: from unknown (HELO [10.255.15.15]) ([10.255.15.15])
	by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2011 14:18:22 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1317762176.git.bruce.ashfield@windriver.com>
References: <cover.1317762176.git.bruce.ashfield@windriver.com>
Date: Tue, 04 Oct 2011 16:19:08 -0500
Message-ID: <1317763148.2323.92.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/1] linux-yocto: update live boot configuration
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
X-List-Received-Date: Tue, 04 Oct 2011 21:24:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks, Bruce.

And the SRCREVs have now also been updated for meta-intel/master and
meta-intel/edison.

Tom

On Tue, 2011-10-04 at 14:08 -0700, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Apologies to anyone that prefers these to be pushed out on top of oe-core,
> but my machine with those repos went down today and I wanted to get these
> out quickly, so this is based on top of my yocto/poky tree. I've also had
> to do this on top of my master branch (hence why you see the distro
> version patch), if we do need this on another branch let me know and I'll
> spend the time to re-create my environment on another machine to get
> things staged differently.
> 
> This is a series of changes from Tom to synchronize live boot settings
> across more machines, which are nicely isolated to a few boards.
> 
> Cheers,
> 
> Bruce
> 
> cc: Tom Zanussi <tom.zanussi@intel.com>
> 
> The following changes since commit c88b9915267f9a89983bb58faf3c30fe1dcdab43:
> 
>   poky.conf: Increment DISTRO_VERSION (2011-10-04 18:33:54 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (1):
>   linux-yocto: update live boot configuration
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 




