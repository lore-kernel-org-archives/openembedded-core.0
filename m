Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1FEC619A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:58:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a141so5082396wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=YP/vhOOSWYfcggEu0m1leeYY7Vri58t7bGHUVaA/vPQ=;
	b=Tf90oqL6vlG8eBVN+xOc5cSMe8Z/YJMW1QAJ1U7gLT6G7/nynpYGGoYghjTl0I4rmq
	zApTigIa0r/HskuCDs2H0/xejPzhFrtZx0GT8LuUYT+6CO4oHPVvw9qabn7edsab9y5w
	UtDTGbVw7+bXhVe6ZY2HEoJSDKqEyLqeEgC3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YP/vhOOSWYfcggEu0m1leeYY7Vri58t7bGHUVaA/vPQ=;
	b=NkMku+/EW1GGjJJtEiRA+GRJMS3xdqeoqRGrroJiuGtmcyOPbbjT9P5TS5kb5Irhon
	ltNoW7nkOp9wUtyUaSbu1MLwTlOYszz9hpJu5jS87uk06HAjgxPkYImsJfrh2MHXIyIB
	lV32AKesZHofaEXFNOi4F23cyMSh8cv4yd1Gov+0wh1aGso06BVOJvpnxxzquHnkmQeT
	FvmXudwZl9MuDuLeM2Rd+pwZ9BU3aGQMKPbkTx2QponjTyfuAN1AscFJmP9i6OjoBMwB
	Tv8k8jUdIeJ7riQ/Q8Y4OgwO0OmVAJ16hfanXxN4bGsH0izx04MmFLjSG+xDc+W7Qt5g
	Wa3A==
X-Gm-Message-State: APjAAAUPw0TKO68dsaLYVHLRC0hjL/fRyWAykaIv6ZtOnCx5r0WeiROv
	V+FBkfrww/g1FrVp7hbAzbJFRg==
X-Google-Smtp-Source: APXvYqxDJdymuYqsRpY5h1DotD8D/ijAgdXGFkVBGXTyVYswwT1voQPsFOhEib5HxcE30dpnuQzD7Q==
X-Received: by 2002:a05:600c:2257:: with SMTP id
	a23mr6657269wmm.15.1582930735136; 
	Fri, 28 Feb 2020 14:58:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z8sm13707418wrv.74.2020.02.28.14.58.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:58:54 -0800 (PST)
Message-ID: <6c66a236197cfa2b432646cfff2a22e3e181a579.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org, Tim Orling
	<timothy.t.orling@linux.intel.com>
Date: Fri, 28 Feb 2020 22:58:53 +0000
In-Reply-To: <20200228144929.164927-1-trevor.gamblin@windriver.com>
References: <20200228144929.164927-1-trevor.gamblin@windriver.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 0/2 v4] Add ptest support for coreutils
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
X-List-Received-Date: Fri, 28 Feb 2020 22:58:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-28 at 06:49 -0800, Trevor Gamblin wrote:
> v4 fixes a multilib issue - do_install_ptest was previously
> using sed to make the d_type-check test point at python3 
> instead of python, but hard-coded the path for the test file.
> 
> Sample test results:
> 
> core-image-minimal:
> MACHINE    | PASS | FAIL | SKIP | TOTAL | TIME (m) |
> qemux86-64 |  472 |    0 |  143 |   615 |      2.5 |
> qemuarm64  |  472 |    0 |  143 |   615 |       51 |
> 
> core-image-sato:
> MACHINE    | PASS | FAIL | SKIP | TOTAL | Time (m) |
> qemux86-64 |  472 |    0 |  143 |   615 |      2.4 |
> qemuarm64  |  472 |    0 |  143 |   615 |       52 |

Sorry Trevor but I think there is an issue here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/735/steps/8/logs/step2d
(and on all the other builders)

Its still causing the reproducible build failures for libmodule-build.

The reason it triggers on this patch is without this it isn't included
in the reproducible builds test. I was blaming Tim's upgrade patch!

Cheers,

Richard


