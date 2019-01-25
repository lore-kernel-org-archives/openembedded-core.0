Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB347C39A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 14:01:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b11so6894491wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=dGb0wsCy2ypsG/MQVCZmMzPuMPkD2ZhUK1bU/NxTI4U=;
	b=Kk5RpY0t5u8XoP2BqrqmaAQUIMe80kSUWDM96zj3X+LeNmwvv5yAP37U7QzCc5LhG8
	WjJW73E9FmEMehp9L59aVN5e8v1UAomwQKt+yHvAVB9ok2lZvcio0UurWT/NISuTHbKy
	34oYQAN0d8B+HUnzQtYAH6/J8O89w/IYCjt7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dGb0wsCy2ypsG/MQVCZmMzPuMPkD2ZhUK1bU/NxTI4U=;
	b=DeWz8dPKqSXFyqWqtJzyHCR3+WfwX1VAgMkKDf0ybFBvYZt9k5z4v9k1JNlA0P8xzy
	30Sqjk/gF/9lfAN8d8lhz9m3645aKv073w+8ymZAmO8yaFl/3piP3jTj7bqz1V8AqcSl
	d5fDIVzUSNx9OF1W6aKtQQ7LQM8e24tYB7tYeIashndC4tNTvFFr4MrtIZeOwxSzVAvz
	ATfvKokxM6pzNaFyv6vniphs1USE3oGlioaeUnKwoSfeeFZw0Y0BYrWUz6lfuU/3nIY+
	kOT6gtw7e3rOdaWgKHWuEOqqx8fKClZazBQgaKBBPyA6hP0RkTgUoYpNl/RWh8RbCLmG
	+dmw==
X-Gm-Message-State: AJcUukfxdqHXVQm9Y9W1kLqJjB9LxAJGl/q1lJKyd1ThztDFbaPvsWxo
	NFv3HCat0rw3yfNSaXan2BHM6A==
X-Google-Smtp-Source: ALg8bN4rxiULP5dxELDlmaQf/sugOswh8Ncx/9Md5xXB5mlWBq06Q6DKPXsWU0uGL8tg6CugqVLXAQ==
X-Received: by 2002:a1c:60c3:: with SMTP id u186mr7499873wmb.66.1548424865595; 
	Fri, 25 Jan 2019 06:01:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a18sm128015349wrp.13.2019.01.25.06.01.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Jan 2019 06:01:04 -0800 (PST)
Message-ID: <4f21e6ba08c6577b383b0a143bb419621e8b2d66.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2019 14:01:03 +0000
In-Reply-To: <20190124210227.25029-1-JPEWhacker@gmail.com>
References: <20190124210227.25029-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] Change default debug split to make separate source packages
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
X-List-Received-Date: Fri, 25 Jan 2019 14:01:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 15:02 -0600, Joshua Watt wrote:
> Changes the default PACKAGE_DEBUG_SPLIT_STYLE to generate separate
> source and debug packages. SDKIMAGE_FEATURES is updated to include
> the
> source packages so that there is not change for the SDK contents.
> 
> [YOCTO #12931]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 2 +-
>  meta/conf/bitbake.conf                 | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Looks good, we'll need to fix
pkgdata.OePkgdataUtilTests.test_list_pkgs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/157/steps/7/logs/step2d


Cheers,

Richard


