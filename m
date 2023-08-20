Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A63EE4993
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 17:31:00 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.131.1692552657491497563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 10:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hodwIvJ/;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a78a2c0f81so1854166b6e.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692552657; x=1693157457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8mjk+F0q8LeLEvl6uk1YVljoPofhv6Wvpu1/htu4pA=;
        b=hodwIvJ/z9HzKi9+3gRYlNdgNgsC/Ahdn6VWigb1gOxUvBwR6w+nfsMdXgpr8cCBNE
         Tl6n+Ry92jhukKzxJpsHDmBOhQymTWqU0YjpZKqVxzPbMxyV8N6QtWSIVHk2sBiL2NU8
         LI4Xj1MBRCpuLhU0K+qTGqpY1VMyZngZv2YkGPPkU0FBrpwikwG2Ck9c7bLSpRgCPzmH
         Emo/WTf23tge+K6WZjrY71ZM1drYK7E9hQiIqBKE25ekEiozntL/nvOVAkkKS8ACh25r
         j3V9OWRmsTKuvmSPxbsCLz2yJ+npms1CppC5Zz/fT8CrHRoPNoFtYjgoR4PMy7P2IgHx
         tfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692552657; x=1693157457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8mjk+F0q8LeLEvl6uk1YVljoPofhv6Wvpu1/htu4pA=;
        b=QIIvIfefaL3fIz1lTzFjypAUGsNiglnLA+379gMbifiM+YL7trNLP/mU4sReS+dFCd
         Be5ZVmpDwQORaY7malnYlgwzngQXy4BwKGv7fGBbDKpy8YnVqiExqamADKN7MYrP9fsD
         R3T9ALxmA7hkbmI5NLZQ+MWkG2Nlb3FFg6oqjmAgdjl+RZ6msHnrp2mhTfe/jeRWwHiR
         eD6xfOcOE2Lo81tfdD7h6Ycy412YyE3TUuB00S5Ddu/gcTQkTtJ4ECV0+r9fvR9uRDMy
         yAuKr+2BWd++H6H0mj1qu+eEj3KVy7ClkEBXzEsO03Z997sPkr6cJyf5O1KWiHZfqPZp
         25Bw==
X-Gm-Message-State: AOJu0Ywcsxo/Fr9X94c7qLbtyUVt4klUTSmItHM3pyVmQU1r7/ouQ3e6
	maW2FY61L/rdYA6HncK4b1WlDWZnazSOs+cXziXcRKFM+fz2UA==
X-Google-Smtp-Source: AGHT+IGlKTxSMJtbiREEo+q8rL+Ap3aeYLz1qrvK5p/o6nVSaFraaHa8WThlOCIpQ/DN7ftvg8CQEODdvjYHDnXne1E=
X-Received: by 2002:a05:6808:210a:b0:3a3:640d:ed71 with SMTP id
 r10-20020a056808210a00b003a3640ded71mr6274844oiw.10.1692552656750; Sun, 20
 Aug 2023 10:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230820111950.15E381070A5@builder.sakoman.com>
In-Reply-To: <20230820111950.15E381070A5@builder.sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Aug 2023 10:30:30 -0700
Message-ID: <CAMKF1srJgDx0w8NvQx+0WE9OPVdY+mDOz_q1En4nsXH=CPaBbw@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 20 Aug 2023
 01:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 17:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186414

On Sun, Aug 20, 2023 at 4:19=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> Branch: master
>
> New this week: 3 CVEs
> CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2023-0687 *

We are at 2.38 release on master and this release contains
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D801af9fafd4689337e=
bf27260aa115335a0cb2bc
which fixes this problem. So I wonder why it appears in the scan here ?

> CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4128 *
> CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4147 *
>
> Removed this week: 15 CVEs
> CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-3533 *
> CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-3606 *
> CVE-2023-0160 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-0160 *
> CVE-2023-2176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-2176 *
> CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-23039 *
> CVE-2023-2430 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-2430 *
> CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-2975 *
> CVE-2023-3446 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3446 *
> CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-35827 *
> CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-3618 *
> CVE-2023-37453 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-37453 *
> CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-37454 *
> CVE-2023-3817 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3817 *
> CVE-2023-4132 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4132 *
> CVE-2023-4133 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4133 *
>
> Full list:  Found 29 unpatched CVEs
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
> CVE-2023-1206 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-1206 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3019 *
> CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
> CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2023-36632 *
> CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-36664 *
> CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3772 *
> CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3773 *
> CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2023-37769 *
> CVE-2023-4004 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4004 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-4016 *
> CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4128 *
> CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
> CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4147 *
>
> For further information see: https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186408): https://lists.openembedded.org/g/openembedde=
d-core/message/186408
> Mute This Topic: https://lists.openembedded.org/mt/100852965/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

