Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SaaQC-0007bU-SM
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 00:34:17 +0200
Received: by ghbz2 with SMTP id z2so3472803ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mDQMfUoghcZ5Aiy1P/Jed0wyyk8TTSGs4q+sH3JAyRA=;
	b=er22NZmZndlqChLKnjx/UxiCi2dvypaQsRQ+pd6zVs5HDiL0wNhTPDC2m1bSTodBvh
	q+qUW7EO3zZx78LB1rtLmogdetGmJDZOZFDgd8bLq8OMy7srM5GLwpGQlLhS3LvKOGqu
	pzmZX3XlnEGlcS5JniOZ0DItmHsUhIhkve3g+YuBTSpVXW+MFJ/R/sFCi925+l523GzN
	VpCwBzdufFCEWgDFO2Ey+7M6zqs3bd5pMFM3Imr1+8aTAYtTwmFa1LoBXUYiGq/Ka55l
	FmCK6XsTo2EFwCP146plbjPbSxjh0nR3VvYhluqqGhCPONNBkaws32xgE7usgcjcYT+Q
	BJtw==
MIME-Version: 1.0
Received: by 10.50.100.169 with SMTP id ez9mr3001164igb.44.1338589434504; Fri,
	01 Jun 2012 15:23:54 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Fri, 1 Jun 2012 15:23:54 -0700 (PDT)
In-Reply-To: <1A5FEE05-459D-4277-97CC-37F418BF1FFA@gmail.com>
References: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
	<CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
	<C20D3B8A-D5AF-46EE-BC26-5423752FE815@gmail.com>
	<CAAB-1ywzkrpx7yoxvZYj-ByCqsXvaATzngWDukZb98mayLfbnQ@mail.gmail.com>
	<F215876C-50E1-447C-9765-03AC9E75670D@gmail.com>
	<1A5FEE05-459D-4277-97CC-37F418BF1FFA@gmail.com>
Date: Fri, 1 Jun 2012 17:23:54 -0500
Message-ID: <CAAB-1yzne9QH7CP=wHxV80=_PnzLyUDzQkBgpkC50rF1kkKVdA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] Generating device tree for building linux-xilinx kernel
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
X-List-Received-Date: Fri, 01 Jun 2012 22:34:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Great,

I used this instructions to generate the device tree file for the project

http://xilinx.wikidot.com/device-tree-generator

Regards

On Fri, Jun 1, 2012 at 5:17 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi Adrian,
>
> On Jun 1, 2012, at 11:18 PM, Elvis Dowson wrote:
>
>> I've created a hardware bsp project using Xilinx SDK 14.1, and used the xilinx-ml507-update project, (after updating it to XPS 14.1 format).
>>
>> Now the script in meta-xilinx/classes/xilinx-kernel.bbclass is looking for a *.dts file, but I don't see that being created anywhere, in my bsp projects.
>
> Ok, got past that error, the *.dts file doesn't get created if I choose Wind River GPP 2.0.
>
> If I switch the distro to Monta Vista 5.0, it generates a ml507.dts file.
>
> Now when I execute bitbake linux-xilinx, it picks up the ml507.dts file correctly and builds the linux image.
>
> NOTE: Running task 521 of 867 (ID: 6, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_configure)
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_configure: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_configure: Succeeded
> NOTE: Running task 857 of 867 (ID: 7, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_compile)
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_compile: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_compile: Succeeded
> NOTE: Running task 858 of 867 (ID: 10, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_compile_kernelmodules)
> NOTE: Running task 859 of 867 (ID: 9, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_sizecheck)
> NOTE: Running task 860 of 867 (ID: 8, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_uboot_mkimage)
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_compile_kernelmodules: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_sizecheck: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_sizecheck: Succeeded
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_uboot_mkimage: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_uboot_mkimage: Succeeded
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_compile_kernelmodules: Succeeded
> NOTE: Running task 861 of 867 (ID: 2, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_install)
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_install: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_install: Succeeded
> NOTE: Running task 862 of 867 (ID: 13, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_package)
> NOTE: Running task 863 of 867 (ID: 11, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_deploy)
> NOTE: Running task 864 of 867 (ID: 3, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_populate_sysroot)
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_package: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_deploy: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_populate_sysroot: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_deploy: Succeeded
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_populate_sysroot: Succeeded
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_package: Succeeded
> NOTE: Running task 865 of 867 (ID: 15, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_package_write_rpm)
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_package_write_rpm: Started
> NOTE: package linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: task do_package_write_rpm: Succeeded
> NOTE: Running noexec task 866 of 867 (ID: 12, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_package_write)
> NOTE: Running noexec task 867 of 867 (ID: 5, /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, do_build)
> NOTE: Tasks Summary: Attempted 867 tasks of which 855 didn't need to be rerun and all succeeded.
>
> Best regards,
>
> Elvis Dowson
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com


