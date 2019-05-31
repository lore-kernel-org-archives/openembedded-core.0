Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB8837E547
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 12:53:52 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h11so9543123ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EGczyi+zUrAuEXTpTPUcAD4CRX17nzNKPAOnpwEufXA=;
	b=Lu3Jx+Fgs4MGVtO4H6hH1vm7ZhfN1c7aXkkTvlqWe6I3FSr9AHjOF23tQQAxWWhZGn
	eyICdsdSmLr8/kmTmwBFkfd72QQZwOxlhL8IMc4p8fEtCijvgW5vFCKrFlauTPMXz1us
	stf5e5VzFVttR92YlY4HIGaKxUBilVtIODIEeBX6WE9Hb2qUUkaAL9zmvf0bLw8ngqm3
	UiY6POBriYSvqMxxe+TquDKsX7TRZ4g5UELVsGsS1mKjB9c5zydgIrDv+T/hnGa/0UKM
	Fm4lYEyVLoNp89BPZZfu2PExvbcBO/n+Rq6zGZ5ud7QYr/qq2SIcyUom9PRG1/vdBP3X
	UIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EGczyi+zUrAuEXTpTPUcAD4CRX17nzNKPAOnpwEufXA=;
	b=k9RdJ09SJS9nSab984SCvYRgWXXYgw7tadNi/G9LSAcdkTocdM+/to7rAageuzzTAL
	cmJ5Pw1TAz5+ynPKpXeKmvqagkMUbxfY7UJeAXJbp66l4pvEtx5WSd7H/fZdXS0wfvmJ
	GOg677Rol+epTYnb3MMv8RogjEJUmmJ9pmoUSyDb+KCmwTDagv6B1gTMd+AyTK+0Zw0o
	UNejjRyH8PE+24PYowoXfX6Xn4EsX+9i7s72gMQqBUKOHYNgXuSuzFJXQwF5ncgNgTR0
	kpQTRz5bAcjCsKdCSPlnq1yP6U4CXzUpN+qPfyqdMpy8eAyMJTalkjSDxAqMhJzB6oqU
	VYhw==
X-Gm-Message-State: APjAAAVmAQkXvcmTryXNuajCDL6qAUeeGWotfLV7FeUcONTLtIhBSFcJ
	t7IqafGdd9twu7NxYV9TcqcM0iNytap3f7ApKE8=
X-Google-Smtp-Source: APXvYqxckOUlOcJgatkeT5d+9/+p/p8PF5p9GNEzQVYO5j4df8KeTZp2lArf1LEhxsvwxIh6MubBnSz6I4qiNew5vzY=
X-Received: by 2002:a2e:9185:: with SMTP id f5mr2849740ljg.51.1559307233010;
	Fri, 31 May 2019 05:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
In-Reply-To: <18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2019 08:53:41 -0400
Message-ID: <CADkTA4M=hUbCPwa6H_KMFN=hDbpdy-XE5kZ8magBQFD-f=ML0w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2019 12:53:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 4:01 AM <richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Thu, 2019-05-30 at 08:44 -0400, bruce.ashfield@gmail.com wrote:
> > Here's the latest round of -stable and -dev bumps for linux-yocto.
> > Looking at
> > the timing, v5.2 could be the new reference kernel introduced in the
> > next
> > release, so I gave it some extra test cycles while doing this update.
> >
> > Also note that I updated 4.9, 4.4 and other non-master kernels with
> > -stable
> > updates. So if you are using linux-yocto as a reference, you can
> > manually bump
> > your SRCREVs to pickup those chnages.
> >
> > The only non-uprev in this series is the one kernel packaging tweak
> > to grab
> > a new artifact introduced with the 5.2 kernel. It is packaged along
> > side the
> > other module outputs, and won't add signficant size or time to
> > anyone's feeds.
> > (and it is safe for older kernels as well, I tested just to be sure).
>
> This fails in testing with one failure on qemuarm:
>

bugger, I didn't expect that!

I'll dig up how I mocked up a systemtap test environment before (it
will be next week before I get to it though (unless I'm lucky), since
my cycles today are spoken for)

Cheers,

Bruce


> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/runtime/cases/stap.py", line 37, in test_stap
>     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> AssertionError: 1 != 0 : stap --disable-cache -DSTP_NO_VERREL_CHECK /tmp/hello.stp
> WARNING: Kernel function symbol table missing [man warning::symbols]
> WARNING: "__aeabi_unwind_cpp_pr1" [/tmp/stapEqi01F/stap_21486.ko] undefined!
> ERROR: Couldn't insert module '/tmp/stapEqi01F/stap_21486.ko': Unknown symbol in module
> WARNING: /usr/bin/staprun exited with status: 1
> Pass 5: run failed.  [man error::pass5]
>
> RESULTS - stap.StapTest.test_stap: FAILED (336.07s)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/648/steps/7/logs/step1c
>
> Cheers,
>
> Richard
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

