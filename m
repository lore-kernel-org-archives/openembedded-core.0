Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 768AC6C4FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 12:26:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l9so12030135wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 04:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=KZyI0hrBMZO+8dM+jxqLchFeOZlq029tJ/tHrT61WB0=;
	b=dOvdMBnr2FSjo5vhmwcni7UxXnURc+V4F4euA5Vbj+8oZaGk4zqWNvfePF7l9g2cF8
	hAB7DWc/SfsTZNnFmFyvYiDtLFXsKT7z9igrDPOWbuNKmVBn+dph2Abx/xCBdXS64nsF
	wx1c0iNKV/fcyC6J1jcC8Q7hNG8rfH7mUHJKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KZyI0hrBMZO+8dM+jxqLchFeOZlq029tJ/tHrT61WB0=;
	b=dvhhpcToEoOMvjNycCi4aNIx8yYSWO7VjHH3u95RCQMMsYd8VG74RiBoz1RQ0DGDQQ
	HXPRCo+kOU1IQMyjK9xCAH2UWXcjeOp898p+uwW0XpvZIc+E342iNVwy/K+UjleBvms6
	5YtQ9jSATaa1x+YflrWDH24epmtIlpGbRj+GF1v8I0LgUqvLOUKrNB2RgMjxE8G1baJm
	XSTKGdavrENhAN6ZNZmIDPPKVEOnqJP8IJhZgdlRUeEG6HZ6FHF160eVUxTJkcda96KX
	1e9Vhcrz4nWt51Ebc7GlYcrC1PqKjTNwp9AqeAijTo/V5DBNv//Ee7uCTY+Mliayfn0Y
	WTFw==
X-Gm-Message-State: AA+aEWYb4+gpaZO7q1u6Imxnuj/vGDTDAdI6fK8lTDSdUUmvTLN56GmT
	UWfqEFTpk8gnwGn0V+82+AAA7IlOwSjGlg==
X-Google-Smtp-Source: AFSGD/WvhDYeJE4H1ATJ2wYjaKPo9qGcGJPCphxQU64PQhcre84bpxE/Feo+o8D6LlkA81xr7MIuqQ==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr10058256wra.282.1545049575087;
	Mon, 17 Dec 2018 04:26:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k19sm149568wre.5.2018.12.17.04.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 04:26:14 -0800 (PST)
Message-ID: <7fc18a5b076eaf0c9e089ece60ed6845f2d36fbc.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 17 Dec 2018 12:26:13 +0000
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/17] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 17 Dec 2018 12:26:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

On Sun, 2018-12-16 at 22:38 -0500, Bruce Ashfield wrote:
> Here is the latest linux-yocto consolidated pull request. Some of
> these commits are re-sends of changes that didn't make the release,
> and others are new.
> 
> Most are routine -stable bumps, configuration cleanups, etc, and
> shouldn't cause any issues.
> 
> The more interesting part of this queue is the introduction of 4.19
> reference kernels to replace 4.14 as the LTS version in master. I've
> built and booted it on qemu*, so it is sane from that point of view.
> 
> I'm trying to separate out the kernel bumps into distict pull
> requests so I can deal with one set of issues at a time:
> 
>  - I'm not removing 4.18 yet, since it will be replaced by 4.20+ as
> the "latest" kernel in the next release. Plus our h/w reference BSPs
> need to be updated before I can drop it.
>    
>  - I'm not bumping libc-headers in this pull, I'll do that in my next
> queue, and we'll jump to 4.20 for the libc-headers at that time.
> There will be one more bump to match the 'latest' reference kernel
> for the release.
> 
> I will also follow up to the appropriate list with a bump to the
> poky-lsb distro
> builds that are using 4.14 as their default kernel version.
> 
> I'm not convinced this is issue free (i.e. did I miss some reference
> to a 4.14 kernel ??),

The bbappend in meta-yocto-bsp? ;-)

(I deleted it)

>  but some people have been asking about 4.19 support, so I wanted to
> get this queue out, and start dealing with any issues it brings.

MACHINE=qemumips64 seems to fail on 4.18:

https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/102

Cheers,

Richard


