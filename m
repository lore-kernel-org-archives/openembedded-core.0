Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id A69E873BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 13:42:50 +0000 (UTC)
Received: by oifu123 with SMTP id u123so31426112oif.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 06:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=YOFrMlfNrKS1EnBhyx5WkFUsCSx0aPhUDwVR+GXvIX0=;
	b=XKk0JH3vfNXZZC8rWrdr7WrHjFTsTcenmvGI6ZT3h7ibum2kLhXGUQqIvlMwp4iJpU
	JpZZmYz/W9QPWm3U9eU3BaI8UaZ4O16r/L5ADAUytESzukSOM7dw7oZbNilPSIiZJR80
	phXUZgY8B0bWJDZi1ignqPNPecJHX1ZtTi2hMtBjdB1pw1dWZafuYu4fKhGmjJ4oxrz+
	6OWtkehk276HNsFAHD7U4wAc+udDg7lXrOQYGWFrAn02cBRukAGN/cBISMBc3XiVi0He
	q6IUAydo+RXey3kac3hhBzkyrhrmGzBDuk0eNIlqueL7yS9HM9fXL/vGe5r7OfPyrO3E
	rVDw==
X-Gm-Message-State: ALoCoQnvVMoFp9oR7sGfnlYkeM0mcnbMzuN/y4pibwV88Ve1ETSa3iiAmGm/0P2gRkkrZHKba/yo
X-Received: by 10.182.199.34 with SMTP id jh2mr32776978obc.48.1433425371722;
	Thu, 04 Jun 2015 06:42:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Thu, 4 Jun 2015 06:42:21 -0700 (PDT)
In-Reply-To: <20150604111313.GH2376@jama>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
	<81bc54c716d05c3d0c28fe7858738a1b8d3fe1d9.1433414236.git.jussi.kukkonen@intel.com>
	<20150604111313.GH2376@jama>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 4 Jun 2015 16:42:21 +0300
Message-ID: <CAHiDW_HXzs1ELU=ffyvqr3iDEujtPUerF-H4Jg-FhagJhBCwzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] xf86-video-omap: Upgrade to 0.4.3
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
X-List-Received-Date: Thu, 04 Jun 2015 13:42:58 -0000
Content-Type: text/plain; charset=UTF-8

On 4 June 2015 at 14:13, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jun 04, 2015 at 01:44:20PM +0300, Jussi Kukkonen wrote:
>> Use last release instead of slightly older git revision, drop the
>> upstreamed patch.
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
>>  .../xorg-driver/xf86-video-omap/configure.patch    | 74 ----------------------
>>  ...-video-omap_git.bb => xf86-video-omap_0.4.3.bb} | 11 +---
>>  2 files changed, 3 insertions(+), 82 deletions(-)
>>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
>>  rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_git.bb => xf86-video-omap_0.4.3.bb} (85%)
>>
>> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
>> deleted file mode 100644
>> index d298d5d..0000000
>> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
>> +++ /dev/null
>> @@ -1,74 +0,0 @@
>> -Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57386]
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From fc7b6045aaec583c7e29021bd23c20a877b20546 Mon Sep 17 00:00:00 2001
>> -From: Ross Burton <ross.burton@intel.com>
>> -Date: Wed, 21 Nov 2012 23:39:18 +0000
>> -Subject: [PATCH] build: rationalise DRI checks
>> -
>> -The existing logic around DRI was complicated and defined a number of variables
>> -that were not used, when in reality DRI is required.
>> -
>> -Move the glproto check to the main pkg-config check, and remove everything else.
>> -
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ----
>> - configure.ac |   33 +--------------------------------
>> - 1 file changed, 1 insertion(+), 32 deletions(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 11238b1..c321b98 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -44,47 +44,16 @@ XORG_DRIVER_CHECK_EXT(XV, videoproto)
>> - XORG_DRIVER_CHECK_EXT(DPMSExtension, xextproto)
>> -
>> - # Checks for pkg-config packages
>> --PKG_CHECK_MODULES(XORG, [xorg-server >= 1.3] xproto fontsproto [libdrm >= 2.4.36] libdrm_omap xf86driproto $REQUIRED_MODULES)
>> --sdkdir=$(pkg-config --variable=sdkdir xorg-server)
>> -+PKG_CHECK_MODULES(XORG, [xorg-server >= 1.3] xproto fontsproto [libdrm >= 2.4.36] libdrm_omap xf86driproto glproto $REQUIRED_MODULES)
>> -
>> - # Checks for header files.
>> - AC_HEADER_STDC
>> -
>> --save_CFLAGS="$CFLAGS"
>> --CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
>> --CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
>> --AC_MSG_CHECKING([whether to include DRI support])
>> --if test x$DRI != xno; then
>> --        AC_CHECK_FILE([${sdkdir}/dri.h],
>> --                      [have_dri_h="yes"], [have_dri_h="no"])
>> --        AC_CHECK_FILE([${sdkdir}/dristruct.h],
>> --                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
>> --fi
>> --AC_MSG_CHECKING([whether to include DRI support])
>> --if test x$DRI = xauto; then
>> --        if test "$have_dri_h" = yes -a \
>> --                "$have_dristruct_h" = yes; then
>> --                DRI="yes"
>> --        else
>> --                DRI="no"
>> --        fi
>> --fi
>> --AC_MSG_RESULT([$DRI])
>> --CFLAGS="$save_CFLAGS $DEBUGFLAGS"
>> --
>> --AM_CONDITIONAL(DRI, test x$DRI = xyes)
>> --if test "$DRI" = yes; then
>> --        PKG_CHECK_MODULES(DRI, [xf86driproto glproto])
>> --        AC_DEFINE(XF86DRI,1,[Enable DRI driver support])
>> --        AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
>> --fi
>> --
>> - AM_CONDITIONAL(VIDEO_DEBUG, test x$VIDEO_DEBUG = xyes)
>> - if test "$VIDEO_DEBUG" = yes; then
>> -     AC_DEFINE(VIDEO_DEBUG,1,[Enable debug support])
>> - fi
>> -
>> --AC_SUBST([DRI_CFLAGS])
>> -
>> - DRIVER_NAME=omap
>> - AC_SUBST([DRIVER_NAME])
>> ---
>> -1.7.10.4
>> -
>> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
>> similarity index 85%
>> rename from meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
>> rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
>> index 454d0a1..95de4ba 100644
>> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
>> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
>> @@ -24,15 +24,10 @@ LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
>>  DEPENDS += "virtual/libx11 libdrm xf86driproto"
>>
>> -SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
>> -PR = "${INC_PR}.3"
>> -PV = "0.4.2+gitr${SRCPV}"
>> -
>> -SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap \
>> -           file://configure.patch \
>> -"
>> +SRC_URI[md5sum] = "be35daf6fa4b75092cc4a8978c437bc5"
>> +SRC_URI[sha256sum] = "db1e0e69fd4c4c8fdca5ef2cb0447bccd7518a718495876a6904bef57b39986d"
>>
>> -S = "${WORKDIR}/git"
>> +PR = "${INC_PR}.3"
>
> Drop PR when PV is incremented.

Thanks. I've dropped the PR and pushed to same branch.

Jussi

>>
>>  CFLAGS += " -I${STAGING_INCDIR}/xorg "
>>
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

