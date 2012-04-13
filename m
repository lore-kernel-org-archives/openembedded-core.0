Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SIp5V-0007lp-N4
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 00:35:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Apr 2012 15:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130742329"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by azsmga001.ch.intel.com with ESMTP; 13 Apr 2012 15:26:06 -0700
Message-ID: <4F88A7FE.4070703@linux.intel.com>
Date: Fri, 13 Apr 2012 15:26:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334238048.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1334238048.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] mklibs-native 0.1.33: include unistd.h to fix build for gcc 4.7
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
X-List-Received-Date: Fri, 13 Apr 2012 22:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2012 06:43 AM, Robert Yang wrote:
> Test info:
> Has been tested on:
> Fedora 17 64bit
> Fedora 16 64bit
> Ubuntu 10.10 32bit
>
> // Robert
>
> The following changes since commit c37faea947ef3980934c02661ecd79cd9668b8a6:
>
>    libunistring: Fix parallel make issue (2012-04-12 12:37:52 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/mklibs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/mklibs
>
> Robert Yang (1):
>    mklibs-native 0.1.33: include unistd.h to fix build for gcc 4.7
>
>   .../mklibs/files/include-unistd.h-for-gcc47.patch  |   29 ++++++++++++++++++++
>   .../mklibs/mklibs-native_0.1.33.bb                 |    3 +-
>   2 files changed, 31 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged with Updated Patch Header as it's a back port

Thanks
	Sau!



