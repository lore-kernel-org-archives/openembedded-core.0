Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrALs-00017x-3I
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:10:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 08:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178848976"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 08:58:58 -0700
Message-ID: <50058BC2.4060102@linux.intel.com>
Date: Tue, 17 Jul 2012 08:58:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Tue, 17 Jul 2012 16:10:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 06:02 AM, Bogdan Marinescu wrote:
> Tested by building core-image-sato-sdk.
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc        |    2 +-
>   .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>   .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>   3 files changed, 7 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>   delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index f11e687..0a068be 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>   BINUVERSION ?= "2.22"
>   EGLIBCVERSION ?= "2.15"
>   UCLIBCVERSION ?= "0.9.33"
> -LINUXLIBCVERSION ?= "3.4"
> +LINUXLIBCVERSION ?= "3.4.3"
>
>   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>   PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
> new file mode 100644
> index 0000000..6f8d9e8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
> @@ -0,0 +1,6 @@
> +require linux-libc-headers.inc
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
> +SRC_URI[sha256sum] = "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> deleted file mode 100644
> index 9e8c88f..0000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require linux-libc-headers.inc
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
> -SRC_URI[sha256sum] = "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
>
Merged into OE-Core

Thanks
	Sau!



