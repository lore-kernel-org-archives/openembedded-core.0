Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBm4-0005RN-KW
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:32:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Sep 2012 15:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="147734937"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2012 15:19:53 -0700
Message-ID: <505CE809.7020508@linux.intel.com>
Date: Fri, 21 Sep 2012 15:19:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1348038052.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1348038052.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] opkg 0.1.8: remove it since it doesn't work
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
X-List-Received-Date: Fri, 21 Sep 2012 22:32:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 02:33 AM, Robert Yang wrote:
> Test info:
> # With PACKAGE_CLASSES = "package_ipk"
> $ bitbake core-image-sato core-image-minimal meta-toolchain meta-toolchain-sdk \
> 	adt-installer meta-ide-support
> $ bitbake package-index
>
> All the builds are OK.
>
> // Robert
>
> The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:
>
>    upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/rm_opkg018
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rm_opkg018
>
> Robert Yang (1):
>    opkg 0.1.8: remove it since it doesn't work
>
>   meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch | 19 -------------------
>   meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb        | 10 ----------
>   meta/recipes-devtools/opkg/opkg_0.1.8.bb              | 11 -----------
>   3 files changed, 40 deletions(-)
>   delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
>   delete mode 100644 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
>   delete mode 100644 meta/recipes-devtools/opkg/opkg_0.1.8.bb
>

Merged into OE-Core

Thanks	
	Sau!



