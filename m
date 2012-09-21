Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBov-0005ci-LW
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:35:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 15:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="210077989"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2012 15:22:51 -0700
Message-ID: <505CE8BA.9040304@linux.intel.com>
Date: Fri, 21 Sep 2012 15:22:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/6] SDK and adt_installer fixes
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
X-List-Received-Date: Fri, 21 Sep 2012 22:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2012 06:47 AM, Laurentiu Palcu wrote:
> Changes in v2:
> Since the previous patchset was not merged I took the liberty of adding
> another 2 fixes and send another patchset so that they're merged in the
> right order.
>
> Changes in v1:
>
> Hi,
>
> This patchset contains some SDK/adt-installer fixes.
>
> Thanks,
> Laurentiu
>
> The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:
>
>    upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/adt_sdk_fixes
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/adt_sdk_fixes
>
> Laurentiu Palcu (6):
>    adt-installer: fix package installation issue
>    SDK: fix installation into symlinked directories
>    adt-installer: ensure directory exists before copying/removing
>    SDK: remove references to Poky distro from tarball installer
>    SDK: relocate symlinks too
>    SDK: allow toolchain installation from another directory
>
>   meta/classes/populate_sdk_base.bbclass             |   21 +++++--
>   .../installer/adt-installer/adt_installer          |    6 +-
>   .../adt-installer/scripts/adt_installer_internal   |   61 +++++++++++---------
>   3 files changed, 54 insertions(+), 34 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



