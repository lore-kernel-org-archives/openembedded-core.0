Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWuGX-0007R7-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 20:57:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2012 11:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147076371"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2012 11:46:48 -0700
Message-ID: <4FBBDF18.9030500@linux.intel.com>
Date: Tue, 22 May 2012 11:46:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337709995-13798-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1337709995-13798-1-git-send-email-jason.wessel@windriver.com>
Subject: Re: [PATCH] recipes-devtools/qemu/qemu.inc: Add jpeg as a dependency
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
X-List-Received-Date: Tue, 22 May 2012 18:57:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 11:06 AM, Jason Wessel wrote:
> If you use a shared state cache and build a large file system,
> followed by a small one, the qemu will be built with jpeg support.
>
Is jpeg optional for qemu?  Do you know why it's included in the first 
place?  Can it be disabled via a --disable in the configure stage?

Sau!
> Building ultra small file systems leaves out jpeg as a dependency
> for the host tool, and when using a sstate cache you end up with
> the following error using runqemu:
>
> qemu: error while loading shared libraries: libjpeg.so.8: cannot open shared object file: No such file or directory
>
> The work around is to execute:
>     bitbake jpeg-native
>
> Signed-off-by: Jason Wessel<jason.wessel@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 93325c3..bd9e5bf 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "open source processor emulator"
>   HOMEPAGE = "http://qemu.org"
>   LICENSE = "GPLv2&  LGPLv2.1"
> -DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11"
> +DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 jpeg"
>
>   # QEMU_TARGETS is overridable variable
>   QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"


