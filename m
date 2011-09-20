Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R61tb-0000nY-7D
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 17:06:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2011 08:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,411,1312182000"; d="scan'208";a="50919918"
Received: from unknown (HELO [10.255.14.183]) ([10.255.14.183])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2011 08:00:43 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 08:00:38 -0700
In-Reply-To: <cover.1316471892.git.josh@linux.intel.com>
References: <cover.1316471892.git.josh@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316530843.2151.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Various hob fixes
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
X-List-Received-Date: Tue, 20 Sep 2011 15:06:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Wrong list, apologies for the noise!

Joshua
On Mon, 2011-09-19 at 15:41 -0700, Joshua Lock wrote:
> This series contains 3 bug fixes.
> 
> The first has been submitted previously but hasn't been applied or commented
> on so I've rolled it into this pull request.
> 
> Patch one and two contain bug fixes for reported issues, patch three is a
> minor change but a noticable one should one stumble accross it.
> 
> Please review and consider for master and the Yocto 1.1 release.
> 
> Regards,
> Joshua
> 
> The following changes since commit 3e7f8afeacf7c8c8de3e87778a3907e33d4a06b3:
> 
>   fetch2/git: fix subpath destination directory (2011-09-19 12:33:38 +0100)
> 
> are available in the git repository at:
>   git://github.com/incandescant/bitbake hob
>   https://github.com/incandescant/bitbake/tree/hob
> 
> Joshua Lock (3):
>   ui/crumbs/hobprefs: re-enable reloading of data after prefs changes
>   hob: fix build again when building packages only
>   hob: enable package only builds even if an image has been built
> 
>  lib/bb/ui/crumbs/hobeventhandler.py |   13 +++++--------
>  lib/bb/ui/crumbs/hobprefs.py        |    2 +-
>  lib/bb/ui/hob.py                    |   12 ++++++++----
>  3 files changed, 14 insertions(+), 13 deletions(-)
> 

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



