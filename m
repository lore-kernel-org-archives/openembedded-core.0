Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THH21-0002Gu-MH
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:33:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2012 09:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="214488696"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2012 09:20:52 -0700
Message-ID: <50647CE3.8020108@linux.intel.com>
Date: Thu, 27 Sep 2012 09:20:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1348309833-13334-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1348309833-13334-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu-native: fix build on hosts without libX11 installed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 16:33:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2012 03:30 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-devtools/qemu/qemu_1.2.0.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> index 7091f6d..191ee48 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> @@ -17,7 +17,7 @@ SRC_URI = "\
>   SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
>   SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI_append_virtclass-nativesdk = "\
>       file://relocatable_sdk.patch \
> @@ -29,4 +29,8 @@ do_configure_prepend_virtclass-nativesdk() {
>   		sed -i 's/-lX11//g' Makefile.target
>   	fi
>   }
> +do_configure_prepend_virtclass-native() {
> +	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
> +	sed -i 's/-lX11//g' Makefile.target
> +}
>
>

Merged into OE-Core

Thanks
	Sau!



