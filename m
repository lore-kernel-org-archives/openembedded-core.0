Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E69827D279
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 08:14:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n9so12020348wru.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2019 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=c15YGvRyy6Gg1egleXxjdU5u/vGOpttgfIyRcEQB/qU=;
	b=CFf2WMRtzMkF+T5965n8mbj0pl9D6/CUX1e/pMmuYKSfZWnxMBxzBwk1Lux0wZgw/n
	//8SNHbV65FjThRccH4A+kdjIgD0VeOpDTbAfRfxjGNO4GhxzZugRm+RJPQGUQaJ1Mjd
	dkHpSPo1QMGcsvzSmQeEVOlQEiLD3xj+Bp88Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=c15YGvRyy6Gg1egleXxjdU5u/vGOpttgfIyRcEQB/qU=;
	b=LvzXuu3sAdNwNaMF0JuYaPUjNc1+EFfpG4h2+FFHjyUr/iR82y7oVXi9JJmCtXj4vd
	hH0Iszme+9krYOhHrS/ONWjhkIfYL2T7MRpvGj7QI62WDo1Z8atcmtbuamzIggr16581
	cZ1fG+bI+Get2OC2oDwtDzTS5X6fRyZ9zbOnl9L2zTkfNKqRNgKrl/s6G3jaCoYKFHCJ
	pKmen+5a6GqyK86kM4o+GtPJa8lyr1Y+5CxvD2ViQSbo+hJ2H5nn+Lo1eSSz472WPjiE
	3LOtlC6IKIdS5czs6qcHOqXN3W4d7hIEXKc1ZwkD/fU3sHBLkYZ0oF7x8ser/gTZs9KL
	Ppgg==
X-Gm-Message-State: APjAAAU599Pn3JGE72KwLDWOjc2G1E9fiopo2Q2zq/TxXLCWmOLGUqKD
	/gW7PC3B7xas9gXSByVOvCzEOA==
X-Google-Smtp-Source: APXvYqzHR8Qm9dmY7al+gohTZhMGWOSF+sFCVV5mfICoU9xwZNf0aQRlK5PuPtSXr8rRapXdkLP9gQ==
X-Received: by 2002:adf:e748:: with SMTP id c8mr7468388wrn.46.1562400856510;
	Sat, 06 Jul 2019 01:14:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y7sm6822471wmm.19.2019.07.06.01.14.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 06 Jul 2019 01:14:15 -0700 (PDT)
Message-ID: <6fb887e88cff19493dfe98332f7265418bb57dd1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 06 Jul 2019 09:14:14 +0100
In-Reply-To: <985c750cab28264567c6e4e532160d44ed07fbbb.camel@linuxfoundation.org>
References: <20190703150405.GA23280@linux-uys3>
	<1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
	<20190704142709.GA3410@linux-uys3>
	<a8811c40e7aab0303c7069c5acc00823567821e6.camel@linuxfoundation.org>
	<985c750cab28264567c6e4e532160d44ed07fbbb.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Sat, 06 Jul 2019 08:14:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 23:28 +0100, Richard Purdie wrote:
> On Thu, 2019-07-04 at 16:57 +0100, Richard Purdie wrote:
> > On Thu, 2019-07-04 at 10:27 -0400, Trevor Woerner wrote:
> > > On Wed 2019-07-03 @ 05:10:14 PM, Richard Purdie wrote:
> > > > Is there any way you could try pigz 2.4 on your machine, see if
> > > > the
> > > > problem still occurred there? If you do rebuild pigz, could you
> > > > apply
> > > > the debug patch in master-next?
> > > 
> > > I've updated the pigz in the $PATH jenkins sees to pigz-2.4.
> > > 
> > > However, my builds are always updated automatically and always
> > > build
> > > from master; there's no way to insert ad-hoc patches into a
> > > build.
> > 
> > That is fine, even just the PATH adjustment will be interesting to
> > see
> > the results with, thanks!
> > 
> > Was that version of pigz patched? FWIW I've patched the one on our
> > opensuse151 worker so we'll see if that helps shed any light on
> > things.
> 
> and it did:
> 
> http://errors.yoctoproject.org/Errors/Details/250609/
> 
> pigz: abort: internal threads error (16, 10)
> 
> which means from:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=110ccb56b88af177c0153741a31a9d34b1f75abf
> 
> +     if ((ret = pthread_cond_destroy(&(bolt->cond))) ||
> +         (ret = pthread_mutex_destroy(&(bolt->mutex))))
> +-        fail(ret);
> ++        fail(ret, 10);
> +     my_free(bolt);
> 
> so pthread_cond_destroy or pthread_mutex_destroy returned EBUSY.
> Further digging required but at least we know which code path we're
> on. I wonder if suse did something odd to libpthread...

Another failure with more debug added:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/792
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/792/steps/7/logs/step1b

specifically:

| DEBUG: Executing shell function sstate_create_package
| pigz: abort: internal threads error (16, 720)
| tar: /srv/autobuilder/autobuilder.yoctoproject.org/pub/sstate/24/sstate:readline:core2-64-poky-linux-musl:8.0:r0:core2-64:3:241b1909d0f06ca48bda9ec41ccee543bb82fcc164b2b74cd4efd318b3ae0a33_package_write_ipk.tgz.KDjTwErb: Wrote only 8192 of 10240 bytes
| tar: Child returned status 16
| tar: Error is not recoverable: exiting now
| WARNING: /home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/readline/8.0-r0/temp/run.sstate_create_package.34356:1 exit 1 from 'exit 1'

which confirms that its aborting with errno 16, EBUSY and the 720 tells
me it came from pthread_mutex_destroy(&(bolt->mutex)) in free_lock(),
called from free_lock(job->calc).

I can't see anything obvious wrong with the way job->calc is being
handled.

I get the feeling this doesn't happen when uninative is in use which
suggests its something odd going on with libpthread on opensuse but its
hard to know that for sure.

Cheers,

Richard


