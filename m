Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 225FE7C271
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:15:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so14626216wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tvzylF2d8du2qnEi2+FqBHUjeRFp1ZZ1R/5H7U9B57o=;
	b=Ce17aj+LegL1EIExCYIFyc2icN6uRMQnZZT3WYWWN0VA9Pif+GN1Uvs9Eo1FNGwbLi
	1CDKyhQFF69tcu/i9uO87Vy6OUdkgKXzELM52rs9h22Io3/jlrB7PIXHO93XUetstJoS
	Hmhyx3kPExPYn8/YLzObTtOxxfOsFt0YqHU20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tvzylF2d8du2qnEi2+FqBHUjeRFp1ZZ1R/5H7U9B57o=;
	b=Xl0WMfY4xdnKbIvRink8ULsoMmaYjbETz0/7nevZkasJMbEZuq5UNmnebAPsa4Kf89
	H1CgMB41rUInrTbiV1A3qUfb3bnOgrq6xSnS3T17L1emUkvtqzsvyoNWuvXgOyHKn1Mk
	/RjF5C+4FvNTL8FlRy4c3AdiEPRYIm1xfYieN7IZEMh4kktmZ2pZsxhrNFLLln01gPdl
	21++9F2VrhmbBJYh7oohzn9Pb7Si8zKy9jzW4XPft9IdzYrl0kQ0DlFYWIrdz0BIG3W4
	4YAFQb62XwUrxsIEaVb4mcbi0ossvz8FoHHLK8bxL7n7KV8hbXlNbwGSpid4u9F99y56
	IFxw==
X-Gm-Message-State: AJcUukc9QbMPkL2SSQ/pFYYtnKaQ1lwc/pwJG7PiZ+d2mWHc7RsqsiKq
	TnvBiq3qa8UMXIPUNaYZgpdRjA==
X-Google-Smtp-Source: ALg8bN5jjqTlhttm/R//Dijb7iPijqnAGW06p/oFcRddJqKjUaMHqicq2g0QW0ejmDyyG3j08rOH7Q==
X-Received: by 2002:adf:e247:: with SMTP id n7mr15316069wri.205.1547810122729; 
	Fri, 18 Jan 2019 03:15:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e9sm70462674wro.16.2019.01.18.03.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Jan 2019 03:15:22 -0800 (PST)
Message-ID: <e4e2a11ab77ad313692deb32704b2618e2da9553.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, ross.burton@intel.com
Date: Fri, 18 Jan 2019 11:15:20 +0000
In-Reply-To: <b561f725baace2efee3e30b5343cf1102319dcea.camel@linuxfoundation.org>
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<b561f725baace2efee3e30b5343cf1102319dcea.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 18 Jan 2019 11:15:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-18 at 11:02 +0000, Richard Purdie wrote:
> On Thu, 2019-01-17 at 02:12 -0500, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> > 
> > Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
> > Specifying -fdebug-prefix-map is equivalent to specifying all the
> > individual -f*-prefix-map options which means including
> > -fmacro-prefix-map and -fdebug-prefix-map currently. Option
> > -fmacro-prefix-map helps to avoid buildpaths qa warnings which
> > caused
> > by __FILE__ macro expansion for packages such as llvm and librepo.
> > 
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta/conf/bitbake.conf | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> I like the idea of the patch a lot. Unfortunately it causes an oe-
> selftest failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/131
> 
> in the go toolchain.
> 
> oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_build
> 
> should reproduce.

There does appear to be another issue:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/commit/?h=poky/master-next/qemux86&id=e3195d9809716652546a1ac69a75287ec707e79b

The debug src files appear to be disappearing?

Cheers,

Richard


