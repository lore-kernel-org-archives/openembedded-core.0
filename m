Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781B8CCF9E5
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 15:17:58 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.18902.1727277469400607857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 08:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRQp8ucS;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5da686531d3so3877464eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277468; x=1727882268; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch8ZDF3zVAa9fORbOU6zp/iSiiBNJIQQ1AILtd+Ff78=;
        b=RRQp8ucSUeKc7YnismtfulrHuZgTz4JGgIWU3uHiY305qZt+a/XzmKNII6DRXtLmvY
         YXKiFa2bSBP1DeZEepjA3apEW2A5zrg3vNAF+JRgvxQtMEkheVe8ke0wVtu41FF9/XiM
         gdrTGnNHJt2Hsxs5+iKv9g+jsvPZ3GonqbqTNe1H+NAKeDcgKN2xTJuLlo9ci6SUefeq
         v97poo4T+DFwfYooJXu07YvL2yLzoSPlrTQU65mrlurdSpvEfanqT9jZCYbtIC8w9o43
         Q+RRjJbvA/bGbbhBXkHrMjZrKkllGaHVTFvssUdLSkAyI7R85z5Vf6ifpM8bwfuoNdN/
         cxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277468; x=1727882268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ch8ZDF3zVAa9fORbOU6zp/iSiiBNJIQQ1AILtd+Ff78=;
        b=XfLuFw8cl1FUbtyHTRIlpmUe7d4KYduNiLvGjtVADsUg9hTgkSwmjVjsQVWto8v526
         O1tdMGTXaCxRAUj3F7qh63c0S4W1WKa7jKvVcYhNJwLUqTkjpQbndPRa/PZUwOZ4yKOv
         jrJhQx6kHmVUa4UJU0WyldKTTt8jGQM1wQHKvevUyDBhHnX1Dy4BIXqH8XgnxLWkkU31
         OC3v3fhkke7Vi7YKjr+tP+U6vMvtWo9sx7qdzj5zNBDZCMpipmiM5P2C08ZiKSDrsQNF
         5DZt6iC/XRS3ahqaHJdUZeAhSy2WwuaK6afkvVQhpiNR7+IBk2zAAzaJDuYP4gJNffcE
         vFCA==
X-Gm-Message-State: AOJu0YzPqLmyDuFHlJI1ZboK9vKRNWK1Wh0b1e7wT+z+RCSwhuWrlg2U
	FgmmkNT7w/Twr64f3pZQy5aZ2RR0x2LkygsQ2vsYQGBLGpLVyp7cD7S9Ct3f4fN1V3kR53YCFOy
	wmNf9FoxxpP6ZW7YBSp8jUSIAFygqJig4
X-Google-Smtp-Source: AGHT+IFoA0z/dWSeRrhaQCxpEyaS5InV++U7BacjcgQHDxZ+U0NaX05gW0/hf/3u6RKo+b/tTJIzZjwYfVvPtT7J30k=
X-Received: by 2002:a05:6820:1607:b0:5e5:c489:6f3c with SMTP id
 006d021491bc7-5e5c6a4ab8dmr2261280eaf.5.1727277468668; Wed, 25 Sep 2024
 08:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240925131141.3655587-1-Deepthi.Hemraj@windriver.com> <29158.1727270173455270657@lists.openembedded.org>
In-Reply-To: <29158.1727270173455270657@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2024 08:17:22 -0700
Message-ID: <CAMKF1sp+X4DJ1WRoBMiCf2OCA8dGqDmf6-Vh1VfYsemTOdfM8w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204963

On Wed, Sep 25, 2024 at 6:16=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Testing was done and below are the test results:
> After update:
> PASS - 4779
> FAIL - 147
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
> Below is the failing testcase
> FAIL: nptl/tst-thread-affinity-sched

Is this regression ? and is it a persistent failure ?

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204954): https://lists.openembedded.org/g/openembedde=
d-core/message/204954
> Mute This Topic: https://lists.openembedded.org/mt/108647219/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

