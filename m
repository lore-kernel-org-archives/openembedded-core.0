Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A3CF34B0
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 14:38:54 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.13174.1727966330989003432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 07:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3gPxhY6;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2870058ffaaso424956fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 07:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727966330; x=1728571130; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppXZ4FtTgvfjUG0zfd9rVvxtCcMVcMAYmgo+sqYiY6U=;
        b=G3gPxhY6JXlrpIQSBbL923YQuvEIlHQs5+6B+ppNpWy3vliCUpVq5Q7oW5w8tDEhX0
         3qDrnZF/R8umnCMTiktt3KAqIIsTipPxFWW+86rAt8dKD/eAz9IQqC50dWFCi4Obw1cr
         yXtpTD5EesIvT5UAE0AASbs7gCq+Rwk6x80eOJtthMbvEMasEQzlzLbODl9bUEYFyUIg
         uMPGdP2rnBHqnO8f3Ci4+dgUlaMNtyiHWWwDdG6Hxog+b86VxCBPW08DgjYbrunsD1rS
         Rh8DRk20XoRwHJ3tLc7mX+5v3ex6QHxIsn8pqX7XRu2YAGQOgA/uZwKg5Drwod5fckpq
         QAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727966330; x=1728571130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppXZ4FtTgvfjUG0zfd9rVvxtCcMVcMAYmgo+sqYiY6U=;
        b=E7jaDLV123X0bz7cTJx1ry4vr6qG1dDCfTV4ozW45V5OCgY8WahkXB2b384hju2M3i
         PSSDLeSFW0HVq59nT5qZduwmoMydAgJSVAjw7Y0RmuKVf/yKmewMFd3HRiQPvtyWDfdZ
         nnDDSRQA6yG2S1hPMOsbUum+/3KcOUSDeF3MndUgn+M39EZT5eqIrr/5V6/zIcyHWNLV
         ZGD7JGZbVCbdMK/skfUvmvWZRgaXAQ/bo/f7WOGhAcI+j+2OV+CY672pBZp9nZ2roeQ6
         WONWJOSHYJM4sbFYQ7PedbdNAIhxYCxwnwg4lIlpzkPCiosqwEAnv0L9GB/9TDYNio/M
         8DDw==
X-Gm-Message-State: AOJu0Yzg/0yD55FQicIkBuJTyiAGAzIT+K9fgsAnL+Lpoq5M6bETA4kl
	jFPuioRvmkeA48V/2537ZFGiUWnVmq6B5h58dEq3hmJzRNn6R4dQGjtSCdIwoLEZ+r1IzOzxfOm
	UYaeZL6m5sNpik2hc9EPxBlO/Lho=
X-Google-Smtp-Source: AGHT+IGpv+IygwLz2Mu0dAzu5BPa+4+lr+umeYrLyo3heY6fP8kZX7mIiyKj254U2/gy11WAVzugJZ9g/LQYOQzqE+A=
X-Received: by 2002:a05:6870:5248:b0:287:cb2:c10 with SMTP id
 586e51a60fabf-2878844dac8mr4993626fac.0.1727966330122; Thu, 03 Oct 2024
 07:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdYM8XVLTVWg6jkZrGPmPG1MVfQMH17aASKgHOK+6zLGgQ@mail.gmail.com>
 <7336.1727954530167946178@lists.openembedded.org>
In-Reply-To: <7336.1727954530167946178@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Oct 2024 07:38:23 -0700
Message-ID: <CAMKF1srVR3LZW3Hq45XWxvFe5dkkfAxySqBzsZuyts576pqEYA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 14:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205207

On Thu, Oct 3, 2024 at 4:22=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi Khem & Steve,
>
> Thanks for checking out the results and your comments.
>
> >>Is this regression? and is it a persistent failure?
>
> We analyzed the issue further by debugging it manually and observed that =
the testcase "nptl/tst-thread-affinity-sched.c" passed as expected. Hence, =
we ran the testsuite again after the update and found that the issue was no=
t reproduced anymore.

Thanks, I wonder why it failed the first time. Was the system running
these suites overloaded ?, I would like to see if there is a pattern
to these failures.
for now this looks ok to me to apply.

> Please find the following results after the update which has 2 less failu=
res than the results before update.
> After Update
> PASS - 4781
> FAIL - 145
> XPASS - 6
> XFAIL - 16
> UNSUPPORTED - 237
>
> Before update:
> PASS - 4770
> FAIL - 148
> XPASS - 6
> XFAIL - 16
> UNSUPPORTED - 237
>
> Diff:
> PASS - +11
> FAIL - -3
> XPASS - 0
> XFAIL - 0
> UNSUPPORTED - 0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205206): https://lists.openembedded.org/g/openembedde=
d-core/message/205206
> Mute This Topic: https://lists.openembedded.org/mt/108647219/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

