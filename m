Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DA5EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 15:14:39 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.37877.1694358877348524848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 08:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gDIJOPFw;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c504386374so2834014fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694358876; x=1694963676; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA2StoY0Hc9iK20Q0M7Lest1rQjvYtHiuo7jN4gfMvk=;
        b=gDIJOPFw4wYxzOsZw1vHiHUFxM9c6yRv/LLe7pVwMul6i4py3J6nZxJZ83HMFegnkJ
         Lpc7kPtGrs66aR2RdeuiBKnO/v/su0tzelc+wOpfi3S8dMnPEeSHwArCffNnOULVb4e7
         K01zlEnFF6Gza+m1i2NGH0R8MRPUdQ2DuDclm+Mo9gVqpA3Zc8GPaoGSYrdS9ip+fKH8
         ruSshBdfNZ9VwTqsboXHbQjS6UH1ndlSwsW80Fdr1Snb141NWwyDagS2WmF/QYuO+wpz
         aXxu340Btde1PqyidwDEAwn8g+WQ569BxUo7omupli6Po/TAX8QenN2wsjmW3sS9aliM
         1c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694358876; x=1694963676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA2StoY0Hc9iK20Q0M7Lest1rQjvYtHiuo7jN4gfMvk=;
        b=ZH+tHF3VwiyDIoKek6vjwPJEv8T57++sZF0f5JWp8bqSVBF2v2C/bQc+UMZYMfsM9X
         ux1QMcn+eqaBved7j8Ic+sDrSMeo+RJSGEzFkN7fcvW2qlHy5zQs0T4WQQfpEIZYdOTN
         3Z2WWdnm117uz6lz7b0eFmqPlp9+jWJSt+T1kRTEC6ETM8ECBUyOFHY5HoOEhtrO0SL2
         hNCrqDMbpYRdUQuWro2/CVk+g8iSGLH8Ib1NS13wD03/rBcgsC8nUpxyabeIFZx6XrAc
         J6soo0mvS6OVWOSwegSLOB3a6eJ8j5eV5rmpBE4jzb1oZ0Bo438l3ex5tfVD3QcbBOxI
         i39A==
X-Gm-Message-State: AOJu0YxZMM6+UbSGSO1pxns88XpW003YPfT2Lkkf5qa3SQ2KGiRg+JVg
	zu1vdsrN6Ykzz6Umpgt0H5cwSVSmXOhjxWnu6e+WsdIs7wk=
X-Google-Smtp-Source: AGHT+IHbyGDOdAda1GRG4lbymJRGlWqy59cj2C5vrZ4bP6Q8r70FyYMufoRr1T3DMQdB65O35UN6QXut1RG0il0R2Qw=
X-Received: by 2002:a05:6870:1955:b0:1d0:dc5b:d67 with SMTP id
 m21-20020a056870195500b001d0dc5b0d67mr9170466oak.42.1694358876458; Sun, 10
 Sep 2023 08:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230910111820.F2D05106AA0@builder.sakoman.com>
In-Reply-To: <20230910111820.F2D05106AA0@builder.sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Sep 2023 08:14:10 -0700
Message-ID: <CAMKF1sp14CrQ=0CntN6wJ6Va+rCBtVY8Je0AQAx8cxQwS1Yg7w@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 10 Sep 2023
 01:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 15:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187456

On Sun, Sep 10, 2023 at 4:18=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> Branch: master
>
> New this week: 10 CVEs
> CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-3563 *
> CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-3637 *

These two are addressed in the 5.69 release which is already in
master. So I wonder how the CVE scanner missed it.

> CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4733 *
> CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4734 *
> CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4735 *
> CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4736 *
> CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4738 *
> CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4750 *
> CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4752 *
> CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4781 *
>
> Removed this week: 3 CVEs
> CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3772 *
> CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3773 *
> CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4128 *
>
> Full list:  Found 36 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2022-3219 *
> CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-33065 *
> CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-3563 *
> CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-3637 *
> CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-36402 *
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2022-46456 *
> CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2023-0687 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-28736 *
> CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-28938 *
> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3019 *
> CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
> CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-36664 *
> CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2023-37769 *
> CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-40030 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
> CVE-2023-4569 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4569 *
> CVE-2023-4611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4611 *
> CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4733 *
> CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4734 *
> CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4735 *
> CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4736 *
> CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4738 *
> CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4750 *
> CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4752 *
> CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-4781 *
>
> For further information see: https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187452): https://lists.openembedded.org/g/openembedde=
d-core/message/187452
> Mute This Topic: https://lists.openembedded.org/mt/101270898/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

