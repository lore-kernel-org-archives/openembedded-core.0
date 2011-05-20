Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNDuL-0006HR-Oy
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:49:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 May 2011 17:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; d="scan'208";a="439426133"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2011 17:46:39 -0700
Message-ID: <4DD5B9EE.9080909@linux.intel.com>
Date: Thu, 19 May 2011 17:46:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC PATCH v2 00/15] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Fri, 20 May 2011 00:49:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 03:25 PM, Darren Hart wrote:
> After some discussion on the oe-core list regarding the *-pull-request scripts
> I provided a proposal, received some feedback, and these patches are the result
> of that discussion. The Cc list varies from patch to patch a bit more wildly
> than is typical as a final sanity test, although it does reflect who commented
> and expressed interest in which parts of the overhaul.
>
> V2: do REMOTE_REPO regex per remote
>      fix various regex issues
>      fix wget ssl issues
>      add github and oe (untested) REMOTE support
>      simplify git-send-email usage logic, avoid duplicating git confirmation
>      add -c, auto-cc per patch option
>
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by.
>
> The following changes since commit c12126ebf07604f998cb35546aa51d806d97af22:
>
>    create-pull-request: switch URL from git.pokylinux.org/poky-contrib to git.openembedded.org/openembedded-core-contrib (2011-05-13 20:38:20 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dvhart/git-pull-v2-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull-v2-oe
>
> Darren Hart (13):
>    create-pull-request: alphabetize arguments
>    create-pull-request: whitespace cleanup
>    create-pull-request: use git request-pull and arbitrary remotes
>    create-pull-request: rewrite known private URLs to public URLs
>    create-pull-request: provide an RFC mode via -c argument
>    send-pull-request: whitespace cleanup
>    send-pull-request: remove local mta support
>    send-pull-request: fix greedy auto-cc regex
>    send-pull-request: don't send all patches to everyone even with -a
>    send-pull-request: verify git sendemail config
>    create-pull-request: add untested oe repository support
>    send-pull-request: streamline git-send-email usage
>    *pull-request: add copyright, license, and descriptions
>
> Otavio Salvador (2):
>    create-pull-request: do not check certificate
>    create-pull-request: add GitHub remote support
>
>   scripts/create-pull-request |  222 ++++++++++++++++++++++---------
>   scripts/send-pull-request   |  307 ++++++++++++++++++++-----------------------
>   2 files changed, 302 insertions(+), 227 deletions(-)
>

Pulled into oe-core

Thanks

	Sau!


