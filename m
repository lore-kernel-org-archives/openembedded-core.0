Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E6B87616F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 15:16:25 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so6474097pde.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Q3JkhjQcNHnGAKfo8ITSOikpOAPGAH1J35v0rRPvoEA=;
	b=UdhymIoieSiTcS4ayrYTpm8n7HSPfG/aFtEc8nPmZQub36iDQmr9UJL9mS92WZBoI+
	FkyYo+t0Cfa7bTrGxPn8oAdzRTzwtqTmmb7Li1P/TeUkEDGXZC3Qmj9MsfnZPghNJ3hY
	GGSrx5+C4xpVq4xrQ2/oWunjwcBM7+Rm6BAVkqHQQ88Eni+zg6ga+9Ttx8YNpUCKh9Ky
	vg5Ots1H9i7Qp8JengtLOpB2mVosLFlg6qmVLUeRm6M5ihQi0nV1oHqwP74ZdahAOQF9
	Jy57WxPyZVHk2UHkW1s4OrK/MFXzeTg4yM2N9ewbjkIPtW+hQdkvJpkRJU8/5uPi3I0e
	Flbg==
X-Received: by 10.68.58.97 with SMTP id p1mr16277791pbq.144.1377702986817;
	Wed, 28 Aug 2013 08:16:26 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	yg3sm34512684pab.16.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 08:16:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521D0622.6090802@windriver.com>
Date: Wed, 28 Aug 2013 19:16:18 +0400
Message-Id: <2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
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
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
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
X-List-Received-Date: Wed, 28 Aug 2013 15:16:27 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F9B10B33-D567-46F5-BDB9-DC8ED15B254C"

--Apple-Mail=_F9B10B33-D567-46F5-BDB9-DC8ED15B254C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi,
       I get the following error while running the bitbake linux-yocto =
command for a qemu machine conf that I'm building. The build system is =
unable to find the dtc binary:

| make: Leaving directory =
`/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/=
3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/image/usr/src/kernel'
| NOTE: make -j 6 vexpress-v2p-ca9.dtb
|   DTC     arch/arm/boot/vexpress-v2p-ca9.dtb
| /bin/sh: =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/linux-qemuarma9-standard-build=
/scripts/dtc/dtc: No such file or directory
| make[3]: *** [arch/arm/boot/vexpress-v2p-ca9.dtb] Error 1
| make[2]: *** [vexpress-v2p-ca9.dtb] Error 2
| make[1]: *** [sub-make] Error 2
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/run.do_install.10606:1 =
exit 1 from
|   exit 1
| ERROR: Function failed: do_install (log file is located at =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/log.do_install.10606)
ERROR: Task 4 =
(/tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.4.bb, =
do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 598 tasks of which 597 didn't need to be =
rerun and 1 failed.


File : qemuarmhf.conf

#@TYPE: Machine
#@NAME: qemuarma9
#@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9.

# Specify the default tune.
DEFAULTTUNE =3D "armv7a-neon"

require conf/machine/include/qemu.inc
require conf/machine/include/tune-cortexa9.inc

# Specify the kernel devicetree.
KERNEL_DEVICETREE =3D "vexpress-v2p-ca9.dtb"

# Specify the machine name used by the kernel.
KMACHINE_qemuarma9 =3D "vexpress"

# Specify the kernel image type.
KERNEL_IMAGETYPE =3D "uImage"

# Set default load address.
# Override with KERNEL_EXTRA_ARGS_<board> +=3D "..." in machine file if =
required
#KERNEL_EXTRA_ARGS_qemuarma9 +=3D "UIMAGE_LOADADDR=3D0x8000"

# Specify the serial console parameters.
SERIAL_CONSOLE =3D "115200 ttyAMA0"


Best regards,

Elvis Dowson=

--Apple-Mail=_F9B10B33-D567-46F5-BDB9-DC8ED15B254C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div>&nbsp; &nbsp; &nbsp; &nbsp;I get the following error while =
running the bitbake linux-yocto command for a qemu machine conf that I'm =
building. The build system is unable to find the dtc =
binary:</div><div><br></div><div><font face=3D"Monaco" size=3D"2">| =
make: Leaving directory =
`/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/=
3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/image/usr/src/kernel'<br>| =
NOTE: make -j 6 vexpress-v2p-ca9.dtb<br>| &nbsp; DTC &nbsp; &nbsp; =
arch/arm/boot/vexpress-v2p-ca9.dtb<br>| /bin/sh: =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/linux-qemuarma9-standard-build=
/scripts/dtc/</font><font face=3D"Monaco"><font size=3D"2" =
color=3D"#ff2600">dtc: No&nbsp;such file or directory</font><br><font =
size=3D"2">| make[3]: *** [arch/arm/boot/vexpress-v2p-ca9.dtb] Error =
1</font><br><font size=3D"2">| make[2]: *** [vexpress-v2p-ca9.dtb] Error =
2</font><br><font size=3D"2">| make[1]: *** [sub-make] Error =
2</font><br><font size=3D"2">| make: *** [all] Error 2</font><br><font =
size=3D"2">| ERROR: oe_runmake failed</font><br><font size=3D"2">| =
WARNING: =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/run.do_install.10606:1 =
exit 1 from</font><br><font size=3D"2">| &nbsp; exit 1</font><br><font =
size=3D"2">| ERROR: Function failed: do_install (log file is located at =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/log.do_install.10606)</fo=
nt><br><font size=3D"2">ERROR: Task 4 =
(/tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.4.bb, =
do_install) failed with exit code '1'</font><br><font size=3D"2">NOTE: =
Tasks Summary: Attempted 598 tasks of which 597 didn't need to be rerun =
and 1 =
failed.</font><br></font><br></div><div><b><u><br></u></b></div><div><b><u=
>File : qemuarmhf.conf</u></b></div><div><br></div><div><font =
face=3D"Menlo"><span style=3D"font-size: 11px;">#@TYPE: =
Machine<br>#@NAME: qemuarma9<br>#@DESCRIPTION: Machine configuration for =
QEMU ARM Cortex A9.<br><br># Specify the default tune.<br>DEFAULTTUNE =3D =
"armv7a-neon"<br><br>require conf/machine/include/qemu.inc<br>require =
conf/machine/include/tune-cortexa9.inc<br><br># Specify the kernel =
devicetree.<br>KERNEL_DEVICETREE =3D "vexpress-v2p-ca9.dtb"<br><br># =
Specify the machine name used by the kernel.<br>KMACHINE_qemuarma9 =3D =
"vexpress"<br><br># Specify the kernel image type.<br>KERNEL_IMAGETYPE =3D=
 "uImage"<br><br># Set default load address.<br># Override with =
KERNEL_EXTRA_ARGS_&lt;board&gt; +=3D "..." in machine file if =
required<br>#KERNEL_EXTRA_ARGS_qemuarma9 +=3D =
"UIMAGE_LOADADDR=3D0x8000"<br><br># Specify the serial console =
parameters.<br>SERIAL_CONSOLE =3D "115200 =
ttyAMA0"</span></font></div><div><br></div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis Dowson</div></body></html>=

--Apple-Mail=_F9B10B33-D567-46F5-BDB9-DC8ED15B254C--
