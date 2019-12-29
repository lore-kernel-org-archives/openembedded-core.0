Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 680D47F491
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 09:23:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so30215107wru.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VBGDo26FA91iaWvyNcA7XY8Nw/4GfrByXuZQ2GCrLhc=;
	b=OI+9tRLswNkMmzqvIdjED9VrsRthY+C8bfDnltFFJrSyj9prpbbp5J1J+tVPR1Rhlr
	JPFfSyX2uuzZ5tkPdgDAd+yhWjvqvBtHL7a9dzlbnuk/ajI+MLw7CyBDIGZSsHcTqEG0
	63h3tD8TDk5t+tOK6pyspfuc/GkywEkO6bWRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VBGDo26FA91iaWvyNcA7XY8Nw/4GfrByXuZQ2GCrLhc=;
	b=VOXArBcGirhz3rlYp6ppTSBp+7l9wZ2xhtQ0PJeaDBxiU+AFSJSmBZudNhZqlqg4cc
	V0udJyi0a+qyREEz7NIunqJzzLsNx9jo2VQa+Gf1GMvU4AAo9r6m1xn7ntJdb0ZRJPjG
	eelwsSm3F0RF1g0qm/Jh/oMFrl78MxEJ3D+g4iO/sqBnpVhqtG30qyJx4RpVTEDuW8xj
	mBh7A9gH5ROYt5F4hzowFq4JZDPr/gkQITVALmalqfhL79z1rqp3iZ5kLfPBczRBHoAw
	mwbROEf5tHd14R6CsuGOlVpVNm6s+H8DqNgEMDHnunLVLhCEliSPyv0U2Zi7A0QHitrB
	oLjg==
X-Gm-Message-State: APjAAAVGjiUDdlxobQqwdCxcZVo0UftxnVSKo1u8tvc0e6ANPqlgyJAl
	m+wy1S9sKr3D73l0hfBj5ILHtgHzIT8=
X-Google-Smtp-Source: APXvYqw6y1D/B3/scBHZ/HyQ+LK/2ZGdyX0CljFDpf9f5O2kCg0u4xgOZsTDZHwyw3TsG5f30eJTww==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr58146422wrv.18.1577611429041; 
	Sun, 29 Dec 2019 01:23:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x6sm16905280wmi.44.2019.12.29.01.23.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 01:23:48 -0800 (PST)
Message-ID: <8c9256ff3e84ac5d8e9acb0f8e7a9bf60baf9dbc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 09:23:47 +0000
In-Reply-To: <20191224224135.20121-1-alistair.francis@wdc.com>
References: <20191224224135.20121-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, sateesh0457@gmail.com
Subject: Re: [PATCH] u-boot: Update to v2020.01-rc5
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
X-List-Received-Date: Sun, 29 Dec 2019 09:23:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-12-24 at 14:41 -0800, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index a0f9c41469..4799948bb1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -11,11 +11,11 @@ LIC_FILES_CHKSUM = "
> file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  PE = "1"
>  
>  # Drop this line when updating to 2020.01 final
> -PV = "2020.01~rc3"
> +PV = "2020.01~rc5"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
> +SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git \

Seems to break on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1392
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1396

Cheers,

Richard


