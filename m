Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFD2m-0006Bm-VF
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:21:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2012 16:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137294486"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2012 16:12:33 -0700
Message-ID: <4F7B83E1.6020802@linux.intel.com>
Date: Tue, 03 Apr 2012 16:12:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333089569.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1333089569.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] sstate-cache-management.sh: fixes and enhancement
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
X-List-Received-Date: Tue, 03 Apr 2012 23:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2012 11:44 PM, Robert Yang wrote:
> Testing info:
> * The output for "-d": (I entered "y" when ask whether continue)
>    $ /path/to/poky/scripts/sstate-cache-management.sh \
>          --cache-dir=/path/to/sstate-cache/ -d
>    Figuring out the archs in the layers ... Done
>    Figuring out the archs in the sstate cache dir ... Done
>    The following archs have been found in the cache dir:
>    armv5te i686 mips ppc603e qemumips qemux86 qemux86_64 x86_64
>
>    Figuring out the sstate-xxx_deploy-rpm.tgz ... (2320 files will be removed)
>    Figuring out the sstate-xxx_deploy-ipk.tgz ... (0 files will be removed)
>    Figuring out the sstate-xxx_deploy-deb.tgz ... (0 files will be removed)
>    Figuring out the sstate-xxx_deploy.tgz ... (6 files will be removed)
>    Figuring out the sstate-xxx_package.tgz ... (2292 files will be removed)
>    Figuring out the sstate-xxx_populate-lic.tgz ... (1736 files will be removed)
>    Figuring out the sstate-xxx_populate-sysroot.tgz ... (1632 files will be removed)
>    7986 files will be removed! Do you want to continue (y/n)? y
>    Removing sstate-xxx_deploy.tgz (6 files) ... Done
>    Removing sstate-xxx_deploy-rpm.tgz (2320 files) ... Done
>    Removing sstate-xxx_package.tgz (2292 files) ... Done
>    Removing sstate-xxx_populate-lic.tgz (1736 files) ... Done
>    Removing sstate-xxx_populate-sysroot.tgz (1632 files) ... Done
>    7986 files have been removed!
>
> * The output for "--stamps-dir": (I entered "y" when ask whether continue)
>    $ /path/to/poky/scripts/sstate-cache-management.sh \
>          --cache-dir=/path/to/sstate-cache/ --stamps-dir=tmp/stamps/
>    Figuring out all the md5sums in stamps dir ... Done
>    Figuring out the files which will be removed ... Done
>    7866 files will be removed! Do you want to continue (y/n)? y
>    Removing sstate cache files ... (7866 files)
>    7866 files have been removed
>
> //Robert
>
> The following changes since commit c8afc79b5d3205355ad61d2589221bf8babe8395:
>
>    libc-packgae.bbclass: Add i686 support in locale_arch_options (2012-03-29 22:22:58 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/sstate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/sstate
>
> Robert Yang (1):
>    sstate-cache-management.sh: fixes and enhancement
>
>   scripts/sstate-cache-management.sh |  289 ++++++++++++++++++++++++++++++------
>   1 files changed, 240 insertions(+), 49 deletions(-)
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


