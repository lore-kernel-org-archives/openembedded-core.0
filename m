Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3sx8-0006hW-Et
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 19:08:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 10:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="48805636"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2011 10:03:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 10:03:38 -0700
In-Reply-To: <cover.1315961467.git.mark.hatle@windriver.com>
References: <cover.1315961467.git.mark.hatle@windriver.com>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316019818.1058.28.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] Update to latest prelinker -- fix arm and x86 issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 14 Sep 2011 17:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 19:52 -0500, Mark Hatle wrote:
> This fixes yocto bugzilla bug 1473.  It addresses an issue where a typecast
> wasn't being specified and the compiler was doing the wrong thing in a 
> printf.
> 
> The symbols of the previous failure were, on a 32-bit IA32 host, targeting
> either a 32-bit IA32 target or ARM target the results of a prelinked image
> may not work properly.
> 
Mark,

There is still a problem with the prelinker, it seems to clobber text in
X11 on qemux86, we get a build that has square blocks for text.

Sau!

> The following changes since commit 3be290aac4da885fe5bc31797c4a689196c63b7a:
> 
>   libzypp: move package-manger to it own package (2011-09-13 16:19:30 -0700)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/prelink
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink
> 
> Mark Hatle (1):
>   Uprev to latest version of prelink_git, fixing TLS issues
> 
>  meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 




