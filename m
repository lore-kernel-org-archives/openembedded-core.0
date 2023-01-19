Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C7FC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:18:09 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.41415.1674119885579787749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 01:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lZr56jWW;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id j1so707463iob.6
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 01:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQXo8aHgvLTdBqqAF1N84YKOM/bSjlTO+qv6f7NiJaE=;
        b=lZr56jWWP7a/n4ISs5GmKzCkQqtzPp27NQLGAQCyZclfYF/Fqb/lk/LNh3q1iwyK11
         PTpZLZXt1G0HUOfw/9zlShqDC/rGUEMB5KRu1IRsp1ATQh7J6t+A4uDN+28ez5nB9bTn
         FpIJ3KngdkEFxnxPBO2CefMEc5r7rqT45phwIcnJBopDaLSl7EUsZWowgqLnVgQOoFPR
         fA2kGoqrtsy2fDx91xcEWLLq9gNkIeiEhOLvx2TTGsxTb+uhQMgvDJsWhZJDHepeBpQ3
         P1cYnZIa25yC/p+Hj+PNQGe5hEJRRQbWF3p/wp44h+CdgV613Z6AEFF8jbZRAsCVAGRZ
         lEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQXo8aHgvLTdBqqAF1N84YKOM/bSjlTO+qv6f7NiJaE=;
        b=kZqRdDM2Jt5VTPPieQug7+ZUqoeTGbTK/3Li9s2wbIF76BZ4P0HhOoArUNqfuPLmI2
         qe62E2Vg22uRDRUt4vnJ/jSU8YsccrAExV8d1XePTs8Mm6P0pvgMPCGjDcFAkZFojNJU
         1XlCDrxBXWyNKyNBnhI6M9P0ocodMxZiiYqOrfSRvvD2s8rhFb1FFve9nh08BL7LeV/E
         seSLi17QXZHLhU3f1s5cNyd9OS498fdICKYNVgKBZxxbatH35JNujBz6k2aOZwAMi/wb
         kBSKZ88PoS0BtC/ujBrt8JB+aBvjfcBjXlFgGEM5HQc5yQ05VCsjGTFgIcGbUlpsT7xQ
         mqLw==
X-Gm-Message-State: AFqh2kpzGVkfQkBZk4212CtZZWrVFqybI4VBNPMVZWX2GiuOIRGG9H55
	efs8iLzF9y8ks5e5IygHSGpsnma0QePJyDK8Veo=
X-Google-Smtp-Source: AMrXdXvU2gmMeIL5yp3znQXTjB/G3Ltrrh+n//ohTgIyn3g3Y2hXseA3/LOflZCu4gLZ7x3ZaPtBZUy48eHIEvmxUNo=
X-Received: by 2002:a02:3407:0:b0:39e:a16b:99c6 with SMTP id
 x7-20020a023407000000b0039ea16b99c6mr837867jae.167.1674119884791; Thu, 19 Jan
 2023 01:18:04 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
 <CANNYZj_9rpnJrSLp_oRvXsRzAXhA=W3ybEmQxrUtdcJtNq18rA@mail.gmail.com>
In-Reply-To: <CANNYZj_9rpnJrSLp_oRvXsRzAXhA=W3ybEmQxrUtdcJtNq18rA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 19 Jan 2023 09:17:52 +0000
Message-ID: <CAO5Uq5QF72RR1GV56GiZ3KtCqTf4UZsjDyACbTvoqLgaOq8Geg@mail.gmail.com>
Subject: Re: [OE-core] Rust crate checksums
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176127

On Thu, Jan 19, 2023 at 8:53 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think Cargo.lock contains those checksums and that forces cargo to
> verify them? Can you check that verification happens and fails when it
> should by e.g. patching it to have bogus checksums?
>

Ah, yes... I'll check.

> Alex
>
> On Thu, 19 Jan 2023 at 08:15, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Unless I'm missing something, I just realised that we're not
> > validating downloaded crate checksums when we fetch them with crate://
> > - Surely we should be?
> >
> > --
> > Alex Kiernan
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176125): https://lists.openembedded.org/g/openembedded-core/message/176125
> > Mute This Topic: https://lists.openembedded.org/mt/96373035/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
Alex Kiernan

