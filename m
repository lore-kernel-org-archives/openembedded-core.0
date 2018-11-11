Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0D56C266
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 21:40:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j17-v6so7209344wrq.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 13:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eJP9/qhCnXzNkTJ/jc5dm8xZYD3uhTfxNERlnSEPxxU=;
	b=cfRkQez3L1Wk2gAb2qTwCrArXEVVvpaVUj3nYDs/Or5NCYMGktAW8CYBT85tV+oNvQ
	D7+husHjERnZtUDKlT2Dqwbdfbsmcv2u20BddnFqcFSezFmuTXfxGvbV+AB9ZGRX4MTw
	klxs0thcm29Bo+WTSYMFN6RDUtCzRi9buMq9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eJP9/qhCnXzNkTJ/jc5dm8xZYD3uhTfxNERlnSEPxxU=;
	b=RLypL+Cce0dFJX7Abr2e3rPpN+bSz94FUypuToa1qpwz9yFteJ96+cFgKF4r2pgCpp
	HNd22jA6hCHrxlonW2cx81STydPq5WNN2lFe/O3+HPjbDrnHtRhRw1azmqyw2f1G6bZp
	J0v7ZcT+su8S27QfRBaQzVJRAF/eau6jTl0wnY9y+AVA8fFFpJDudgbW5H65GANGXouE
	9RxSwq+1UF+rmDMC921C3nrLU4PQaz0h0e8h66gRZHsqe2ZNWoQlsYBySSa/Z8dvtoZb
	kgGuNHCunBr7WqySQTr94PJMsnwsy5kye+qbIkOnQ+faGsO9OjRcm2j2wLVt/YFy8GNk
	lvzw==
X-Gm-Message-State: AGRZ1gKXbSwiFXmV9C4/aMk5fsrSX3p31eJSfNEKjxkg+WA3zb9cYnld
	UdT+3jyIPJ/X0qFnYTSL8qz6mw==
X-Google-Smtp-Source: AJdET5dhRrCfAWzQ88eeyE99ihy6C6TP8/3mXmwu78YFYq560EN4cajsrUyeMEHp0xhH4KdBAJ5wYA==
X-Received: by 2002:adf:f2cd:: with SMTP id
	d13-v6mr15044026wrp.78.1541972429036; 
	Sun, 11 Nov 2018 13:40:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q2sm14045876wrx.77.2018.11.11.13.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Nov 2018 13:40:28 -0800 (PST)
Message-ID: <f3bfec0beec87739dc7e9fda2392e88a63b2b7d3.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Nov 2018 21:40:25 +0000
In-Reply-To: <3c59ccda-0370-c30c-ee8e-1c5165a56e5b@gmail.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<20181109142912.23102-11-richard.purdie@linuxfoundation.org>
	<eb4748cd-d26c-a916-f887-311dd6bbb8fa@gmail.com>
	<e1af6ef60da366ccc0cc163eb26040e03ee156bc.camel@linuxfoundation.org>
	<3c59ccda-0370-c30c-ee8e-1c5165a56e5b@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 11/12] testimage: Further cleanup DEFAULT_TEST_SUITES
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
X-List-Received-Date: Sun, 11 Nov 2018 21:40:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-11-11 at 13:34 -0800, akuster808 wrote:
> On 11/11/18 1:18 PM, richard.purdie@linuxfoundation.org wrote:
> > On Sun, 2018-11-11 at 12:52 -0800, akuster808 wrote:
> > > On 11/9/18 6:29 AM, Richard Purdie wrote:
> > > > Now the test markup of the development tools tests is complete,
> > > > this
> > > > can be further tweaked to auto run the correct tests.
> > > > 
> > > > Signed-off-by: Richard Purdie <
> > > > richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  meta/classes/testimage.bbclass | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/testimage.bbclass
> > > > b/meta/classes/testimage.bbclass
> > > > index b00d47441b2..4e9494296e1 100644
> > > > --- a/meta/classes/testimage.bbclass
> > > > +++ b/meta/classes/testimage.bbclass
> > > > @@ -40,12 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?=
> > > > "${WORKDIR}/testimage/packages"
> > > >  TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
> > > >  TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
> > > >  
> > > > -BASICTESTSUITE = "ping date df ssh scp python perl apt opkg gi
> > > > ptest dnf rpm parselogs logrotate connman systemd oe_syslog pam
> > > > stap ldd xorg"
> > > > -DEVTESTSUITE = "gcc kernelmodule buildcpio buildlzip
> > > > buildgalculator "
> > > > +BASICTESTSUITE = "\
> > > > +    ping date df ssh scp python perl apt opkg gi ptest dnf rpm
> > > > parselogs \
> > > > +    logrotate connman systemd oe_syslog pam stap ldd xorg
> > > > kernelmodule gcc \
> > > > +    buildcpio buildlzip buildgalculator"
> > > 
> > > Again Nak. You are forcing folks to have x11, systemd etc in the
> > > "Basic". 
> > 
> > No, I'm not. If the image doesn't have x11 in it, the test will
> > show
> > "skipped". If the image doesn't have systemd in it, it will show
> > those
> > tests as "skipped". If you just want to test ptest, you can specify
> > that, which is what you had to do before this change anyway *just*
> > to
> > run ptest.
> > 
> > So I'm not really seeing the problem?
> 
> So for meta-security, since it needs python and perl, will it re-run
> those tests every time I run the meta-security ptests?  if it does,
> one may interpret those changes as a negative to the overall testing
> experience.

It depends. It will probably continue to do what it did before which is
to "auto" run tests, unless you're building one of the core-image-XXX
images which had specific tests defined.

If you want to just run the ptest tests, just set:

TEST_SUITES = "ptest"

There are likely some "testing experience" issues but I think these
changes are a key step in improving it, by making the tests much more
automatic without having to define specific test suites for specific
images.

You can still specify specific test subsets just as you've always been
able to.

I agree the output from testing is confusing and I have some ideas on
how to improve that too, but one step (patch) at a time.

Cheers,

Richard





