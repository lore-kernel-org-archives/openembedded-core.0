Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGrF-0003ln-6u
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:30:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 09:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="165826112"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2012 09:19:34 -0700
Message-ID: <4FFB0496.3080800@linux.intel.com>
Date: Mon, 09 Jul 2012 09:19:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1341800388.git.kai.kang@windriver.com>
In-Reply-To: <cover.1341800388.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] V3: Fix lsbinitscripts link problem
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
X-List-Received-Date: Mon, 09 Jul 2012 16:30:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2012 07:26 PM, Kang Kai wrote:
> Hi Saul,
>
> As your comment, I remove the manual rename of file functions in both of lsbinitscripts and initscripts.
>
> Regards,
> Kai
>
> The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:
>
>    sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro
>
> Kang Kai (2):
>    initscripts: use update-alternative to handle file functions
>    lsbinitscripts: increase ALTERNATIVE_PRIORITY
>
>   meta/recipes-core/initscripts/initscripts_1.0.bb |    8 +++++++-
>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    4 ++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


