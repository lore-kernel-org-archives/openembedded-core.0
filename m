Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE446E660
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 12:55:43 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h53so4525459qth.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ci+rKScB0LrkBjsF0VIjq+m68aQX005ONl5RMu/Zeds=;
	b=fzrYQMA7INI8BsU3ZvByx5iXYVRnj9S06g5THZpqUoN13N3+gzfIzqIc9utgcRL2fN
	rrwpb5b/SDxb2Y9J75woYa1Vqhj0LW7wqJBh9Ya6wr8bzXDNUc0JChuIwdQ2U/d+26pi
	/EtwlM9sGjHotQtjEaQlaUJPYhwMKIYzolrgu0JPpBu3j8kYNWyaEpGYWxVP/4zeu9fz
	fSx+qb79MormbrIgy077qd4xMCUa2h1L2UqRyyMM3a8n5Ly+d8LKHxXfNsDwnFlkyi6k
	5AWY020jG/5zHToUYH3AGaIayPOOMQY7yIRRfJBx4ORboVXKrpO8N9eezpq3ZB3+aVA4
	/mSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ci+rKScB0LrkBjsF0VIjq+m68aQX005ONl5RMu/Zeds=;
	b=A6TzBRvvaIum4Z5biVyU2NrkvP8wDBTqX1uqgYtijeNtJXF0Kd4UhRbUi3fGBepyax
	jl5PwTno8t75lLC8ywe1Uq+i+i9g/F9+7oUVhxf88k8DuFoJGefjM4Cvpkyd799/Eq+L
	1GL80tiuek8+06LDeJ56N1rLCX4fEIKTQ4La/FFiq/NyAAc+6yyvnxjlZuCrXT8JaiVh
	KPuWnxs0OrvLD7zSfXhVxOA8SwODcxpz5yVZocb1UcBfAFegl8AnK6Np97ikSRh+8+Ih
	TZH2GKa9alASi1IBjqcOfSsXy+NOnZWRhz69q190W9aItuYrTdfXS9rR8Vhojm4TF7O3
	zlYQ==
X-Gm-Message-State: AIkVDXJ2/WNP4WaNB07UMMtJ3QOXUnyJWhky1KklxREzvilLYpiHSid/r9okOuF8c4cogodhfBBvKgKw0PLhLg==
X-Received: by 10.55.10.131 with SMTP id 125mr14275181qkk.257.1486126543574;
	Fri, 03 Feb 2017 04:55:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.175 with HTTP; Fri, 3 Feb 2017 04:55:43 -0800 (PST)
In-Reply-To: <CAJTo0LZtjvhJrFBGipL7XmOmaVzy84bxX=etWVgRHa7t-BERNg@mail.gmail.com>
References: <20170130074745.584-0-nathan@nathanrossi.com>
	<20170130074745.584-4-nathan@nathanrossi.com>
	<CAJTo0LZtjvhJrFBGipL7XmOmaVzy84bxX=etWVgRHa7t-BERNg@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 3 Feb 2017 22:55:43 +1000
Message-ID: <CA+aJhH2-C7ZWQpjqyb471yER=zgHJN1cpq3QdKoE5Mt1FtiZvA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Alistair Francis <alistai@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libgcrypt.inc: Enable use of binconfig
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
X-List-Received-Date: Fri, 03 Feb 2017 12:55:55 -0000
Content-Type: text/plain; charset=UTF-8

On 3 February 2017 at 00:17, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 30 January 2017 at 07:47, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>
>> Due to pkg-config support for libgcrypt being un-available for upstream
>> libgcrypt, some packages that depend on libgcrypt rely on the use of
>> libgcrypt-config (e.g. QEMU).
>
>
> We disable those scripts for a good reason: they're generally either broken
> entirely in a cross-environment, or fail badly if sstate is used.    A
> better solution really is to just patch qemu's configure (yes, I know this
> sucks).
>

Agreed, at first that was the approach I went for, even went so far as
to sending a patch upstream for QEMU (before realizing that libgcrypt
upstream doesn't have pkgconfig). But upstream QEMU are not to
interested in having such change.

https://patchwork.ozlabs.org/patch/711018/

However since this is not really required for the QEMU in oe-core,
this patch can be dropped from the series and I will sort this out by
patching the configure in the QEMU recipe that needs this.

Should I send a v2 of this series which removes this patch?

Regards,
Nathan

