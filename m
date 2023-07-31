Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71181C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 17:22:23 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.1303.1690824140646550326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 10:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZNdrEQt/;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: luca.boccassi@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-444c42f608aso1434059137.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690824139; x=1691428939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTw2KSpjLLiKycf8HA7kdx3KqYen43pViLmCmhK9tfk=;
        b=ZNdrEQt/T1fkjOpKTedYkN7XWyhSvAwI++PpZNblkHn72a1Qje3wqoLJLY6PGnXKJ/
         3wPafOBQwhSrhgAtegfjMwcuEtHh3GSZvxlmsxUNMJuExp85vvu1+2s3YJrg+r28fcjZ
         C4cH9Jle9lUoi27DHLgN9mDvO0pDxowcBgUza4q7ry/jaPOM4Z9tMN5uvkKvJh3MwTay
         G4FiQHVgVKudQxvPldgN6vDAyDej1nlMLIuMl9T3ZBDPqzyp16NYqaTOW6cnbvpPQWvq
         jjxbJTPdDxpFqbKRnKkgfIMU3XNFNcnrNK0PmZ1D5YukBY5ZSgNFtqdI2Cdrxf49x4Rc
         0dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690824139; x=1691428939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTw2KSpjLLiKycf8HA7kdx3KqYen43pViLmCmhK9tfk=;
        b=KIU9XliyjWQRAa3kChuZ53eWN0VZNNm7gnd8l7eULAX28hBg+P5R/7nGbWuitep9k+
         tTX4m234PY5ghmntCjy+tkNpnA6rF3kJlau2vp57DV0sZ+GDhwSXstWlYHGuu0qiovjI
         T5/HqnXuBPjbsWCQtZCfsI+VqjfPFsy9JbvyT/3wqa6x07CkbO//OqDnphB5AM+/UH1c
         tsqq5uXFWL2eCYp+YKlwMPJrjaBTu6grbLA8qy0tJ3fyrdrpEkiF0NFOpUPmsQB5zIn1
         EKEYy5cV3jCi/mNPxVL1mXCHIEYGd2DOi8DXar8RcGsWVGizPiJJCnznKJR1LgEQ61+Y
         7YNQ==
X-Gm-Message-State: ABy/qLbTxWq3IzoQNFsy3hfi+jyZea7h03BG/b22RQMNWMZHCS6cr/fw
	hgjwJn2Vka9P16zJ6fSc4e1tDrI6ljR75F3cL9k=
X-Google-Smtp-Source: APBJJlFw5Ya5wfkESZAlwVEK1cUKxSbo+b1CE2vNCJJ3q2fvQuBQhnkAfDCtRwHFRqPiQ3V4oh5fhW5Xn03btVyCSu0=
X-Received: by 2002:a05:6102:94:b0:443:6c11:fc5b with SMTP id
 t20-20020a056102009400b004436c11fc5bmr605897vsp.14.1690824139604; Mon, 31 Jul
 2023 10:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com> <202307311713165bd45fd1@mail.local>
In-Reply-To: <202307311713165bd45fd1@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 31 Jul 2023 18:22:07 +0100
Message-ID: <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 17:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185153

On Mon, 31 Jul 2023 at 18:13, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 31/07/2023 17:56:05+0100, Luca Bocassi wrote:
> > On Mon, 31 Jul 2023 at 17:40, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > This causes the following failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5570/steps/14/logs/stdio
> > >
> > > 2023-07-30 21:25:44,944 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> > >   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 297, in test_all_required_variables_set
> > >     self.assertTrue(line, msg=res.output)
> > >   File "/usr/lib/python3.10/unittest/case.py", line 687, in assertTrue
> > >     raise self.failureException(msg)
> > > AssertionError: None is not true : NOTE: Reconnecting to bitbake server...
> > > Loading cache...done.
> > > Loaded 0 entries from dependency cache.
> > > Parsing recipes...done.
> > > Parsing of 954 .bb files complete (0 cached, 954 parsed). 1878 targets, 53 skipped, 0 masked, 0 errors.
> > > NOTE: Resolving any missing task queue dependencies
> > > ERROR: Nothing RPROVIDES 'pam-plugin-umask' (but /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd_254.bb RDEPENDS on or otherwise requires it)
> > > NOTE: Runtime target 'pam-plugin-umask' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['pam-plugin-umask']
> > > NOTE: Runtime target 'udev' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['udev', 'pam-plugin-umask']
> > > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > > ERROR: Required build target 'core-image-minimal' has no buildable providers.
> > > Missing or unbuildable dependency chain was: ['core-image-minimal', 'packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> > >
> > > It repeats for other runtime tests.
> >
> > I added that on Alex's request. So it's either that failure, or the
> > ignorable log message? I'll send a v5 without the recommends then.
>
> In any case, you are going to have to fix the tests

Which test? There was a warning if the optional pam module is not
installed, just ignore it, it's harmless.

