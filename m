Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93D777BFFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 17:26:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o17so3625197wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pNfwHwdIiWXaFJ+br05iR8dVBg88p72JG6eM87Qg5BE=;
	b=MPRFeOfTdQEQMmZv+ENjhdexzRl5lEyr3yJ13k5xUmuxhR8qaSHeLEQUIHFe2EQet7
	LjCgJ2Jvd9xEykIyaRhPXbvVJd1z/dAZ9pEpZNcEYD2axOE6Pib65MrEij5rbzCg6txW
	Vz9tXnYwgA5iJ/K5aO5SSp+xwY0LgdpJamHuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pNfwHwdIiWXaFJ+br05iR8dVBg88p72JG6eM87Qg5BE=;
	b=AzRRrctKBeoJyTMokk4G/YD7T8gIJwmtnrdg/tnHHdwHjQmDjkUXjpFgCiOkUwgw68
	CVqtlV/eAVfULy73vu1fuSfGG6R3XU9db+LxCWoVLz9JzDuv/bcqb9ouwXqXiFa395LR
	9vuK+8tFV+9/0T9xqWeE06n1DFeWzRL8SRyQaeihLd3vpj6yU1JOsHT3liFWlKfjNmmV
	7V5JBeF2/GXdI04QP4owQ/lKZXBBcXLEiGhSMJ6FnZ8pjWE8YKw74TRocNHg8HG+cwic
	vgcjspdSgGxYPhHg2OUWoC4adARydmewZzpFfj9oXQadbO40mcWlD4Wp1sWaRDVRMHIe
	uBBg==
X-Gm-Message-State: AHQUAuZeHi8teF36TKmsecMv02q8+OLYLnWwPrq2dEX/7/FO9xGRt+20
	M0t8wGgMvGMwj4BfV0+yHwsI4w==
X-Google-Smtp-Source: AHgI3IYCaT2IT80O7EFWat2SkQpTOqFMz3HU/As5b+YCCUVxBqDaoXHxYWJHqNmp/b/hQ7PJKHg1wg==
X-Received: by 2002:a5d:6346:: with SMTP id b6mr3809378wrw.118.1549992406036; 
	Tue, 12 Feb 2019 09:26:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z3sm9656472wrt.66.2019.02.12.09.26.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Feb 2019 09:26:45 -0800 (PST)
Message-ID: <9f11043869417ac0303aac69acbf46fd2d9b4803.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 17:26:44 +0000
In-Reply-To: <20190212054754.2801-1-raj.khem@gmail.com>
References: <20190212054754.2801-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Tue, 12 Feb 2019 17:26:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-11 at 21:47 -0800, Khem Raj wrote:
> PN-dev is empty and causes dependency loops during SDK build
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 1 +
>  1 file changed, 1 insertion(+)

I commented on this elsewhere but for completeness, this is a
workaround, not a fix. The problem is that the PROVIDES in target-sdk-
provides-dummy.bb are clearly missing something.

This means that the SDK tries to exclude "/bin/sh" and similar target
dependencies from the SDK rootfs which leads to excluding busybox and
then fails to do so. If busybox is installed, busybox-dev gets pulled
in and the problems start.

The real fix is to figure out the missing target-sdk-provides-dummy
provides.

If someone could share a way to reproduce the failure that would be a
good start.

Cheers,

Richard


