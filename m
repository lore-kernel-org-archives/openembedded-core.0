Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHs1-0006xv-W3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:35:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2012 10:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="163405545"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 09 Jul 2012 10:24:27 -0700
Message-ID: <4FFB13CB.9010200@linux.intel.com>
Date: Mon, 09 Jul 2012 10:24:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341372067-24821-1-git-send-email-kartikmohta@gmail.com>
In-Reply-To: <1341372067-24821-1-git-send-email-kartikmohta@gmail.com>
Cc: Kartik Mohta <kartikmohta@gmail.com>
Subject: Re: [PATCH] gcc-common: Don't use "is" for comparing strings, use "=="
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
X-List-Received-Date: Mon, 09 Jul 2012 17:35:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 08:21 PM, Kartik Mohta wrote:
> Needed because the equality check was failing here even though upon
> printing the LHS and RHS were the same.
> As per http://stackoverflow.com/a/2987975/64537, using "is" compares the
> memory addresses of the two objects which is not what we want here. We
> just want to compare the values.
>
> Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 45828bb..0a9324a 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -10,7 +10,7 @@ inherit autotools gettext
>   FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/gcc-${PV}"
>
>   def get_gcc_fpu_setting(bb, d):
> -    if d.getVar('ARMPKGSFX_EABI', True) is "hf" and  d.getVar('TRANSLATED_TARGET_ARCH', True) is "arm":
> +    if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
>           return "--with-float=hard"
>       if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
>           return "--with-float=soft"
>

Merged into OE-Core

Thanks
	Sau!


