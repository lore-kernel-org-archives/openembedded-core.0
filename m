Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B0FD860B52
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:14:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m3so6325415wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TYDlgJ0kCJZroY1l8zkCY6U8Q9fm+aoEEPKIX4JWou4=;
	b=Fwt2094FjIcfoxbsT6V/0dRswsUoDw4kT1VkSHc45w6jKDMNUFp5tJZZDEGgscwbIf
	hjXFJHxrqWnvmOSPwP1J22zKxDrI/OOBmyfxiEI5Blkpo4jfISfKa95cDUaIDr3GV/WI
	ReG3283xHG+pmNj3GDZOQCI97Poig1fZ2oIo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TYDlgJ0kCJZroY1l8zkCY6U8Q9fm+aoEEPKIX4JWou4=;
	b=d+mdoBYTpVAN1B3QLJvplEmyoLUx6pyIaT+wLmsdMFsqc8PIakNWlv4i4Rp1uuRfOL
	P7CaHQmkooBNocsdWQCml2mN489QRt/keqtqdj+Swri57FZ3cszRzEK890kXUJUBE6eY
	htp5YC+TEaRM8XhZF2/L6KeRSxO/5EX/lEZvyjSuJmX8wye1C93Lmn3VIzAOta3BfDkC
	XnblDqBLR9cCkTXvz5QhMYhe0gmp6ueOfSP3ibgv9Os7122xqgE8OqWlpEeM4KZcZQjc
	Zs6MRZ9e3R5P/fvGfzX2LdhEuf+DFXcID74nT41aizgHLhMJNtbcdVsgMOZ5OcEp018F
	x0pw==
X-Gm-Message-State: APjAAAV1Mqrv74mZ2VOZCtmEdK74xMRPsNR2XCR8/hENZ4xfCcE8c2f6
	z9B3bzJ8lUMPaAmSFeaKXzoWeQ==
X-Google-Smtp-Source: APXvYqxb6tO9Ih+3xQ6r/feWDupUMRCrqY/sN7oJMaMKe2HL7dxoG6dPRICPv64RusopcsArHAsUVw==
X-Received: by 2002:a1c:5441:: with SMTP id p1mr10433503wmi.161.1582982078288; 
	Sat, 29 Feb 2020 05:14:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id j4sm5287113wrr.0.2020.02.29.05.14.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 05:14:37 -0800 (PST)
Message-ID: <d415671888365ca180bcfb72000bcd394f0e7b24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Feb 2020 13:14:36 +0000
In-Reply-To: <CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
	<23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
	<CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] piglit: move to meta-oe
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
X-List-Received-Date: Sat, 29 Feb 2020 13:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 14:11 +0100, Alexander Kanavin wrote:
> On Sat 29. Feb 2020 at 11.40, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2020-02-29 at 11:14 +0100, Alexander Kanavin wrote:
> > > This recipe is build-heavy, yet is not part of any images and
> > isn't
> > > runtime tesed as
> > > part of oe-core. There's no evidence of anyone using it, as all
> > > commits are revision updates. It also pulls in NumPy, which is
> > also
> > > a significant support item, and wouldn't otherwise be part of
> > core.
> > 
> > I'm not sure about this. The intent was to use piglit as a way of
> > improving our graphics testing, particularly allowing it to be
> > automated.
> > 
> > Whilst we've had to focus on getting the basics right, I'm not sure
> > that objective isn't still a worthy goal over time?
> 
> Piglit is meant for testing and validating OpenGL drivers for real
> hardware. While we can put it on top of software Mesa driver or
> virgl, I am not sure there is much value in that? Software rendering
> might even be too slow to run in practice.

OE-Core is meant to be usable for validating BSPs amongst other things
though. Testing virgl does prove the graphics stack is working too from
a software perspective so does have some value.

Cheers,

Richard


