Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SkIRh-0002D1-14
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 19:23:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2012 10:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117023631"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jun 2012 10:13:01 -0700
Message-ID: <4FEC909C.2090907@linux.intel.com>
Date: Thu, 28 Jun 2012 10:13:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340703038.git.kai.kang@windriver.com>
In-Reply-To: <cover.1340703038.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] archiver.bbclass: Add the function of filtering packages
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
X-List-Received-Date: Thu, 28 Jun 2012 17:23:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2012 02:36 AM, Kang Kai wrote:
> Hi,
>
> These patches are from Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> This function can miss and tarball packages according to license from recipes.
>
> Regards,
> Kai
>
> The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:
>
>    sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib xiaofeng/archiver
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/archiver
>
> Xiaofeng Yan (2):
>    archiver.bbclass: Add the function of filtering packages
>    local.conf.sample.extended: Add filtering function to
>      archiver.bbclass
>
>   meta-yocto/conf/local.conf.sample.extended |    3 +
>   meta/classes/archiver.bbclass              |   71 +++++++++++++++++++++++++++-
>   2 files changed, 73 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


