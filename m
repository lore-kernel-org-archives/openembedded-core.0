Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE1687C219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:02:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j2so14591337wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=JjSftckaOIHgirCkd21FjC+v/fZZX17kMg8GXV5xS8E=;
	b=FFYlq6/kX7sk8/z4C/MU8YvXblWa6PystOfcnYVE7zwr71aYohJzy3FN3/5ezW1czN
	a8dJqAlDpfFPWkLpXIsYrZuvbKRSw7BNFbK3+b7uw5/SO6iYhggpwV3HY34SuKGAWe7E
	xRBnaFX6DFUiIxVa9cRx43ASkwl9UqkpBQn2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JjSftckaOIHgirCkd21FjC+v/fZZX17kMg8GXV5xS8E=;
	b=cu5BQ79BbJVllXZakg8mv9hHxvkQbIJfTtp7Bo2G2FfvzQmd4tRJC2LCEDcdI6LVwv
	GrGr9wzBvq5nm9enAPaxySHAmZVrZ/veM1iKQps7v558NnLJmXp1/ZUvVgiIU2c4OQER
	TcdenCsqscRJBTdkqMp11FBiIAvK14dW7ytGwlnePYmbx4hQCGUxT5A4yp/jFJz9SN4K
	+MrjXwQXU2eM9svUs2nH1Yv3LRzYq0tON6YFLCBcZy4MsoBnyP/+E17R5BbXkRxSf9+9
	dQeuXWsFYmGOuw1FQvaVE6zW41XFcb20HZHREtqmJfW3+iNeu4oCA0c5Qxbku9MPR0bv
	MDIw==
X-Gm-Message-State: AJcUukcDMWm0vaAANDVcjwf1AjbGIsNqKgoA/wb0T9sNdq8y07lpB912
	xLIpmqtRWbFiwkKWi8kJoBwgcQ==
X-Google-Smtp-Source: ALg8bN7wr4MycNPmOxu8R38/A+n4KGMkDtsTgCvdH6Zto+epUMsUAEiTn0VQfcosPJE+PYd74G/Kbg==
X-Received: by 2002:adf:f3c6:: with SMTP id g6mr15714066wrp.111.1547809332430; 
	Fri, 18 Jan 2019 03:02:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n11sm24754053wrw.60.2019.01.18.03.02.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Jan 2019 03:02:11 -0800 (PST)
Message-ID: <b561f725baace2efee3e30b5343cf1102319dcea.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, ross.burton@intel.com
Date: Fri, 18 Jan 2019 11:02:10 +0000
In-Reply-To: <20190117071227.57387-1-kai.kang@windriver.com>
References: <20190117071227.57387-1-kai.kang@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Fri, 18 Jan 2019 11:02:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-17 at 02:12 -0500, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
> Specifying -fdebug-prefix-map is equivalent to specifying all the
> individual -f*-prefix-map options which means including
> -fmacro-prefix-map and -fdebug-prefix-map currently. Option
> -fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
> by __FILE__ macro expansion for packages such as llvm and librepo.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I like the idea of the patch a lot. Unfortunately it causes an oe-
selftest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/131

in the go toolchain.

oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_build

should reproduce.

Cheers,

Richard


