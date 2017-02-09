Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B41E60053
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 03:18:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id i10so10569164wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 19:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rQdUZ6LS5r/p5Cca+ob46G1J1LgIM1jYZ+HMpmq1EU4=;
	b=kcpsM2oCoS4IIy24v68cDzfchqJ8as06vyathp0m1hs5zcKfV5YCUyuYMc97eCjUk9
	g5BbMswj94wRdmoYmsg21QCDtE3vPBL/zoZYecqGegYQE6o8+tUUR6DbFFgLD0QaUW1c
	EdfUmi5Pf81UrCQ6XyCbQvrEn/vhZ1+RTUaC3Sb6yyRzCnTd/v6v269TzECsGAK3ecLA
	zU29VwMSchUqkvye9649AohK6pBGEsSIqVERtsgdBW5VWAPXXi3dsBp+aari4O1tpsjA
	X3Et5flqwqatGsyCfsdUuxlBiGvp81FJNraczcACzsW73Buw3sHUH3LneGxsX5H1455i
	mmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rQdUZ6LS5r/p5Cca+ob46G1J1LgIM1jYZ+HMpmq1EU4=;
	b=FMmH/je7GryoS8bT1lwTi4eM47vqbst4pJ+R11/i+9cfKXw03X6lvOkYxkdsAhxdek
	cdIi3QU4rQvL2FaKm3yiIIkqB/E49LMjSKDpA0D2N2jjCKh/If/WCuNL7U0JT3nHKae7
	y3rjE/fWNzJUVGJf0C9wsYULZjwcPlHVUaxYIHjhBWGCcfZRb757xmD9yj2q19A6C5hD
	O4uWM6SPMRFr02LXPp9ezVBqPIsuHdA7mrNAotlirF0bAz/qozsgWsjH6cBFCVhzmuy5
	FC1mIQ9ocKq5YMomJsOOvGbohovGWvdwtt/gcWAOCaoPVhIzNtlTg7bG8UxlLyhxVVA2
	IFaQ==
X-Gm-Message-State: AMke39mlJRW56pPL4mJoydot7Vnndq9Na4gIui20c8GImuG/K9pg02fKzVOgGxhQc+KO9S6ikMP/NoDJwUefXw==
X-Received: by 10.223.160.43 with SMTP id k40mr724552wrk.24.1486610308084;
	Wed, 08 Feb 2017 19:18:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.17.228 with HTTP; Wed, 8 Feb 2017 19:18:27 -0800 (PST)
In-Reply-To: <1486636418-5719-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1486636418-5719-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Feb 2017 19:18:27 -0800
Message-ID: <CAJ86T=WM_Ei4UCzkjHtOLKTMKJH8mz4q+DYe9_wuSdN-nJh1gg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: 1.24.1 -> 1.26.2
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
X-List-Received-Date: Thu, 09 Feb 2017 03:18:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 2:33 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade busybox from 1.24.1 to 1.26.2
> 2) Delete 12 patches below, since they are integrated upstream.
>     busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
>     busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
>     busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
>     busybox/CVE-2016-2147.patch
>     busybox/CVE-2016-2147_2.patch
>     busybox/CVE-2016-2148.patch
>     busybox/busybox-1.24.1-truncate-open-mode.patch
>     busybox/busybox-1.24.1-unzip-regression.patch
>     busybox/busybox-1.24.1-unzip.patch
>     busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
>     busybox/commit-applet_tables-fix-commit-0dddbc1.patch
>     busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
>
> 3) Modify 3 patches below to make it compatible with new version
>     busybox/busybox-cross-menuconfig.patch
>     busybox/busybox-udhcpc-no_deconfig.patch
>     busybox/makefile-fix-backport.patch

You should also refresh and review the defconfig file to ensure that
any new configuration options are set appropriately (e.g. new applets
should typically be disabled).

