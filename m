Return-Path: <rsalveti@rsalveti.net>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 02EBC78ADB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 23:06:32 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j19-v6so8110418ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 16:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uT1pHtT+6nxgtMvDXqyJtW+mZ23l7s38SDAUskddyKs=;
	b=Wd29zLlFjjC+ynhyPf3LA1Qhkh3Z2/+1Tk2j3+998NHFlGKIj7IIyl8CNc1+cv1Ez2
	KV5h0518naYKnspI4QHEscq/XLhhkPNeglnEoB4ybYYDTNOyPUyjRtfogK/rxsnwyDD6
	nZDHdifVvxTq1P0FSn/z/SLgTbFIUz67pbQ07rusqEGX4UrdP1ZAFr02zzG0eM+sz244
	ECBA7ZwEeCTzyVY7+M/BnENdpVJlCkVRIR4Yyb64pgcxH4eadxuvFeD7n25OyZz4V8dG
	R0BHdzHZ6t7zyOEubDK5xDig37JAqcwlZcCy1l0I30NbW/vLdTzZ5P5yVT3gYuqO/vOK
	AZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uT1pHtT+6nxgtMvDXqyJtW+mZ23l7s38SDAUskddyKs=;
	b=cQ1Tar5Kzbzojzx/6AagXawZOrdGjeLGlq+H/l45UtGmbZWgAXRWs0MNKTDIip1+70
	TRGKZ2bmbalwTHt8P0Ib4//XmvMqQMnU7Kg5fmjvw0J5j9LLxlt9M67Y72i1xWFOUvzC
	ZPLT09o4YWXXB7kH5JkXKtDkpZ1XUkL9zdc7JOOPBcHieShrHNAcsvHHeL0GB2xJAO94
	2YzD9E1LcoKADJdEJ39cX6qFokweLsyFYTtT1aAqihWBKU2ZmxJWyKxK5ohJWybclLRw
	DXPI0BRupvRvxK3dJXsoagXNCOqcoifdtFwV3cL+fzSmM3pd3Oge69bWSWMRtG37tDe6
	NsYA==
X-Gm-Message-State: AOUpUlFrKGPwbFhGPm8jydhWFUA+Cz76tM/KgYnlx/J3ToepY811s+1C
	ku3eu2hSiygbxP95N0Gk/r2MZVY5a9pIkjEH+1WR9BHA
X-Google-Smtp-Source: AAOMgpcPzUkMBGPnZAZ80F1LP9y4jn0+6ijV+irmnxdtvmF+NInw25YadWP8eOfrlnIYLH8eq+2Xg4H62nY3DaR+dNo=
X-Received: by 2002:a2e:8:: with SMTP id 8-v6mr16506723lja.112.1532559993340; 
	Wed, 25 Jul 2018 16:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c505:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 16:05:52
	-0700 (PDT)
