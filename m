Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 08F0D731CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 23:24:25 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s68so27227095qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 15:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PrYlFfEzUm3NbFv9RDSQs3z+Lxey520VjiVwLSY2zAU=;
	b=JeiW2D77X+sH9+0ol89ZSFkwFwaWsgBX9W5af/6bJGUeJFyio/0kN6SBZ7MZ6B/kAV
	XVQKsSIUDhLExTwwWQQ9F5Ua/uevaNvpGFuZXiF75Ds37HmQ6ImMxDdZK8sUga7QdO35
	2VFkdwsqL5IC13vLJF63EIanfiUGuFZ313ml4gP0KNccl2CIGEn3Ly7euBCBQKGd4c20
	+RGKfTt+WXpgeF4HgA52d75kRO9eepXvOkmPyCMt6yZmzZ3Rl8azajHqD0W1yBWQUHPF
	6F4JDhfrQax2TVW4YIZjuVaEuS7npkjsmlXqVpHG0RNabS/93N/hhtCy3zvvqCre8rtO
	fbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PrYlFfEzUm3NbFv9RDSQs3z+Lxey520VjiVwLSY2zAU=;
	b=gXJvKmQ2cCV40Ig6iXKr7VgDCYTjq9wezUJ156JhQGbfB3ZJYjifW63PmgJDuD595h
	vj9Z2qG+VINtCE4UHALg0IYjx9hnR3h9/wTab8vTdP0xAILBLx3QgYkkGmN/PeBlp0+S
	Syt/tvbbQHOLAyi7XsOxD/bVfwaClDjsrqOajNx/xKpb3Idw0FfgqBb2xiZVzeKl2dww
	FgNJ5oyNZzUYZLprwjCLIaLvsdT7+qmiA9CyLimXQVTc3k8Km3zwfztSU2auMnI+dexu
	w0i8KrTuRhT75R98pQshXDZwxr9xugNlY3qhkm/pJ/V/ojI0eoUtrwMSXwm+FP+8zc8c
	AXiw==
X-Gm-Message-State: AD7BkJJ9krUdKPDItUyuXF3XDxT+z0TQBI1YQ5c3j8Tb+6ghNY3KdhJqkwBj/4E0nx3/1/vNclPoSQPh3yjINA==
X-Received: by 10.55.73.199 with SMTP id w190mr13505487qka.77.1457133865911;
	Fri, 04 Mar 2016 15:24:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 4 Mar 2016 15:23:56 -0800 (PST)
In-Reply-To: <1457130807.2804.59.camel@linuxfoundation.org>
References: <1457130807.2804.59.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2016 07:23:56 +0800
Message-ID: <CAMKF1sqY+rsv8Hu5pi1tdvybQLp9Ro-HgZ3NZktvSiWhmVM00Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: uninative stdc++ abi
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
X-List-Received-Date: Fri, 04 Mar 2016 23:24:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 5, 2016 at 6:33 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> +# https://wiki.debian.org/GCC5
> +# We may see binaries built with gcc5 run or linked into gcc4 environment
> +# so use the older libstdc++ standard for now until we don't support gcc4
> +# on the host system.
> +BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
>
>
> Is this the right way to try and fix this? Any better ideas?

yes thats the best option we have given the myriad of build OSes we
have to support.

