Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUkDQ-00068N-AP
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:44:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 11:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="16293201"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2011 11:41:00 -0700
Message-ID: <4DF113BC.5010008@linux.intel.com>
Date: Thu, 09 Jun 2011 11:41:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307540891.2580.2.camel@elmorro>
In-Reply-To: <1307540891.2580.2.camel@elmorro>
Subject: Re: [PATCH] initramfs-live-install: remove allarch inherit
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
X-List-Received-Date: Thu, 09 Jun 2011 18:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 06:48 AM, Tom Zanussi wrote:
> initramfs-live-install is only compatible with i.86|x86_64 so
> shouldn't inherit 'allarch'.  This removes it.
>
> More specifically, commit 52295fa3deef3b0374b99829626d524cefae6001
> (Improve handling of 'all' architecture recipes and their interaction
> with sstate) sets TARGET_ARCH which due to the COMPATIBLE_HOST setting
> in the recipe causes it to be skipped and gives the following error
> for any -live build:
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Runtime target 'initramfs-live-install' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['initramfs-live-install']
> ERROR: Required build target 'core-image-sato-live' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-sato-live', 'core-ima\
> ge-minimal-initramfs', 'initramfs-live-install']
> ERROR: Nothing RPROVIDES 'initramfs-live-install'
>
> Signed-off-by: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   .../initrdscripts/initramfs-live-install_1.0.bb    |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> index fdda718..6a16f4c 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
> @@ -11,8 +11,6 @@ do_install() {
>           install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
>   }
>
> -inherit allarch
> -
>   FILES_${PN} = " /install.sh "
>
>   # Alternatives to grub need adding for other arch support


Merged into OE-Core with slight modification to keep the inherit 
allarch, but commented out.

Thanks
	Sau!


