Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw4Sf-0004dm-Bz
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 05:49:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2011 20:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,273,1312182000"; d="scan'208";a="10430299"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 20:44:18 -0700
Message-ID: <4E547392.1050101@linux.intel.com>
Date: Tue, 23 Aug 2011 20:44:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313731222.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1313731222.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Remove the hard coded url in adt-installer
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
X-List-Received-Date: Wed, 24 Aug 2011 03:49:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2011 10:21 PM, Lianhao Lu wrote:
> This patch fixed the bug #1380. It removed the hard coded url in the opkg configuration files included in the adt-installer.
>
> The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
>    Darren Hart (1):
>          kernel: restore crtsavres.o to enable building external modules on powerpc
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1380
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1380
>
> Lianhao Lu (1):
>    adt-installer: Removed the hard coded repo url.
>
>   .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    2 +-
>   .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    2 +-
>   .../installer/adt-installer_1.0.bb                 |    5 ++++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
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



