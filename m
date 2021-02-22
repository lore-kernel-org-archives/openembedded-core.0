Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.31733.1613976378853277608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=n8PpiJkc;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id q14so54897325ljp.4
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 22:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=BOg8a3b1BvaV3KCr2EhprhvSyOVda+0oj+E8bTFEKWE=;
        b=n8PpiJkcSPO9HFXep6LBo2zfqJuddJwmvv60NAT52Z8CMVngIlcA3W2qT8zlVtMina
         m8Wr5XkflfIpf+XSW7ZXk/yxK+2NEI0ihoxHvzM7IScXS9RIlBDseT979aCLE67TB6Vc
         yZyLkTMAN9swxDNB6skCBOYPbfgGaXkiBqipTTAV56tLPWJ4Fws9CMHoxrcYWG07DjBy
         D/8d1dFcfFd8ddgyjUTtNk3baDtFQARNbbDLbdSBBAofdb0JEJx6urQp0AQVIth2bEHF
         YuPqJMzDsMapzaYekWMV3757Acqe/TNX10dj/jn2LmPyTRlcp9WbGHrQ/aq7wuFJz9nG
         ZXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BOg8a3b1BvaV3KCr2EhprhvSyOVda+0oj+E8bTFEKWE=;
        b=TglMB0S/xZzJI6iJQx6RF3wU3E6zcAV4ahoKbirBJ3ytLo7LZriGG+08hlJbxFYR0m
         mUEvH5iGAx58e1cdhZf64rlIq+CyGIFHq4dX7pl/boYaKXuhbXfA+ImOSI2aN9xlLCfr
         +t7zzdSDj0X1eIZ9mBY88lSJSqX6E0xPODbU1LXZDmIV+ruE2/TH9m+qXPNdyqeN+f/A
         VnDsEWkLaM9eJZkGMF2McohGTb7XXkIMH9J3qSxDN/uRjxtcnM9cCy2z1pcVQjD1Stha
         u8MNFk4T4AomasAt7R2Rmpb5x+SBwicdJwmgCYNCOcyGAW/mn1/H6H364sS7vnRMvn5b
         Au0Q==
X-Gm-Message-State: AOAM532XmeZvNrCGL+ri9Ph7+XCL2/+jNZfWBW1T0B7GZs9KAByStH9O
	lr0olX62SD5g3LP+IPTrqABbfSxbDvAHQAfs
X-Google-Smtp-Source: ABdhPJzeZKSWgkp4Mb1aE8yeHI/1vReG60NKFGqEm3RIDcKT15SaBo7xRmwSFfz+qBbX2zcima6WqQ==
X-Received: by 2002:ac2:520b:: with SMTP id a11mr10703934lfl.483.1613976376363;
        Sun, 21 Feb 2021 22:46:16 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id r22sm1752938ljh.58.2021.02.21.22.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 22:46:15 -0800 (PST)
Subject: Re: [OE-core] [PATCH] busybox: update 1.33.0
To: "Valek, Andrej" <andrej.valek@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210219220042.2384431-1-open.source@oleksandr-kravchuk.com>
 <DB8PR10MB3977A450622E50F79787E7FE92819@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <6c3eae73-2ea0-6e54-3ee1-a450527f7d96@oleksandr-kravchuk.com>
Date: Mon, 22 Feb 2021 07:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DB8PR10MB3977A450622E50F79787E7FE92819@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I must have missed that. My apologies.

