Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0hH-0007fA-JK
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:11:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2011 10:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="41638171"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 10:06:54 -0700
Message-ID: <4E49522E.9020101@linux.intel.com>
Date: Mon, 15 Aug 2011 10:06:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313164608.6733.162.camel@phil-desktop>
In-Reply-To: <1313164608.6733.162.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] pixman: remove spurious dependency on libx11
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
X-List-Received-Date: Mon, 15 Aug 2011 17:11:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 08:56 AM, Phil Blundell wrote:
> Nothing in pixman actually uses libx11, so no need to DEPEND on it.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
> index e5472c0..1a33a18 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
> @@ -13,8 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
>                       file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
>                      "
>
> -DEPENDS = "virtual/libx11"
> -
>   PE = "1"
>   PR = "r0"
>

Merged into OE-Core

Thanks
	Sau!


