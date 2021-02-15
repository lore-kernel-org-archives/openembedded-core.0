Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.53.1613421992049791597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 12:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OauweqCv;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id y10so3736373qvo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 12:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xwuN9qyE78DRtiJYS6CBDNnI0x4fVMO1cZWMF0KPJE4=;
        b=OauweqCvjpqt2s6FuLmvY1g+IpwOCesripMxoOdqwFzwcvkFQO+z5m6SEchP+Hi07g
         zxOyFFN2fEHG3kSOppZt6b/jjUWLIStp/LOabtOz5RgTedJJ80l7s7doPnGdUmH9J/+4
         oNQ+PC0vRZro5NqObWeAn+tPraXF2jwXs1+Xykg9JqhoG+MFYger31DdWr4oiPMKrQjd
         JqNfQoz+LsCWxPlMWr9hjfq4xWqm/OC/WfFp8UqdfTQDc43jC0myi9KbJyI8mFAFU7nn
         4l7CBuhokDh70wDyxfwPxC+tHbgTKFoSgrwqUjRnHMqsbs0iOimJD6uhO851lxpmI5jI
         ZY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xwuN9qyE78DRtiJYS6CBDNnI0x4fVMO1cZWMF0KPJE4=;
        b=mXluJbCuNvfK/t82qB4KCIQJaBYH+eI2Zk0kahnjKDH0ky02wlhS+MW9KOlpdrv2oN
         mJ8ACNim4VFPaZ4GSGwSYW96Rm80H0v2o9/KoCNqlQVnFQyC3Bqp4SfpDH4SK3NV+fI/
         giIfUyZVOo/6ybqQKB1rXQeuE7oEuX3WkwXRwE9Ntl9T2nDWOp9C1rh273sYrCZHbztF
         D83kV/ov1k3nHZaAKQdN5ik2FZ8MC5OxXPqIfqpq4Kb54kyrUy4BJO0G5zJeeerAHxM+
         AMPmB0FHYGWIPUJbcLpFU/XN6CP1sEY29+ygsBbkOYtxm/B2+zYSIM8eSR2o+apoRnRE
         gtXQ==
X-Gm-Message-State: AOAM530r7MQ6Tx8Cqs923O3elpdV+p7GNAqbppdMn1lkUKF1zgRoxNGM
	eCmNajgqNKreJner3TVQTXyNE0qnZMkn+C+3yUw=
X-Google-Smtp-Source: ABdhPJwT14qMtBlznczaT7NpcKkeh3xiONc10FLM4yQvUbABxX1jniJYQO5a0X1FKqeM0s6PthFU8A8HwU2t0ocnAHE=
X-Received: by 2002:ad4:4693:: with SMTP id bq19mr16478015qvb.43.1613421991280;
 Mon, 15 Feb 2021 12:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20210212045335.16612-1-champagne.guillaume.c@gmail.com> <CAAnfSTvUJvqH0ZNde7VpqTFdLrMC022+T1HPKigUYKDhDZc=WQ@mail.gmail.com>
In-Reply-To: <CAAnfSTvUJvqH0ZNde7VpqTFdLrMC022+T1HPKigUYKDhDZc=WQ@mail.gmail.com>
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
Date: Mon, 15 Feb 2021 15:46:20 -0500
Message-ID: <CAHSN6OfaLBdt7JFtc8Zs7dN6NiLyBOniynzLoMn=eKe6EfC_Dw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/2] replace qemuboot.conf by qemuboot.json
To: Ross Burton <ross@burtonini.com>
Cc: liezhi.yang@windriver.com, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 12 f=C3=A9vr. 2021 =C3=A0 06:48, Ross Burton <ross@burtonini.com> a=
 =C3=A9crit :
>
> On Fri, 12 Feb 2021 at 04:54, Guillaume Champagne
> <champagne.guillaume.c@gmail.com> wrote:
> > This fixes bug #12503. Sending this as an RFC since I'm not sure what t=
o
> > do with autobuilder-worker-prereq-tests. It fetches a qemuboot.conf fro=
m
> > yoctoproject.org, but this cannot be changed yet to qemuboot.json since
> > it doesn't exist on there.
>
> I understand that you're simply fixing a newcomer bug but I just don't
> see the rationale behind the bug in the first place.  Copying in
> Robert for his opinion.
>
> I'm unaware of any real world limitations of INI files that are a
> problem for runqemu.  We either break compatibility with existing
> builds, or have two separate parsing codepaths in runqemu which

Fair enough, I asked a question to that effect on the bugzilla report
a month ago but didn't get an answer. Someone should eventually close
this ticket / remove it from the newcomer list before you get other
contribution attempts regarding this .

> complicates things more (as the ini path won't get tested).
>
> Ross
