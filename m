Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL5rR-00072a-Av
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 05:49:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 May 2011 20:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="435963623"
Received: from unknown (HELO [10.255.12.78]) ([10.255.12.78])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2011 20:46:53 -0700
Message-ID: <4DCDFB34.3080306@linux.intel.com>
Date: Fri, 13 May 2011 20:47:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [RFC PATCH 00/10] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Sat, 14 May 2011 03:49:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Note that oe-core has one additional commit to create-pull-request which
I didn't have in poky. I guess the scripts dirs aren't kept in sync the
same way meta is.

If you want to apply these as they are and not wait for v2, you just
need to revert the following commit from oe-core:

commit 84e07ef76bf4f484a2d5e0180632e7a4981a1af7
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Mar 15 11:07:22 2011 +0100

    create-pull-request: switch URL from git.pokylinux.org/poky-contrib
to git.o

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

There is nothing wrong with the patch, I just didn't have it and this
series obsoletes it, so reverting it was easier than dealing with the
merge conflicts ;-)

--
Darren

On 05/13/2011 04:35 PM, Darren Hart wrote:
> After some discussion on the oe-core list regarding the *-pull-request scripts
> I provided a proposal, received some feedback, and these patches are the result
> of that discussion. The Cc list varies from patch to patch a bit more wildly
> than is typical as a final sanity test, although it does reflect who commented
> and expressed interest in which parts of the overhaul.
> 
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by.
> 
> The following changes since commit 65e5ebc1d27b0a6cb2e33596d6d32c536b857f0d:
> 
>   tcmode-default: fix a typo (2011-05-13 11:02:20 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib.git dvhart/git-pull
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull
> 
> Darren Hart (10):
>   create-pull-request: alphabetize arguments
>   create-pull-request: whitespace cleanup
>   create-pull-request: use git request-pull and arbitrary remotes
>   create-pull-request: rewrite known private URLs to public URLs
>   create-pull-request: provide an RFC mode via -c argument
>   send-pull-request: whitespace cleanup
>   send-pull-request: remove local mta support
>   send-pull-request: fix greedy auto-cc regex
>   send-pull-request: don't send all patches to everyone even with -a
>   send-pull-request: verify git sendemail config
> 
>  scripts/create-pull-request |  176 +++++++++++++++++++----------
>  scripts/send-pull-request   |  265 ++++++++++++++++++-------------------------
>  2 files changed, 228 insertions(+), 213 deletions(-)
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


