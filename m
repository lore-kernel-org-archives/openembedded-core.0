Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvkWu-0008IZ-UG
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 08:32:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2011 23:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,267,1312182000"; d="scan'208";a="44090522"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 23:27:23 -0700
Message-ID: <4E53484B.1080802@linux.intel.com>
Date: Mon, 22 Aug 2011 23:27:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/5][PULL] multilib: Some fixes of improper ${PN}
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
X-List-Received-Date: Tue, 23 Aug 2011 06:32:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2011 02:08 AM, Dongxiao Xu wrote:
> Hi Richard,
>
> This pull request fixes some improper ${PN}, please help to reivew and pull.
>
> Thanks,
> Dongxiao
>
> The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
>
>    kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/ml
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml
>
> Dongxiao Xu (5):
>    curl: Use BPN instead of PN for style like lib${PN}
>    ea-acl: Use BPN instead of PN for style like lib${PN}
>    attr: Use BPN instead of PN for style like lib${PN}
>    acl: Use BPN instead of PN for style like lib${PN}
The above 4 have been merged to OE-Core

>    procps: Fix lib path to support multilib

There are some comments from Richard on the patch in the Consolidated 
Pull Request from last week, please review and resubmit.

Thanks
	Sau!

>
>   .../procps/procps-3.2.8/install.patch              |   29 --------------------
>   meta/recipes-extended/procps/procps.inc            |    3 +-
>   meta/recipes-extended/procps/procps_3.2.8.bb       |    8 +++---
>   meta/recipes-support/attr/acl.inc                  |    2 +-
>   meta/recipes-support/attr/attr.inc                 |    2 +-
>   meta/recipes-support/attr/ea-acl.inc               |    6 ++--
>   meta/recipes-support/curl/curl_7.21.7.bb           |    8 +++---
>   7 files changed, 14 insertions(+), 44 deletions(-)
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/install.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


