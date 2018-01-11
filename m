Return-Path: <rudnik.mathias@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE256E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:18:02 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b76so7521637wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 11:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=TgtSaYgOk6hf+VfDT9u+bwALmzkKHqNbVh2klDwk5Ms=;
	b=uy6Lx8y7Ttpp5W4oeZDS5XjPrueP2sMPkhRgfMrsTQe+T5SIC8vYNQkTj289SrHLxN
	SJKWnkaTAsX0lQB1NKOqq3Y1fTMjhGxeY9OUM0ri7Db8Tr6V2hOA3Ism/gWcOIvXMHD8
	0As5WwxOLzdtROCOArqJBV/68anP2DSvgP83bnO1rn7s47slxpQJgkBRWixfnDDuwf4m
	V/ThaL0n6veCKCLfvw0ca1487IHG8Q73gtSaBPDDxABgQaH2dAsZW6fc+QUMGqNQ2u8p
	vwCGEo3E7TbOsbM2FiRQC/qfpbWDK7dktzQKOefskSRSRavZ4fZcfnojPPBuLM7E3AJZ
	dubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=TgtSaYgOk6hf+VfDT9u+bwALmzkKHqNbVh2klDwk5Ms=;
	b=mRDyb7h2EN4N04oQo1IxcfsmEIAFN+hCnGUGA8aHtzMOZPnoFuJert6J9936W7esQn
	akX9qdmaV5brQkDurR87Y/TAngELwLl36eOApfoEGsaplR3RduAOcsY6B/60tkPsz+OM
	AsyXzKGlh+OjwvDpX5EJ0RnNvnyBp5o4Ss1Lr8FtYxYWllO9gDLEYolBxAvrYs7Ocji2
	YmRN6hPUtIUXkButQKd5+tR7EUO16bo2nPIBXnA1H93ynxQOOSEpr3UG2YmcaijOHfiH
	eRCGzDd+9LmTHhojRR6GVDaypyCw+Yx+JjbyfqDy1E7yFDGe889V6uovnBchb14ESxaM
	HlIQ==
X-Gm-Message-State: AKGB3mLBtarO8HcQe3eix26nNGXdk42vSxj1nSWqo6ynJ4mZ/HM8nc2O
	mA/1zeovYiEYUpocSjBulxg5BX+1
X-Google-Smtp-Source: ACJfBos+yxotBG4ygXVpr5fTbFwAjSMIYWxjlFAg3dQZ1KJJ7AstjfHcROL6gjI1LYML7pPe2dYFdA==
X-Received: by 10.80.170.200 with SMTP id r8mr31655759edc.230.1515698282972;
	Thu, 11 Jan 2018 11:18:02 -0800 (PST)
Received: from [192.168.0.14] (ip1f12feb4.dynamic.kabel-deutschland.de.
	[31.18.254.180]) by smtp.googlemail.com with ESMTPSA id
	g45sm12696388eda.88.2018.01.11.11.18.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:18:02 -0800 (PST)
From: Mathias Rudnik <rudnik.mathias@googlemail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Message-Id: <649D7563-3FDB-40A1-A166-7DFA9E706B0D@googlemail.com>
Date: Thu, 11 Jan 2018 20:18:02 +0100
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3273)
Subject: Error do_compile libepoxy
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
X-List-Received-Date: Thu, 11 Jan 2018 19:18:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to build libepoxy but the do_compile tasks breaks.
I found following error messages in the logs:

arm-poky-linux-gnueabi-gcc -march=3Darmv6 -mfpu=3Dvfp -mfloat-abi=3Dhard =
-mtune=3Darm1176jzf-s -mfpu=3Dvfp =
--sysroot=3D/hdd_gold1/mathias/git/poky/rpi-build/tmp/work/arm1176jzfshf-v=
fp-poky-linux-gnueabi/libepoxy/1.4.3-r0/recipe-sysroot =
'-Itest/egl_common@sta' '-Itest' '-Iinclude/epoxy' =
'-I../libepoxy-1.4.3/test' '-Iinclude' '-I../libepoxy-1.4.3/include' =
'-Isrc' '-I../libepoxy-1.4.3/src' '-fdiagnostics-color=3Dalways' '-pipe' =
'-D_FILE_OFFSET_BITS=3D64' '-Wall' '-Winvalid-pch' '-std=3Dgnu99' '-O2' =
'-g' '-O2' '-g' '-feliminate-unused-debug-types' =
'-fdebug-prefix-map=3D/hdd_gold1/mathias/git/poky/rpi-build/tmp/work/arm11=
76jzfshf-vfp-poky-linux-gnueabi/libepoxy/1.4.3-r0=3D/usr/src/debug/libepox=
y/1.4.3-r0' =
'-fdebug-prefix-map=3D/hdd_gold1/mathias/git/poky/rpi-build/tmp/work/arm11=
76jzfshf-vfp-poky-linux-gnueabi/libepoxy/1.4.3-r0/recipe-sysroot-native=3D=
' =
'-fdebug-prefix-map=3D/hdd_gold1/mathias/git/poky/rpi-build/tmp/work/arm11=
76jzfshf-vfp-poky-linux-gnueabi/libepoxy/1.4.3-r0/recipe-sysroot=3D' =
'-lEGL' '-fPIC' '-Wpointer-arith' '-Wmissing-declarations' '-Wformat=3D2' =
'-Wstrict-prototypes' '-Wmissing-prototypes' '-Wnested-externs' =
'-Wbad-function-cast' '-Wold-style-definition' =
'-Wdeclaration-after-statement' '-Wunused' '-Wuninitialized' '-Wshadow' =
'-Wmissing-noreturn' '-Wmissing-format-attribute' '-Wredundant-decls' =
'-Wlogical-op' '-Werror=3Dimplicit' '-Werror=3Dnonnull' =
'-Werror=3Dinit-self' '-Werror=3Dmain' '-Werror=3Dmissing-braces' =
'-Werror=3Dsequence-point' '-Werror=3Dreturn-type' '-Werror=3Dtrigraphs' =
'-Werror=3Darray-bounds' '-Werror=3Dwrite-strings' '-Werror=3Daddress' =
'-Werror=3Dint-to-pointer-cast' '-Werror=3Dpointer-to-int-cast' =
'-fno-strict-aliasing' '-Wno-int-conversion' '-MMD' '-MQ' =
'test/egl_common@sta/egl_common.c.o' '-MF' =
'test/egl_common@sta/egl_common.c.o.d' -o =
'test/egl_common@sta/egl_common.c.o' -c =
../libepoxy-1.4.3/test/egl_common.c
../libepoxy-1.4.3/test/egl_common.c: In function =
'get_egl_display_or_skip':
../libepoxy-1.4.3/test/egl_common.c:36:5: error: unknown type name =
'Display'; did you mean 'EGLDisplay'?
     Display *dpy =3D XOpenDisplay(NULL);
     ^~~~~~~
     EGLDisplay
../libepoxy-1.4.3/test/egl_common.c:36:20: error: implicit declaration =
of function 'XOpenDisplay'; did you mean 'eglGetDisplay'? =
[-Werror=3Dimplicit-function-declaration]
     Display *dpy =3D XOpenDisplay(NULL);
                    ^~~~~~~~~~~~
                    eglGetDisplay
../libepoxy-1.4.3/test/egl_common.c:36:20: warning: nested extern =
declaration of 'XOpenDisplay' [-Wnested-externs]
cc1: some warnings being treated as errors

Does anybody know what i am doing wrong?



