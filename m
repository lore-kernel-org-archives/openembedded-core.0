Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51DD36BD05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 22:44:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7SMiA5m010210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2013 15:44:10 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 28 Aug 2013 15:44:10 -0700
Message-ID: <521E7D2E.6060404@windriver.com>
Date: Wed, 28 Aug 2013 18:43:58 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Elvis Dowson <elvis.dowson@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
In-Reply-To: <2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Wed, 28 Aug 2013 22:44:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-28 11:16 AM, Elvis Dowson wrote:
> Hi,
>         I get the following error while running the bitbake linux-yocto
> command for a qemu machine conf that I'm building. The build system is
> unable to find the dtc binary:
>
> | make: Leaving directory
> `/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/image/usr/src/kernel'
> | NOTE: make -j 6 vexpress-v2p-ca9.dtb
> |   DTC     arch/arm/boot/vexpress-v2p-ca9.dtb
> | /bin/sh:
> /tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/linux-qemuarma9-standard-build/scripts/dtc/dtc:
> No such file or directory
> | make[3]: *** [arch/arm/boot/vexpress-v2p-ca9.dtb] Error 1
> | make[2]: *** [vexpress-v2p-ca9.dtb] Error 2
> | make[1]: *** [sub-make] Error 2
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING:
> /tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/run.do_install.10606:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_install (log file is located at
> /tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/log.do_install.10606)
> ERROR: Task 4
> (/tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.4.bb,
> do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 598 tasks of which 597 didn't need to be
> rerun and 1 failed.

Did you ever get past this ? It looks like the recent device tree
changes where we use the kernel dtc versus an external dtc are causing
you a problem.

Bruce

>
> *_
> _*
> *_File : qemuarmhf.conf_*
>
> #@TYPE: Machine
> #@NAME: qemuarma9
> #@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9.
>
> # Specify the default tune.
> DEFAULTTUNE = "armv7a-neon"
>
> require conf/machine/include/qemu.inc
> require conf/machine/include/tune-cortexa9.inc
>
> # Specify the kernel devicetree.
> KERNEL_DEVICETREE = "vexpress-v2p-ca9.dtb"
>
> # Specify the machine name used by the kernel.
> KMACHINE_qemuarma9 = "vexpress"
>
> # Specify the kernel image type.
> KERNEL_IMAGETYPE = "uImage"
>
> # Set default load address.
> # Override with KERNEL_EXTRA_ARGS_<board> += "..." in machine file if
> required
> #KERNEL_EXTRA_ARGS_qemuarma9 += "UIMAGE_LOADADDR=0x8000"
>
> # Specify the serial console parameters.
> SERIAL_CONSOLE = "115200 ttyAMA0"
>
>
> Best regards,
>
> Elvis Dowson


