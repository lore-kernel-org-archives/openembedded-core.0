Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id A1F567F8E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 22:52:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m4so4561975qke.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=21NS6jvXcQ8hEHm6lU+yW6A9lTD1+kkYRM7VQPEhnK0=;
	b=K8GtosU/f6MlXxc1eziUhPcGpt5dLEx3BB/j6/vQZehTSrEY6ZoE3QLgkYb3IwWnwJ
	7tlcf4Qcs9WDarJa8uPHxNuTM9iCKSFIh/f62EknI4lRa9GMBMxOYmlyipx8CbGLMsVC
	mtm3iwDRVdRztE/7ziMhTFOasIyIVpK3YW9vEq231Gemdov4oMDocRy7IxE2r8Rikizl
	3reJTdLHWKu1qy3XhWPL5NoBG9SQg0ZLTaL8Tn8wVFSg/WuVM/yeUOCN9mfqIVB6FuVc
	agJT0H7hK3qGwX2HrFyln4YYYMY4POtZo6fmFj/QYtoaAjU2ILx5DQum+5US+i3VYHZR
	e4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=21NS6jvXcQ8hEHm6lU+yW6A9lTD1+kkYRM7VQPEhnK0=;
	b=r+lT5w6myVh045eQzYy2AlwT88MpotxBdLrB//Pqy92wIwJi0/0weVOCM5qIIfdTQB
	fyYtaRo931oqO+7q+LbkPQ2t90BEojojRVvda8wl0n1XE2JH160vuLfrbdb49xYYAff1
	fyhc7YI9jyqq7N2qdVmhimgd06OX2n2mo+ns5kwBIlZ+nXW0shRB1gYh8Ep/VpnFpF2j
	CXTyYhAMoOHQS5+JhmLlTPMMCTf3uWTi+R1+G2No1iQrsTXpXq9Z8BanWCDdGfAgYL6M
	AMTWkRt8CdEj0HgAttY3YT6/2h/1aGQOlooYvsJ0A+FZRkkntOe2Iq+Tl4v/O8s95kFk
	CTMw==
X-Gm-Message-State: APjAAAVfrK4oHtQh0eyxDQlSCFAZT7EwrafF50Jo9LrrOEu1U6vnKLHZ
	rc2LDvzEUM46LA8rEuBFr5Zgfa8qjmqdwlqe3Lw=
X-Google-Smtp-Source: APXvYqy4tQ2vcjMiAtRvNtBBOS4oO6nfOXxQnGCqFWl3Nmu7b6RGr4Nwu7DnwLxQPDGl9StTwLupEpy8wyJ85Db3zT4=
X-Received: by 2002:a05:620a:134b:: with SMTP id
	c11mr8391740qkl.71.1571871159907; 
	Wed, 23 Oct 2019 15:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
In-Reply-To: <502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2019 23:52:13 +0100
Message-ID: <CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 22:52:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> > On 23/10/2019 14:03, Khem Raj wrote:
> > > Hi Richard
> > >
> > > New master-next I see these fails
> > >
> > > https://errors.yoctoproject.org/Errors/Build/91645/
> > >
> > > First two are important one's we already know why
> > > ti-display-sharing-fw fails to fetch
> >
> > ERROR: QA Issue: libiio: Files/directories were installed but not
> > shipped in any package:
> >    /usr/lib/python2.7
> >    /usr/lib/python2.7/site-packages
> >    /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
> >    /usr/lib/python2.7/site-packages/iio.pyc
> >    /usr/lib/python2.7/site-packages/iio.py
> >
> > That may have been triggered by some change in oe-core but that's
> > definitely an issue with libiio.
>
> Its from this cmake change:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1
>

I think its causing more failures, where suddenly, the recipes are now
resorting to native python, is this patch correct I wonder ?

see
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4

>
> >
> > WARNING:
> > TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > r0/temp/run.do_configure.7679:1
> > exit 1 from 'NO_FETCH_BUILD=1
> > TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > r0/recipe-sysroot-native/usr/bin/python3-native/python3
> > setup.py clean'
> > ERROR: Execution of
> > 'TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > r0/temp/run.do_configure.7679'
> > failed with exit code 1:
> > Traceback (most recent call last):
> >    File "setup.py", line 17, in <module>
> >      setup(**config['options'])
> >    File
> > "TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > r0/recipe-sysroot-native/usr/lib/python3.7/site-
> > packages/setuptools/__init__.py",
> > line 145, in setup
> >      return distutils.core.setup(**attrs)
> >
> > Looks like whatever astor is doing with setuptools doesn't agree
> > with the upgrade to 41.4.0?
>
> Yes, I can confirm that reverting
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b9703df2853e72b974a63ef1146f09a6c197990d
> locally does make it build again.
>
> Cheers,
>
> Richard
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

