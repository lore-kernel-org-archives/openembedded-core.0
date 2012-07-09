Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoH1l-0004eD-Jl
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:41:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 09:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190311728"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 09:30:20 -0700
Message-ID: <4FFB071C.4000505@linux.intel.com>
Date: Mon, 09 Jul 2012 09:30:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341847664-30221-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1341847664-30221-1-git-send-email-fcooper@ti.com>
Subject: Re: [PATCH] psplash - Update to latest psplash version. LIC_CHKSUM Tweak
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
X-List-Received-Date: Mon, 09 Jul 2012 16:41:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 08:27 AM, Franklin S Cooper Jr wrote:
> * Update psplash to the latest version.
> * Change the license checksum to use the lines in the psplash.h that contains
>    license information instead of doing a checksum on the entire file.
>
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>   meta/recipes-core/psplash/psplash_git.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
> index 0d88a60..f9b77de 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -3,11 +3,11 @@ DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly em
>   HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
>   SECTION = "base"
>   LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://psplash.h;md5=a87c39812c1e37f3451567cc29a29c8f"
> +LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
>
> -SRCREV = "e05374aae945bcfc6d962ed0d7b2774b77987e1d"
> +SRCREV = "84764337a584002a92940323d374b0e417c573a6"
>   PV = "0.1+git${SRCPV}"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
>              file://psplash-init \
>

Merged into OE-Core

Thanks
	Sau!


