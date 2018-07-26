Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5286086F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 09:07:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o18-v6so1228138wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=doTR1R8isKJ1peuL6wkxIPk6hqGRzU3TZNE3W6riXh8=;
	b=FYlgeK1u4Hlj44EZKvgOLqAPYpFflFgkDL5m4r3xYR+lbat7liefT8uCwN4D7zL+9S
	9UkIggePjcY89u/HDzo05D8djdcwhuVNGbT+nuCLRWaUt8hR2rTLXF+cSxi3LIMu/ziu
	0abGxwoe09MCdAz1jCWUg84NLfnVYHDu/2RYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=doTR1R8isKJ1peuL6wkxIPk6hqGRzU3TZNE3W6riXh8=;
	b=a1MJa1Ap4Y7PHU5KAu+ZWuB0yIsg7nzU81Q0xzIrN56n1p2PPyMawr8usZEFbVlrrL
	vAHhzZeOl8j9G6kca1LRI/6JrAvqRiYB24zllGNN0WDlrQs2AXPksGSiYkXDtqoKdVgA
	oijmtWLWvRnZp4fjS0giBXHxKghPMNWLCnG0QcvqPu3l7427kP6zkmOrW/GnG4sBl3Pn
	AYiZQnACQ307ThORLKeTPPNgnTLKZmjjSxjNatpNEbdUzvYXf3AA5io+v5B4DrpgmdkA
	JTM26wKw5jSnYzTkX1ty1NF7O9uw9FpE5ku1T8S5uTUMJ1RjqLN/JBZS1RQwu76kYwKJ
	KYrg==
X-Gm-Message-State: AOUpUlHmurdZ7vetcCv/19iKAYGPSkC3Yfxiip4KNSSPGZJ0LU9JVC3n
	x/pNX6dyG2Oqz4wxjVke8RvNXg==
X-Google-Smtp-Source: AAOMgpdHMDnRvHiYAb35gtBifdMdvMn/MgG3RZIm9uXjQX6okjs+4e6xyE9ajyBQn3xOw34p3XvLyw==
X-Received: by 2002:a1c:1182:: with SMTP id 124-v6mr986866wmr.75.1532596032934;
	Thu, 26 Jul 2018 02:07:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j3-v6sm1277411wrt.70.2018.07.26.02.07.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 02:07:11 -0700 (PDT)
Message-ID: <de82bfbc618d5bd3414f0c6942779bab2a866524.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, mark.hatle@windriver.com
Date: Thu, 26 Jul 2018 10:07:10 +0100
In-Reply-To: <0ca7463e-1966-0956-f21d-d23058a7a4ff@windriver.com>
References: <20180725164107.8891-1-kai.kang@windriver.com>
	<30c2f9cc5e10db824fb7df312bee88e17814221c.camel@linuxfoundation.org>
	<0ca7463e-1966-0956-f21d-d23058a7a4ff@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Install rdependent of allarch package with same multilib variant of image
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
X-List-Received-Date: Thu, 26 Jul 2018 09:07:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-07-26 at 14:53 +0800, Kang Kai wrote:
> On 2018年07月26日 06:47, richard.purdie@linuxfoundation.org wrote:
> > There is a bigger problem though since the allarch recipe signature
> > filtering doesn't change what bitbake will actually build, only how
> > its
> > represented in sstate and the circumstances under which it would
> > rebuild it. If ca-certificates DEPENDS on openssl, it will build
> > openssl whether you're targeting core-image-sato or lib32-core-
> > image-
> > sato. This potentially means you can end up in a situation where it
> > wouldn't build lib32-openssl if nothing else in lib32-core-image-
> > sato
> > depended upon it more directly.
> 
> That's why extend rdepends of allarch package with all multilib
> variant. 
> In bitbake inner environment, make ca-certificates depends on
> openssl, lib32-openssl and even libn32-openssl for qemumips64. It may
> cost a little more build time(I didn't test yet), but the dependency
> relationship is fixed and make sure that all multilib version
> of openssl exist in 'oe-core-repo' which is used for do_rootfs.
> 
> When build ca-certificates, both openssl and lib32-openssl will be 
> built. And when write package of ca-certificates, remove openssl and
> lib32-openssl from RDEPENDS and keep noarch-openssl. 
> And make both openssl and lib32-openssl provides noarch-openssl. Then
> some tweak according image multilib type could be done at then end
> of do_rootfs.

Requiring that all variants of openssl build in order to build ca-
certificates will have huge build time impact as it will need to build
both multilib toolchains.

At that point we'd probably be better either building allarch recipes
twice (which I don't like), or, banning non-allarch dependencies from
allarch recipes. If a recipe needs a non-allarch dependency we'd make
it non-allarch. We may just have to accept the latter...

Cheers,

Richard


