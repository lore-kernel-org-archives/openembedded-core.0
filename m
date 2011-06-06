Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTjRG-0002Dd-Po
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 01:42:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2011 16:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,328,1304319600"; 
   d="scan'208";a="9899957"
Received: from unknown (HELO [10.255.13.99]) ([10.255.13.99])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2011 16:39:12 -0700
Message-ID: <4DED6520.9020909@linux.intel.com>
Date: Mon, 06 Jun 2011 16:39:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307402014.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1307402014.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] pseudo: Update pseudo to 1.1.1 version
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
X-List-Received-Date: Mon, 06 Jun 2011 23:42:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2011 04:15 PM, Mark Hatle wrote:
> Update pseudo to latest release version.
>
> This has been tested with an core-minimal-image, as well as existing
> pseudo tests outside of oe-core.
>
> The following changes since commit 925de3b3e74d15547840a2edaceff437e135bddd:
>
>    tzcode: Update to 2011g (2011-06-06 15:52:18 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/pseudo
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=WIP
>
> Mark Hatle (1):
>    pseudo: Update pseudo to 1.1.1 version
>
>   meta/recipes-devtools/pseudo/pseudo.inc            |   10 +++++-----
>   .../pseudo/{pseudo_1.0.bb =>  pseudo_1.1.1.bb}      |    4 ++--
>   meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +++---
>   3 files changed, 10 insertions(+), 10 deletions(-)
>   rename meta/recipes-devtools/pseudo/{pseudo_1.0.bb =>  pseudo_1.1.1.bb} (51%)
>
Mark,


Could you create an entry in the distro_tracking_fields.inc for pseudo 
and mark yourself as owner, there might be part of one in there already.

Check the wiki for details on what's needed.


Thanks
	Sau!


