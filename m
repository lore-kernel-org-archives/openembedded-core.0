Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAP4-0001GF-Na
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:13:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 09:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178851638"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 09:02:02 -0700
Message-ID: <50058C7A.3040102@linux.intel.com>
Date: Tue, 17 Jul 2012 09:02:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342016043-29802-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1342016043-29802-1-git-send-email-b19537@freescale.com>
Subject: Re: [oe-core v2] task-core-sdk.bb: add libgomp and libgomp-dev by RECOMMENDS
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
X-List-Received-Date: Tue, 17 Jul 2012 16:13:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 07:14 AM, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>   meta/recipes-core/tasks/task-core-sdk.bb |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
> index ec6cdcc..fe95236 100644
> --- a/meta/recipes-core/tasks/task-core-sdk.bb
> +++ b/meta/recipes-core/tasks/task-core-sdk.bb
> @@ -7,7 +7,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>   DEPENDS = "task-core-console"
> -PR = "r7"
> +PR = "r8"
>
>   ALLOW_EMPTY = "1"
>   #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
> @@ -48,6 +48,10 @@ RDEPENDS_task-core-sdk = "\
>       file \
>       tcl"
>
> +RRECOMMENDS_task-core-sdk = "\
> +    libgomp \
> +    libgomp-dev"
> +
>   #python generate_sdk_pkgs () {
>   #    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
>   #    pkgs = d.getVar('PACKAGES', True).split()
>

Merged into OE-Core

Thanks
	Sau!


