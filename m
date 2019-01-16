Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F54F7C075
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 11:05:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p4so6406026wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 03:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=sHz071wow09AU3DX9ru++IrmIxfv2OGdS/zkRw4Vw/Q=;
	b=BD6ZFuqmSX9M4BMHlmNsqUYlbG8WMCaHKgw/Etj8KZYF61LSAnDUlFHMno7kaCb2Mx
	uA35EUwCAApDCb9XJ1NaUI8wtsiCTCPgqbuC96FNvFLWzMWC5WwlaUU2sy1cpTQZtbOc
	GNBmLELmrbQrNKeDP7L8ovowMFB1DL8RzKw20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sHz071wow09AU3DX9ru++IrmIxfv2OGdS/zkRw4Vw/Q=;
	b=WA+A0GGIl+gB2Bbd9tWc1QIHz/YxkRmuQT2jS+KACZ2QLBqs1bWDfwwmbXFLjwttAd
	xtvRXy7JQgOZRP3JSN/JM+NDrnOsFCoI3gmk82ajvwJl7ibOfFOmU0mxjSN1vu93MCLj
	l26DztkC011E5NN1B/yJttTpvyDPWolsISWO9mH54yTz2RPL/2oDbzKg7yx0F1tqbvc2
	lvddSCZ48UWOV3da3377ZccjyNKZvmJEFOkCB2MpB1e/Vj/8likx0oL3BdxuzsJ1HGxJ
	dpWg5hcHeNRURo8qNM89XblnNv0HaVHH9gQmoIM4IhYLwB+vl+i4lwxdOXQN1SAVRLm9
	MN4g==
X-Gm-Message-State: AJcUukdCWDT3D9F4OT08sw/SAPUHk1nXMRbpjDwAK2A1ecKfwF2wpxtJ
	yvANQuEZ7cxa/GpoZIlGrkvWhw==
X-Google-Smtp-Source: ALg8bN4BNbgoZgP76DhDWALDEDBN8FVB8BI8hOxG0XvttIq7nwmIYrWgGfzeU19lro0DeJ4pBSpYKQ==
X-Received: by 2002:adf:df01:: with SMTP id y1mr7355456wrl.127.1547636726148; 
	Wed, 16 Jan 2019 03:05:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t76sm37685256wme.33.2019.01.16.03.05.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 03:05:24 -0800 (PST)
Message-ID: <f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 11:05:23 +0000
In-Reply-To: <20190115230612.18947-1-petr.vorel@gmail.com>
References: <20190115230612.18947-1-petr.vorel@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 16 Jan 2019 11:05:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-16 at 00:06 +0100, Petr Vorel wrote:
> Updated patches
> * 0004-build-Add-option-to-select-libc-implementation.patch
> * 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> * 0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
> 
> Removed patches (accepted in upstream)
> * 0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
> * 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
> * 0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> * 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> * 0001-statx-fix-compile-errors.patch
> * 0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
> (accepted v2 version, see 
> http://lists.linux.it/pipermail/ltp/2018-October/009691.html)
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Update SRCREV (previous version used old version)
> * Refresh patches

Thanks for looking at this. Unfortunately it failed in testing on most
targets:

https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/181/steps/7/logs/step1b

(one failure given as an example).

Warnings as errors are good during development but sometimes less
useful during release due to the variety of end user configurations.

Cheers,

Richard


