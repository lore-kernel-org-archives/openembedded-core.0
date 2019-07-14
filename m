Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9697ECC4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 20:02:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j8so10792906wrj.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=snt+OBXRmZb0ASZVyI4HXJxbqpWC9FEMrB7eXsOY7Xk=;
	b=IVTaLR5r0Akqea0j7SxyMyHfqU2D147jCzL5a9i65pMQXqwz56EHL5V6VXfxElg6Hg
	06ILG/uu0tLwhKLPUfVv15aTNRd8eBLLbfbdBLfF3JHO19Rbxad7uP9VMkedaQQU8RQs
	6LK6eT4wwkMSNkCehCFaGiURwE8njGd2biBgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=snt+OBXRmZb0ASZVyI4HXJxbqpWC9FEMrB7eXsOY7Xk=;
	b=Lu0zxA8GtLElol+XPsQDHWEpaxxuzmwzK7T0aGB58fLF64jIGiTaIl9gZwfuLjTw+6
	DCL+kqfF8Vev2Pzt7JZVt9NuARA3jjyN1Zy1ON7Mxp9iEa4FprWg1TKPDArVgZR21EL+
	nbXfUjbXnYaSGiKvZ0zhZGea7H3tqC61yVzaXWkKYIgVnNoK7n5UMdtEnznb2uQ540bW
	rPSglG4QxaWZgyYU8sD77dzAlJCuq4y4GH/vY/TGU6ps9VzFA2tGQd6VTQwsU8Q/TAt1
	aZW1dJctMPQdyEATGilWi87zyXt4JoXOCYIIVEhry8xwrVFSSDK7LasH4kDSkPsSR/op
	JGqA==
X-Gm-Message-State: APjAAAVvYpGxNm/7ZsM9DY+6Ih6Ico0UnmBAUHPyAPKVFcMvAxLKYi3S
	V5OxdiJFWKQpj0MlXcGj8YZwEFHdZxI=
X-Google-Smtp-Source: APXvYqxWmBf/+jR+8HzL4G3bcRSU4ALCuL/KPjETZuCK/0D/c9ugVMHEZ2kkZsW6IKwtgEyteeYxnw==
X-Received: by 2002:adf:e941:: with SMTP id m1mr14848609wrn.279.1563134521178; 
	Sun, 14 Jul 2019 13:02:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x24sm15154381wmh.5.2019.07.14.13.02.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 14 Jul 2019 13:02:00 -0700 (PDT)
Message-ID: <4a3012195bce0677424610614a432fdae2fb498f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Jul 2019 21:01:59 +0100
In-Reply-To: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
References: <20190712202216.29218-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] xorgproto: update to 2019.1
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
X-List-Received-Date: Sun, 14 Jul 2019 20:02:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-12 at 22:22 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> >
> ---
>  .../0001-Remove-libdir-specification.patch    | 468 ----------------
> --
>  ...orgproto_2018.4.bb =3D> xorgproto_2019.1.bb} |   6 +-
>  2 files changed, 2 insertions(+), 472 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-proto/xorgproto/0001-
> Remove-libdir-specification.patch
>  rename meta/recipes-graphics/xorg-proto/{xorgproto_2018.4.bb =3D>
> xorgproto_2019.1.bb} (65%)

Something in this series was causing:

| checking for xproto x11 xextproto xext xf86miscproto... no
| configure: error: Package requirements (xproto x11 xextproto xext xf86mis=
cproto) were not met:
|=20
| No package 'xf86miscproto' found
|=20
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|=20
| Alternatively, you may set the environment variables XXF86MISC_CFLAGS
| and XXF86MISC_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/mpc8315e-rdb/build/build/tmp/work/ppce=
300c3-poky-linux/libxxf86misc/1_1.0.4-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/pokybu=
ild/yocto-worker/mpc8315e-rdb/build/build/tmp/work/ppce300c3-poky-linux/lib=
xxf86misc/1_1.0.4-r0/temp/log.do_configure.14901)
NOTE: recipe libxxf86misc-1_1.0.4-r0: task do_configure: Failed
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
ERROR: Task (/home/pokybuild/yocto-worker/mpc8315e-rdb/build/meta/recipes-g=
raphics/xorg-lib/libxxf86misc_1.0.4.bb:do_configure) failed with exit code =
'1'

and the libx11 upgrade seemed to cause:

| i686-poky-linux-libtool: link: gcc -isystem/home/pokybuild/yocto-worker/g=
enericx86/build/build/tmp/work/core2-32-poky-linux/libx11/1_1.6.8-r0/recipe=
-sysroot-native/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-lin=
k -Wl,/home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/core2-32=
-poky-linux/libx11/1_1.6.8-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link=
 -Wl,/home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/core2-32-=
poky-linux/libx11/1_1.6.8-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/home=
/pokybuild/yocto-worker/genericx86/build/build/tmp/work/core2-32-poky-linux=
/libx11/1_1.6.8-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/home/pokyb=
uild/yocto-worker/genericx86/build/build/tmp/work/core2-32-poky-linux/libx1=
1/1_1.6.8-r0/recipe-sysroot-native/lib -Wl,-O1 -Wl,--allow-shlib-undefined =
-Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/genericx86/build/build/=
tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -static -o mak=
ekeys makekeys.o  -L/home/pokybuild/yocto-worker/genericx86/build/build/tmp=
/work/core2-32-poky-linux/libx11/1_1.6.8-r0/recipe-sysroot-native/usr/lib -=
L/home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/core2-32-poky=
-linux/libx11/1_1.6.8-r0/recipe-sysroot-native/lib
| /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: =
cannot find -lc
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:411: makekeys] Error 1
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/genericx86/build=
/build/tmp/work/core2-32-poky-linux/libx11/1_1.6.8-r0/build/src/util'
| make[1]: *** [Makefile:2092: ../src/util/makekeys] Error 2
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/genericx86/build=
/build/tmp/work/core2-32-poky-linux/libx11/1_1.6.8-r0/build/src'
| make: *** [Makefile:518: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/cor=
e2-32-poky-linux/libx11/1_1.6.8-r0/temp/run.do_compile.17543:1 exit 1 from =
'exit 1'

Cheers,

Richard


