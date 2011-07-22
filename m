Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkIDU-0007LZ-Hg
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:04:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 09:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,248,1309762800"; d="scan'208";a="31228906"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 09:00:33 -0700
Message-ID: <4E299EA1.5060005@linux.intel.com>
Date: Fri, 22 Jul 2011 09:00:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311304709-6156-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1311304709-6156-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] tclibc-uclibc: Fix TARGET_OS for powerpc
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
X-List-Received-Date: Fri, 22 Jul 2011 16:04:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/21/2011 08:18 PM, Khem Raj wrote:
> 1a9ae8ea8c0540d41b8ff4d95c0420d6df754634 removed -uclibc
> hence it got all wrong for powerpc. uclibc TARGET_OS
> for classic ppc is linux-uclibc and for ppc w/ SPE its
> linux-uclibcspe
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/conf/distro/include/tclibc-uclibc.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
> index 2ccda5b..7c06654 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -5,7 +5,7 @@
>   TARGET_OS = "linux-uclibc"
>   TARGET_OS_arm = "linux-uclibceabi"
>   TARGET_OS_armeb = "linux-uclibceabi"
> -TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
> +TARGET_OS_powerpc = "linux-uclibc${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
>
>   # Add uclibc overrides to the overrides.
>   OVERRIDES =. "libc-uclibc:"

Merged into OE-Core

Thanks
	Sau!


