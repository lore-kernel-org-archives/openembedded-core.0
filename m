Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkHdO-0006H2-Vo
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:27:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jul 2011 08:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,247,1309762800"; d="scan'208";a="30820801"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2011 08:23:05 -0700
Message-ID: <4E2995D8.90400@linux.intel.com>
Date: Fri, 22 Jul 2011 08:23:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311191810.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311191810.git.tom_rini@mentor.com>
Subject: Re: [PATCH v2 0/1] Resync siteinfo.bbclass with oe.dev
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
X-List-Received-Date: Fri, 22 Jul 2011 15:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 01:50 PM, Tom Rini wrote:
> Hey all,
>
> This is the second of two pull requests.  This doesn't depend on the first
> request, it's just splitting changes up.  There's three changes here.  First,
> site/ix86-common was setting the wrong value for unsigned int.  Second,
> change perl to use SITEINFO variables rather than functions.
> We're down to one change now to re-sync siteinfo.bbclass with oe-core
> and oe.dev.  This re-works the functions a bit inside siteinfo.bbclass
> to be easier to add new platforms (and hopefully multilibs) to.
>
> My next step is to work on merging and verifying as much as possible
> the site files in oe-core and oe.dev.
>
> v2: Rework based on Richard's comments to not be a generator and just
> return a string list again.
>
> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
>    Mei Lei (1):
>          lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo-bbclass-v2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo-bbclass-v2
>
> Tom Rini (1):
>    siteinfo.bbclass: Port over oe.dev logic for site files
>
>   meta/classes/siteinfo.bbclass |  203 ++++++++++++++++++++---------------------
>   1 files changed, 98 insertions(+), 105 deletions(-)
>   create mode 100644 meta/site/common-linux
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into Oe-Core

Thanks
	Sau!


