Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4061F7F316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:26:01 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t14so2851073lji.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ccVxSBvv8xilmFiqYlWMNmEz/HuOKyebrgQU8HW/HXQ=;
	b=DLX27e0kZy28UqoYmMZNBOnwDOyGyDbKBGh7T47QQSaPB7opkeN/bjttCxxXsGQDCV
	6IRHAySXRu8nFv6tm8BsYcubQuqWUdVRsFHXG4QBZMmLivU/BHBDL9YvJsf27bFFFa6T
	kPcF2+0cpzsZh9Hmn9BZWTliIULnT3+SFid6SOLNbZbsj1eZzFVqym1b/YXix7LVCR9F
	n8j0BdJLx7g3D0pPmbJrquEFrepYkFt+pfouRjAi2x7nHPYHp52orhHwPMjWWUWXR1Mj
	zNosYRCofHpnm4ZbXqnX4LKYvzM2W9XSuRFIENLAHB5ZTPHQRoTnxIerYb+nSSeATejt
	7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ccVxSBvv8xilmFiqYlWMNmEz/HuOKyebrgQU8HW/HXQ=;
	b=inlX4HcHgADYOvSRgT1QMzPQlEJ3MziHAeLr6rVjjZ0nyXaRiIujIsrw6fgNKxLJjA
	7lYa0w+AGXRhX4cGinotkNH03xFUQWqIvTqwlF74sza4yLk/s3pEqGY+CJLCOBw9AdVk
	jyCrSonIHRYyQxJ1tKOUyxITidc5vFhFqE0/JLYKnLkwOHNpR9YantCMGJhHN7hQ98xc
	LDayy/uPMPG0TTxDrh65e4Jd301r84BGBKUvMCUr1P0RKnnYv029BXmKKUtbiav8rJdT
	EmtSk6xt+stn8x53QdNaYXUyeahxVN4Nw8jhMPpUJZ8bnzz1KgOcOaChI6xtk9xeHOI0
	0DoQ==
X-Gm-Message-State: APjAAAVptaRHsb+PBhs3s+gTr+nunuotFr24Z92+ThOTmgmDL8ARrJFc
	3HwV59y2PgzSV7WisCOVAOuPjPe0GetXGursbpovoHXO
X-Google-Smtp-Source: APXvYqzwoFrFrCTAkVOi7gkZEfq1z09dAelpRj5LsWduzBm4fmXvf+87Ge0sGRfbctdHQykGTYdZYk3EB0bcGivA2Q0=
X-Received: by 2002:a05:651c:1036:: with SMTP id
	w22mr5154969ljm.79.1567081561661; 
	Thu, 29 Aug 2019 05:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
In-Reply-To: <28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 08:25:50 -0400
Message-ID: <CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2019 12:26:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 5:29 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-08-14 at 11:31 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Hi all,
> >
> > This pull request is a collection of smaller fixes that I've been
> > collecting
> > while I work through the 5.2/5.3 kernel intro, new libc-headers, etc.
> > There's
> > no reason to make them wait while I finish that work, so here they
> > are in a
> > single branch.
> >
> > There's nothing major here, just a some legwork changes, licensing
> > update
> > and a short term workaround for embedded host paths in the kernel
> > binaries.
>
> There appear to be a few issues with the new headers. ppc looks to have
> particular issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/976
>

Hmmm. Those must be packages not covered in my build testing. I will
have a look .. but for some of these packages, I really have no idea
and just search up the error and hope upstream has a fix :D

Cheers,

Bruce

> eudev:
>
> util.lo ../../../eudev-3.2.8/src/shared/sysctl-util.c
> | ../../../eudev-3.2.8/src/shared/log.c: In function 'create_log_socket':
> | ../../../eudev-3.2.8/src/shared/log.c:123:43: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
> |   123 |         (void) setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
> |       |                                           ^~~~~~~~~~~
> |       |                                           SO_TXTIME
> | ../../../eudev-3.2.8/src/shared/log.c:123:43: note: each undeclared identifier is reported only once for each function it appears in
>
> neard:
>
> ../neard-0.16/plugins/p2p.c: In function 'p2p_connect_blocking':
> ../neard-0.16/plugins/p2p.c:324:33: error: 'SO_RCVTIMEO' undeclared (first use in this function); did you mean 'SO_RCVTIMEO_OLD'?
>   324 |  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
>       |                                 ^~~~~~~~~~~
>       |                                 SO_RCVTIMEO_OLD
> ../neard-0.16/plugins/p2p.c:324:33: note: each undeclared identifier is reported only once for each function it appears in
> ../neard-0.16/plugins/p2p.c:328:33: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
>   328 |  if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
>       |                                 ^~~~~~~~~~~
>       |                                 SO_TXTIME
> ../neard-0.16/plugins/p2p.c: In function 'p2p_connect':
> ../neard-0.16/plugins/p2p.c:555:33: error: 'SO_RCVTIMEO' undeclared (first use in this function); did you mean 'SO_RCVTIMEO_OLD'?
>   555 |  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
>       |                                 ^~~~~~~~~~~
>       |                                 SO_RCVTIMEO_OLD
> ../neard-0.16/plugins/p2p.c:559:33: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
>   559 |  if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
>       |                                 ^~~~~~~~~~~
>       |                                 SO_TXTIME
> Makefile:1973: recipe for target 'plugins/src_neard-p2p.o' failed
> make[1]: *** [plugins/src_neard-p2p.o] Error 1
>
> and errors from lttng-ust (cc'd Jonathan).
>
> qemuarm is erroring due to /dev/fb0 disappearing, which is probably kernel?
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/975
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/976
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/986
>
> and we also have an unintended side effect multilib build failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/995
>
> which might be due to changed dependencies, I need to check into that one further.
>
> Cheers,
>
> Richard
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

