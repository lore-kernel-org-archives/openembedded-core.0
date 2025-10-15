Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D1BCCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 03:48:29 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.7532.1760500099939114112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 20:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BQdD4ygT;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d5fb5e34cso8507177b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 20:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760500099; x=1761104899; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNJbKRrSwYVGbhspAnwSNfPeLxNf4tP1BVL9Mk8QsAc=;
        b=BQdD4ygTtPOCJ0+8cLwK1g/SQuQvfOEYTfmxUP9C+pbmp/mnC8rSbdKEiyJqCwujXF
         Iq1ELTmLg22JTeo1cu7kAoTsd0A7HV3xcYhuB9XYMSfG7WM2+D/zt5JDAwz7IDI0OW/3
         8vjtWRMmRbFfGbAxYAW+RvERPRjtveJPwM3Tou/24LumcFTCEBbNMJDPGnydpni745DZ
         3u28OJYR2IkyJ7f/5b+6uz4EiPCLwWheFCpOg9jLY5FKsSxvRXbukHd0QJoWi6vrEqWN
         j8F2fggNhlI5VWUXgB8ao8X/iXtzrG7YVlfdsxXGnomz5fDmPM7Ts/aBWLqFfiWQj3Qp
         e5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760500099; x=1761104899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNJbKRrSwYVGbhspAnwSNfPeLxNf4tP1BVL9Mk8QsAc=;
        b=OHTuwtN9pmkwJw3dxp7/kK32FytPHyxFJcpsRMB2b34FvaO/CPW7Kc3SsGTk6aQnLS
         gGFMlsuVrrLFb8Ew3DBmXj8I4PisCSwFXBUyG5HbYAkXaRMauj4Rxot+9x07UNgJ1sGn
         ivNMbsxa37JEYhmoGurObqnbQDvvvf5jq1hS+7I/IeNHPFKqbnje5+SM/X/z133XrXPV
         l2CrPfwnuNuwOc37b5GKLyxctgc/QjCti5xuiVmIPiCB0vmNv6EOq9cCRFJxhKib+9ov
         yFuWZhSP28TTqTgkf9O4DqoM7lr1ctcXziy+afnDANBpMXS5o958l9Xqw64XyBf5uSx+
         R5YA==
X-Gm-Message-State: AOJu0YyROg/P9ozJpgN9RoGAu9GJfz2DWKPgJ8nY8Pof2PBfBto0vBiR
	YOWzRGPnjTZzdZgWKxwmCRLAS2LsuNW4RTrrilHTDsbI/9ESZYrZs3N9lgD+p5LKvsHVwJY71Pz
	wwaBmHrpEd9UTf6KPwwOFj+qGEJUu0O0=
X-Gm-Gg: ASbGncvOmAYbv2Do5fP6dVvYlo6RS8JnTRy6zFFOp4mMS/GZJgLfYnHJIzIpvui/myn
	LiCnZyXNDRgQdQDDbOoHX109OsVcKyupWVK9OSDneyL09M1OHOWm0yBA4eRZe+tlr7dkFBt3JmH
	g6/86ERDSFIPflC9ScCjbVq7d0U0JKYdXe/A9zfMz0gw7DpZkjqxkQSlnmvhFLWSUB0qHM7NGRC
	t4nhXtNnAZ+DAjqMPnSzSHPQeOVVJjrP2MbpXugH4jAQTwl1lFEK63oIHFf0pZf8ubBkfHy5+Lh
	xFJNGl0rFjzFuUScPlNUvPdiG9K26r65GPbQ
X-Google-Smtp-Source: AGHT+IFGxoIsUv0gYicKeN4eI6I2JIwvWNnf/X+r3pjgx3+hAKKeBaZKJs+qpRErYxNpoki9JbINX8IReIzZbMw1rHQ=
X-Received: by 2002:a05:690e:2514:10b0:63c:f5a6:f307 with SMTP id
 956f58d0204a3-63cf5a706f5mr8262664d50.30.1760500098917; Tue, 14 Oct 2025
 20:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sohg3Bf3h2NBdcFdrCebPqOuVq-OUwku556Hfp6p--Gbg@mail.gmail.com>
 <8400.1760495582957874981@lists.openembedded.org>
In-Reply-To: <8400.1760495582957874981@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 20:47:52 -0700
X-Gm-Features: AS18NWDLE7NoDRvPEKXAEoPx01GPZ-Wd3O3Q8qzdEUMkSqTLWkO3lTPcBNsIvNU
Message-ID: <CAMKF1soLStA6ZX-1PH7cGSwDgJ_XeFrtjUzFC7wZX3MeefLJPg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone 04/14] glibc: Remove partial BZ#25847
 backport patches
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 03:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224874

On Tue, Oct 14, 2025 at 7:33=E2=80=AFPM Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On Wed, Oct 15, 2025 at 04:27 AM, Khem Raj wrote:
>
> are these backports being done in glibc 2.35 release as well ?
>
> Hi Khem,
>
> Yes, I=E2=80=99ve submitted the backported patches for this pthread issue=
 to glibc upstream for the following stable
> branches: 2.38, 2.37, 2.36, and 2.35. You can find the submission here:
> https://sourceware.org/pipermail/libc-stable/2025-July/thread.html
>
> Carlos(Glibc maintainer) has already taken the patches into 2.38 and ment=
ioned that he will review the
> others (including 2.35) as well. The long-term aim is to get these accept=
ed into glibc 2.35 upstream too, so that
> we can eventually drop our local backports in Yocto through regular branc=
h updates.
>

Thanks for the info. I am good with these patches.

>
> Thanks,
> Sunil Dora
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224872): https://lists.openembedded.org/g/openembedde=
d-core/message/224872
> Mute This Topic: https://lists.openembedded.org/mt/115762087/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

