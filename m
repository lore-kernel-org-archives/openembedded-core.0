Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC8C7892B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:19:19 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a10-v6so9903123qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eg4m9Goshwr5PfqnyRFYop9CrBJq+APd/AAXkAbVNIc=;
	b=F/R9DIFge/ORkbKLHyQUoaXmottCJDW8ywA+1UpBzNAtS5I2wPMH8wbbh/0SC4BYZP
	zxKO29OwGXSYjC+QHNenM28OfitUCxr7OoYwR4IaGagIfGPbCaIvDB4pxXDZLhYc6Vb6
	DxHWYg3IW8VhRTOXqIE8zAFdYWf4R9vp2/4cjF89OYExa7aIhlEl7X4ynRFOAhKo1/Nf
	OAVnK2xVVKTZZICPtsIdoCSkDG78znkTZMmkT+KA1Uq5Evm5RvqSHi/hg8a26mIgC3jX
	IPEqrg6HzKSb7Yy5Vs17ZnV6u2EkTObeUy5eByyaYJ+/j/BnWTSmkvCa30jDb4SV0s0+
	G9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eg4m9Goshwr5PfqnyRFYop9CrBJq+APd/AAXkAbVNIc=;
	b=tfySYM1V9WoqGXSSl+5sHcaKXw6UO3isDyrdLggmdZl9blP1u0zwucj+FXC9xC/dGA
	cSHGQonHfu5ikp1IETkArV6ggmCfkgOYAefN3VY5NpFFELG/20xc+ffKgwxW88cYxa57
	gjM/o+EYt47x7P0jv0Hqz/HMEpsSuJhCDXq/T/cBPSNcPLesIWajMF6ipnizS9MBAmu1
	LDNowAF58WOkBDxLC1Xx8r3IXr9brOGV28qGYtyyc8p4EC0zMPOMAdWUd/4hTSmZ9BUY
	jkBNl1IzCKP0MfRd2+mgUEkPzYjN+q/amIg3tEZHquKG5fdTT7na8rd7ccMT2BA9p5vl
	Sz5w==
X-Gm-Message-State: AGRZ1gLKFZVTkBfoAA1SNIQocHI0jC6amrpmddWampc/aeR5Ht6ZjxI+
	dYaw9KxTO5icdVeuSEiFBKV70q4ydWH6BiX1t0c=
X-Google-Smtp-Source: AJdET5cnvnwqWexl7D5bGJm4LKuC08dIrsKVu3b2kFrcP5UApihcbW/1lR5YszHGcwAVcjexI+SSVxZvcJAnsKkWcYc=
X-Received: by 2002:ac8:3693:: with SMTP id
	a19-v6mr13185302qtc.236.1540829960162; 
	Mon, 29 Oct 2018 09:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
	<46d200d7ef4c6399ccc99801674fb203916555c6.camel@linuxfoundation.org>
	<3746db69-c37e-4500-4780-bfe24bdafdd2@windriver.com>
In-Reply-To: <3746db69-c37e-4500-4780-bfe24bdafdd2@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 09:18:54 -0700
Message-ID: <CAMKF1sqhaOzFwUy2fjJwH9c2AZh39jbBMeSfZYOY3MkW_+kX7w@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix occasionally install fail for parallel build
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
X-List-Received-Date: Mon, 29 Oct 2018 16:19:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 23, 2018 at 11:53 PM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
>
> On 10/24/2018 02:04 PM, Richard Purdie wrote:
> > On Wed, 2018-10-24 at 11:30 +0800, changqing.li@windriver.com wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> when do parallel build, like run "make install -j 48", openssl will
> >> do_install
> >> failed with below error:
> >> mv: cannot stat 'openssl/1.1.1-
> >> r0/image/usr/lib/libcrypto.so.1.1.new': No such file or directory
> >> Makefile:318: recipe for target 'install_dev' failed
> >>
> >> problem caused by target install_dev and target install_runtime, both
> >> installed
> >> libcrypto.so.1.1, result in log:
> >> *** Installing development files
> >> ...
> >> install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> >> link /var/tmp/foo/lib/libcrypto.so ->
> >> /var/tmp/foo/lib/libcrypto.so.1.1
> >> ...
> >> *** Installing runtime files
> >> install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> >>
> >> command in install_dev and install_runtime will have parallel
> >> competition.
> >>
> >> have create an issue to upstream:
> >> https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
> >>
> >> but upstream won't support this condition, so use this fix as a
> >> workaround to fix the problem.
> > This means that:
> >
> > a) Upstream don't support parallel make install
> > b) Reject patches fixing any bugs in parallel make install
> >
> > This means the Upstream-Status should be rejected with the link above,
> > not pending. It also means we may need to think about not using
> > parallel install although since its working, its tempting to carry
> > patches and keep using it if it works.
> >
> > It may be worth pointing out to upstream that it is mostly working for
> > us? I am a little worried they know something we don't about problems
> > this could run into.
> >
> > Cheers,
> >
> > Richard
> >
> >
> I will point out to upstream that it is mostly working for us,  and
> ask upstream suggestion about potential problem of parallel build.
>
> if upstream think no obvious potential problem can seen,  I will change
> upstream-status to reject and resend the patch.
>
> if upstream recommend not to do parallel build,  I will add something
> like below
> to stop parallel build for make install, and resend the patch, but in
> this case,  build
> openssl  will very slow.
>
> ifneq ($(filter install,$(MAKECMDGOALS)),)
> .NOTPARALLEL:
> endif

I think its best to convince or follow upstream here. Making install
target as serial might be best approach if there are other issues with
parallel install that upstream is uncomfortable with such a patch we
should try to find more.

