Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id C275D7F3E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 12:52:17 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u13so4923100lfm.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=alu0ygKCZGA/r7l7daQV/hnwuroc15GsBrzDlyM8tCw=;
	b=hlHkh8BOSxHitfeD2D34VHF8fbo+ZENiqz/fPWyzy3UTTiGUjLIcL5dbth6cErTA0H
	Iu1xhjn9V7m6fXsF8L6aSi/4J49x0vBRd1TIcHq5dvelb16c4K+UVygO+HRKFbiJDRMP
	dly2qMsxwrrG6Hl4oNJXPNfAOiEnpkt56p4p/ocYOSY9bRnXxAE+1LDR2m8DDGFmfz/z
	PEBRJItE5rv2D3fZTIfhO6TduNxjk0tV8tNcfWhXUgt0p1vPE7/PDbOp1TImAmWQ3Z9j
	hvnJTbMlj0E36KKwIAduQlOKtMQrzshAwAA1twxXrD9GTNJHzdOHYEew8bXupF7z0R6h
	Yu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=alu0ygKCZGA/r7l7daQV/hnwuroc15GsBrzDlyM8tCw=;
	b=RGEkdrolPb3ZgAzkjs5UyjZeF6otCAacB7fs5aZS+lAHAsHLn9gXIRU65lyZCx1ipd
	OR2nCzSnDZ/QzrSPB8pOnPyvBMF9AVz9YWYGSn5PxvxNqXmG7aXfQtLRHFMOqfFnxvXA
	zzQPkhZt8MD+bvaUuHA0zVkhXTnP0ePdmzFs1/bDqriGIsK2R9Q7J0t2LCXzE+DuJogk
	MRz4hJR6UUrF2fzEAdCa/GqkS+9pj/g5Vec/BhitHlqbSLsQzxuEwp7FPTQEJWo/SmRL
	0O3Mi/pwF3MfUvT/CiM55Vmj9FwLRQRTIgizKzt2XkaV0aHUkTuyMKtCI3JZTeoplAPL
	RwaA==
X-Gm-Message-State: APjAAAUNPwoaNA1bCopIIfbQyeU7XahfKAogt/3nnrkgLI7XGLkIpGwm
	72vdCJWd+nclxA2br4csJMuCVkLGbAhZfSsi0XfQkRIG
X-Google-Smtp-Source: APXvYqxG5aj9Fx+6SRNmlGmC1qp4TChEYpMoQtTlS2VyPYY1DZVYrcID5Pwo8roJmaCpPNBf14mn3GlQ9KHU6KXaCX8=
X-Received: by 2002:a19:428f:: with SMTP id p137mr6315064lfa.149.1567774338168;
	Fri, 06 Sep 2019 05:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
	<CADkTA4OFwO91cmwrvrTeHWHLF2iEz_JrxU=WODARQsiBqCSSHQ@mail.gmail.com>
	<3d3dc2514bd632d216550b3b42308abfdfbb46a8.camel@linuxfoundation.org>
In-Reply-To: <3d3dc2514bd632d216550b3b42308abfdfbb46a8.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Sep 2019 08:52:07 -0400
Message-ID: <CADkTA4MQ3xdrcED6==Ha=gbcON0hpabann6g=trM5d7FgkQPng@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemtap: Test latest and greatest for 5.2 kernel
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
X-List-Received-Date: Fri, 06 Sep 2019 12:52:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 8:43 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-09-06 at 08:24 -0400, Bruce Ashfield wrote:
> > On Fri, Sep 6, 2019 at 3:24 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Systemtap has issues with the 5.2 kernel which are fixed in master,
> > > we helped
> > > debug and submitted some of the patches. Update to a git version
> > > which includes
> > > all the fixes.
> >
> > And I can confirm that I can now run the stap test on all the arches
> > with 5.2.
>
> Cool. I also got a few more systemtap patches accepted upstream so we
> can clean up the patches there a bit.

We will soon declare you a systemtap expert ;)

>
> >
> > I'll send the rest of my 5.2 queue in a few hours (the removal of
> > 5.0,
> > and setting 5.2 as default where needed). I just want to run a few
> > more tests before sending.
>
> I actually merged my patch to poky which changed the default FWIW since
> it made it though the autobuilder...

No worries. I'll make sure to check master and master-next before
sending anything! That really just leaves me with the 5.0 removal, so
I'll double check for lingering references to it and send the patch
along.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

