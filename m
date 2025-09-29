Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03288CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:43:13 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web11.6033.1759171392212336851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EApGaRro;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6353ff1a78dso3630239d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759171391; x=1759776191; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+JEm+w4mcaHL+XHGngMUB7DoKaxNAAK6Yqg11VmPJQ=;
        b=EApGaRrooc2ukxZM0I/vgjO5dZ3V5tB7XfBvQdyj6K3B2byV4ecRbkUB8i2SJe6gc3
         ySKbQpzYiVAxvPvrbmoPivXCf2/VrpAKeIUVKVE+W0Hx6YYDzN8bQEykTHWgJ+6IED5O
         4/DwUbINo1ESygnpUdRayn1ppPrv9pp05akgZbGyTRSM+qG4dVMg6hecHBZFUDr6kt3M
         BsFbauDjZaTdvZLv/Xwi0FOez6k1FnSm91JD7S5u8RF9st+EKoAigZPT08cFkYHPu47+
         9CwcZXCfT467wXz0ku/L/uFhtBN6/riHowRiFIYxyHxaGsGTbl25mobN45/cL7vQyIwi
         asgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759171391; x=1759776191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+JEm+w4mcaHL+XHGngMUB7DoKaxNAAK6Yqg11VmPJQ=;
        b=V6mQAYNIky549Chx4UohcV2nELbCY1pLg2plzo1xExenW27t05vgZORnB8XSJdaxU+
         +HQ/du5TGlhm8nZ+IVLlDscUJmbMRi5yvRkFQqrdJPel3VCpFkmmLX4RdCblDi2Rf0ik
         iiCdZ1cgli3GujhlolMStbm7AA0hjGD6q2ShpGLzzZSltoevshyQMpdmc0nqxTJZXjpO
         Eipg2YF6eo91yltVNAzhyYkg/MWNHGdeqiyaCO9tilwL1zvgMSGMVKeNXsSovYlcsMxv
         juhpbL2I7PufYYTqxLYUTC803MZ55hdx20Q7R6AyHvPuar+kOibXZmKmBk6TnDguTAnX
         ac6w==
X-Gm-Message-State: AOJu0Yxt/vsESk/CPkZg6hCuFpr4l7eVm4cwVt722XqGgsGmgmXm7tqB
	R++SwvEkZuFhqcRjHVonSYZqAdkzibFDkfjNykNDPru58RCxOIrRd7vJfOkSqIGJAqNZiQKtpb4
	PRn2mzrs8gk8FXw+20M8bUnurbrthmy0ArTlE
X-Gm-Gg: ASbGnctLsOsIhA0J5Vh0wMOpYkLYb6QhLpWQjRdOafU17iM6NIvxJXgneqCPgNq5Q+K
	x/HdU2yuTasEx1ATQh+nbxa2lFp68K55MRqBssCvTopaUWe28uQxbD/WerPf5H1wUQrwvo2WR+B
	YO67lj0+E+fVk790lw3iHUl3XodzjH+U/lWBcSRLQ6xbrXxPRaZRxrQcAL/sT1phRiwGaz3naEV
	pP29FTCz4pgJpwqCSuArsSdD3xAenZoX8Y3r3DlZUbLnINkmgTdMCmKRBKZMA47JUJkV072fqnO
	ODcqGmpXtRXw8/sWYc+S/+NCNbIL/GWP2p9KLENXxbmSEVLW6TwKjLZMUp/uHCPb
X-Google-Smtp-Source: AGHT+IHDjdMH43M4JR/44izAZAc2138m/4L2u3nI0LH3Q9aPjGVzBtsUz66MpKVgF+2emA0069kxG/we56PSW/ha1Ow=
X-Received: by 2002:a05:690e:4304:b0:635:4ecd:75a6 with SMTP id
 956f58d0204a3-6361a8ad738mr15712821d50.52.1759171391179; Mon, 29 Sep 2025
 11:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
In-Reply-To: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 11:42:43 -0700
X-Gm-Features: AS18NWC64kSyq9uEdHkc1bH2SXywnngMZoyxzkPEfqUe66yrsYyPhEsxzWuwTiA
Message-ID: <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com>
Subject: Re: [OE-core] Distro wide LTO broken?
To: william@wkennington.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224164

On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kennington via
lists.openembedded.org
<william=3Dwkennington.com@lists.openembedded.org> wrote:
>
> If I add the following to my distro, the build breaks for the openssl
> and other core packages due to having build path impurities in the
> static libraries created.
>
> ```
> require conf/distro/include/lto.inc
> DISTRO_FEATURES +=3D "lto"
> ```
>
> The errors I get are all like
> ```
> ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> /usr/lib/libssl.a in package openssl-staticdev contains reference to
> TMPDIR [buildpaths]
> ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> /usr/lib/libcrypto.a in package openssl-staticdev contains reference
> to TMPDIR [buildpaths]
> ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found, failin=
g task.
> ERROR: Logfile of failure stored in:
> /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/op=
enssl/3.5.2/temp/log.do_package_qa.118335
> ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/openssl_3.=
5.2.bb:do_package_qa)
> failed with exit code '1'
> ```
>
> Probably there is just some kind of flag missing in the LTO build
> options to filter out the build directory, as -ffile-prefix-map and
> whatnot are already present in the builds. I haven't yet figured out
> exactly what is contributing to this impurity.
>

Inspect the .a files ( maybe using strings or binary viewing tools
like xxd ), with LTO they are flat objects with additional information
for
LTO to work and I think it will give more information.

> Prior to rebasing on the latest master, LTO was working fine globally.

what is the delta we are talking about here ?

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224137): https://lists.openembedded.org/g/openembedde=
d-core/message/224137
> Mute This Topic: https://lists.openembedded.org/mt/115492623/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

