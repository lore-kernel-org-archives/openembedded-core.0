Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4368E6186C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 21:18:43 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id tp5so8029904ieb.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iswtvVkpqIkYqtTyaiZ5eTGdP0FFDBdsdmwOoRpqtnE=;
	b=axHfyrOPlVsyeGuKmW6szemvsToogzKYckudjJGnF02lrIktU18SxqqJn8NLuNcoSQ
	DZUa/GVpBtilXtMQjBb6WS9Ea4yHf62UAIsdy7t5ONlFBLPsY29LMx2dmr8XHCMFuugw
	0rxXkU7yrHwCmwrSEJPqva3oQuq40y1j/nAgLXUSHbNBgzCkuE4D1Wpb9393lsOqNczc
	VBtS+TOLdG1TTbHlV5Ok8ee+ZLd9/ZnztCzpi/WJ8ADvvbUfj6sCT910memGgm3omvv/
	Urg5bhlwmr63SPPMd0wk8/UdPZwMl5eVFUrltH9A994LPO+PoaorbeorN6BOqK5h10Pz
	PH1A==
X-Received: by 10.50.36.5 with SMTP id m5mr11557655igj.3.1378502325166; Fri,
	06 Sep 2013 14:18:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Fri, 6 Sep 2013 14:18:10 -0700 (PDT)
In-Reply-To: <1378501748.3484.36.camel@ted>
References: <1378415843.32427.84.camel@ted>
	<165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
	<1378460046.32427.96.camel@ted>
	<50C050F1-3F84-419B-8053-D8DCA38FFFA7@gmail.com>
	<1378487137.3484.18.camel@ted>
	<A7AF04A1-07A7-4994-B4EB-48B09606345B@gmail.com>
	<1378501748.3484.36.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2013 14:18:10 -0700
Message-ID: <CAMKF1soqyU_h5SpJqwDBq7XyT7uc=GLDW_FK50Mt-feMkEwiSg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] gcc-runtime: Hacks for libgfortran with gcc-4.8
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
X-List-Received-Date: Fri, 06 Sep 2013 21:18:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 6, 2013 at 2:09 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I can't see how that will help solve this problem though?

might help n getting the libtool hackery right.

