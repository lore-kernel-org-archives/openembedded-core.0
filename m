Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rbc8T-0007Eq-Fb
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 19:03:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2011 09:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103040197"
Received: from unknown (HELO [10.255.12.77]) ([10.255.12.77])
	by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2011 09:56:57 -0800
Message-ID: <4EEB8669.30900@linux.intel.com>
Date: Fri, 16 Dec 2011 09:56:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323946873-28584-1-git-send-email-stefan@datenfreihafen.org>
In-Reply-To: <1323946873-28584-1-git-send-email-stefan@datenfreihafen.org>
Subject: Re: [PATCH] u-boot-xilinx: Update inc file path after oe-core change
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
X-List-Received-Date: Fri, 16 Dec 2011 18:03:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2011 03:01 AM, Stefan Schmidt wrote:
> Signed-off-by: Stefan Schmidt<stefan@datenfreihafen.org>
> ---
>   recipes-bsp/uboot/u-boot-xilinx_git.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
Does this directory need to be renamed also?

Sau!

> diff --git a/recipes-bsp/uboot/u-boot-xilinx_git.bb b/recipes-bsp/uboot/u-boot-xilinx_git.bb
> index 255f3b5..016a0bb 100644
> --- a/recipes-bsp/uboot/u-boot-xilinx_git.bb
> +++ b/recipes-bsp/uboot/u-boot-xilinx_git.bb
> @@ -1,5 +1,5 @@
>   inherit xilinx-boot xilinx-utils
> -require recipes-bsp/uboot/u-boot.inc
> +require recipes-bsp/u-boot/u-boot.inc
>
>   PR = "r14"
>   PV = "v2009.11"


