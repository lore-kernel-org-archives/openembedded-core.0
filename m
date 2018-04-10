Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id E978A74928
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 23:16:33 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id y46-v6so14727445otd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A71ec0vB/a4Dkn9Vq7nRjufoLmuHmcXrk9Nuoazj50Q=;
	b=m/xMhrSq64E0IYJgy3yV+2QSXTyBjpCeSsTZ4aSuzId7dOp03vYgMvH8P/134urlWj
	QcaJYOZ/LTpxLk9RgYlI8ICiNYhsmgS84YoH0FQPX6h12xxdhV3xOCJAr9QLZ0NbDvDv
	M6se1Y63tYl8RfND/1jEsE2IXqkk9AG0+kvOSYKA1bCUR99LexuNcr/lsdkob1fT05aJ
	AGzZxnld6cCksnzntZEVdJmRETxnm+72Brca3oKMGRy+IpYIVH38P9yK8nQjF5rXpLi3
	5oLP4KGIMteQnBBRuUf7DPrNDes90i0zRDCT0jUNULRdlEY8D1XimkthYww/jfM94xjx
	p0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A71ec0vB/a4Dkn9Vq7nRjufoLmuHmcXrk9Nuoazj50Q=;
	b=tlhX8bT/r14fabV/OoXMBOf3MRMm4TN5giuxYQiggfQgNKbIpg3PqdtoNj3avb32r4
	shDIzutLrzo4rtIQ+f15oAWDbIFh/viTFsX5nqBoVew3F9gb0XFlgWkhf+RPF982vnjj
	wSglJ0jV8F87SlWjy59hXGJtz9jUnueO7f6/Xlv1+EH7N0xCuDwVO1fIDL4VLhrhlpJC
	quoT/UPcWLAPxaSCU1hqulg1vH5CSujDm4iYj31uFpteSifgU6gFc6kQ5rGrowkaJXHn
	q1NRj/eFBkulR7JYnoDgIXAXPDZuCm0o1qmFLnKTcogfNLUqISqTouNRLckAalFp3CuK
	HjSQ==
X-Gm-Message-State: ALQs6tA1n18U4ZPu8hsbuUa9ebt1/4cJvRcyrriInkvCULpJviJ1MUcD
	qDoxMRwtADl4wxG/2X2vcxUJmzP5jwBRPUZus9K3kQ==
X-Google-Smtp-Source: AIpwx4/a60mI/b4zYpiMp6Kd0p5J6H4o5qyC5zIt9/vWw5QdeH/j2hSaDT9+NACKrOxw1BYVSj7OYSuONgqT+k+zViU=
X-Received: by 2002:a9d:f29:: with SMTP id 38-v6mr1726062ott.119.1523402194693;
	Tue, 10 Apr 2018 16:16:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 10 Apr 2018 16:16:14 -0700 (PDT)
In-Reply-To: <1523387170-30191-2-git-send-email-denis@denix.org>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<1523387170-30191-2-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Apr 2018 00:16:14 +0100
Message-ID: <CAJTo0La0UV_6yYzdPsFnBtak0JfX0QQU-24JFN1_N7te8=Mepw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] weston: upgrade to 4.0.0
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
X-List-Received-Date: Tue, 10 Apr 2018 23:16:35 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 April 2018 at 20:06, Denys Dmytriyenko <denis@denix.org> wrote:
> diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> index 0671a45..6799254 100644
> --- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> +++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
> @@ -1,26 +1,25 @@
> -From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
> +From ad1d2161c811cff25d1684c33611f300adb753bc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 May 2015 20:56:00 -0700
> -Subject: [PATCH weston] make error() portable
> +Subject: [PATCH] make error() portable
>
>  error() is not posix but gnu extension so may not be available on all
>  kind of systemsi e.g. musl.
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted

Ah, I've seen this before and was wondering if it was a genuine
mistake or devtool being bad.

devtool refresh is doing A Bad Thing and for some reason dropping the
Upstream-Status tag.  Alex, can you see why this is?  Denys, can you
edit it back in?

Ross

