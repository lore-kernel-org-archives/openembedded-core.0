Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB17E6DF23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 19:25:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2013 11:25:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,835,1378882800"; d="scan'208";a="439283301"
Received: from jbrandeb-mobl.amr.corp.intel.com (HELO [10.255.15.213])
	([10.255.15.213])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2013 11:25:53 -0800
Message-ID: <52A0D341.7090007@linux.intel.com>
Date: Thu, 05 Dec 2013 11:25:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>, 
	openembedded-core@lists.openembedded.org
References: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
	<1386234101-21411-2-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1386234101-21411-2-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH V2][ 2/2] libav: Update to v0.8.9
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
X-List-Received-Date: Thu, 05 Dec 2013 19:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Andrei:

I see RP already merged this, but I have a couple of comments


On 12/05/2013 01:01 AM, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>   .../0001-configure-enable-pic-for-AArch64.patch                   | 0
>   meta/recipes-multimedia/libav/{libav_0.8.8.bb => libav_0.8.9.bb}  | 8 +++-----
>   2 files changed, 3 insertions(+), 5 deletions(-)
>   rename meta/recipes-multimedia/libav/{libav-0.8.8 => libav-0.8.9}/0001-configure-enable-pic-for-AArch64.patch (100%)
>   rename meta/recipes-multimedia/libav/{libav_0.8.8.bb => libav_0.8.9.bb} (69%)
>
> diff --git a/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch
> similarity index 100%
> rename from meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
> rename to meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch

We are generally trying to get rid of versioned patch directory in favor 
of just a general recipe name (libav in this case).

> diff --git a/meta/recipes-multimedia/libav/libav_0.8.8.bb b/meta/recipes-multimedia/libav/libav_0.8.9.bb
> similarity index 69%
> rename from meta/recipes-multimedia/libav/libav_0.8.8.bb
> rename to meta/recipes-multimedia/libav/libav_0.8.9.bb
> index 9cb4cf2..065a6d2 100644
> --- a/meta/recipes-multimedia/libav/libav_0.8.8.bb
> +++ b/meta/recipes-multimedia/libav/libav_0.8.9.bb
> @@ -1,10 +1,10 @@
>   require libav.inc
>
> -SRC_URI = "http://libav.org/releases/libav-0.8.8.tar.xz \
> +SRC_URI = "http://libav.org/releases/libav-0.8.9.tar.xz \
why not convert this to ${BP} so it does not need to be edited in the 
future. BP = BPN-PV.

Sau!

>              file://0001-configure-enable-pic-for-AArch64.patch"
>
> -SRC_URI[md5sum] = "34b8f1279a04466386ed67731197efe3"
> -SRC_URI[sha256sum] = "e95cf618eb6239177a62c46f15e840c37e02e8308baf94912fc5910ff4aacbf2"
> +SRC_URI[md5sum] = "7c0e5743cd5c4d4b1bcafd02a2e82e09"
> +SRC_URI[sha256sum] = "4f5181164e4007d5b0013bb3cc5e3b7393ab71ac286319c714b7697e2784f77f"
>
>   LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> @@ -14,5 +14,3 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>   EXTRA_OECONF += " \
>       --enable-postproc \
>   "
> -
> -
>

