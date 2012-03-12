Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S79Md-0004vT-Tc
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 18:48:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2012 10:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137531594"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2012 10:40:11 -0700
Message-ID: <4F5E34FB.2050409@linux.intel.com>
Date: Mon, 12 Mar 2012 10:40:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331085934.git.lianhao.lu@intel.com>
	<324c375ed3e7c0fb061b52c9dd6a57afdfe4f5fa.1331085934.git.lianhao.lu@intel.com>
In-Reply-To: <324c375ed3e7c0fb061b52c9dd6a57afdfe4f5fa.1331085934.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 1/1] adt-installer: Corrected wrong environment file names.
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
X-List-Received-Date: Mon, 12 Mar 2012 17:48:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 06:06 PM, Lianhao Lu wrote:
> [YOCTO #2055]
> 1. Corrected the wrong environment file name for powerpc.
>
> 2. Removed unnecessary variables in adt_installer.conf.
>
> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   .../adt-installer/scripts/adt_installer_internal   |    2 ++
>   .../installer/adt-installer_1.0.bb                 |    5 +----
>   2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
> index 6201095..684dc88 100755
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
> @@ -175,6 +175,8 @@ check_result
>   echo_info "Updating environment script with target sysroot location."
>   if [ "$1" == "x86"  ]; then
>     env_filename=`ls $INSTALL_FOLDER/environment-setup-i586*`
> +elif [ "$1" == "ppc" ]; then
> +  env_filename=`ls $INSTALL_FOLDER/environment-setup-powerpc*`
>   else
>     env_filename=`ls $INSTALL_FOLDER/environment-setup-$1*`
>   fi
> diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> index 340349d..27937d9 100644
> --- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
> +++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> @@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"
>
>   PACKAGES = ""
>
> -PR = "r6"
> +PR = "r7"
>
>   ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
>   ADT_DIR = "${WORKDIR}/adt-installer/"
> @@ -68,9 +68,6 @@ fakeroot do_populate_adt () {
>   	cp -r scripts ${ADT_DIR}/
>   	cp adt_installer ${ADT_DIR}
>   	cp adt_installer.conf ${ADT_DIR}
> -	echo 'YOCTOADT_VERSION=${SDK_VERSION}'>  ${ADT_DIR}/temp.conf
> -        cat ${ADT_DIR}/adt_installer.conf>>  ${ADT_DIR}/temp.conf
> -        mv ${ADT_DIR}/temp.conf ${ADT_DIR}/adt_installer.conf
>   	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
>           echo 'SDK_VENDOR=${SDK_VENDOR}'>>  ${ADT_DIR}/scripts/data_define
>           echo 'INSTALL_FOLDER=${SDKPATH}'>>  ${ADT_DIR}/scripts/data_define

Merged into OE-Core

Thanks
	Sau!


