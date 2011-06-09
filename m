Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUjnp-0003mG-1B
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:17:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2011 11:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="12066737"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 11:14:35 -0700
Message-ID: <4DF10D8B.4010400@linux.intel.com>
Date: Thu, 09 Jun 2011 11:14:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307602786.git.ke.yu@intel.com>
In-Reply-To: <cover.1307602786.git.ke.yu@intel.com>
Subject: Re: [PATCH 0/1] add mesa-demos to sato-sdk to fix bug 1112
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
X-List-Received-Date: Thu, 09 Jun 2011 18:17:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 12:03 AM, Yu Ke wrote:
> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
>    Khem Raj (1):
>          package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib kyu3/bug1112
>    http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/bug1112
>
> Yu Ke (1):
>    sato-sdk: add mesa-demos application
>
>   meta/classes/core-image.bbclass                 |    1 +
>   meta/recipes-sato/images/core-image-sato-sdk.bb |    2 +-
>   meta/recipes-sato/tasks/task-core.bb            |    6 +++++-
>   3 files changed, 7 insertions(+), 2 deletions(-)
>
Ke,

I discussed this with Richard and we applied a different patch that adds 
mesa-demos to an existing task called task-core-tools-testapps
and then ensure that it is part of sato-sdk.

We also cleaned up the EXTRA_IMAGE_FEATURES include by default in 
local.conf to not include all the tools and testapps, but only the debug 
tweaks.  This will give a truer representation of the sato and lsb 
images sizes (when built without -dev or -sdk).

Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


