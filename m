Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F353265EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 03:08:21 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2014 20:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,864,1392192000"; d="scan'208";a="433761907"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2014 20:08:19 -0700
Message-ID: <537975A3.102@linux.intel.com>
Date: Sun, 18 May 2014 20:08:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1400133537.git.rongqing.li@windriver.com>
In-Reply-To: <cover.1400133537.git.rongqing.li@windriver.com>
Subject: Re: [PATCH 0/2] forward 2 CVE patches for nss
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 May 2014 03:08:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2014 11:00 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> The following changes since commit 03ece04bb1379adc5729fd0857e5287dfcae0e3a:
>
>    perl-5.14.3:fix CVE-2010-4777 (2014-05-15 11:10:52 +0800)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib roy/nss
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/nss
>
> Li Wang (2):
>    nss: CVE-2014-1492
>    nss: CVE-2013-1740
>
>   .../nss/files/nss-CVE-2013-1740.patch              |  914 ++++++++++++++++++++
>   .../nss/files/nss-CVE-2014-1492.patch              |   66 ++

Both these patches need Upstream-Status in the .patch file please

Thanks
	SaU!

>   meta/recipes-support/nss/nss.inc                   |    2 +
>   3 files changed, 982 insertions(+)
>   create mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
>   create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
>

