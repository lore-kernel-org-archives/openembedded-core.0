Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0mfO-0003jb-KU
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 05:21:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 20:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128885752"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 20:13:35 -0800
Message-ID: <4F470E6F.4020501@linux.intel.com>
Date: Thu, 23 Feb 2012 20:13:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1329916583.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Fri, 24 Feb 2012 04:21:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/22/2012 05:27 AM, Robert Yang wrote:
> Here is the testing result:
>
> $ ./poky/scripts/sstate-cache-management.sh --cache-dir=sstate-cache.bak/ --remove-duplicated
> Figuring out the archs in the sstate cache dir ...
> The following archs have been found in the sstate cache dir:
> i586 ppc603e x86_64 qemux86 qemuppc
> Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
> Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
> Removing the sstate-xxx_deploy.tgz ... (8 files)
> Removing the sstate-xxx_package.tgz ... (3282 files)
> Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
> Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
> 12088 files have been removed
>
> // Robert
>
> The following changes since commit 87e32edb88c30ac116fa396148ac26357051f93a:
>
>    iputils: Add base_libdir to VPATH in order to find the crypto library (2012-02-21 17:59:40 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/remove-sstate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/remove-sstate
>
> Robert Yang (1):
>    A script to clean obsolete sstate cache files
>
>   scripts/sstate-cache-management.sh |  135 ++++++++++++++++++++++++++++++++++++
>   1 files changed, 135 insertions(+), 0 deletions(-)
>   create mode 100755 scripts/sstate-cache-management.sh
>

Merged into OE-core

Thanks
	Sau!


