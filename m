Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9C6361F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 19:57:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7RJvBwp016212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2013 12:57:11 -0700 (PDT)
Received: from [128.224.21.154] (128.224.21.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 27 Aug 2013 12:57:11 -0700
Message-ID: <521D0495.203@windriver.com>
Date: Tue, 27 Aug 2013 15:57:09 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
In-Reply-To: <1377251290-4290-1-git-send-email-lpapp@kde.org>
X-Originating-IP: [128.224.21.154]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Tue, 27 Aug 2013 19:57:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-23 05:48 AM, Laszlo Papp wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb | 27 +++++++++++++++++++++++
>   meta/recipes-bsp/u-boot/u-boot_2013.07.bb         | 23 +++++++++++++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>
...
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> new file mode 100644
> index 0000000..f3f4b62
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> @@ -0,0 +1,23 @@
> +require u-boot.inc
> +
> +# To build u-boot for your machine, provide the following lines in your machine
> +# config, replacing the assignments as appropriate for your machine.
> +# UBOOT_MACHINE = "omap3_beagle_config"
> +# UBOOT_ENTRYPOINT = "0x80008000"
> +# UBOOT_LOADADDRESS = "0x80008000"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +
> +# This revision corresponds to the tag "v2013.07"
> +# We use the revision in order to avoid having to fetch it from the repo during parse
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +
> +PV = "v2013.07+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"

Just curious...
I dont' see a good reason to specify the git protocol twice:
    git://.... and ; protocol=git

This occurs in many recipes and we could get rid of the clutter
with a script if it bothers anyone else. :)

Am I missing something or are people just copying and pasting the text?

// Randy

> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

