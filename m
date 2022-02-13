Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5DCC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 20:31:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.25888.1644784263408378597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 12:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q0vnRh1I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso5168042wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 12:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yC6WkmEPsvSRF4N8NounIvvcZU+0/HyvAnJxzgvipBU=;
        b=Q0vnRh1ID8SfkIvaf33CMFj604UJk3WZhiaTzX/GUS1BkdIhx7V2kOlgJgvdrzhuE4
         1/Hw5WG8dTHxWz2+JCZSDo4l++CKWxpt6Z1ONEinn3ur6KfdlRH2/gHQ+2KkKCtad7Bm
         a9XHT8TtxUXiGrKnmtYbfX8WDKjeSUomZZQPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yC6WkmEPsvSRF4N8NounIvvcZU+0/HyvAnJxzgvipBU=;
        b=ZsCkSIa6CJ4NaGoFbZsGg+TFXM3Zmth21+7Uw1LBcnm41wNMw3t/C2qaELz9bGbwMk
         7IO5/YigSIbVjIM+Q7qRoO17D9YBuSe881ePNT+6EQ+4QMQPEsh1TKMcq9IKDdxke4Tb
         EwocNPQyEdpAr7JpfAF6bLyHc95aBmk1wGZidsBI+gS46EM0kQcyfdNvNqvJv/NihO9Y
         HAit10k+ax/Egndzw0TAcXXSbsqcxUd5pLJD9SO04DddvIctFxrKF9VkMtMAH3+E5YpS
         Wd3ClWztPi0FSNYg6Ny/Q2puJ7gt+wQfRzYqr+qPtq5jNZm9Ios/E1VzrmaPvWhAf0Ay
         QFfQ==
X-Gm-Message-State: AOAM533+pQN44PwkdjK5FGYUHxDslOgEE88JQB9bxfM0F32c7PeV3b1d
	oAgs6W5yNRF9sCFNFUiUGgRDIg==
X-Google-Smtp-Source: 
 ABdhPJxFCzefPh2hkBQPGrrpDIyWP/OQRyT3deJUQRngekLFRGjD6/8a35qPC5USJHtoB0k34oow9g==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr8644037wmi.118.1644784261898;
        Sun, 13 Feb 2022 12:31:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:385:df26:3e57:9893?
 ([2001:8b0:aba:5f3c:385:df26:3e57:9893])
        by smtp.gmail.com with ESMTPSA id
 d7sm11904767wmb.18.2022.02.13.12.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 12:31:01 -0800 (PST)
Message-ID: 
 <f757b86e660f932075e03658a50de4e10b348f35.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Feb 2022 20:30:57 +0000
In-Reply-To: 
 <CADkTA4N-yxzSMuhVpPWyddcaOLkmBpEwgs4TECr8SNup8tE__Q@mail.gmail.com>
References: <20220210183719.3213809-1-raj.khem@gmail.com>
	 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
	 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
	 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
	 <c33e356bc1429ff6b8175dd056603a21cae833d4.camel@linuxfoundation.org>
	 <CADkTA4N-yxzSMuhVpPWyddcaOLkmBpEwgs4TECr8SNup8tE__Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 20:31:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161690

On Sun, 2022-02-13 at 11:27 -0500, Bruce Ashfield wrote:
> On Sun, Feb 13, 2022 at 9:27 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Sat, 2022-02-12 at 20:25 -0500, Bruce Ashfield wrote:
> > > On Sat, Feb 12, 2022 at 12:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > 
> > > > On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > > > > > Release Notes are here [1]
> > > > > > 
> > > > > > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> > > > > > 
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > 
> > > > > So far there was a mingw failure:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729
> > > > 
> > > > This seems a race
> > > > 
> > > > > i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
> > > > D3DCompiler_dll_t.o: No such file or directory
> > > > > Assembler messages:
> > > > > Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
> > > > > i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
> > > > > i686-w64-mingw32-dlltool: failed to open temporary head file:
> > > > D3DCompiler_dll_h.o: No such file or directory
> > > > > Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
> > > > > make[1]: *** [lib32/libd3dcompiler_35.a] Error 1
> > > > 
> > > > 
> > > > 
> > > > > 
> > > > > and a qemuppc kernel build issue:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
> > > > > 
> > > > 
> > > > this needs a kernel patch backported ( looking towards Bruce to include it)
> > > > 
> > > > https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/
> > > 
> > > I've grabbed this change, and the riscv one, and applied them to 5.10 and 5.15.
> > > 
> > > The pull request is on the list for the binutils fixes and -stable updates.
> > 
> > Thanks Bruce. Unfortunately this doesn't seem to fix the qemuppc build issues:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4691
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2634
> 
> I see a patch from January on lkml with the shortlog: "powerpc/mm:
> Switch obsolete dssall to .long", which may be related.
> 
> But I'm not setup to see the build issues myself this weekend, but can
> start looking more closely on Monday.

I can confirm that cherry-picking:

From d51f86cfd8e378d4907958db77da3074f6dce3ba Mon Sep 17 00:00:00 2001
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Tue, 21 Dec 2021 16:59:03 +1100
Subject: powerpc/mm: Switch obsolete dssall to .long

into 5.15 locally did fix my qemuppc build.

Cheers,

Richard



