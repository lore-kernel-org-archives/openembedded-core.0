Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXdEn-0002uO-CL
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:58:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2012 11:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103936177"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2012 11:47:56 -0700
Message-ID: <4FBE825C.6080001@linux.intel.com>
Date: Thu, 24 May 2012 11:47:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337781684.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1337781684.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] V2 rpm 5.4.0: respect to the arch when choose the alternatives
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
X-List-Received-Date: Thu, 24 May 2012 18:58:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 07:06 AM, Robert Yang wrote:
> Changes of V2:
>
> Fix the rpm rather than the PACKAGE_EXTRA_ARCHS
>
> // Robert
>
> The following changes since commit 3bf8069100e54153d13319dc32ca089327b6a139:
>
>    documentation/yocto-project-qs/yocto-project-qs.xml: added quotes (2012-05-01 21:00:36 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/121_rpm_arch
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/121_rpm_arch
>
> Robert Yang (1):
>    rpm 5.4.0: respect to the arch when choose the alternatives
>
>   .../rpm/rpm/rpm-respect-arch.patch                 |   67 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>   2 files changed, 69 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
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


