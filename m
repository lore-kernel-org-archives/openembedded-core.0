Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SogVZ-0007sM-HO
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:54:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 12:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120881499"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 12:42:31 -0700
Message-ID: <4FFC85A7.2070105@linux.intel.com>
Date: Tue, 10 Jul 2012 12:42:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341909636.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1341909636.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] subversion: do_install failed (parallel issue)
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
X-List-Received-Date: Tue, 10 Jul 2012 19:54:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 02:35 AM, Robert Yang wrote:
> The following changes since commit 8d8b9e77aa3403e880cbbdfefc7f24a993b3161f:
>
>    linux-yocto/3.4: perf scripting & unionfs fixes (2012-07-09 17:06:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/svn
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/svn
>
> Robert Yang (1):
>    subversion: do_install failed (parallel issue)
>
>   .../subversion/fix-install-depends.patch           |   45 ++++++++++++++++++++
>   .../subversion/subversion_1.6.15.bb                |    6 ++-
>   .../subversion/subversion_1.7.2.bb                 |    3 +-
>   3 files changed, 51 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
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


