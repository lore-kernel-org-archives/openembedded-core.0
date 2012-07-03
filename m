Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7PZ-00039e-75
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:01:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 10:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173042407"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 10:50:10 -0700
Message-ID: <4FF330D2.7020203@linux.intel.com>
Date: Tue, 03 Jul 2012 10:50:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1340773014.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] icu 3.6: do_install failed: Segmentation fault
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
X-List-Received-Date: Tue, 03 Jul 2012 18:01:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2012 01:19 AM, Robert Yang wrote:
> The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:
>
>    sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:06 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/icu
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/icu
>
> Robert Yang (2):
>    icu 3.6: dropp apply=yes from path
>    icu 3.6: do_install failed: Segmentation fault
>
>   .../icu/files/larger-cmd-size.patch                |   27 ++++++++++++++++++++
>   meta/recipes-support/icu/icu-3.6.inc               |    9 ++++--
>   meta/recipes-support/icu/icu_3.6.bb                |    2 +-
>   3 files changed, 34 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core the latest version with 2048

Thanks
	Sau!



