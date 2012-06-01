Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SaZP9-00022q-GC
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 23:29:07 +0200
Received: by wgbdr1 with SMTP id dr1so2156788wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Zd3Waxr5ODnWLUIVmGfq493I0KyN2o82BJLTjUEm4oQ=;
	b=Y5QWHee6yIs6Szy2PA4Mbv4YiYo6h5ECwddVsBdStjdGMXEYFdB8HtA7JK3VP5pDye
	KFII1migpy9nhFz0keOBo5tAN8zzAAlRDFBtD3dGMJFSmQAyDEHWVQDQVI2CQKj05P62
	thKvmS7I3Q6pnulBYQIrd52gCc4eLPs4pIMurdybNVeuLJxvRhBfjMEeD78w0qyGbtoM
	BegRoXaSbA1ZdCAzMYxgMYqbF6G//chHe1cT6LpECwVU/vQG6gXdaNkbRG9M4OwXm790
	glNm/UvSPys2+/WeMKwbJ1AUPluPZVMiTiLMBXHejv7TJTYMfNDNVgc3pMGxJvLtmmV2
	O4TA==
Received: by 10.216.194.93 with SMTP id l71mr3241929wen.169.1338585524376;
	Fri, 01 Jun 2012 14:18:44 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id k8sm11340449wia.6.2012.06.01.14.18.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 14:18:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAAB-1ywzkrpx7yoxvZYj-ByCqsXvaATzngWDukZb98mayLfbnQ@mail.gmail.com>
Date: Fri, 1 Jun 2012 23:18:41 +0200
Message-Id: <F215876C-50E1-447C-9765-03AC9E75670D@gmail.com>
References: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
	<CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
	<C20D3B8A-D5AF-46EE-BC26-5423752FE815@gmail.com>
	<CAAB-1ywzkrpx7yoxvZYj-ByCqsXvaATzngWDukZb98mayLfbnQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jun 2012 21:29:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On May 31, 2012, at 11:13 PM, Adrian Alonso wrote:

>>> That's a second process that you need todo with xilinx EDK to export
>>> and launch xilinx SDK
>>> from there create a new device tree project which will parse the =
"mhs"
>>> hardware descriptor file
>>> and from there generate the device tree according to the hwd =
settings...

I've created a hardware bsp project using Xilinx SDK 14.1, and used the =
xilinx-ml507-update project, (after updating it to XPS 14.1 format).

Now the script in meta-xilinx/classes/xilinx-kernel.bbclass is looking =
for a *.dts file, but I don't see that being created anywhere, in my bsp =
projects.

The XPS SDK project is generated into the following location from your =
XPS system.mhs project:

/project/xilinx-sdk-workspace (which contains two subfolders =
linux_2_6_bsp_0, and xilinx-ml507_hw_platform)

Your XPS project is located in

/project/xilinx-ml507-updated

and my local.conf settings are=20

XILINX_BSP_PATH ?=3D "/project/xilinx-ml507-updated"

is that the correct BSP path location?=20

When I try to build the linux-xilinx recipe, I get the following errors:

NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_unpack: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_unpack: Succeeded
NOTE: Running task 854 of 867 (ID: 1, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_patch)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_patch: Started
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_patch: Succeeded
NOTE: Running task 855 of 867 (ID: 6, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_configure)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_configure: Started
ERROR: Function failed: do_configure (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15/temp/log.do_configure.308=
45 for further information)
ERROR: Logfile of failure stored in: =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15/temp/log.do_configure.308=
45
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| ERROR: Function failed: do_configure (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15/temp/log.do_configure.308=
45 for further information)
| ERROR: No device tree found, missing hardware ref design?
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r15: =
task do_configure: Failed
ERROR: Task 6 =
(/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 856 tasks of which 852 didn't need to be =
rerun and 1 failed.

Summary: 1 task failed:
  /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.

Best regards,

Elvis Dowson=


