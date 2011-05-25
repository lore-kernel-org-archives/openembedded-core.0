Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPHlc-00081c-Ep
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:21:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 10:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1563739"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 10:18:04 -0700
Message-ID: <4DDD39CC.5050408@linux.intel.com>
Date: Wed, 25 May 2011 10:18:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306180893.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1306180893.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/1] create-pull-request: generalize the	repository URL parsing
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
X-List-Received-Date: Wed, 25 May 2011 17:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2011 01:06 PM, Darren Hart wrote:
> I noticed the REMOTE_REPO was not being properly parsed by the
> create-pull-request script in a pull recently sent from Khem. This should
> address the issue with the added benefit of treating each of pokylinux,
> yoctoproject, openembedded, and github with a single regex for determining
> REMOTE_REPO and public'ifying the URL. Most other repositories are also likely
> covered by the new regex for generating the public URL. Specific cases are still
> obviously required for generating a browsable web URL.
>
> The following changes since commit ed8646e257ad84b017e5295b892eeb44bcef0483:
>
>    *pull-request: add copyright, license, and descriptions (2011-05-16 15:18:20 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dvhart/git-pull
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull
>
> Darren Hart (1):
>    create-pull-request: generalize the repository URL parsing
>
>   scripts/create-pull-request |   29 ++++++++++++-----------------
>   1 files changed, 12 insertions(+), 17 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core

Thanks
	Sau!


