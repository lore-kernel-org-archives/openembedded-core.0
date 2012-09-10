Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6IF-00054K-41
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:53:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Sep 2012 08:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="220112374"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2012 08:40:28 -0700
Message-ID: <504E09EC.7060707@linux.intel.com>
Date: Mon, 10 Sep 2012 08:40:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1346824226.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1346824226.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] package_rpm.bbclass: fix incremental rpm image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 15:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 07:54 AM, Robert Yang wrote:
> Test info:
> # With INC_RPM_IMAGE_GEN = "1"
> $ bitbake core-image-sato-sdk core-image-sato core-image-minimal \
> 	package-index meta-toolchain-sdk
> # Build 3 times.
> #
> # Modified some packages and rebuild it, the incremental image
> # generation works well.
>
> # Without INC_RPM_IMAGE_GEN = "1"
> $ bitbake core-image-sato-sdk core-image-sato core-image-minimal \
> 	package-index meta-toolchain-sdk
>
> // Robert
>
> The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:
>
>    build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/rpm_inc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_inc
>
> Robert Yang (1):
>    package_rpm.bbclass: fix incremental rpm image generation
>
>   meta/classes/package_rpm.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


