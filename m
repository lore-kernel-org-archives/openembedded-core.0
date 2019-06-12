Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 861557E701
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 09:57:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 22so5852149wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fWjfF3hG+YaeMNcD1p3/oKH+0UxQ0fHWDgi6fDIjBKc=;
	b=WFd/PEvq/NzH/KGrCMoNpMwnskYnIgGggg5ESefS8jWJVtORQVRLfIGh+wRDUzrbru
	A+YI3EF9HJqNKLylhqVFLWUhIqiLw010WgNnJgD5p4pI4tg7JBl1rFGWigd4IhDDCAR4
	QlpRovL9xlM7EqRb84KTzslLcqJalDoBPfpeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fWjfF3hG+YaeMNcD1p3/oKH+0UxQ0fHWDgi6fDIjBKc=;
	b=SvG851ITBuSAkC7/btmqYwSZ8GBr+SJaeR5oHjcdFf1HmwlU6F0xMgZIe7TVeoxM48
	pALH9p0b3Q94Iqz4g1gWmBg1Buw+EZxQQwCTfSNLJOQhDm3gNPWUkQvh7bC9qqnJyM1W
	x23wPmLwi/u5cBGWaGLBgCcr/9s2AVaq4Ak7SfnxAHCWy/2L07sAbTwTlMQMemL86t11
	AHoO29bk6rGDVYxfkIkvGIDJe4yOVY6DoB/RzmHvwtKr8SM1OOiv5bGNI0f7hiESg+38
	lOuJhFnWbEd4iz+MV4f1ps9BcA5ce9rPOL4MBkHWCzhqSzzAPdvnR0eqBnn+7vZw3+AF
	WozQ==
X-Gm-Message-State: APjAAAXfcMPU34ru7YzOyvqrRU/2yX1JFcsxS7zz0K5FszR14jieE5Xx
	uTTWhHWXAoB6iDGJDo7tUpf+7g==
X-Google-Smtp-Source: APXvYqxNTU2iVY3p6bV5IxE37YECz8cJ9b6hJt+2z54/x8Jj6gfV/Ru7qMD2qKxAkQav236jWVVCBg==
X-Received: by 2002:a05:600c:2189:: with SMTP id
	e9mr14794840wme.56.1560333475100; 
	Wed, 12 Jun 2019 02:57:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s10sm5717119wmf.8.2019.06.12.02.57.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 02:57:54 -0700 (PDT)
Message-ID: <d0b197e49ef118034631fae6f322a745b0e34932.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 10:57:53 +0100
In-Reply-To: <1560330909-164994-1-git-send-email-zhe.he@windriver.com>
References: <1560330909-164994-1-git-send-email-zhe.he@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 09:57:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-12 at 17:15 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> This is based on meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb and is for
> those who want to build lttng-modules with bleeding edge kernel, to avoid
> regularly backporting patches from upstream.
> 
> Note that PREFERRED_VERSION needs to be set to select this recipe instead of the
> tar ball one.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/lttng/lttng-modules_git.bb | 34 ++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules_git.bb

Do we really want/need to duplicate the whole recipe?

Cheers,

Richard


