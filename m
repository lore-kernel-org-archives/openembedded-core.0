Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B67026B212
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 20:19:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 13:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,977,1367996400"; d="scan'208";a="394926284"
Received: from unknown (HELO [10.255.15.104]) ([10.255.15.104])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 13:19:10 -0700
Message-ID: <1377721150.1643.17.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 28 Aug 2013 15:19:10 -0500
In-Reply-To: <cover.1377720350.git.bruce.ashfield@windriver.com>
References: <cover.1377720350.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto/3.10: M4 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2013 20:19:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-28 at 16:12 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Here's an update of the linux-yocto-3.10 SRCREVs for the dropbear
> ssh issue, and a config change to restore existing behaviour.
> 
> Credit goes to TomZ for tracking down the root cause. We'll continue to

And to Darren for identifying the actual commit ;-)

Tom

> dig at this more and see what the permanent fix will be .. and whether or
> not this needs to be fixed upstream.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 2051e4dff4384e1b618a050aeebf72a76cadab4b:
> 
>   midori: use BPN instead of PN (2013-08-28 09:31:10 +0100)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (1):
>   linux-yocto/3.10: fix ssh login and restore CC_OPTIMIZE_FOR_SIZE
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 ++--
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 ++++++++--------
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 



