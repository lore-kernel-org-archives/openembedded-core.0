Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 511E27F2A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:43:29 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r134so1513189lff.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HpAhiI4p33q6B4prl/PVWgG0fCl9XXCRZdmgO8msbGs=;
	b=kGxKFIYohO8suyJKsQ7STOqCGaxQ/rgU6PUojS3804Q0JeqC5sEluRRP83QFqjwQlF
	wzdJf5h8lQDhKzY6QI9W2c/9zafxRyrqcJyCSsCDnK5m1roBB2dVjZHYW0ZhcEV8yc1u
	jOVmlpwkZ/m0nL+1EF12y7SYiesfu5qVS7gAW39RJrAAiJRX1VErJD/xcYqsISPRR7/S
	5Aql/A0DySoQmEd4w52i73AWd4pkhY+360aZMyt/laGNbHFpXJI2qnnLdQ8bNctjLdNc
	yQIo9ALR0sIQQPPN1VNEEhZACls6MWdpXPmY2ydujssLBdluIyG/McPqedOSqFtTH4Hf
	X8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HpAhiI4p33q6B4prl/PVWgG0fCl9XXCRZdmgO8msbGs=;
	b=qqgGW5bGGEDAgxONju6X82SyOn6iZZZdzk15D3I6Sn2Zicg9+6commhx5G+JlPpdJX
	zC1WTHTbJD8t3DLuv5pKt0VjH3/mhlKgTYQz0C8U4Wn6byvajwVFA7kumo7NUqCLQjUQ
	RK1eZbbF/6xhPKHXfffMy2LXcl5JjPAiERY3Ajl2qU6UyWZhainBM+Ko+bQHRgSlXLxW
	f54J6nhmoTC/QPsh+3bDiJ54GoX8leTE2c1cNtEJoLzxJUQQF5WDWwQtO/Y5Zq+jU31F
	+1n543pJx5ydK5YZECVY3gBh3AimVut31YfVng5W8oFZq6SHs72GkgjhYBY8r5BO/Jbf
	zc8g==
X-Gm-Message-State: APjAAAX2azeTI4zHyI70Dznlsht06XwqlPc0fo9zla/OLXgwt6NvV5sO
	SI53AKnGr5rpCljvkJ1pkjIVn2OwOyYpomz6Oqc/gjWE
X-Google-Smtp-Source: APXvYqz5THyUZTKkdHZNGdNool2CDGaCvR9zEvsbytcly2t1Z6Ts27xzNfp7k724Z0L9Q9kq2GTbECSbnvp9kgrFyRw=
X-Received: by 2002:a05:6512:50f:: with SMTP id
	o15mr6189940lfb.63.1567082609586; 
	Thu, 29 Aug 2019 05:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
In-Reply-To: <CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 08:43:18 -0400
Message-ID: <CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] kernel-yocto: misc build / config changes
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
X-List-Received-Date: Thu, 29 Aug 2019 12:43:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 8:25 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Aug 29, 2019 at 5:29 AM <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2019-08-14 at 11:31 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Hi all,
> > >
> > > This pull request is a collection of smaller fixes that I've been
> > > collecting
> > > while I work through the 5.2/5.3 kernel intro, new libc-headers, etc.
> > > There's
> > > no reason to make them wait while I finish that work, so here they
> > > are in a
> > > single branch.
> > >
> > > There's nothing major here, just a some legwork changes, licensing
> > > update
> > > and a short term workaround for embedded host paths in the kernel
> > > binaries.
> >
> > There appear to be a few issues with the new headers. ppc looks to have
> > particular issues:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/976
> >
>
> Hmmm. Those must be packages not covered in my build testing. I will
> have a look .. but for some of these packages, I really have no idea
> and just search up the error and hope upstream has a fix :D
>
> Cheers,
>
> Bruce
>
> > eudev:
> >
> > util.lo ../../../eudev-3.2.8/src/shared/sysctl-util.c
> > | ../../../eudev-3.2.8/src/shared/log.c: In function 'create_log_socket':
> > | ../../../eudev-3.2.8/src/shared/log.c:123:43: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
> > |   123 |         (void) setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
> > |       |                                           ^~~~~~~~~~~
> > |       |                                           SO_TXTIME
> > | ../../../eudev-3.2.8/src/shared/log.c:123:43: note: each undeclared identifier is reported only once for each function it appears in
> >
> > neard:
> >
> > ../neard-0.16/plugins/p2p.c: In function 'p2p_connect_blocking':
> > ../neard-0.16/plugins/p2p.c:324:33: error: 'SO_RCVTIMEO' undeclared (first use in this function); did you mean 'SO_RCVTIMEO_OLD'?
> >   324 |  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
> >       |                                 ^~~~~~~~~~~
> >       |                                 SO_RCVTIMEO_OLD
> > ../neard-0.16/plugins/p2p.c:324:33: note: each undeclared identifier is reported only once for each function it appears in
> > ../neard-0.16/plugins/p2p.c:328:33: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
> >   328 |  if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
> >       |                                 ^~~~~~~~~~~
> >       |                                 SO_TXTIME
> > ../neard-0.16/plugins/p2p.c: In function 'p2p_connect':
> > ../neard-0.16/plugins/p2p.c:555:33: error: 'SO_RCVTIMEO' undeclared (first use in this function); did you mean 'SO_RCVTIMEO_OLD'?
> >   555 |  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
> >       |                                 ^~~~~~~~~~~
> >       |                                 SO_RCVTIMEO_OLD
> > ../neard-0.16/plugins/p2p.c:559:33: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
> >   559 |  if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
> >       |                                 ^~~~~~~~~~~
> >       |                                 SO_TXTIME
> > Makefile:1973: recipe for target 'plugins/src_neard-p2p.o' failed
> > make[1]: *** [plugins/src_neard-p2p.o] Error 1
> >
> > and errors from lttng-ust (cc'd Jonathan).

FWIW: lttng-ust builds fine for me with the 5.2 kernel + 5.2 headers,
it is one of the things I build and test as part of
core-image-kernel-dev.

I just rebuilt it here this morning and didn't see any errors.

Bruce

> >
> > qemuarm is erroring due to /dev/fb0 disappearing, which is probably kernel?
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/975
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/976
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/986
> >
> > and we also have an unintended side effect multilib build failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/995
> >
> > which might be due to changed dependencies, I need to check into that one further.
> >
> > Cheers,
> >
> > Richard
> >
> >
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

