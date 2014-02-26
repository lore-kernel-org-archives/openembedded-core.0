Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 21CF16F1A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:53:13 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id h16so1006260oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 07:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qq4dsEJHWDcAPGSFFw7Dk3/eECaO+sVshc4KVjlWt8A=;
	b=SGiNnYAytzfbQAGRo5+X/K8WDfvcpUwGAUCkw2UuRCIhkdNgKSzuwX5BxFbpfYZjP6
	WLuiDTp4iAONHAfDVviqG1pgi0JWU3k9gy8uB4c8niils1cGMw4YTakGfnj7pu0Nvm/8
	jWJZ33iTCrRmjVFzj+AYIEOdh0qGC/MxOm5ovdAJ2Kq4pJ7cI6pIQCgsn/7ysuvMsRlE
	EQXLtTu3nJnmI9L9c/qP8y8rHZvz+Rc1/v1DpBGqkwn9PeBcUMrkPNU/Kwo3KW9y6p3D
	eA/RcXfoGIxAIxrLXO+2mHtuaxNl9eNvaoLt6ofE2PTSL82O/+PzZiP+hNKko30Gqh6A
	5tag==
X-Gm-Message-State: ALoCoQlq32TnFm1Icb5Js9ly26no1+wJlKF4kB7k3afczV5GlpN39+bSrNLbhGLHXfJAg/f6iFzx
X-Received: by 10.60.70.239 with SMTP id p15mr7129034oeu.26.1393429994720;
	Wed, 26 Feb 2014 07:53:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Wed, 26 Feb 2014 07:52:54 -0800 (PST)
In-Reply-To: <1393428647-9217-1-git-send-email-valentin.popa@intel.com>
References: <1393428647-9217-1-git-send-email-valentin.popa@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 26 Feb 2014 16:52:54 +0100
Message-ID: <CAP71WjxeRWSVoV=-_Z7aAJNwvWNUW5i=Dxgj5GG+NgCH6Nq-4A@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] mesa: build fix for gallium-egl
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
X-List-Received-Date: Wed, 26 Feb 2014 15:53:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 4:30 PM, Valentin Popa <valentin.popa@intel.com> wrote:
> Avoid altering eglplatform.h from {top_srcdir}/include
> using an alternative to
> 0003-EGL-Mutate-NativeDisplayType-depending-on-config
> patch.

i don't think this is the right fix. i get the following build failures now:

| i586-rdk-linux-libtool: compile:  i586-rdk-linux-gcc -m32
-march=i586 --sysroot=/work/rdk-dora/build-qemux86/tmp/sysroots/qemux86
-DPACKAGE_NAME=\"Mesa\" -DPACKAGE_TARNAME=\"mesa\"
-DPACKAGE_VERSION=\"9.1.6\" "-DPACKAGE_STRING=\"Mesa 9.1.6\""
"-DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi?product=Mesa\""
-DPACKAGE_URL=\"\" -DPACKAGE=\"mesa\" -DVERSION=\"9.1.6\"
-DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1
-DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
-DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\"
-DHAVE_CLOCK_GETTIME=1 -DHAVE_PTHREAD=1 -DHAVE_LIBEXPAT=1 -I.
-I/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main
-I/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/include
-I../../../include
-I/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/gbm/main
-D_GNU_SOURCE -DHAVE_PTHREAD -DHAVE_DLOPEN -DHAVE_POSIX_MEMALIGN
-DIN_DRI_DRIVER -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS
-DHAVE_MINCORE -DHAVE_LIBUDEV -DHAVE_LLVM=0x0303
-D_EGL_NATIVE_PLATFORM=_EGL_PLATFORM_DRM
-D_EGL_DRIVER_SEARCH_DIR=\"/usr/lib/egl\" -D_EGL_OS_UNIX=1
-DHAVE_DRM_PLATFORM -DHAVE_FBDEV_PLATFORM -D_EGL_BUILT_IN_DRIVER_DRI2
-DHAVE_XCB_DRI2 -O2 -pipe -g -feliminate-unused-debug-types
-fno-omit-frame-pointer -Wall -std=c99
-Werror=implicit-function-declaration -Werror=missing-prototypes
-fno-strict-aliasing -fno-builtin-memcmp -c
/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main/eglconfig.c
 -fPIC -DPIC -o .libs/eglconfig.o
| make[3]: *** [eglapi.lo] Error 1
| In file included from
/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/include/EGL/egl.h:36:0,
|                  from
/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main/egltypedefs.h:36,
|                  from
/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main/egllog.h:34,
|                  from
/work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/src/egl/main/eglarray.c:32:
| /work/rdk-dora/build-qemux86/tmp/work/i586-rdk-linux/mesa/2_9.1.6-r0/Mesa-9.1.6/include/EGL/eglplatform.h:118:22:
fatal error: X11/Xlib.h: No such file or directory
|  #include <X11/Xlib.h>

I am building with x11 removed from DISTRO_FEATURES, btw.