In-Reply-To: <29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
From: Ricardo Salveti <rsalveti@rsalveti.net>
Date: Wed, 25 Jul 2018 20:05:52 -0300
Message-ID: <CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Wed, 25 Jul 2018 23:06:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Upgrade systemd to 239.
>
> 1. Patch Changes
> * Rebased Patches
>   0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>   0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>   0006-Make-root-s-home-directory-configurable.patch
>   0027-remove-nobody-user-group-checking.patch
>   0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>   0013-add-fallback-parse_printf_format-implementation.patch
>   0014-src-basic-missing.h-check-for-missing-strndupa.patch
>   0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>   0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>   0017-Include-netinet-if_ether.h.patch
>   0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>   0022-don-t-use-glibc-specific-qsort_r.patch
>   0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>   0026-Use-uintmax_t-for-handling-rlim_t.patch
>   0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>   0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>   0001-core-device.c-Change-the-default-device-timeout-to-2.patch
>   0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>
> * Dropped Patches and Reasons
>   0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>     This patch is dropped because the problem has been fixed by
>     binutils upstream. And this workaround could be dropped.
>     https://sourceware.org/bugzilla/show_bug.cgi?id=18548
>
>   0007-Revert-rules-remove-firmware-loading-rules.patch
>   0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>     These two patches are dropped because they are for kernel < 3.7.
>     But the current minimal requirement of kernel to build systemd
>     is as below.
>     REQUIREMENTS:
>         Linux kernel >= 3.13
>         Linux kernel >= 4.2 for unified cgroup hierarchy support
>     So these two patches no long make any sense.
>     Also remove non-exist firmware-path option
>
>   0009-remove-duplicate-include-uchar.h.patch
>   0010-check-for-uchar.h-in-meson.build.patch
>     These two patches are dropped because musl has implemented
>     uchar.h. See commit below from musl repo.
>     """
>     ab9672ae73248f51e30f4553c4b8878525e46383
>     implement uchar.h (C11 UTF-16/32 conversion) interfaces
>     """
>
>   0018-check-for-missing-canonicalize_file_name.patch
>     The above patch is dropped because current systemd does not need
>     canonicalize_file_name.
>
>   0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>     The above patch is dropped because utmp makes no sense in musl.
>     Check code below from musl.
>     include/utmp.h:#define _PATH_UTMP "/dev/null/utmp"
>     And utmp PACKAGECONFIG has been explicitly disabled for musl.
>     So we don't need this patch.
>
>   0032-memfd.patch
>   0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>   libmount.patch
>   0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>     The above patches are dropped because they are backported patches.
>     And current systemd has contained these patches.
>
>   0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>     The above patch is dropped because it has been merged and is now
>     in new version.
>
> * Newly Added Patch
>   0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>     This patch is added to fix build for musl.
>
>   0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>     This patch is added to fix the following error which caused system
>     unable to boot up.
>       systemd-udevd.service: Failed to adjust OOM setting: Invalid argument
>       dbus.service: Failed to adjust OOM setting: Invalid argument
>
>   0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
>     This patch is added to fix segment fault error on musl systems.
>
>   0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch
>     This patch is backported to solve a race condition between
>     user-runtime-dir@xxx.service stop and user deletion.
>
> 2. PACKAGECONFIG and Dependency Changes
> * Add a new PACKAGECONFIG item 'gshadow'. Enable it by default for glibc
>   but disable it by default for musl. This is because musl does not provide
>   gshadow.h.
>
> * Add a new PACKAGECONFIG item 'portabled'. Default to disable it because
>   it's still experimental, according to the announcement letter.
>   """
>   Currently, the support is still experimental, but this is expected to
>   change soon. Reflecting this experimental state, the "portablectl" binary
>   is not installed into /usr/bin yet.
>   """
>
> * Change 'kmod' from a hard dependency to a PACKAGECONFIG item. Default
>   to enable it.
>
> * Change 'acl' from a hard dependency to a PACKAGECONFIG item. Default
>   to enable it.
>
> * Remove 'readline' from DEPENDS. systemd does not need it.
>
> * Remove 'libcgroup' from DEPENDS. The dependency on libcgroup has been
>   removed from systemd a long time ago. We now remove this unnecessary
>   dependency from DEPENDS.
>
> 3. update-alternatives changes
>   The utilities like shutdown, poweroff, etc. are now created as symlinks
>   at do_install. So there's no need to use update-alternatives mechanism
>   anymore to create the symlinks now. In addtion, I don't think we now
>   support multiple init systems at one running system, so there's really
>   no need to use update-alternatives mechanism here.

I noticed that reboot stopped working locally as I had busybox
installed together with systemd, and the busybox version ended up
being used as it was provided via update-alternatives.

Looking for possible similar broken links, I found that
update-alternatives ended up pointing reboot, halt and poweroff to the
busybox binary instead of systemctl. Should we revert the changes and
bring back update-alternatives for them?

Thanks,
-- 
Ricardo Salveti de Araujo

