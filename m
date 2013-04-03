Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNPxO-0003z1-0P
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:50:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2013 08:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="313059168"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2013 08:33:25 -0700
Message-ID: <515C4BC5.1010609@linux.intel.com>
Date: Wed, 03 Apr 2013 08:33:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Alex DAMIAN <alexandru.damian@intel.com>
References: <1364991788-29402-1-git-send-email-alexandru.damian@intel.com>
	<1365002436-5355-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1365002436-5355-1-git-send-email-alexandru.damian@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libproxy: add dependency on glib-2.0
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
X-List-Received-Date: Wed, 03 Apr 2013 15:50:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 08:20 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> libproxy uses glib-2.0, but the depends is missing
>
> Fixes intermittent build errors.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/classes/core-image.bbclass                 |    4 ++--
>   meta/recipes-support/libproxy/libproxy_0.4.7.bb |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 86df91d..2bd5c12 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -41,8 +41,8 @@ PACKAGE_GROUP_tools-profile = "packagegroup-core-tools-profile"
>   PACKAGE_GROUP_tools-testapps = "packagegroup-core-tools-testapps"
>   PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
>   PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
> -PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
> -PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
> +#PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
> +#PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
>   PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
>   PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
>   PACKAGE_GROUP_hwcodecs = "${MACHINE_HWCODECS}"

You seem to have pulled in some other stuff also, please send a clean v2.

Thanks
    Sau!


> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> index 510c6b7..89f22b8 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
>                       file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
>
> -DEPENDS = "gconf"
> +DEPENDS = "gconf glib-2.0"
>
>   PR = "r5"
>
>


