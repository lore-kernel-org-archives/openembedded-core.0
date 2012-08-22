Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T43fF-0002v9-Px
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 07:39:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 22:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,807,1336374000"; d="scan'208";a="136716638"
Received: from unknown (HELO [10.255.13.17]) ([10.255.13.17])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2012 22:27:30 -0700
Message-ID: <1345613248.17535.1.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 22 Aug 2012 00:27:28 -0500
In-Reply-To: <cover.1344876697.git.bruce.ashfield@windriver.com>
References: <cover.1344876697.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, scott.a.garman@intel.com
Subject: Re: [PATCH 0/1] [denzil] linux-yocto: make validate_branches handle non BSP branches
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
X-List-Received-Date: Wed, 22 Aug 2012 05:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-13 at 13:10 -0400, Bruce Ashfield wrote:
> Scott,
> 
> Here's a fix for validate_branches that comes from a pending master
> change that I've been running for 3 weeks, and one that TomZ has tested
> in his yocto BSP work on denzil.
> 
> It fixes some BSP use cases that involve setting a specific SRCREV
> on a base branch, so that a BSP branch that doesn't yet exist can 
> be created off of that known base. Previously only an existing BSP
> branch could have it's SRCREV restricted.
> 

Hi Scott,

I don't see this in denzil - do you have it queued for the next pull
request, or did it get missed?

Tom

> cc: Tom Zanussi <tom.zanussi@intel.com>
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 73cdebf60df225ee10f2eb215935be3b61e1b831:
> 
>   documentation/dev-manual/dev-manual-kernel-appendix.xml: Add note about conflict (2012-06-29 15:54:26 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel-denzil
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-denzil
> 
> Bruce Ashfield (1):
>   linux-yocto: allow do_validate_branches to handle all branches
> 
>  meta/classes/kernel-yocto.bbclass |  119 +++++++++++++++++++++++++------------
>  1 files changed, 80 insertions(+), 39 deletions(-)
> 




