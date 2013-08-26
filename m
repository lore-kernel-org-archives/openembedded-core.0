Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF2E6A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 01:03:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q13NrY012646
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 18:03:23 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 25 Aug 2013 18:03:22 -0700
Message-ID: <521AA95A.8000803@windriver.com>
Date: Sun, 25 Aug 2013 21:03:22 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Elvis Dowson <elvis.dowson@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
In-Reply-To: <4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
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
X-List-Received-Date: Mon, 26 Aug 2013 01:03:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-25 3:09 PM, Elvis Dowson wrote:
> Hi Bruce,
>                     I noticed that you've committed the changes for qemuarma9 KMACHINE configuration to the linux-yocto kernel.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/tree/meta/cfg/kernel-cache/bsp?h=meta
>
> I adapted the qemuarm.conf configuration and booted it up, but nothing shows up in the QEMU window, I just get a black screen.
>
> Has qemu with the qemuarma9 configuration been successfully built and tested before?

It has been, but not with a machine definition that is part of oe-core
or Yocto.

It was contributed as the output from some cortexA9 testing, and I've
been carrying the kernel parts ever since.

>
> This is how my qemuarm.conf looks like, locally at the moment:
>
> #@TYPE: Machine
> #@NAME: qemuarmhf
> #@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard float.
>
> # Specify the default tune.
> DEFAULTTUNE = "armv7a-neon"
>
> require conf/machine/include/qemu.inc
> require conf/machine/include/tune-cortexa9.inc
>
> # Specify the machine name used by the kernel.
> KMACHINE_qemuarm = "qemuarma9"

This is a default, so you don't need to set it.

>
> # Specify the kernel image type.
> KERNEL_IMAGETYPE = "zImage"

I recall booting it with a uImage, but maybe my memory is failing.

>
> # Specify the serial console parameters.
> SERIAL_CONSOLE = "115200 ttyAMA0"

All of the above looks reasonably sane, but it's more about how you
launch qemu than the kernel build that is probably resulting in your
issues. What machine subtype did you use ?

Bruce

>
>
> Elvis Dowson
>


