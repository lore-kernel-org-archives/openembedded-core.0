Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E25617D5BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 21:22:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so15441781wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=NdEaMJ8QoCivDF1DRhuOgF4vc/slg/yuNDcDcfzLask=;
	b=g818iXceo4pnopiV2spka28tHAcjfUxXC4WfzHfd3FJewWUuuc8Bu05kiz4mBKjStE
	eQGplVV4UGPsxAZjHRQ4k2BIY9AaO/yMzR8Pel7mRD+QZhmc6eEIggA8tfvc9MJiXFeh
	tkKi9aD8ResCrtt/szpzmFvSxp/H8I4HWX5/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NdEaMJ8QoCivDF1DRhuOgF4vc/slg/yuNDcDcfzLask=;
	b=RVCGoQBb9snOx64DEXfDH5q/Wln5WXUThm2dBUGgonVjhDdw8NewByg3WqAZYbgWg3
	OwxGM9ADHaG5uYUelt9lCED9dRTi+73pYHxjyKn/M/B7RDeyMo5dNSBE/wv0TgN8n/Jz
	80w9USIewPKYhaJaq/hmyDcRE50C4REzwKW6LH4NHV5B6g4onCXVygH2G6mbG0j7snIg
	XZkQ109/QVYBaiNLFMW1KBtgKhfUKEIoIF41iHcNuKpBlnb/W+qNJGNysE9RtE1HSUUp
	QkyAiYa0/vqzODXcEHh9dcK+8aZLqVhRv/FKgKC8XwvThAV+kcaMVwP5zpFMcYEyvhrl
	sJQw==
X-Gm-Message-State: APjAAAWPylUSRseDUkUubMS5DTqq6xirrNe72pq0X70nJu547d/a4t5e
	J5zQe7OEFNYlmgMgyKCnn+acgA==
X-Google-Smtp-Source: APXvYqyqLHt1024BTvJLkHJH75Y2DCXSm+RBIVNWHVpS+qignnFFnHAgfDzDvk2Ms8pGoAeAVR2Z0A==
X-Received: by 2002:a05:600c:48a:: with SMTP id
	d10mr29197652wme.87.1579036975502; 
	Tue, 14 Jan 2020 13:22:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r5sm21223164wrt.43.2020.01.14.13.22.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 13:22:55 -0800 (PST)
Message-ID: <708f047ae3ec29edfd2633346273ebb919211ec0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 21:22:54 +0000
In-Reply-To: <20200114140007.36622-3-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
	<20200114140007.36622-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 03/20] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 14 Jan 2020 21:22:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 14:59 +0100, Alexander Kanavin wrote:
> Drop a backport, and a patch that causes build errors with
> the new version.
> 
> Add a patch to make ARM HW crypto optional; upstream for some
> reason does not allow disabling it.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...ppc64-inline-assembler-for-clang-r-j.patch | 35 ---------------
> ---
>  ...figure-option-to-disable-ARM-HW-cryp.patch | 35
> ++++++++++++++++++
>  .../nss/nss/nss-fix-nsinstall-build.patch     | 36 ---------------
> ----
>  .../nss/{nss_3.45.bb => nss_3.49.1.bb}        | 12 ++++---
>  4 files changed, 43 insertions(+), 75 deletions(-)
>  delete mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-
> Fix-ppc64-inline-assembler-for-clang-r-j.patch
>  create mode 100644 meta/recipes-support/nss/nss/0001-freebl-add-a-
> configure-option-to-disable-ARM-HW-cryp.patch
>  delete mode 100644 meta/recipes-support/nss/nss/nss-fix-nsinstall-
> build.patch
>  rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.49.1.bb} (94%)

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1435

Cheers,

Richard


