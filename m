Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E513F7C0F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 14:57:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v11so7463849qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 06:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+P4uKq8w8SpjSd2j5Y/Eho8hxD/ukJ76VEqyt0+ZQIs=;
	b=fjl/RR5kNYjyomS5ggmNj7aUXMOBITAudotpWXlNc555m79ibFRpHKDPdumfCL2pL4
	nIgEFUF850fwvSjvh6Kjglcm4vOSLtc4zJM89FBJkDFmNgjfTwFKx/jOzYYkdTq8zzbM
	32etSjv8Bb5Kv+wOA78P8sDdKMW/FQUh+90WlkEIaOp5r9uhhc6DZfYSyElJ5Zi5bfwU
	D0UXfMw3GrbzQo7zIlNty3E6QgpMtLXluhkTIKuNm3b0WDvOkcK4wDCk2FVJ6FXhS5IW
	o0q+1ssqfaTvbS1Sugiv8L/BAGndmNWNZ/6j62dbO6LlNY5YGEuIRRCdfaDwuV67b2He
	oNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+P4uKq8w8SpjSd2j5Y/Eho8hxD/ukJ76VEqyt0+ZQIs=;
	b=Ra9gisfeUNOadi91gLHwMA3iurK3rmd3U8ejOHAdlBtQa5YiDQKMTRBrUZT2m6NhNA
	4Ne0VtLfNX79AwrN0qa27thtUfopiyVxZsnR3fpawUddi62GhfysfJTvfYgJwc/l/Ytp
	AjMAHKVE2SWcK2AMzatdLtxWi5kLPOU71loOPOhunyCFr2uxLfeo7KEScMq9N7nKG1MF
	iN5vYaIYz/ZMp9agHms9y85bK7oST0Uum/XmePChLQRMK97NLK2BZL6OdBV3qIMi433D
	knQe77tQIyeZaCuiAbTI9uh+/3u3/qCXCHFRedW1x1X0ZbSGsEoZx90JEc56fNLlNU1J
	Krhg==
X-Gm-Message-State: AJcUukf5GxyB4ruZTeVtDlbuy4V9orMzxg1Kr+IfuTTU16b28UKD1dgx
	K8p05nXFbCUlVBrBObKAlXHyXigBV268UyfWOe8=
X-Google-Smtp-Source: ALg8bN4sYKAZzuS52MfgSUFaHl/G815udOLaVmb6YbAIC9twKjCp0xrL6ZWyW1PMGTw2fFAMme5ETVHgzJriySNy9U4=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr7330556qte.29.1547650625327; 
	Wed, 16 Jan 2019 06:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20190115230612.18947-1-petr.vorel@gmail.com>
	<f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
In-Reply-To: <f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jan 2019 06:56:38 -0800
Message-ID: <CAMKF1spaQmVW_=5bgus7nkw5Q9vU+DQH+qTzMj27i8omxg1DwA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Wed, 16 Jan 2019 14:57:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 16, 2019 at 3:05 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-01-16 at 00:06 +0100, Petr Vorel wrote:
> > Updated patches
> > * 0004-build-Add-option-to-select-libc-implementation.patch
> > * 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> > * 0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
> >
> > Removed patches (accepted in upstream)
> > * 0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
> > * 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
> > * 0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> > * 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> > * 0001-statx-fix-compile-errors.patch
> > * 0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
> > (accepted v2 version, see
> > http://lists.linux.it/pipermail/ltp/2018-October/009691.html)
> >
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Changes v1->v2:
> > * Update SRCREV (previous version used old version)
> > * Refresh patches
>
> Thanks for looking at this. Unfortunately it failed in testing on most
> targets:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/181/steps/7/logs/step1b
>
> (one failure given as an example).
>
> Warnings as errors are good during development but sometimes less
> useful during release due to the variety of end user configurations.
>
with glibc 2.29 in play
http://errors.yoctoproject.org/Errors/Details/216829/


> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

