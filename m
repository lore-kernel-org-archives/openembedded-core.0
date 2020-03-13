Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id ED4FF61CB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 16:11:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so12858064wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=D561aF8X51OwmBUjuruhYUC/XwuQKDg72UAxQdQtyeU=;
	b=HhPgPMqA98gzK8mowspVgGL7KLjrhtkHONGG54+ajj/ef4JY/hVlTzQ4nWY2czolZz
	86OVNhtFg2i2I6I8dgE3Qf0Z4mSKoazeVLay2gUDi+DxvZ2yAJf/LZfGqvUbaG15e+Ub
	q7PdqwYUfqDZRIBTTF70leSzSUfWglQ+Q4oG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=D561aF8X51OwmBUjuruhYUC/XwuQKDg72UAxQdQtyeU=;
	b=WZc24Jkx5CecoaskMTsi7ZiDsVJKRFqv4zCvI4eHgbhy1VB/y/Wdxd/58ODyQr5BDa
	k/0PTCMeZ6hYX3C/8OsMTSDJM94uVZdXTOCrpZhm/qBQRpeEpYaGHvNGTdfb8HREs0e1
	y27ORQaQGdm6JSHnHF1GYzNxiSr2ezMmthYJ2ltTfjyf2prGyijM/f1AC3BpvOKvKtaB
	9gWE8RDim5PbT4dLcboKMM6RsnYJtt9+syDPx1qH89Pa9m8kcPBUOOWgh68lcoA2S9JP
	X+qMVSd8+Q4ztbIo7RWsd4FKFUZ/JMSyBm/F+oZRP6hMx1t3qjcBMt3ftfYJcxQCrJj4
	qYlw==
X-Gm-Message-State: ANhLgQ1CSSPZQM+KjpLMZ3/YRMlupFYd3kPP6xAtVxtzv9tZasKzDqjj
	7o4z8csST64V9IJlppcB1vUflw==
X-Google-Smtp-Source: ADFU+vtmZAlW8IupDcEgtrFX/wXSsCVi0pLPvqs8Q3qt/hf9HCHRpKM+vFQ4uTJR9ZguddUH0wVuyw==
X-Received: by 2002:adf:83c4:: with SMTP id 62mr1632752wre.105.1584115882640; 
	Fri, 13 Mar 2020 09:11:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d63sm17619867wmd.44.2020.03.13.09.11.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 09:11:21 -0700 (PDT)
Message-ID: <73540320e37a4fb6868b4625abc823f8ba53223f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 16:11:20 +0000
In-Reply-To: <0aaac991c5634577b000a3e62f0ec5e59ddf0e1b.camel@linuxfoundation.org>
References: <20200312230238.413509-1-raj.khem@gmail.com>
	<0aaac991c5634577b000a3e62f0ec5e59ddf0e1b.camel@linuxfoundation.org>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] musl: removes aliases for glibc provided libraries
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
X-List-Received-Date: Fri, 13 Mar 2020 16:11:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-13 at 16:10 +0000, Richard Purdie wrote:
> On Thu, 2020-03-12 at 16:02 -0700, Khem Raj wrote:
> > From: Jan Kaisrlik <ja.kaisrlik@gmail.com>
> > 
> > Based on the recommendation in musl mailing list[1] All symlinks
> > have
> > been removed from musl recipe.
> > 
> > [1]: https://www.openwall.com/lists/musl/2020/03/10/11
> > 
> > Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 15 +--------------
> >  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> Breaks SDK tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1697

I mean on target toolchain tests...

Cheers,

Richard


