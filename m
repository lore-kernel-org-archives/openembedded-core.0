Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoJTT-00012q-OB
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:13:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Aug 2011 11:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="35054364"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2011 11:09:27 -0700
Message-ID: <4E383D57.9060003@linux.intel.com>
Date: Tue, 02 Aug 2011 11:09:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311885993-13462-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311885993-13462-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] bitbake.conf: Add PACKAGE_ARCHS to include TUNE_PKGARCH
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
X-List-Received-Date: Tue, 02 Aug 2011 18:13:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 01:46 PM, Kumar Gala wrote:
> Recent changes to how TUNE_PKGARCH is composed means it might not be in
> the PACKAGE_EXTRA_ARCHS_tune list.  Rather than having to update all
> such lists we just add TUNE_PKGARCH to PACKAGE_ARCHS.
>
> An example, for ppc603e TUNE_PKGARCH is now:
>
> 	powerpcppc603e
>
> However, PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
>
> Thus we run into issues during things like rpm packagine since it will
> not end up dealing the rpms created in a 'powerpcppc603e' directory.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/conf/bitbake.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9c80f11..d8b9f36 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -104,7 +104,7 @@ SDK_CC_ARCH = "${BUILD_CC_ARCH}"
>   PACKAGE_ARCH = "${TUNE_PKGARCH}"
>   MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
>   PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
> -PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
> +PACKAGE_ARCHS = "all any noarch ${TUNE_PKGARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
>   # MACHINE_ARCH shouldn't be included here as a variable dependency
>   # since machine specific packages are handled using multimachine
>   PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"


Not pulled, this has been fixed in another way

Thanks
	Sau!


