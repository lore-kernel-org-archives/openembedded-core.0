Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78B5A60229
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:11:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m1so4203664wml.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ARI+cWxXCXVgwmXs1jPP+JXHcHDOhFD9+VJ1dfxWa3c=;
	b=VbdieX7uUxOftKffO05XVSFfwOr4PN8u3SjovXK0M2G2UIt6J9ACNhEmVPD1uvVgU7
	w54LyA0uPgstrKblZE+5d847CXcYAtoig5zJpSzVgMryehoMcorqA4VyG6ODb9waMDWb
	vatjIJVPsTBvLcxIYF8zB7jGB9FiQcew1b1NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ARI+cWxXCXVgwmXs1jPP+JXHcHDOhFD9+VJ1dfxWa3c=;
	b=A/ZqrITJ8y6IUclBEXTWXlHMb0/aL2I/BQJHD4IfuDcDzmniIa6IO9t6ds3O+qHWbw
	UHxtDQQz9/9VetwCYq/YCVM8O2DOnUslO2uHV7hu6Z9TnQCuqBB32VaUhvUoFz+COq73
	DtjjKa1DWWX1BjHyXFIO3sl72hDaQ1/Ad4q09TAu374y2BHqsVCNQyjgF0XuDwaHY48m
	CvfSqjfkbv6vQjv5MBkGAHi/jj+eodAyste/j4+zeXIyI80R+izA/P+rY6T0Z6rHo1aQ
	91/USRHxv7tBggZXngpOotVuPPUO0IuPrksXK6NTFXgIgeL1zYXLyBZ8xzGR85IgyaZY
	wqEg==
X-Gm-Message-State: AHQUAuagL+Ihq2gGEAIm5Eyxk7cO/0gzytyhNCbiznBwXwXwJ6tzoOqJ
	ur8rkLJJWtSjniVYHf0WAiytyw==
X-Google-Smtp-Source: AHgI3IYKEO2hnVRRcugMNogeFmXhePH2fiw6EZvXJhzqN0GEckOuXQtruA5JcgOLwP7QxDMCqJA6aw==
X-Received: by 2002:a1c:a4c4:: with SMTP id n187mr5376768wme.15.1550923881085; 
	Sat, 23 Feb 2019 04:11:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n9sm3619164wmi.33.2019.02.23.04.11.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 04:11:20 -0800 (PST)
Message-ID: <4834854809ccfc7043b9834526bbeae76907d3e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, =?ISO-8859-1?Q?Andr=E9?= Draszik
	<git@andred.net>
Date: Sat, 23 Feb 2019 12:11:19 +0000
In-Reply-To: <CAJTo0LbAe_VNjcn=-ehnD4wqJKprn5CBj2cfM9cjSUMaF=ssDQ@mail.gmail.com>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
	<20190205023241.29707-14-git@andred.net>
	<CAJTo0LbAe_VNjcn=-ehnD4wqJKprn5CBj2cfM9cjSUMaF=ssDQ@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 13/13] util-linux: final cleanup
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
X-List-Received-Date: Sat, 23 Feb 2019 12:11:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 21:08 +0000, Burton, Ross wrote:
> Looks like the manpage cleanup didn't quite work:
> 
> WARNING: util-linux-2.32.1-r0 do_configure: QA Issue: util-linux:
> invalid PACKAGECONFIG: manpages [invalid-packageconfig]

There is also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/319/steps/7/logs/warnings

WARNING: lib32-util-linux-2.32.1-r0 do_package: QA Issue: lib32-util-linux package lib32-util-linux-blkid - suspicious values 'e2fsprogs-blkid' in RREPLACES [multilib]
WARNING: lib32-util-linux-2.32.1-r0 do_package: QA Issue: lib32-util-linux package lib32-util-linux-blkid - suspicious values 'e2fsprogs-blkid' in RCONFLICTS [multilib]

so something isn't quite right with the mutlilib variants of the
recipe.

Cheers,

Richard


