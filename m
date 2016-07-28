Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D20E16072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 13:02:39 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 38so98710661iol.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ABRePCumsPCpYeKgFeover5+Ul3loeJKs2cmk6Soqt4=;
	b=EbRm2RGARJc+h+KT4pBTDjZyyS8sWE/1FrBmCwd/8mSayqiQiCdsN+2Xl6JDK31U9l
	3BXzoLAh+2GHd3zQ1lDRL+Wq2dnOves7hOV3nUl1o+Ag9UoP+2Hw3lzcmkCYsmWHTaNK
	pk0fCKTpCeY1t11hxSrjYiEsvZfums7fOCZlxVfbozjCLm673ekiwe+zAqctNPlH73Hh
	FwUhaRtVvHXmeOLOCEzV4ivh2PWz0IrmoCeZRPgduYAQ7kfKan6JYjcLO6IlIJn6NrdT
	JvLoC3CFDJCUKEidVsfZ2uWP2GYDLN+eJg2nDeITCJjUGV6UMOTWp5ZHPZrtzgv2Plu1
	xGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ABRePCumsPCpYeKgFeover5+Ul3loeJKs2cmk6Soqt4=;
	b=kFaaKUkPT7uBcL3XmyFgAMQ/UMugFfKsTkdQnEXVHJBbpnTsyIQ5ov7cUr6U3d144F
	N1l9JeZ6kwfFRjTQgoQufdtu7gxbtBIm/Lc3UfgQbhfcZ0kG8YRX1RFNwEoMh2pa95PY
	feETvkguRDP5rLLC7Nmahp9Nq07nnsWm360oBqFjxOY79FLQ3rxSKtFXv2ANy9IR+jRk
	b13d2MBH4Ph2mLZUYNS3nOyh//7rr7vUO9jYIxbhz1g79BPboS9xPDBJP9MqJus9Ss13
	9/kFqjUDMV7tDjgloIaX9tbdTC+EY1QaLNvWWDxxAxr4BzUQvaf9xwEuUF5/+psr/NjE
	fs/Q==
X-Gm-Message-State: AEkooutVSj6mkRTB9pz+Kg0WIg2PZIs2T+C5yilf4ODAbcFVhtHKXgNSBs+/V+NsRNoYLp/o7n7JPe2DegE618mp
X-Received: by 10.107.135.142 with SMTP id r14mr42359448ioi.133.1469710959880; 
	Thu, 28 Jul 2016 06:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 28 Jul 2016 06:02:20 -0700 (PDT)
In-Reply-To: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jul 2016 14:02:20 +0100
Message-ID: <CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Thu, 28 Jul 2016 13:02:41 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcafdabe0538b1bf4d

--001a113eccbcafdabe0538b1bf4d
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 23:21, Manjukumar Matha <
manjukumar.harthikote-matha@xilinx.com> wrote:

> This patch enables building u-boot using externalsrc
>

The commit summary should mention that it's enabling out-of-tree builds, of
which supporting externalsrc is a side effect.

However this doesn't work for me with beaglebone:

|   arm-poky-linux-gnueabi-gcc
 --sysroot=/data/poky-master/tmp-glibc/sysroots/beaglebone -E
-Wp,-MD,./.u-boot.cfg.d -D__KERNEL__ -D__UBOOT__   -Iinclude
 -I/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include

-I/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/arch//include
-include
/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/linux/kconfig.h
 -nostdinc -isystem
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.1.1/include
-include
/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/u-boot/u-boot.lds.h
-DCPUDIR=  -ansi -DDO_DEPS_ONLY -D__ASSEMBLY__ -x assembler-with-cpp -P -dM
-E -o u-boot.cfg
/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/config.h
| In file included from
/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/configs/am335x_evm.h:19:0,
|                  from
/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/config.h:6:
|
/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/configs/ti_am335x_common.h:22:27:
fatal error: asm/arch/omap.h: No such file or directory
|  #include <asm/arch/omap.h>
|                            ^
| compilation terminated.

Ross

--001a113eccbcafdabe0538b1bf4d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2016 at 23:21, Manjukumar Matha <span dir=3D"ltr">&lt;<a href=3D=
"mailto:manjukumar.harthikote-matha@xilinx.com" target=3D"_blank">manjukuma=
r.harthikote-matha@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><di=
v id=3D":1jg" class=3D"">This patch enables building u-boot using externals=
rc<br></div></blockquote><div><br></div><div>The commit summary should ment=
ion that it&#39;s enabling out-of-tree builds, of which supporting external=
src is a side effect.</div><div><br></div><div>However this doesn&#39;t wor=
k for me with beaglebone:=C2=A0</div></div><br><div class=3D"gmail_extra">|=
 =C2=A0 arm-poky-linux-gnueabi-gcc =C2=A0--sysroot=3D/data/poky-master/tmp-=
glibc/sysroots/beaglebone -E -Wp,-MD,./.u-boot.cfg.d -D__KERNEL__ -D__UBOOT=
__ =C2=A0 -Iinclude =C2=A0-I/data/poky-master/tmp-glibc/work/beaglebone-pok=
y-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include =C2=A0=
 -I/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2=
016.03+gitAUTOINC+df61a74e68-r0/git/arch//include -include /data/poky-maste=
r/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+d=
f61a74e68-r0/git/include/linux/kconfig.h =C2=A0-nostdinc -isystem /data/pok=
y-master/tmp-glibc/sysroots/x86_64-linux/usr/lib/arm-poky-linux-gnueabi/gcc=
/arm-poky-linux-gnueabi/6.1.1/include -include /data/poky-master/tmp-glibc/=
work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0=
/git/include/u-boot/u-boot.lds.h -DCPUDIR=3D =C2=A0-ansi -DDO_DEPS_ONLY -D_=
_ASSEMBLY__ -x assembler-with-cpp -P -dM -E -o u-boot.cfg /data/poky-master=
/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df=
61a74e68-r0/git/include/config.h</div><div class=3D"gmail_extra">| In file =
included from /data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueab=
i/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/configs/am335x_evm.h=
:19:0,</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /data/poky-master/tmp-glibc/work/beaglebon=
e-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/git/include/c=
onfig.h:6:</div><div class=3D"gmail_extra">| /data/poky-master/tmp-glibc/wo=
rk/beaglebone-poky-linux-gnueabi/u-boot/v2016.03+gitAUTOINC+df61a74e68-r0/g=
it/include/configs/ti_am335x_common.h:22:27: fatal error: asm/arch/omap.h: =
No such file or directory</div><div class=3D"gmail_extra">| =C2=A0#include =
&lt;asm/arch/omap.h&gt;</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^</div><div class=3D"gmail_extra">| compilation terminated.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
></div>

--001a113eccbcafdabe0538b1bf4d--