On 22/02/2021 07:36, Valek, Andrej wrote:
> Hello Oleksandr,
>
> Why are you upgrading to unstable version?
>
> Cheers,
> Andrej
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Oleksandr Kravchuk
> Sent: Friday, February 19, 2021 11:01 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> Subject: [OE-core] [PATCH] busybox: update 1.33.0
>
> Removed upstreamed patch.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   ...1-hwclock-make-glibc-2.31-compatible.patch | 83 -------------------  .../{busybox_1.32.0.bb => busybox_1.33.0.bb}  |  4 +-
>   2 files changed, 1 insertion(+), 86 deletions(-)  delete mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>   rename meta/recipes-core/busybox/{busybox_1.32.0.bb => busybox_1.33.0.bb} (90%)
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> deleted file mode 100644
> index 8d1f272120..0000000000
> --- a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
> -From: Sakib Sajal <sakib.sajal@windriver.com>
> -Date: Fri, 17 Jul 2020 17:27:21 +0000
> -Subject: [PATCH] hwclock: make glibc 2.31 compatible
> -
> -NEWS for glibc version 2.31
> -===========================
> -
> -Deprecated and removed features, and other changes affecting compatibility:
> -
> -* The settimeofday function can still be used to set a system-wide
> -  time zone when the operating system supports it.  This is because
> -  the Linux kernel reused the API, on some architectures, to describe
> -  a system-wide time-zone-like offset between the software clock
> -  maintained by the kernel, and the "RTC" clock that keeps time when
> -  the system is shut down.
> -
> -  However, to reduce the odds of this offset being set by accident,
> -  settimeofday can no longer be used to set the time and the offset
> -  simultaneously.  If both of its two arguments are non-null, the call
> -  will fail (setting errno to EINVAL).
> -
> -  Callers attempting to set this offset should also be prepared for
> -  the call to fail and set errno to ENOSYS; this already happens on
> -  the Hurd and on some Linux architectures.  The Linux kernel
> -  maintainers are discussing a more principled replacement for the
> -  reused API.  After a replacement becomes available, we will change
> -  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
> -  argument is not a null pointer.
> -
> -  settimeofday itself is obsolescent according to POSIX.  Programs
> -  that set the system time should use clock_settime and/or the adjtime
> -  family of functions instead.  We may cease to make settimeofday
> -  available to newly linked binaries after there is a replacement for
> -  Linux's time-zone-like offset API.
> -
> -hwclock had two calls to settimeofday, in functions to_sys_clock and -set_system_clock_timezone, where both the arguments to settimeofday -were valid (non-null).
> -Therefore, split the call, once for timezone and once for timeval.
> -
> -Fixes #12756
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - util-linux/hwclock.c | 12 ++++++++----
> - 1 file changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c -index dc97d8f..cf346e8 100644
> ---- a/util-linux/hwclock.c
> -+++ b/util-linux/hwclock.c
> -@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, int utc)
> -
> - 	tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
> - 	tv.tv_usec = 0;
> --	if (settimeofday(&tv, &tz))
> --		bb_simple_perror_msg_and_die("settimeofday");
> -+	if (settimeofday(NULL, &tz))
> -+		bb_simple_perror_msg_and_die("settimeofday: timezone");
> -+	if (settimeofday(&tv, NULL))
> -+		bb_simple_perror_msg_and_die("settimeofday: timeval");
> - }
> -
> - static void from_sys_clock(const char **pp_rtcname, int utc) -@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
> - 	gettimeofday(&tv, NULL);
> - 	if (!utc)
> - 		tv.tv_sec += tz.tz_minuteswest * 60;
> --	if (settimeofday(&tv, &tz))
> --		bb_simple_perror_msg_and_die("settimeofday");
> -+	if (settimeofday(NULL, &tz))
> -+		bb_simple_perror_msg_and_die("settimeofday: timezone");
> -+	if (settimeofday(&tv, NULL))
> -+		bb_simple_perror_msg_and_die("settimeofday: timeval");
> - }
> -
> - //usage:#define hwclock_trivial_usage
> ---
> -2.24.1
> -
> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
> similarity index 90%
> rename from meta/recipes-core/busybox/busybox_1.32.0.bb
> rename to meta/recipes-core/busybox/busybox_1.33.0.bb
> index 3a669444dd..1a3f218bca 100644
> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
> @@ -44,11 +44,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>              file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>              file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> -           file://0001-hwclock-make-glibc-2.31-compatible.patch \
>              file://rev.cfg \
>              file://pgrep.cfg \
>   "
>   SRC_URI_append_libc-musl = " file://musl.cfg "
>   
> -SRC_URI[tarball.md5sum] = "9576986f1a960da471d03b72a62f13c7"
> -SRC_URI[tarball.sha256sum] = "c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689"
> +SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
> --
> 2.25.1
>
