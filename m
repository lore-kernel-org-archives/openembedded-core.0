Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9CFC7204D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:34:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA65Y8aL009468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 21:34:08 -0800 (PST)
Received: from [128.224.163.178] (128.224.163.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 5 Nov 2014 21:34:07 -0800
Message-ID: <545B084F.9010907@windriver.com>
Date: Thu, 6 Nov 2014 13:34:07 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1415248440-28251-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1415248440-28251-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH 1/1] busybox: add the dropped patches back
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
X-List-Received-Date: Thu, 06 Nov 2014 05:34:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

please drop it, thanks

-Roy

On Thursday, November 06, 2014 12:34 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> busybox-cross-menuconfig.patch and busybox-install-ping6-to-usr-bin.patch
> were dropped when uprev, add them back.
>
> no busybox-cross-menuconfig.patch, "bitbake -c menuconfig busybox" did not
> work.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../{busybox-1.21.1 => busybox-1.22.1}/busybox-cross-menuconfig.patch   | 0
>   .../busybox-install-ping6-to-usr-bin.patch                              | 0
>   meta/recipes-core/busybox/busybox_1.22.1.bb                             | 2 ++
>   3 files changed, 2 insertions(+)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox-1.22.1}/busybox-cross-menuconfig.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox-1.22.1}/busybox-install-ping6-to-usr-bin.patch (100%)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-cross-menuconfig.patch b/meta/recipes-core/busybox/busybox-1.22.1/busybox-cross-menuconfig.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-cross-menuconfig.patch
> rename to meta/recipes-core/busybox/busybox-1.22.1/busybox-cross-menuconfig.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.22.1/busybox-install-ping6-to-usr-bin.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.22.1/busybox-install-ping6-to-usr-bin.patch
> diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
> index 82f7f68..2a4e647 100644
> --- a/meta/recipes-core/busybox/busybox_1.22.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
> @@ -6,6 +6,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://get_header_tar.patch \
>              file://busybox-appletlib-dependency.patch \
>              file://busybox-udhcpc-no_deconfig.patch \
> +           file://busybox-cross-menuconfig.patch \
> +           file://busybox-install-ping6-to-usr-bin.patch \
>              file://find-touchscreen.sh \
>              file://busybox-cron \
>              file://busybox-httpd \
>

-- 
Best Reagrds,
Roy | RongQing Li

