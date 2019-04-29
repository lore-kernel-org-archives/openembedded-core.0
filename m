Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA677DBBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:59:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w15so16543725wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yzB5L+DuyluAQnC5pH9rttiuKlFgELW94ccKD1Yw2bQ=;
	b=BBBeczqNlLalDpL96AQTT0maqwZHTVx0SqodMwwl5a8mZcOdfpxcbt1MCeFf6SIjFV
	xzZQ6GAwofzvCmNMyufDojsA1Gp5pYarjIiAykTBH8Atc4YYtph2/67grmtLRdC3ZIdg
	EUBPxe6UacUgfC0qemfujWeu5kxEdLGlRenkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yzB5L+DuyluAQnC5pH9rttiuKlFgELW94ccKD1Yw2bQ=;
	b=jw0YLQTSXjk+2ZX181FDJbodE6z0tXThZ/SDcy5u+AHimtZRrDWuWrOPntGUvcEze9
	7LquQOgZVhSAa1VIArgcKNixPfE5laxgWYdQVk8ooSoQLTvyIBRWrES5eK+eKrcUDNjG
	lHwwUnChz66Q3ICUlzRGSlyUcOZxOUeFlasrJ2qSmLNsdpcRhpdcyY1GfU9Xua5hCX5A
	vFtQaYgPvw3cav4Ngl+9j3j1qh7s7VHuyo7aWq8Y89E35V06l+HK/97j+x/qrGC4IAg2
	2EUGs9e8uCwdbPOgZhIBG1wB3pbR30na6m+O96+aIZhfVHctnEyStK2+MXBZIN7ncilw
	NQ7w==
X-Gm-Message-State: APjAAAXFP4qP0v2HEw6VpejeYi/gy6M1MeSUk3NMP+bFgxIZOMA2pjxW
	v9kCuHlT62yYsYVYxAkDPWHjnQ==
X-Google-Smtp-Source: APXvYqxgxd56xAGbaNFmJ6Q+dKoeHUpkEkrpvGq3faxi/u5siSQoMYCVeIw5Uw94YBDkQTXOGCF2+g==
X-Received: by 2002:a1c:9d82:: with SMTP id g124mr6970544wme.110.1556553542028;
	Mon, 29 Apr 2019 08:59:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm20416505wmd.25.2019.04.29.08.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 08:59:01 -0700 (PDT)
Message-ID: <e40159322e1389b7514ff4d4c6183c070abc7f53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 16:59:00 +0100
In-Reply-To: <1556356777-78549-1-git-send-email-changhyeok.bae@gmail.comd>
References: <1556356777-78549-1-git-send-email-changhyeok.bae@gmail.comd>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] iputils: update to s20190324
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
X-List-Received-Date: Mon, 29 Apr 2019 15:59:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-04-27 at 09:19 +0000, Changhyeok Bae wrote:
> From: Changhyeok Bae <changhyeok.bae@gmail.com>
> 
> build system is changed to meson.
> 
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>

Still doesn't build with musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/546

Cheers,

Richard


