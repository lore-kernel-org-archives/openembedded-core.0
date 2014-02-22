Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD05B6EEFA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 18:11:06 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id r1so1833432igi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jzcmhUgb2gZOLDgvtM0Z3AiWtROY2ry6UrOzaM+LH9M=;
	b=gryy/xeOORX2Ij9YHFLe7fbKNHtUY94Wk18vSZqzf62eOQSGx4lPjm0/b4LTCNlSBh
	dBygDbEFPe1HIcFmifRCJoIyCF1Gzh85kt7U1X9ktTOX2KekkDTd32/d6UP9C9XTVcHF
	oyUncISI0HdM/f31i53zXd1YAq/wxEgAtz82rjlsVdOiEH+y+/p/dzYBUxQiRz/mSOv3
	j/6n9v5nCibJzQcsBQ74OP32sueXz04DWShvUbc8Dq9oke7PuokT92RYIru48mMlUa08
	hivztix4fxOytRcrqJ60qRrbnLUxDIDsi5oEpQWq/kOZvZD4OGPTAi6g1yJe0P3avB0B
	K10g==
X-Received: by 10.43.153.68 with SMTP id kz4mr7942790icc.29.1393092666919;
	Sat, 22 Feb 2014 10:11:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Sat, 22 Feb 2014 10:10:36 -0800 (PST)
In-Reply-To: <1393090150-28187-2-git-send-email-Martin.Jansa@gmail.com>
References: <20140222120340.GM3854@jama>
	<1393090150-28187-1-git-send-email-Martin.Jansa@gmail.com>
	<1393090150-28187-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Feb 2014 10:10:36 -0800
Message-ID: <CAMKF1srUQdPozeiOGv=dxD04NHA=g4qjV+mE-m0CnMd+uzpqBA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Make it compatible with systemd-209
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
X-List-Received-Date: Sat, 22 Feb 2014 18:11:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 22, 2014 at 9:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ++++++++++++++++++++++
>  .../pulseaudio/pulseaudio_4.0.bb                   |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
> new file mode 100644
> index 0000000..467cd2c
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
> @@ -0,0 +1,30 @@
> +From 002b16f0f2176b4c685e210e335bf69c02563ede Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 22 Feb 2014 18:03:10 +0100
> +Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
> +
> +* they were merged into libsystemd in systemd-209
> +
> +Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---

while we fight to make it work in OE you can in parallel stage/get
reviews on these patches in respective upstream projects.


> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 388fae2..fff7a83 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1160,7 +1160,7 @@ AC_ARG_ENABLE([systemd],
> +     AS_HELP_STRING([--disable-systemd],[Disable optional systemd support]))
> +
> + AS_IF([test "x$enable_systemd" != "xno"],
> +-    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd-login ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
> ++    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
> +     HAVE_SYSTEMD=0)
> +
> + AS_IF([test "x$enable_systemd" = "xyes" && test "x$HAVE_SYSTEMD" = "x0"],
> +--
> +1.8.5.3
> +
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> index b419c54..53dd494 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
> @@ -1,6 +1,7 @@
>  require pulseaudio.inc
>
>  SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
> +           file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
>             file://volatiles.04_pulse"
>
>  SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
> --
> 1.8.5.3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

