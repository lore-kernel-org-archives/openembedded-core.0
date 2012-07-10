Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Soezz-0006KL-6x
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 20:17:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2012 11:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190871890"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2012 11:05:58 -0700
Message-ID: <4FFC6F06.2090208@linux.intel.com>
Date: Tue, 10 Jul 2012 11:05:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207091310550.23920@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207091310550.23920@oneiric>
Subject: Re: core-image-*.bb: Remove usage of EXTRA_IMAGE_FEATURES from some .bb files
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
X-List-Received-Date: Tue, 10 Jul 2012 18:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 10:12 AM, Robert P. J. Day wrote:
>
> Replace the usage of EXTRA_IMAGE_FEATURES in a small number of .bb
> files with IMAGE_FEATURES, and leave the use of EXTRA_IMAGE_FEATURES
> for developers in their local.conf files, to avoid the possibility of
> undesirable side effects.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>    i *think* this should do it ...
>
> diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
> index 047d66b..7601410 100644
> --- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
> +++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
>   (LSB) implementations. It includes the full meta-toolchain, plus development \
>   headers and libraries to form a standalone SDK."
>
> -IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh"
> -EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
> +IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh \
> +	tools-debug tools-profile tools-testapps debug-tweaks"
>
>
>   IMAGE_INSTALL = "\
> diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
> index 29512e3..e89b574 100644
> --- a/meta/recipes-rt/images/core-image-rt-sdk.bb
> +++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
> @@ -8,8 +8,7 @@ tools for real-time use. It includes the full meta-toolchain, development \
>   headers and libraries to form a standalone SDK."
>   DEPENDS = "linux-yocto-rt"
>
> -IMAGE_FEATURES += "dev-pkgs tools-sdk"
> -EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
> +IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug tools-profile tools-testapps debug-tweaks"
>
>   IMAGE_INSTALL += "rt-tests kernel-dev"
>
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index 39742ef..733ef7f 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -5,8 +5,8 @@ DESCRIPTION = "Image with Sato support that includes everything within \
>   core-image-sato plus meta-toolchain, development headers and libraries to \
>   form a standalone SDK."
>
> -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
> -EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
> +IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs \
> +	tools-debug tools-profile tools-testapps debug-tweaks"
>
>   SSHSERVER_IMAGE_FEATURES = "ssh-server-openssh"
>
>

Merged into OE-Core

Thanks
	Sau!


