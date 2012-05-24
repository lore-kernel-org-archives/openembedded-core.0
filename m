Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcIo-0006lf-9B
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 19:58:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 May 2012 10:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147417797"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 24 May 2012 10:48:08 -0700
Message-ID: <4FBE7458.3090102@linux.intel.com>
Date: Thu, 24 May 2012 10:48:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336983006.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1336983006.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] V2 Fix incremental rpm image generation
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
X-List-Received-Date: Thu, 24 May 2012 17:58:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2012 01:11 AM, Robert Yang wrote:
> Changes of V2:
> * Save rpmlib for core-image-minimal rather than remove it
>
> // Robert
>
> The following changes since commit 12b4543ac9f54c0db0ee4a7ee546a71946a051f8:
>
>    classes/rootfs_*: fix splitting package dependency strings (2012-05-13 20:09:56 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/inc_rpm
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/inc_rpm
>
> Robert Yang (2):
>    package_rpm.bbclass: Fix incremental rpm image generation
>    rootfs_rpm.bbclass: save rpmlib rather than remove it
>
>   meta/classes/image.bbclass       |    6 ++++++
>   meta/classes/package_rpm.bbclass |   20 ++++++++------------
>   meta/classes/rootfs_rpm.bbclass  |    6 +++++-
>   3 files changed, 19 insertions(+), 13 deletions(-)
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


