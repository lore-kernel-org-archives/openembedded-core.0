Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B816E60655
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 23:57:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2013 16:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,797,1367996400"; d="scan'208";a="355818302"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2013 16:57:44 -0700
Message-ID: <51FAF5F8.3090602@linux.intel.com>
Date: Thu, 01 Aug 2013 16:57:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, 
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	Zhenhua Luo <zhenhua.luo@freescale.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
	<de6a83423f5ac7d902282d888934078c89fa0a01.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <de6a83423f5ac7d902282d888934078c89fa0a01.1375275560.git.laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/13] xf86-input-evdev: upgrade to 2.8.1
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
X-List-Received-Date: Thu, 01 Aug 2013 23:57:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 06:09 AM, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   ...ut-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} (83%)
>
Looks like this change will require a bbappend update to your layers.

It's not in master yet, but will be shortly.

Thanks
	Sau!

> diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
> similarity index 83%
> rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
> rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
> index d19b82f..bc6c7fc 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
> @@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
>
>   DEPENDS += "mtdev"
>
> -SRC_URI[md5sum] = "e9bef0779d364cb588aa93a0ee6736c8"
> -SRC_URI[sha256sum] = "2f5b4403955f8e82603acff7f8f21a67e89a7c0230e1506c6924c4b9dd8f0e57"
> +SRC_URI[md5sum] = "cc1f59e22edfbc69daecf01e43a8dba3"
> +SRC_URI[sha256sum] = "09f887e1ce6cdb92154035db9044e0795a5c80f1ffb9efc599aed9a9dc1ff539"
>

