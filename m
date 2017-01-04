Return-Path: <moritz.fischer@ettus.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 523DF60938
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 00:28:10 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n21so386583270qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 16:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/5Ei34j1R0JtUMe07OeErfa5x81MES2vXzRc2Y0M3bc=;
	b=RABaKVsshDM5QpLKHHZjOlFNnxSNRcrKJpXOQC7AX01EFSFDnqYUxTuQjtwPjP626X
	1F24x9wIEMG+MiCSNeRz7eCj+8NX+QG5btWBtSfFdAd6W93R2tb+ZklXE+FGFBJuVI4p
	E/Oc4penGHLXblYu2HUAymCvC7F/UZlQK0iHkWloIKtCHjx/VrTgeK6UTT5YgezQQRkW
	eM8jPAbVYKZC8YxEPdzLB4MPiQPKEAaevbpv1aoWMe8cVAmeLPj+FwacOo6KeLpgNwb+
	lWlk436zfxVu8NLuSHyCkgpVerHuwlpQ0UbWUYsGjmtVFrJtANRBSo3z9hs1OhFpmBna
	ynDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/5Ei34j1R0JtUMe07OeErfa5x81MES2vXzRc2Y0M3bc=;
	b=DqO6BiN8h+og/IT75Ic4n0YEBZQwime3Iy/rH1Lr3XlCI8jER+snOwMOEhMpKY7BJs
	fvMz/ddWWhEuMlpCjczRVHsXuYnCHeL3E3aDCUWdibMH46qb7ALZyRrco4Jy7ogGLZPZ
	eOHRP3/+Ws8wX4HgwW2f/7Ol2saF1yWlZoaO0+r3iZUvB7HPt5yAk5moXqNKIZD0IDNf
	vSsWVIhQoWGN8IdTj34uFotMvi2VgyYhFDemUlgyY5uIFWsDrIhUpBPS0Nr4GiVnWpNu
	RjvpYtp/Qv7nePeSIpNsBcXioZuXQb1c11hIaHwIynNi1OJcHHX8nM1enK4ZjaI45g4k
	+hCA==
X-Gm-Message-State: AIkVDXLddV4NWWY0S3IslVZcg4B6Yl2QQaC8T32cA6eEzn9PwZJMIo54RUoyK/8N1nImTYgncAZVDyMJyLYaUdlF
X-Received: by 10.55.209.150 with SMTP id o22mr59266293qkl.274.1483489691005; 
	Tue, 03 Jan 2017 16:28:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.160.163 with HTTP; Tue, 3 Jan 2017 16:28:10 -0800 (PST)
In-Reply-To: <1483034519-11162-1-git-send-email-moritz.fischer@ettus.com>
References: <1483034519-11162-1-git-send-email-moritz.fischer@ettus.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Tue, 3 Jan 2017 16:28:10 -0800
Message-ID: <CAAtXAHeA6RzdBiRMnrHzD2VHnawA32=3KyXKEVkqQSG2Vo2z4g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: koen@dominion.thruhere.net, Moritz Fischer <mdf@kernel.org>
Subject: Re: [meta-oe][PATCH v2] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 04 Jan 2017 00:28:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

I realized this might have gotten held up by me not being subscibed to the list,
do you want me to resubmit?

On Thu, Dec 29, 2016 at 10:01 AM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:
> Add a recipe to build 'ectool' a utility to interact with the embedded
> controller on Google's chromebooks (and other platforms using it).
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
> Changes from v1:
>
> - Replaced DESCRIPTION with SUMMARY (Martin)
> - Use EXTRA_OEMAKE (Martin)
> - Removed FILESEXTRAPATHS (Martin)
> - Changed PV (Martin / Khem)
> - Removed FILES_PN (Khem)
> ---
>  .../chromium-utils/chromium-utils.bb               | 24 ++++++++++++++++++++
>  .../files/0001-build-Add-HOST_LDFLAGS.patch        | 26 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils.bb
>  create mode 100644 meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
>
> diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils.bb b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> new file mode 100644
> index 0000000..87d866a
> --- /dev/null
> +++ b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Chromium EC utilities"
> +DEPENDS = "libftdi"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca36"
> +
> +SRCREV = "b19bb1f22a3fd0102030485d324c0321a18827e8"
> +SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;protocol=https \
> +           file://0001-build-Add-HOST_LDFLAGS.patch \
> +          "
> +
> +PV="1.1.9999+${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = "'HOSTCC=${CC}' 'HOSTCFLAGS=${CFLAGS}' 'HOST_LDFLAGS=${LDFLAGS}'"
> +
> +do_compile() {
> +    oe_runmake utils
> +}
> +
> +do_install() {
> +    install -m 0755 -d ${D}${bindir}
> +    install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
> +}
> diff --git a/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
> new file mode 100644
> index 0000000..46e8cad
> --- /dev/null
> +++ b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
> @@ -0,0 +1,26 @@
> +From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
> +From: Moritz Fischer <moritz.fischer@ettus.com>
> +Date: Tue, 27 Dec 2016 22:24:07 -0800
> +Subject: [PATCH] build Add HOST_LDFLAGS
> +
> +Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> +---
> + Makefile.rules | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.rules b/Makefile.rules
> +index 404454d..0057ba9 100644
> +--- a/Makefile.rules
> ++++ b/Makefile.rules
> +@@ -60,7 +60,7 @@ cmd_c_to_build = $(BUILDCC) $(BUILD_CFLAGS) \
> +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c) \
> +                $(BUILD_LDFLAGS) \
> +                -MMD -MF $@.d -o $@
> +-cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d  -o $@ \
> ++cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF $@.d  -o $@ \
> +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c)
> + cmd_cxx_to_host = $(HOSTCXX) -std=c++0x $(COMMON_WARN) $(HOST_CXXFLAGS)\
> +       -I ./$($(notdir $@)_ROOT) -o $@ $(filter %.cc,$^) $($(notdir $@)_LIBS)
> +--
> +2.4.11
> +
> --
> 2.7.4
>

Thanks,

Moritz

