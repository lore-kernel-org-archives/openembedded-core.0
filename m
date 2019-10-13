Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 825AC7F62A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 13:44:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v8so16678284wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qrAQqWp4GfHihNe/IH9avR3AnmZojsNbuyaPWVL6ggE=;
	b=XLReCtstZ4fUCkzh0JhGx+nC3nyN8JPUucGFTqyMHF/U2iCm+8gnwmGCqcK6kbkF5Y
	lIDwfCjWrS2G8zmNZjXVYKeLg05uWSnpo7uEQjnvo+PO2mu7CC34x17eHTKIIHarbBlx
	Jo01iwQYRYMEM2/IXchC6ULVAi6/o9S8QMUeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qrAQqWp4GfHihNe/IH9avR3AnmZojsNbuyaPWVL6ggE=;
	b=Jvjv6EroG4n57mGEBz9b8JjODp40lQNhN+B+jLLj2ddZhK/x9tWFqJPd2MCvumllZA
	wR96knkb+hwtRqhHDtm2gNdmnRL7RqaJvl+ZzYrQxPKZxHONXUcU7d799W2/oYyQ/zE+
	ONa4lS7TaQD6gHLNiX7PGL2/mb2TZ0nbu4j+JuXt3qGcIozvimjoCgqjFJlLhRxSwQ2+
	VsQk+gNVr8x6oMmj0eMzqZSKRv+PJq6dK9G/TjBLG6qiFDp2SQwBkHDxZaAVZzIuvlG5
	iXnL2pw6MS8fQ7UeNL4Cc13PUczGVbO1cSEI3TZpOPfOcC7inTG9KW6vanHYMeiqMxN8
	xcuQ==
X-Gm-Message-State: APjAAAXLIEbfSq9DrajgD2J5DBr7qyqtH/GYDBjWR+SqbKRrZ+m9bS4e
	hmeMWz5V6zzDyYWup3kswQU6YA==
X-Google-Smtp-Source: APXvYqxSeSEoG8hSt463NZjqBV6eQOpKasiMqhvEx0aW0Q9ZrnucIHzjXzapK6eolZGTcuSfI/vJbg==
X-Received: by 2002:adf:b21a:: with SMTP id u26mr22653951wra.119.1570974272156;
	Sun, 13 Oct 2019 06:44:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v6sm31861866wma.24.2019.10.13.06.44.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 06:44:31 -0700 (PDT)
Message-ID: <ffe6a140ee4cf36bb7ce8fd2f460bcd7e0a86f05.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 13 Oct 2019 14:44:30 +0100
In-Reply-To: <cover.1570885333.git.Martin.Jansa@gmail.com>
References: <cover.1570885333.git.Martin.Jansa@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH][RESEND 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Sun, 13 Oct 2019 13:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-10-12 at 13:03 +0000, Martin Jansa wrote:
> The following changes since commit
> 59938780e7e776d87146002ea939b185f8704408:
> 
>   build-appliance-image: Update to master head revision (2019-10-09
> 22:28:44 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib
> jansa/artifacts
>   
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts
> 
> Martin Jansa (6):
>   image-artifact-names: introduce new bbclass and move some variables
>     into it
>   bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in
>     the _LINK_NAME variables and change it to hard link
>   kernel-artifact-names.bbclass: use PR instead of PKGR in
>     KERNEL_ARTIFACT_NAME
>   kernel.bbclass: imageType without {}
>   kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
>   *-artifact-names: include version only in the artifact links

I tried this on the autobuilder and it seems to break several things:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/423

Looks like do_bootimg fails, as well as the testimage oeqa code being
unable to find the testdata json files.

There could well be further issues beyond that but its hard to tell.

Cheers,

Richard


