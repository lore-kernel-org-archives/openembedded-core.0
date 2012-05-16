Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUiju-00051y-SK
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:14:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2012 11:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144012599"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2012 11:03:42 -0700
Message-ID: <4FB3EBFE.40403@linux.intel.com>
Date: Wed, 16 May 2012 21:03:42 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337105658.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1337105658.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/2] tcmode-external-csl: Allow overriding some key values
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
X-List-Received-Date: Wed, 16 May 2012 18:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2012 09:16 PM, Peter Seebach wrote:
> This tiny little set of ?= changes lets me use a different CS binary
> toolchain than the one being supported by the external-csl feature by
> default, allowing us to share more code.
>
> Also I improved an error message.  (Side note:  Sorry if it's spammy
> to have a separate patch for it, but I couldn't convince myself that these
> two changes were doing the same thing.)
>
> The following changes since commit 01dea384924293d0f99723073277bf6b1f4c7976:
>    Christopher Larson (1):
>          tcmode-external-csl: handle TUNE_PKGARCH=core2
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/toolchain
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchain
>
> Peter Seebach (2):
>    tcmode-external-csl.inc: Allow for overrides
>    tcmode-external-csl.inc: specify the path you couldn't find
>
>   meta/conf/distro/include/tcmode-external-csl.inc |   20 ++++++++++----------
>   1 files changed, 10 insertions(+), 10 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core

Thanks
	Sau!


