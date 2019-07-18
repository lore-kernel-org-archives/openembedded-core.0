Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A59F7EEE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:33:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so28518647wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=MIzV4reXMTEr9zIU9eC8g5eOAJ+kynWaIJbRh1bqv7M=;
	b=IHaqHlCYdrA4uqTxvTunoBRo3mpDKNpYC35REfA8LQBYoh37i52QfAmjBFgWryHeW8
	0hYqIqNGb0tZs89fNKHe7cOr5y6ej5bwAEOJ4/00CkSvDMrD5s+6y7Av/FCMKLXr+P7g
	FF/FIEZW8TNZ+IWBlIWAXKiaO9vhk1t9f+BFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MIzV4reXMTEr9zIU9eC8g5eOAJ+kynWaIJbRh1bqv7M=;
	b=ppg2BliQ097+qft58EEclMZrIm065k6bJ4+6I1sVyahmRWgjWv6/eoz7VxKnBAKAEk
	h6XJdQyU2nvS3T7YzJCjrUvGHOHN02s9po4pr3YkJ2BFAAyjH3ZN881RR9ye6Ro9Gvr5
	1VkQ0ZYDHcaKptTSbXnUFIVivZlJAU4RMddLlE/seqqiC0wiIwoXKvC8l3/Z2rVo4i8d
	4vq2jGVYR5xYdpWYRcm4Ljs+BhDrukCklEk139hbqfCV++LmHhhFHTJ3KPFVU1igMDAs
	wrsJUZJ2dRD8DyYiQxAPQ2ylsrgFQrhM9k2Rda7dvX0TPjwmql+FeK71ZRq07C29IYH1
	kUsg==
X-Gm-Message-State: APjAAAWJPu3v36A//K9Y2+2124Nsmuol2JGlW9tTAsEgfuK1S9x2OlMC
	+KEBlbd3rNiTykXLcodmbg54eQ==
X-Google-Smtp-Source: APXvYqyrIcqE1ZNKEhgYlESLJY+Z2LTxpOYuv6oYNe1W59Jy7rKdxGtWiz2+TDBlGc5gXANYctu7qg==
X-Received: by 2002:a05:6000:1007:: with SMTP id
	a7mr37821696wrx.172.1563453235939; 
	Thu, 18 Jul 2019 05:33:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u186sm42256326wmu.26.2019.07.18.05.33.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 05:33:55 -0700 (PDT)
Message-ID: <8ffc227244161cf4735427ed794ba569e41cd0ce.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Jul 2019 13:33:53 +0100
In-Reply-To: <CABymUCN4Z9mD3zytqA9s5nS-me3-iCU_tAz47KmUibMamtDsFQ@mail.gmail.com>
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
	<1728686637c0ddb7bfcad08769da97a8705daca7.camel@linuxfoundation.org>
	<CABymUCN4Z9mD3zytqA9s5nS-me3-iCU_tAz47KmUibMamtDsFQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: fix missing signature
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
X-List-Received-Date: Thu, 18 Jul 2019 12:33:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-07-18 at 17:18 +0800, Jun Nie wrote:
> <richard.purdie@linuxfoundation.org> 于2019年7月17日周三 下午7:41写道：
> > On Wed, 2019-07-10 at 15:10 +0800, Jun Nie wrote:
> > > u-boot.bin with dtb & signature should be placed in ${B} so that
> > > it can be deployed by u-boot as expected. Otherwise, the version
> > > without signature is installed.
> > > 
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  meta/classes/uboot-sign.bbclass | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > I continue to be very worried we have no test coverage in this area
> > of
> > the code. Since I don't know it particularly well I'm effectively
> > merging patches blindly :(.
> 
> Then I think you can merge it as long as it pass current test
> coverage. Because I already test the FIT signature feature comes back
> with this patch :-)

It has merged but my point is we really need better test coverage of
these areas of the code.

What I'd really like is for people to help write tests which showed the
broken behaviour the patch is fixing.

Cheers,

Richard


