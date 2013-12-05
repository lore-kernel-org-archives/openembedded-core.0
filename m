Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 68F916DF23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 19:53:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2013 11:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,835,1378882800"; d="scan'208";a="439296488"
Received: from jbrandeb-mobl.amr.corp.intel.com (HELO [10.255.15.213])
	([10.255.15.213])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2013 11:53:23 -0800
Message-ID: <52A0D9B3.10107@linux.intel.com>
Date: Thu, 05 Dec 2013 11:53:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>, 
	openembedded-core@lists.openembedded.org
References: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH V2][ 1/2] libav: Add v9.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 19:53:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2013 01:01 AM, Andrei Gherzan wrote:
> This version includes libavresample needed for packages like xbmc.
> To use this version add:
> PREFERRED_VERSION_libav = "9.10".
> Removed git version as being an older version of a 9.X release.
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>   .../libav/{libav_git.bb => libav_9.10.bb}               | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
>   rename meta/recipes-multimedia/libav/{libav_git.bb => libav_9.10.bb} (65%)
>
> diff --git a/meta/recipes-multimedia/libav/libav_git.bb b/meta/recipes-multimedia/libav/libav_9.10.bb
> similarity index 65%
> rename from meta/recipes-multimedia/libav/libav_git.bb
> rename to meta/recipes-multimedia/libav/libav_9.10.bb
> index 951baa9..a76cc9c 100644
> --- a/meta/recipes-multimedia/libav/libav_git.bb
> +++ b/meta/recipes-multimedia/libav/libav_9.10.bb
> @@ -1,16 +1,13 @@
>   require libav.inc
>
> -LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
> -                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +SRC_URI = "http://libav.org/releases/libav-9.10.tar.xz"
>
why not use ${BP} here instead, so we do not need to edit it for version 
changes?


> -PV = "9.8+git${SRCPV}"
> +SRC_URI[md5sum] = "4b49d1d8734815ca095bb0600d41c5cb"
> +SRC_URI[sha256sum] = "83dbe640779da1c1e8d8836c99575f57f749d18407494ebca451578afee9300d"
>
>   DEFAULT_PREFERENCE = "-1"
>
> -SRCREV = "9aaca159bd220582c698f13d081a455f398c9975"
> -SRC_URI = "git://git.libav.org/libav.git"
> -
> -S = "${WORKDIR}/git"
> -
> +LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
> +                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>
LIC_FILES_CHKSUM should be at the beginning before the SRC_URI

Thanks
	Sau!


