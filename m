Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFB07EC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:27:32 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l14so1299732lje.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 17:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d8QAAlCgf7WgH3nhOJR0krH5k1R9oMOv7mu0f9Dvm3k=;
	b=PlWq2Li3FwIW0UTgY9fEteFeD7/7ou6Q38Kzr/RxPzzNUz3EHC/QghQTVi6diVfSaK
	fmqxxGdZAbSI8s8nLAcXKuU4zXJjfd2P0+7h9gar4HJSAzdUMfLGqxNM9N1OM/pjvr85
	qWNMuSQrm3m4PGZtlJhzRGnx4ewq0QRS9VSbxyFfhdjrjVHA/2uNYXou0f5awcxbWCjh
	5OTl797fhndm/lGDuY7HL9uK1Qr81+0uFrvBdXnXRnAHK6Sgev7IMH/OQtWAIU4b1kAX
	xdzhOuBvD0/kgH1L0ht+ta5bztehJSdb4HFhdnOTxwVwPnuD8zzcyJYrgn8KRcC4vMae
	ssBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d8QAAlCgf7WgH3nhOJR0krH5k1R9oMOv7mu0f9Dvm3k=;
	b=hPe3N0jTcspj2l7t3fywkFbkrUh7W1v3GrWZrZFXGCalceU96ZMjRwVkX78BqRs1aN
	Fyisu5o4p4+t1cWQO05FhjLKjLuuxxmexFRULQRX1Gcn7OoDXKJFb99czuAuYm3Gjn/o
	6Eruc+DBSSADW/vYB4Hhboy67eSPETODA4UhNm93VF4JWFb2exmfzHi6fpQGUVygI8cl
	wNf8VRMN4Zl0AHWpU1VmTsxd6LElXynIiy+VBCCWENqsmhUh7XAorwiHNfeY3W0RIJ+C
	5GmWl9ZxKKtY7zqduygEsALtlEe9tDfrNYP3xhGCbD6g8cFUxOeLaj5Vc+sex4jEtVA7
	bbUQ==
X-Gm-Message-State: APjAAAXAv99cyMtE8CLXBh9Rfi9G0WiqOz6g6Dc8q/RQZdTD4b1hEr5Y
	M1g/g22jyd2mYDNqriSHx/WXVD0P/qo4AHeZDMc=
X-Google-Smtp-Source: APXvYqwwbm7amwqEw9msDWwF6AuFwJ/8/ojvkeDVipYNNbUv/mCjsxYIp0+YI2r5OZF54fr4wL+pBfZS9liOqQbwf+c=
X-Received: by 2002:a05:651c:1036:: with SMTP id
	w22mr3537477ljm.79.1567038452856; 
	Wed, 28 Aug 2019 17:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<c1bffa0ef4621c96d200e8ed14fd818d97b41677.1567019771.git.bruce.ashfield@gmail.com>
	<8664f9ff7f4a8463b16d3d17d213ad3375798ea8.camel@intel.com>
	<CADkTA4O_39fPJYD1DmiVVUL4GguyjqYG6VUct330GtzDnSezow@mail.gmail.com>
	<390a239da98f0f9013f9d32726354958620baf68.camel@intel.com>
	<CADkTA4Mg-wtkuyik8yEm=jMDO+VPq934oOocUnLN1sgo_vapAg@mail.gmail.com>
In-Reply-To: <CADkTA4Mg-wtkuyik8yEm=jMDO+VPq934oOocUnLN1sgo_vapAg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 20:27:21 -0400
Message-ID: <CADkTA4OgaPUwvN4h=+095DDgn6gUgFjwGH2kipC+Uh+DbVSDdQ@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 00:27:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 8:24 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 8:18 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> >
> > On Wed, 2019-08-28 at 20:13 -0400, Bruce Ashfield wrote:
> > > > On Wed, Aug 28, 2019 at 8:01 PM Mittal, Anuj <anuj.mittal@intel.com>
> > > wrote:
> > > This is causing failure for 5.0 kernels probably because the attr.py
> > > > python -> python3 changes are not there ...
> > > >
> > > > ERROR: perf-1.0-r9 do_package_qa: QA Issue: /usr/libexec/perf-
> > > > core/tests/attr.py contained in package perf-tests requires
> > > > /usr/bin/python, but no providers found in RDEPENDS_perf-tests?
> > > > [file-
> > > > rdeps]
> > > > ERROR: perf-1.0-r9 do_package_qa: QA run found fatal errors. Please
> > > > consider fixing them.
> > > > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> > > > worker/genericx86/build/build/tmp/work/genericx86-poky-
> > > > linux/perf/1.0-
> > > > r9/temp/log.do_package_qa.36284
> > > > NOTE: recipe perf-1.0-r9: task do_package_qa: Failed
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/975/steps/8/logs/step1b
> > > ote:
> > unfortunately, I can only cover the active kernels in master with any
> > certainty, and I already have a patch to drop 5.0, so I didn't
> > > trigger
> > this.
> > I can spin a patch for 5.0 and make sure it is version proofed a ibt,
> > but if anyone else has issues with <insert version here>, they'll
> > > need
> > > >
> > > unfortunately, I can only cover the active kernels in master with any
> >
> > Can we cover at least the kernels in OE-Core master right now affected
> > by this change? So 4.19 as well ...
>
> Consider 5.0 to be not there. It is going to be deleted in about a
> day. My hands are very full, so I'm not able to spend much time on it
> at the moment.
>
> 4.19 did work in my earlier testing, but I will have a look ASAP
> (probably next week, since my cycles are largely spoken for at the
> moment).

.. but I will visually check 4.19 for any other scripts that reference
just 'python' visually and make sure my tests are broad enough. It is
more builder and boot cycles that I don't have easily accessible. It
shouldn't be too hard to make the fixes generic and broad enough to
cover it.

Bruce

>
> Bruce
>
> >
> > Thanks,
> >
> > Anuj
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

