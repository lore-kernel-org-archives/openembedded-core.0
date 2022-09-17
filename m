Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B75AC6FA82
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 14:04:30 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.6220.1663423464581254039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 07:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GwqjqPVG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t14so40302033wrx.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=+cLl5OFMskO3/J8ShdbMONMVQr0QznyYrhWfzM9nxZc=;
        b=GwqjqPVGTwk10LWzAewMLuDpw6FqVuUe73RCQk7LCdBOXKEv4p64R/2st5NPAcQE0o
         UQLfs5Dna3rkYutPQGvX/9GYzkV11EQCVaM9UgOez1SLnDq6Avl49fZtLvBzgtmdFn86
         r6oKYvRnrr8S1HxRaykci/bLMKC/ZfPCDibwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=+cLl5OFMskO3/J8ShdbMONMVQr0QznyYrhWfzM9nxZc=;
        b=I/RhR3HFJKkBdU8KdJ3BPXsv83Vt6bduHaAVpnX1pNHxrUJEddtx/XWwG206Uk9VsG
         /dzuC75QaxxBf+/kTZRonNTy5RGmghW/iEEDHXpjIimonAabW7qV2NeP5CDhBy/Qo6FK
         SFrP153DW1ZrFVjNmqfLDt5kTc9Bo9OVWPNht0KHXIaRKaxFKci4BDBkPzZIW+eJM0mV
         fOZ/gWRgYBJ/HCch15CUo5GM/rC92ST0hI38KBuH4gII2AKocvM53WAXTcOQ8cc3Qs1i
         8vOmFqwh5fBNwD5IwXHEcWUhIyRoxGb2qPS7PJRZZ2mue5NVGjmTM0IgmtJ/SqmLN421
         fkCQ==
X-Gm-Message-State: ACrzQf3S1MzMC23YiakZjmDVWlit21cbPAHN7KAuKg/751pDcL6wtoxS
	pA5uPDpf9bJLZpuxLfgvb6vVIw==
X-Google-Smtp-Source: 
 AMsMyM4Iahctj9l3q7dfAKmDq4PemA24Ck6t2pSLOVMfT3Lswz3/WnMA2noK8KgVuFG/goV68kd1Vw==
X-Received: by 2002:a5d:59c3:0:b0:22a:4463:5a3a with SMTP id
 v3-20020a5d59c3000000b0022a44635a3amr5505655wry.123.1663423462883;
        Sat, 17 Sep 2022 07:04:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6?
 ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 n13-20020a7bcbcd000000b003a60bc8ae8fsm6066487wmi.21.2022.09.17.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 07:04:22 -0700 (PDT)
Message-ID: 
 <7af0d3563301632f007852d58c406d507f70fe2e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] python3: update 3.10.6 -> 3.11.0rc2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sat, 17 Sep 2022 15:04:21 +0100
In-Reply-To: <20220914120421.551923-1-alex@linutronix.de>
References: <20220914120421.551923-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 14:04:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170835

On Wed, 2022-09-14 at 14:04 +0200, Alexander Kanavin wrote:
> The semaphore fix has landed and is available from 3.11 onwards:
> https://github.com/python/cpython/commit/1ee0f94d16f150356a4b9b0a39d44ba1=
d2d5b9fc
>=20
> 3.11 release schedule: https://peps.python.org/pep-0664/
>=20
> Drop 0001-Mitigate-the-race-condition-in-testSockName.patch
> as it is merged upstream.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-recipe/python3-dir.bbclass       |  2 +-
>  ...ib-termcap-to-linker-flags-to-avoid-.patch |  8 ++--
>  ...-search-system-for-headers-libraries.patch |  6 +--
>  ...-use-prefix-value-from-build-configu.patch | 14 +++---
>  ...e-the-race-condition-in-testSockName.patch | 47 -------------------
>  ...sts-due-to-load-variability-on-YP-AB.patch | 18 +++----
>  ...FLAG_REF-always-for-interned-strings.patch | 33 -------------
>  ...-detection-of-mips-architecture-for-.patch | 33 ++++++++++---
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |  6 +--
>  ...asename-to-replace-CC-for-checking-c.patch | 44 ++++++++---------
>  ...tutils-prefix-is-inside-staging-area.patch | 10 ++--
>  .../python3/avoid_warning_about_tkinter.patch | 21 ++++-----
>  .../python/python3/crosspythonpath.patch      | 22 ++++-----
>  .../python/python3/makerace.patch             | 10 ++--
>  ...python3_3.10.6.bb =3D> python3_3.11.0rc2.bb} | 13 ++---
>  15 files changed, 112 insertions(+), 175 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/0001-Mitigate-th=
e-race-condition-in-testSockName.patch
>  delete mode 100644 meta/recipes-devtools/python/python3/0001-Use-FLAG_RE=
F-always-for-interned-strings.patch
>  rename meta/recipes-devtools/python/{python3_3.10.6.bb =3D> python3_3.11=
.0rc2.bb} (97%)

It is good to have this ready but given the timing of the final release
compared to ours, and the knock on implications of a python version
change on other layers, I'm likely to hold this until the next release
unless there is a pressing reason we need it.

Cheers,

Richard

