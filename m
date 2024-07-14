Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FD2C3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 18:37:11 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.21470.1720982229350302637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 11:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTqOWoy2;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2598001aae7so1951288fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720982228; x=1721587028; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMWlzMJe+p5ghnGaYoOivw2qBffCQS8B7RO0AbAh2UI=;
        b=YTqOWoy2f9rflRY5/djv/7MZ1ddbGXS8yNgScyhfclWmG5w9S4PQl0nOYr2zxjwum+
         1JMNbqDGxnxpcnJIYmobexjkSDTMo38neZZUlOhSGE7acqQrGdNsyy+NfwmteVtglual
         1SafqGbUjh11go/EZRkEK/u4bqcMatG5HHz6EdL1hxXFDvKCsFWRNrfkl+bAw9DBUys9
         9F7484faYXBtGM3dYXdI7bpt5xNyGORsjbvhejVJzGZfU0TDO+Ogr1sou51lNZvmqjpq
         Vc4XNqXfX8l0bSwvCrhWK4+iD+GsTnIhVmi3wTi2KkJNfZsGd5qTZCJLiSNO5/IR/Jfd
         v5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720982228; x=1721587028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMWlzMJe+p5ghnGaYoOivw2qBffCQS8B7RO0AbAh2UI=;
        b=FlfpC7lE8aPqPpvcgTkcGsKhLfnDYZFLCvBRZb7bKTELadmRk8d0h6zddXKBs8+rve
         UuCyc3Ra6gJBWtbn+G+jqnRzVBaNOolLIqq8rWnbg7++EnwhIXV8Imrq3JCu5L/xAdS3
         eyaq+uy/lhW9lyouvKLpHPFujlNgZD5rQwaq87gJuwkD5Uo1pp35kgsqxqF4e/Qyj4U2
         x+fQfHWuHisr7U/03OVJMIlWJqfbW3pDrlNIwNIYDlVBlhoPvFWRu3dnxe3njBYA9n2D
         FCT248yKbU6kueoy2SI8ZnopIJ4kUcZb3SWEEeFSLFRlzr8ZiOAB1bTIhA4dV5BImI6M
         aZSQ==
X-Gm-Message-State: AOJu0YxbByS5m9zy4fD2o4wK5zPG/YoinfzX1PbZhOA5Mjk/VAgedF0x
	5JVEwoNhqghBLYoxVdB5GocTct4DAOLZxR8yjz055iYMHUcfXN3ZQ9pHtnOe0dk4KL05qYoORSx
	BDiRe6Jd3Kc/ANSg6vBFUwggxpDE=
X-Google-Smtp-Source: AGHT+IE3PC8ixvVdLucfF0J2378IubJ2lLGpcKQ5X4RDknt8o7Hrh2hN4oNyyrO4hu1BIYhwnKIKJUWO+D7l/eHQz5w=
X-Received: by 2002:a05:6870:41cf:b0:25d:f285:d013 with SMTP id
 586e51a60fabf-25eae7b64c7mr13398297fac.15.1720982228512; Sun, 14 Jul 2024
 11:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240714111926.59CEF100437@builder.sakoman.com>
In-Reply-To: <20240714111926.59CEF100437@builder.sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jul 2024 11:36:42 -0700
Message-ID: <CAMKF1sr22S2zUwT+qXvjSSkwjCarx-hpECf2HNaG-x8Qiy9aCQ@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 14 Jul 2024
 01:00:01 AM HST
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 18:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201891

On Sun, Jul 14, 2024 at 4:19=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Branch: master
>
> New this week: 2 CVEs
> CVE-2024-36288 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-36288 *
> CVE-2024-39472 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-39472 *
>
> Removed this week: 2 CVEs
> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-42363 *
> CVE-2024-24789 (CVSS3: 5.5 MEDIUM): go:go-binary-native:go-cross-core2-64=
:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-247=
89 *
>
> Full list:  Found 39 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2022-3219 *
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-s=
anitizers:gcc-source-14.1.0:libgcc:libgcc-initial https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-4039 *

This seems to be mis-diagnosed, CVE-2023-4039 is fixed by this series
- https://gcc.gnu.org/pipermail/gcc-patches/2023-September/630054.html
and it was committed into trunk of that time which eventually became
GCC-14 release. and the above said patch series is already part
of 14.1 GCC release. While we can add an ignore in recipe and squash
this but I wonder if the CVE checker tool has something missing here.

> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-42364 *
> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-42365 *
> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-42366 *
> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-51767 *
> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-6535 *
> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-21803 *
> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-23848 *
> CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-24857 *
> CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-24858 *
> CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-24859 *
> CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-24864 *
> CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-25739 *
> CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-25740 *
> CVE-2024-26596 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-26596 *
> CVE-2024-26900 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-26900 *
> CVE-2024-26913 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-26913 *
> CVE-2024-26949 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-26949 *
> CVE-2024-26952 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-26952 *
> CVE-2024-27012 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-27012 *
> CVE-2024-27017 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-27017 *
> CVE-2024-36288 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-36288 *
> CVE-2024-36971 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-36971 *
> CVE-2024-39472 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-39472 *
> CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6505 *
>
> Summary of CVE counts by recipe:
>   linux-yocto: 31
>   busybox: 3
>   qemu:qemu-native:qemu-system-native: 2
>   gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-14.1.0:libgc=
c:libgcc-initial: 1
>   gnupg:gnupg-native: 1
>   openssh: 1
>
> For further information see: https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201856): https://lists.openembedded.org/g/openembedde=
d-core/message/201856
> Mute This Topic: https://lists.openembedded.org/mt/107212366/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

