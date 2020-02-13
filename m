Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31D2A60C85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:38:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s144so809683wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=hqywPhT1gwxBG7MeEBXAaJJSbzA1/NXKyHtgVd3syto=;
	b=QCmWmBonVAlelFc0HVuvL9K4dW3Ixj1ReLnOHJ6pb4vY1qephsmYubeJdBALWbDlsk
	r1BnDnzAav3wP0BdowJ7+L12niM3PCduBvSYt6v0De6jl5e9EPwJPrR5M1DZqxyhF6P5
	ots9dMv+nvhNNWAt7wbartmQ/oxXJzxq94VWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hqywPhT1gwxBG7MeEBXAaJJSbzA1/NXKyHtgVd3syto=;
	b=mQg9CgxuELjbrTU9rtadXLC/pUCzivcm9PQ/wDFD47FoD9qs+hEYUEbGqielA8H4Nz
	fbe4Iy/+XmHnvzluOnPFYaY0uHvtKHiLoxvWKKvi4TK/r0s7EK6DUY/TqYVNUNdculLj
	Wa4CBJCqCc/GvWEvmy8VInFv4l4HuRojzhZF7s9tooNN1tvD7CDBlUKl7P0OEnbVow2+
	50TayXrTE9NcP41Bl96xmnS99z5Rr+P2awpX2T3nvNYqZAzMARf4E2Ub2lKDy0jmDZGP
	bZAUUgWoKAouUzwsf8D9zRORoAsnSopFqTsHjIIaYsC0p8COnC4fwVuaY3YwQH7LJGw8
	L3rQ==
X-Gm-Message-State: APjAAAWa1Q43OB/WP+M9haQLODfY4iveK4gYWVCixzwubDU0pTd7ou9I
	l0DXx6Rcq7YU+YkVgKvYeoCGsA==
X-Google-Smtp-Source: APXvYqxD539cDwuSukyCFs1+MwmWmupeFJinGzMEsMlrDyoA+Vd0Na8YVzwQ2ARrNSAFkb99bk7DMQ==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr480679wmg.86.1581637089063;
	Thu, 13 Feb 2020 15:38:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm4761719wmc.22.2020.02.13.15.38.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 15:38:07 -0800 (PST)
Message-ID: <ff9fd754f0151c81ef5938f904415ef0a212b8b8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 23:38:06 +0000
In-Reply-To: <650b515ce0c79adcbba39cdf47bc23f764ca1465.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
	<650b515ce0c79adcbba39cdf47bc23f764ca1465.1581575578.git.raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 6/9] gdb: Upgrade to 9.1 release
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
X-List-Received-Date: Thu, 13 Feb 2020 23:38:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-12 at 22:38 -0800, Khem Raj wrote:
> Drop security patches which are now in 9.1 already
> Forward port rest of patches to 9.1
> Detailed changes [1]
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00008.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Something odd is going on as another patch failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1551

Cheers,

Richard


