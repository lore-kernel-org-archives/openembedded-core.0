Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6CA71A30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 22:56:29 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b184so4093357qkc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vw91kpMGovsYxlTaa1IyyzMCGox8LyRQ7FF3375qtDw=;
	b=Tt0do4MkHiwnUr30EUcO7Lbu7/uR0RCexsy8OJGbHoC9Aowy65EgcJik/Tyu5KRJCe
	ugrmrZL3Nu+y+P8q7ZGW5IaRqdsJpmearXDP2GuuktcHX1A3EahB812K/+hA+stJPY4x
	DsV8Mm7vB72jlMIT/I7g4cCwqY5jPUCeLZvuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vw91kpMGovsYxlTaa1IyyzMCGox8LyRQ7FF3375qtDw=;
	b=lbw4JZCArhgud86cqAwMvkbzXg2yni/6oHUdG6/brEV7yHeoYKhtiNUZLIVX9r2Jgi
	Vlz4rhIEPYUjmbiP5QtWio2zsvBQBbFmjjymkjWKRFJVlZOwOBrdPfMnwWDRGB1cTJfQ
	9JSvZvaUmLVOlLrxMAOB1LOCpXy3gus2K/JgbnxkdNm7bpCrw3RJ1YLnB29C5sAL+GDR
	93wTHJzju0qdkLb7/2oR2CP+xKXNj3vOBj55mfIyUiD1d2J/665F8kIykSrZ0VNR3syZ
	8V1qeO8DMqmFd6JJf4QDiw3Ahe5iTrit8bdKr+jZUQIAIXP44s11BX/R9vzYRIxu7c/+
	yVUg==
X-Gm-Message-State: AKGB3mIvncN7fr0cX5bqW9ujrcuqrumPN/Rl+PrBnFPF6YMXXb7NrbZy
	c7i3YZyce5NOXyHBzlKP0i8I8g==
X-Google-Smtp-Source: ACJfBossaKI2qFAeIhsknwqvZayJHMl8cP4i7GC/Ynf7de29wKWOJb4YMNtgpGh64WM9BcX2xo8nCg==
X-Received: by 10.55.214.25 with SMTP id t25mr8989889qki.43.1513205791118;
	Wed, 13 Dec 2017 14:56:31 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	y23sm1708564qtj.24.2017.12.13.14.56.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 14:56:30 -0800 (PST)
Date: Wed, 13 Dec 2017 17:56:28 -0500
From: Tom Rini <trini@konsulko.com>
To: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <20171213225628.GV372@bill-the-cat>
References: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
	<1513176749-28928-1-git-send-email-kristian.amlie@northern.tech>
MIME-Version: 1.0
In-Reply-To: <1513176749-28928-1-git-send-email-kristian.amlie@northern.tech>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Wed, 13 Dec 2017 22:56:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 13, 2017 at 03:52:29PM +0100, Kristian Amlie wrote:

> See the patch for details. This patch has already been applied
> upstream, but we need it for v2017.11.
> 
> Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

