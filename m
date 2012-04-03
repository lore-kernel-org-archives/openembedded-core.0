Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFD1L-00068e-JS
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:20:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Apr 2012 16:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137294004"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2012 16:11:04 -0700
Message-ID: <4F7B8388.4000407@linux.intel.com>
Date: Tue, 03 Apr 2012 16:11:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333087412.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333087412.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Fix powerpc environment file naming in adt-installer
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
X-List-Received-Date: Tue, 03 Apr 2012 23:20:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2012 11:06 PM, Lianhao Lu wrote:
> The yocto bug #2055 was reopened due to the oe-core commit c2d96179. This patch fix this by adapting to the new powerpc environment file name in adt-installer.
>
> The following changes since commit c8afc79b5d3205355ad61d2589221bf8babe8395:
>    Noor Ahsan (1):
>          libc-packgae.bbclass: Add i686 support in locale_arch_options
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug2055
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2055
>
> Lianhao Lu (1):
>    adt-installer: Adapted environment file name for powerpc.
>
>   .../adt-installer/scripts/adt_installer_internal   |    2 --
>   .../installer/adt-installer_1.0.bb                 |    2 +-
>   2 files changed, 1 insertions(+), 3 deletions(-)
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


