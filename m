Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SnzI1-0002xS-28
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 23:45:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2012 14:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="162801524"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2012 14:34:03 -0700
Message-ID: <4FF9FCCA.8080408@linux.intel.com>
Date: Sun, 08 Jul 2012 14:34:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
	<1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
Subject: Re: [PATCH 2/2] mkelfimage: Add stable git build (initial recipe)
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
X-List-Received-Date: Sun, 08 Jul 2012 21:45:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 01:22 PM, Raymond Danks wrote:
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7687/
>
> Resubmitting to oe-core for review prior to commit in openembedded-core.
>
>   meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   18 ++++++++++++++++++
>   1 files changed, 18 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
>
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> new file mode 100644
> index 0000000..b341213
> --- /dev/null
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
> +HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
> +SECTION = "devel"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
> +
> +SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
> +PV = "1.0.0+gitr${SRCPV}"
> +PR = "r1"
> +
> +SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http;branch=master"
> +
> +S = "${WORKDIR}/git/util/mkelfImage"
> +
> +inherit autotools
> +
> +NATIVE_INSTALL_WORKS = "1"
> +BBCLASSEXTEND = "native"
>

I found this packaging issue:
> ERROR: QA Issue: mkelfimage: Files/directories were installed but not shipped
>   /usr/share/mkelfImage
>   /usr/share/mkelfImage/elf32-i386

When I did a world build for x86

Can you please address it.

Thanks

Sau!



