Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SaaJm-0005Ev-DP
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 00:27:38 +0200
Received: by werg55 with SMTP id g55so1692956wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=CwgMUVMMIMl/EsYqK/mRlRF/rFFZ2yrMRpNOiHuih98=;
	b=cmJPFle1wRCfmq6+PygmlOuSm0JrgnW5df440rgaXGaDx2v7mi8QWkmvbuHYDC45hp
	llP3saOL+TZc4ZRD9K+RUzXnmpfdmgMwDol1oz75YaxWFhNOzTnHTUO6T+bCHuksRQyy
	7kd+I9N4ER0MNsgWKbYUCLTiLGpOdJar8Los07RTvq5Be9jc/VkA7dj9diO2psRibNZ/
	+w4cKylIDBnmZ7uDud5H6JfQ7Rkv9hcPevrlSMx8aEXeHvg+6wQzmAhKa5mmnkJrNgMT
	iOIrkNyNzE8GCEy58UJT3YuS1v+LiZ+u405b6dF5CRTkznasVvWdKg6UBzcrjSLGCb1r
	cqag==
Received: by 10.216.218.77 with SMTP id j55mr3053984wep.179.1338589037016;
	Fri, 01 Jun 2012 15:17:17 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id k8sm11872818wia.6.2012.06.01.15.17.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 15:17:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <F215876C-50E1-447C-9765-03AC9E75670D@gmail.com>
Date: Sat, 2 Jun 2012 00:17:13 +0200
Message-Id: <1A5FEE05-459D-4277-97CC-37F418BF1FFA@gmail.com>
References: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
	<CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
	<C20D3B8A-D5AF-46EE-BC26-5423752FE815@gmail.com>
	<CAAB-1ywzkrpx7yoxvZYj-ByCqsXvaATzngWDukZb98mayLfbnQ@mail.gmail.com>
	<F215876C-50E1-447C-9765-03AC9E75670D@gmail.com>
To: Adrian Alonso <aalonso00@gmail.com>
X-Mailer: Apple Mail (2.1278)
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
X-List-Received-Date: Fri, 01 Jun 2012 22:27:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Jun 1, 2012, at 11:18 PM, Elvis Dowson wrote:

> I've created a hardware bsp project using Xilinx SDK 14.1, and used =
the xilinx-ml507-update project, (after updating it to XPS 14.1 format).
>=20
> Now the script in meta-xilinx/classes/xilinx-kernel.bbclass is looking =
for a *.dts file, but I don't see that being created anywhere, in my bsp =
projects.

Ok, got past that error, the *.dts file doesn't get created if I choose =
Wind River GPP 2.0.=20

If I switch the distro to Monta Vista 5.0, it generates a ml507.dts =
file.

Now when I execute bitbake linux-xilinx, it picks up the ml507.dts file =
correctly and builds the linux image.

NOTE: Running task 521 of 867 (ID: 6, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_configure)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_configure: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_configure: Succeeded
NOTE: Running task 857 of 867 (ID: 7, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_compile)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_compile: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_compile: Succeeded
NOTE: Running task 858 of 867 (ID: 10, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_compile_kernelmodules)
NOTE: Running task 859 of 867 (ID: 9, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_sizecheck)
NOTE: Running task 860 of 867 (ID: 8, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_uboot_mkimage)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_compile_kernelmodules: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_sizecheck: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_sizecheck: Succeeded
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_uboot_mkimage: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_uboot_mkimage: Succeeded
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_compile_kernelmodules: Succeeded
NOTE: Running task 861 of 867 (ID: 2, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_install)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_install: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_install: Succeeded
NOTE: Running task 862 of 867 (ID: 13, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_package)
NOTE: Running task 863 of 867 (ID: 11, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_deploy)
NOTE: Running task 864 of 867 (ID: 3, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_populate_sysroot)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_package: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_deploy: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_populate_sysroot: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_deploy: Succeeded
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_populate_sysroot: Succeeded
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_package: Succeeded
NOTE: Running task 865 of 867 (ID: 15, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_package_write_rpm)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_package_write_rpm: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_package_write_rpm: Succeeded
NOTE: Running noexec task 866 of 867 (ID: 12, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_package_write)
NOTE: Running noexec task 867 of 867 (ID: 5, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_build)
NOTE: Tasks Summary: Attempted 867 tasks of which 855 didn't need to be =
rerun and all succeeded.

Best regards,

Elvis Dowson



