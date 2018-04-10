Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 380C1747C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 09:55:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40L2bc0ygQz1qtfG;
	Tue, 10 Apr 2018 11:55:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40L2bc04zQz1qqkr;
	Tue, 10 Apr 2018 11:55:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 2fpExPbkWWmp; Tue, 10 Apr 2018 11:55:22 +0200 (CEST)
X-Auth-Info: dQn5tlFUvfNwtcTTUVFx90Jz/IWSxbC9JuoAHtmxDRg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 10 Apr 2018 11:55:22 +0200 (CEST)
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>,
	Khem Raj <raj.khem@gmail.com>
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
From: Marek Vasut <marex@denx.de>
Message-ID: <53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
Date: Tue, 10 Apr 2018 11:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Tue, 10 Apr 2018 09:55:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04/10/2018 11:49 AM, Martin Hundebøll wrote:
> Hi,

Hi,

> I had to patch up our own u-boot recipe as shown in the attached patch
> to make v2018.03 compile for qemu-x86.
> 
> The thing is that the build of pylibfdt became unconditional since
> 15b97f5c5e ('pylibfdt: move pylibfdt to scripts/dtc/pylibfdt and
> refactor makefile')
> 
> In my case u-boot/pylibfdt failed to find the correct (native) headers,
> because python setuptools / distutils looks into STAGING_{LIB,INC}DIR
> when compiling the native extension for libfdt. I didn't find any other
> way to specificy this in either the u-boot Makefile or some other magic
> environment variable.

CCing Yamada-san, maybe he has an idea.
Also, do not top post.

> // Martin
> 
> On 2018-04-09 02:54, Khem Raj wrote:
>>
>> On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de
>> <mailto:marex@denx.de>> wrote:
>>
>>     This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>>     patches accepted upstream, getting the patch count to zero.
>>
>>
>>
>> It fails for me if I have libfdt installed on build host
>> It seems build is doing the include dance which goes all the way into
>> hosts system include directories
>>
>>
>>
>>     Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de>>
>>     Cc: Otavio Salvador <otavio@ossystems.com.br
>>     <mailto:otavio@ossystems.com.br>>
>>     Cc: Ross Burton <ross.burton@intel.com
>> <mailto:ross.burton@intel.com>>
>>     Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>>     <mailto:richard.purdie@linuxfoundation.org>>
>>     ---
>>       .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19
>>     -------------------
>>       ...t-common_2018.01.inc => u-boot-common_2018.03.inc} |  6 ++----
>>       ...fw-utils_2018.01.bb <http://fw-utils_2018.01.bb> =>
>>     u-boot-fw-utils_2018.03.bb <http://u-boot-fw-utils_2018.03.bb>} |  0
>>       ...t-mkimage_2018.01.bb <http://t-mkimage_2018.01.bb> =>
>>     u-boot-mkimage_2018.03.bb <http://u-boot-mkimage_2018.03.bb>} |  0
>>       .../u-boot/{u-boot_2018.01.bb <http://u-boot_2018.01.bb> =>
>>     u-boot_2018.03.bb <http://u-boot_2018.03.bb>}   |  0
>>       5 files changed, 2 insertions(+), 23 deletions(-)
>>       delete mode 100644
>>     meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>       rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc =>
>>     u-boot-common_2018.03.inc} (68%)
>>       rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.01.bb
>>     <http://u-boot-fw-utils_2018.01.bb> => u-boot-fw-utils_2018.03.bb
>>     <http://u-boot-fw-utils_2018.03.bb>} (100%)
>>       rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.01.bb
>>     <http://u-boot-mkimage_2018.01.bb> => u-boot-mkimage_2018.03.bb
>>     <http://u-boot-mkimage_2018.03.bb>} (100%)
>>       rename meta/recipes-bsp/u-boot/{u-boot_2018.01.bb
>>     <http://u-boot_2018.01.bb> => u-boot_2018.03.bb
>>     <http://u-boot_2018.03.bb>} (100%)
>>
>>     diff --git
>>     a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>     b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>     deleted file mode 100644
>>     index ecaa1796a4..0000000000
>>     --- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>>     +++ /dev/null
>>     @@ -1,19 +0,0 @@
>>     -Enabled dhcp client functionality for Yocto reference
>>     -hardware MPC8315E-RDB.
>>     -
>>     -Upstream-Status: Pending
>>     -
>>     -Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com
>>     <mailto:ed.bartosh@linux.intel.com>>
>>     -
>>     -Index: git/configs/MPC8315ERDB_defconfig
>>     -===================================================================
>>     ---- git.orig/configs/MPC8315ERDB_defconfig
>>     -+++ git/configs/MPC8315ERDB_defconfig
>>     -@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
>>     - CONFIG_CMD_SATA=y
>>     - CONFIG_CMD_USB=y
>>     - # CONFIG_CMD_SETEXPR is not set
>>     -+CONFIG_CMD_DHCP=y
>>     - CONFIG_CMD_MII=y
>>     - CONFIG_CMD_PING=y
>>     - CONFIG_CMD_DATE=y
>>     diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>>     b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>>     similarity index 68%
>>     rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>>     rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>>     index d2073ea0c7..8ffae365a9 100644
>>     --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>>     +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>>     @@ -7,10 +7,8 @@ PE = "1"
>>
>>       # We use the revision in order to avoid having to fetch it from the
>>       # repo during parse
>>     -SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
>>     +SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
>>
>>     -SRC_URI = "git://git.denx.de/u-boot.git
>>     <http://git.denx.de/u-boot.git> \
>>     -    file://MPC8315ERDB-enable-DHCP.patch \
>>     -"
>>     +SRC_URI = "git://git.denx.de/u-boot.git
>>     <http://git.denx.de/u-boot.git>"
>>
>>       S = "${WORKDIR}/git"
>>     diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>>     <http://u-boot-fw-utils_2018.01.bb>
>>     b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>>     <http://u-boot-fw-utils_2018.03.bb>
>>     similarity index 100%
>>     rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>>     <http://u-boot-fw-utils_2018.01.bb>
>>     rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>>     <http://u-boot-fw-utils_2018.03.bb>
>>     diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>>     <http://u-boot-mkimage_2018.01.bb>
>>     b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>>     <http://u-boot-mkimage_2018.03.bb>
>>     similarity index 100%
>>     rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>>     <http://u-boot-mkimage_2018.01.bb>
>>     rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>>     <http://u-boot-mkimage_2018.03.bb>
>>     diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>>     <http://u-boot_2018.01.bb>
>>     b/meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>> <http://u-boot_2018.03.bb>
>>     similarity index 100%
>>     rename from meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>>     <http://u-boot_2018.01.bb>
>>     rename to meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>>     <http://u-boot_2018.03.bb>
>>     --
>>     2.16.2
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>


-- 
Best regards,
Marek Vasut

