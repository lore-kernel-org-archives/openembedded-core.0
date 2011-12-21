Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdF6O-00029L-7j
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 06:52:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2011 21:45:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88785942"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2011 21:45:26 -0800
Message-ID: <4EF17275.6080202@linux.intel.com>
Date: Tue, 20 Dec 2011 21:45:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324441819.git.shane.wang@intel.com>
In-Reply-To: <cover.1324441819.git.shane.wang@intel.com>
Subject: Re: [PATCH 0/1] [RESEND]Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Wed, 21 Dec 2011 05:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2011 08:32 PM, Shane Wang wrote:
> Here is the script to check which recipe provides SUMMARY and which doesnot.
> For those which do not, maintainer should add or update to a meaningful summary for HOB to display in description.
>
Shane,

I guess I am not understanding why this is needed.  Why can't we use 
DESCRIPTION which is a required entry?  Use the first X Characters of 
DESCRIPTION?

Sau!


> The following changes since commit b281fd127bac9ba77ab63a5c2b812ddd5d56df37:
>
>    documentation/poky-ref-manual/technical-details.xml: edits per Richard Purdie (2011-12-16 16:58:41 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/summary-audit
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/summary-audit
>
> Shane Wang (1):
>    Create a script for SUMMARY audit in recipes
>
>   scripts/contrib/summary-audit.sh |   55 ++++++++++++++++++++++++++++++++++++++
>   1 files changed, 55 insertions(+), 0 deletions(-)
>   create mode 100755 scripts/contrib/summary-audit.sh
>


