Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9B86D458
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 11:10:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y197so9985957wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WblgPtIrDyNth9/uvVz/QvKT0rsZk759aHVfDwYTiUY=;
	b=Ap/gZ9F4f44zvYjCUM439lUc2mYPBKyFHLfdRvv5iNgq5At0R+zYFebyyC+8Os3/ca
	lN0ioBDy+OnkyRKbbyPF6SaiHY5j18GrUMNVprxMWjmdIExyq+CzNj9z8KyjgsthNoiD
	t4VyhlfydGlevisLo74RkM5ckrHnnAbIfqyss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WblgPtIrDyNth9/uvVz/QvKT0rsZk759aHVfDwYTiUY=;
	b=jkl052RElNvWXLN6WlZdk4M1Emy4u7fbAhcx8/PJhhNVaii/ca1L1PvbS3gEcxU261
	azHi5KR326cnDEye0kXgTnU3LSJGcMc75WSfOFPiV5ix2RD07LOsV9Dg3dvOQ1RNsENA
	yGp4Z/Ui4B94TmhQYbyj6CuR1x0LPwB0stT9E335WkKLaYKAaaYQ54Z8XZNubpQg+20a
	XYyOnjrUp1p0fE9O0dth9hey82USZfPpwqsvxUjOt5i4NhzEg9kurwBr5+U4nLWAbBiW
	1w+Ll2uHrw3mYF+h+J1Sw+IqMoYc/6fHnecZMiBzQGHOPwxqUcQ3oes/IlMHlT4ufYRP
	51AQ==
X-Gm-Message-State: APjAAAULHBQ/9saGFXukoruGOlD2cu+2EDRXMGL9BrVudrhgMNKFONjp
	FLauavOpU+S4wG0DNTQg4HhEcQ==
X-Google-Smtp-Source: APXvYqwBxgaQheLrrSn8asx2XyshcwfT8PRZIhbdGkcZI9lHYiXcq8x2baQdvJpiNpUm+VTLX675Zw==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr3159493wma.53.1556190657234; 
	Thu, 25 Apr 2019 04:10:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n18sm18184014wrt.16.2019.04.25.04.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 04:10:56 -0700 (PDT)
Message-ID: <5a4d7a816976c59a9911392478d2663ba8595b02.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 12:10:54 +0100
In-Reply-To: <20190419195809.25716-1-joe.slater@windriver.com>
References: <20190419195809.25716-1-joe.slater@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gdk-pixbuf: add timeout to run-ptest
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
X-List-Received-Date: Thu, 25 Apr 2019 11:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-19 at 12:58 -0700, Joe Slater wrote:
> The default timeout of 300 seconds is far too low for qemu bsp's.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
> index 8f90723..b4f982b 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
> @@ -1,3 +1,5 @@
>  #! /bin/sh
>  
> -gnome-desktop-testing-runner gdk-pixbuf
> +# The default timeout of 300 seconds is far too low for qemu bsp's.
> +#
> +gnome-desktop-testing-runner -t 2400 gdk-pixbuf

This raises an interesting dilemma.

Do we set the timeouts to match a real hardware system, a software
emulated qemu or a KVM accelerated qemu?

My instinct says we should time these for real hardware and KVM
accelerated images only as ptests are simply too slow to realistically
run anywhere else.

The downside to long timeouts is if something does break, long hanging
builds.

On that basis I'm not sure we want to start patching all the timeouts
for software qemu...

Cheers,

Richard


