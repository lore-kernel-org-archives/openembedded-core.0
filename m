Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DBF4E7E91F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:11:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so2116966wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 05:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=OCNR27HZWX9nRmfpKyhYtvwG+jeb9RW+7pLm5ofUzjQ=;
	b=hnTbKW+dm+l4RuY4IoBy+dFjJkvgTvnUiMwOjpPspnZptEIBujGd8pznMqgJvyaNTb
	+4MzAeA0SLBo4zfBO2vUU+2dD57gZyu8HjSGrGCnXs28QLa61cu18+EpSWbynQhNmNWR
	3ku6M+FsGAp7rlXSuNwXk7woXKplRNk22avYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OCNR27HZWX9nRmfpKyhYtvwG+jeb9RW+7pLm5ofUzjQ=;
	b=feXcdqmR9NUfWCm/79BDsPd9369uQm2r/SKUx3gN06BG0IB5AsGamCpkW98acKLlqk
	fPcfXa5OMbS47EOKUBJPGe6iAtBn9PejlTB5Jkf+hTT0dTa0obzG/IyRs1paeqmXnQqJ
	MrgngUn1115ga3SuuL2/wmf1BgPTUH5llqqEjjysESxB9trd+MK8HweK8sq8JYFyN8M8
	8wdLCuutmwctz98ZMrxBIFeNsU5cqml8m5CpJVHxjmav2tzt63eCvHzhjN8hiABRcrsZ
	vvJzUGEgb73N0H722R3jwYvFTrtfnBVcZZCfpaTEI5gqHdSeaPuFb5wDq3ORBU4CRhwd
	VedA==
X-Gm-Message-State: APjAAAVn1pArv1syAT6m1smoM81eGD/o45QtVBUbg5ibEzxWlgAghPAJ
	0ZFdaZVzByNM4MV1zDWLEtMO8Q==
X-Google-Smtp-Source: APXvYqwMpausi4baHK7V394XxFO2ZMXCmXxtCLbZqsrIcc9It/X3dgFhaTgu9aK2/pd0bUeKrOaDpQ==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr7325289wmc.22.1560514266534; 
	Fri, 14 Jun 2019 05:11:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c17sm2590256wrv.82.2019.06.14.05.11.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 05:11:05 -0700 (PDT)
Message-ID: <ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 14 Jun 2019 13:11:04 +0100
In-Reply-To: <20190614120448.2wg2523qu67la7mh@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 12:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 14:04 +0200, Marco Felsch wrote:
> On 19-06-14 11:55, Richard Purdie wrote:
> > On Thu, 2019-06-13 at 19:54 +0200, Marco Felsch wrote:
> > > Most of the time we are compiling for embedded targets which have
> > > dedicated hardware combinations. Enabling swrast by default isn't
> > > a
> > > good
> > > solution for such devices because if the hardware render node has
> > > an
> > > issue or doesn't support a special format/request Mesa will
> > > fallback
> > > to
> > > the software renderer. This will make it harder to debug
> > > performance
> > > issues.
> > > 
> > > A better way is to let the user decide if a software renderer is
> > > needed e.g. if the system has no hardware renderer or to have
> > > such a
> > > fallback device. This way the user knows that the software
> > > renderer
> > > is
> > > enabled.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > v3
> > > - rebased on current master-next branch
> > 
> > I think this breaks the autobuilder:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/694
> 
> thanks for covering that. Why didn't I get a email?

The patchtest emails come from quick tests. This is a test of full
builds on the autobuilder with batched together patches. The system has
no real knowledge of which patch causes which failure so its a manual
process. We don't have the infrastructure to run all patches through
the full autobuilder tests individually.

>  Anyway thats
> interessting. IMHO it isn't a good solution to rely on that fact that
> the package have some 'random' default enabled drivers. Should we fix
> the qemu configs or should I add:
> 
> PACKAGECONFIG_append_qemuall = " swrast"

The assumption is that swrast makes a good fallback and would be
available in most cases.

I suspect qemuall might not fix beaglebone-yocto or some of the
hardware BSPs.

Its also assumed these packages are shared amongst multiple machines
which may need different drivers.

I suspect this means the defaults should be on but I am happy to have
more PACKAGECONFIG options to control things for people who want to
customise/micro-optimise.

Cheers,

Richard




