Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SMG2O-0005L1-2g
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 11:58:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Apr 2012 02:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92026009"
Received: from dongxiao-osel.sh.intel.com (HELO [10.239.36.11])
	([10.239.36.11])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Apr 2012 02:48:53 -0700
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1335171085.git.dongxiao.xu@intel.com>
References: <cover.1335171085.git.dongxiao.xu@intel.com>
Date: Mon, 23 Apr 2012 17:45:46 +0800
Message-ID: <1335174346.26744.55.camel@dongxiao-osel>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 0/1 v2][PULL] Fix bug 2355
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
X-List-Received-Date: Mon, 23 Apr 2012 09:58:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-23 at 16:53 +0800, Dongxiao Xu wrote:
> Hi Richard,
> 
> This pull request is the second version to fix bug 2355, please help to review and pull.

Richard, there are some issue inside.
Please hold this change for a while.

Thanks,
Dongxiao

> 
> Changes from v1:
> Add an inherit for siteinfo.bbclass
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:
> 
>   self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore
> 
> Dongxiao Xu (1):
>   qt4: move functions from python to shell style
> 
>  meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
>  meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   15 +++++++++++--
>  meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
>  meta/recipes-qt/qt4/qt4.inc                 |   28 +++++++++++++++++++++++---
>  meta/recipes-qt/qt4/qt4_arch.inc            |   25 ------------------------
>  5 files changed, 38 insertions(+), 34 deletions(-)
>  delete mode 100644 meta/recipes-qt/qt4/qt4_arch.inc
> 




