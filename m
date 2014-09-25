Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id C84E971503
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 02:36:17 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id l13so7650057iga.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 19:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+3fI2Hd9ZRFDoVbeTccv+ET2zw2rywQCbT66GG0GUNU=;
	b=dKboy8U0Tzhe/pMwtAjl/j6+NdLdqzWo6tXtyZvgZ85FRXMeEs1JcjJRbE0i5ArbFR
	FXXu8XvU5XnwTMcuTy8zlfeR85cvbX8SZ67U9hmsjUtYI81YP1JcvtSpngMhfNZVOztN
	hqR5+F8CjN63LPrn4ZLffvhdfEphvGRshb64cdCe65qeqDqugScxAIwyKw+Gh+DIX74L
	GYRerJ/W6jidSdmrx/ccEo/u6tPTw0kfnOESVAkVC57phs2QVUfzquP182VqIjI8e9DA
	KpH6usiMllEfYvBg6Fv9A1xme9bWS4jo7Q8Z56kDrAShzkOcNqDEIRdXqap/ptmnAxKk
	Np4w==
X-Received: by 10.43.61.4 with SMTP id wu4mr15596058icb.77.1411612577914; Wed,
	24 Sep 2014 19:36:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Wed, 24 Sep 2014 19:35:47 -0700 (PDT)
In-Reply-To: <54237A49.9060406@windriver.com>
References: <1411503122-6202-1-git-send-email-fathi.boudra@linaro.org>
	<54237A49.9060406@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Sep 2014 19:35:47 -0700
Message-ID: <CAMKF1sr63NHXEKma7kPKJSiPShJmiw8=v2xXCCtOBC6a8u4KwA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: add aarch64 support
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
X-List-Received-Date: Thu, 25 Sep 2014 02:36:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 24, 2014 at 7:13 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
>
> It doesn't work and fail to do link:
>
> | ../src/.libs/libunwind-aarch64.so: undefined reference to `unreachable'
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [test-coredump-unwind] Error 1
>
> Is 'unreachable'  an debug function?
>

this should come from libunwind_i.h apply this patch
https://launchpadlibrarian.net/138280994/0001-Support-building-with-older-compilers.patch

I wonder why its not upstream

