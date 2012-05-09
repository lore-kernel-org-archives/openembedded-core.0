Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSGSW-0003Sx-NV
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:38:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2012 16:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141123242"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 16:28:22 -0700
Message-ID: <4FAAFD96.7040804@linux.intel.com>
Date: Wed, 09 May 2012 16:28:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336497947-28128-1-git-send-email-eric@eukrea.com>
	<1336498243-14896-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1336498243-14896-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH v2] zlib: upgrade to 1.2.7
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
X-List-Received-Date: Wed, 09 May 2012 23:38:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/08/2012 10:30 AM, Eric Bénard wrote:
> 1.2.6 is no more fetchable and 1.2.7 fix some bugs, full changelog is
> available here : http://zlib.net/ChangeLog.txt
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
> v2 : remove PR=r1
>
>   .../remove.ldconfig.call.patch                     |    0
>   .../zlib/{zlib_1.2.6.bb =>  zlib_1.2.7.bb}          |    6 ++----
>   2 files changed, 2 insertions(+), 4 deletions(-)
>   rename meta/recipes-core/zlib/{zlib-1.2.6 =>  zlib-1.2.7}/remove.ldconfig.call.patch (100%)
>   rename meta/recipes-core/zlib/{zlib_1.2.6.bb =>  zlib_1.2.7.bb} (80%)
>
> diff --git a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
> similarity index 100%
> rename from meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
> rename to meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
> diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
> similarity index 80%
> rename from meta/recipes-core/zlib/zlib_1.2.6.bb
> rename to meta/recipes-core/zlib/zlib_1.2.7.bb
> index 54f8abf..803fec3 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.6.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
> @@ -6,13 +6,11 @@ SECTION = "libs"
>   LICENSE = "Zlib"
>   LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
>
> -PR = "r1"
> -
>   SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>              file://remove.ldconfig.call.patch \
>              "
> -SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
> -SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
> +SRC_URI[md5sum] = "2ab442d169156f34c379c968f3f482dd"
> +SRC_URI[sha256sum] = "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378c79d52e9334934"
>
>   do_configure (){
>   	./configure --prefix=${prefix} --shared --libdir=${libdir}

Merged into OE-Core

Thanks
	Sau!


