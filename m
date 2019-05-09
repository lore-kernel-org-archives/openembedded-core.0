Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACFA17DF8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 20:19:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y5so4718340wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=uLhiFYHbCYMhFQD46HkcW6E44+vUd7vpmu1sqPe81ng=;
	b=TUupx97b/Pb4fFmeHjDSHup9npwWsOe9hpHn+kKLKqgRoQtw8x9gPdxfPw2P9cVs7p
	I3xacO11yVj/xteGgUdw+Tf1q6+6/VHBe3/19Dq7SN9BU8Tfvm92pQ7Qm2IfealIcinO
	M77itpCLM7bhykX1UXYnJw1Rbyo3XBW7XG2VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uLhiFYHbCYMhFQD46HkcW6E44+vUd7vpmu1sqPe81ng=;
	b=iGA72fvhoRUeprOGq8n/4yz/kvXRezGyRj/WP+XZSjWNXSRmIghJ54ARAKLJ4mCyd4
	pPQAYG/v9s+ZSFHRtO5kB7AKkG+b3GSN8DAxuA5AXLV75uwHcEmcD2BnOX8IUdSRPlnS
	KfZEKr6CYvq4dy826J7hhQFTnHz+jmuhy8Dij8W4fgEtUqfMffH3xFNqPzMIifrL4q1+
	SMB+bWGPdjvdIpmeZPEG5E8XnFRrPbPkWaA9YC+ubpCSwehNul9qqVtqBZu/A/XN3PE9
	EYmVIC6Q0hMSwZI3TDk4K06ysO+pEnyX4vE8Tt6+ofEgSwDMqKt0zpMpjfRkzx/cFbcu
	6jQw==
X-Gm-Message-State: APjAAAVjxOD8FDZ/wfagJWoB2po3KfLe3Irad8xWpGAeBJtrVQBaoxEm
	QaRS4Dw1wNcv9bLqGWM7pg0y0A==
X-Google-Smtp-Source: APXvYqwpKxShtK946KjsfYdPy0xLTkAEAdpsfhIVVbbSLTCkvJdDzLPVODD8a8joMA6YKyLJiDUKRA==
X-Received: by 2002:a05:600c:552:: with SMTP id
	k18mr4259555wmc.67.1557433187386; 
	Thu, 09 May 2019 13:19:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r9sm7546716wrj.57.2019.05.09.13.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 13:19:46 -0700 (PDT)
Message-ID: <047c54ca3988760cad94a11a511219887edc8980.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>
Date: Thu, 09 May 2019 21:19:43 +0100
In-Reply-To: <CAMKF1sqcCNx6M8Ve8YTzMDCGaZdvBU4LQYhxKgEcH2Q6FyeeCA@mail.gmail.com>
References: <20190507210338.17788-1-raj.khem@gmail.com>
	<4fba9588af56d66a633fde9dba8e1a4176ed234e.camel@intel.com>
	<CAMKF1sqcCNx6M8Ve8YTzMDCGaZdvBU4LQYhxKgEcH2Q6FyeeCA@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-9: Add recipes for gcc 9.1 release
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
X-List-Received-Date: Thu, 09 May 2019 20:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-09 at 11:05 -0700, Khem Raj wrote:
> On Wed, May 8, 2019 at 11:55 PM Mittal, Anuj <anuj.mittal@intel.com>
> wrote:
> > This is probably causing selftest failure for fortran
> > (test_toolchain_fortran):
> > 
> > ERROR: libgfortran-9.1.0-r0 do_package: QA Issue: libgfortran:
> > Files/directories were installed but not shipped in any package:
> >   /usr/lib/gcc/x86_64-poky-linux/9.1.0/include
> >   /usr/lib/gcc/x86_64-poky-
> > linux/9.1.0/include/ISO_Fortran_binding.h
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/162/steps/7/logs/step2d
> > 
> 
> fortran is not in default set of languages to build so sent a
> separate
> patch for this here.
> https://patchwork.openembedded.org/patch/161101/


There is a second issue which is why was this mixing gcc 8 and 9 in the
same build. I've sent a patch to add a missing PREFERRED_VERSION.

We've not run another gcc 9 test, I'll likely merge the gcc 9 version
as non-default and then we can keep testing until it works and we can
make it the default.

Cheers,

Richard


