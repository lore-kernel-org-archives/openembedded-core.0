Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A01FC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 07:17:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.12339.1720163847618549948
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 00:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gw2lhlog;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3678f36f154so711357f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 00:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720163846; x=1720768646; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbQRty5Jobl9xolNkMG4gbeI8lTrGMLOis33wHmFqbo=;
        b=Gw2lhlog21/yuCsws2SPM6lyMYQeFL+UJ5qEnW7cY2s+0iJfdpi3EBQbG0K/RcN0SI
         btD5iZNVSFuuKDLTD9ydgWcRWoTGlajiASgkrNngHIzgK1egthsWSm+8hJfxDfnhhvga
         kovCjrAwDDrjE8IvOH9s8A7/vv//YRJQlNU9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720163846; x=1720768646;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbQRty5Jobl9xolNkMG4gbeI8lTrGMLOis33wHmFqbo=;
        b=N47dK4FMlVFOOpgTuJh2AXQ0u/Me2IWsAqoOHIlMbCHnftLAhY7feErFEo8GXU3bin
         ukcnoWpB87kiDOSQRmEtsKxhgunwPP7U3ZhEIAlR3Ehb887OcsC1HAnuyD/8hfwxyqJ7
         nI6ZlKLdkFRUGDGVNMFWVVTKisbstrBe/6VnF0o0tZL4WdQqnLB5dxrLirYUJFDgPxn8
         +qhBc/tj0OE49EjsDHZorUlkd6Kd8NLqNn2AO6aTdVP/PGrW0UFwvne9rz8g/LrZWXwS
         4QBN/2EdlMwd5YNPQLTWpX8IwcKBt3pgyXu7R6rIEomLwy2EiK1rPiW9V2dmtXCDV1uX
         i/SA==
X-Forwarded-Encrypted: i=1; AJvYcCWbjCUs5TQB17DtD2MeWT9yxoQSlzTgoSVGFnBfs9yb4c04bm9ID++HOrz8mx6mb0aKX63HR7aPERRLtBMHYudwbjWrr6971mitlbnSTAQVcnlCthNJi0+N
X-Gm-Message-State: AOJu0YyXhQINw4oBZ0MBl6iQPryxMWQWsDfnLprLQ4aHfYGpfL+46SRV
	fwY+9yBF2htegXaafop4jMTbf5WTeiPRBdN1lZ74M/ot9QG/T4wCmLRO/56vOG0=
X-Google-Smtp-Source: AGHT+IHyPl/kD8GQO+59qbY8BNcuAu4vPgqvo6XCI/3Htp7m17kQCST5sPcbzav0kPEn7vteSaPX/w==
X-Received: by 2002:adf:ff92:0:b0:367:9522:5e6d with SMTP id ffacd0b85a97d-3679de7ca93mr2860312f8f.52.1720163845932;
        Fri, 05 Jul 2024 00:17:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c? ([2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd66fsm20339618f8f.8.2024.07.05.00.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:17:25 -0700 (PDT)
Message-ID: <9d1f2e3193eb4a866145202e605ace1354f81a8d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5 0/8] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 05 Jul 2024 08:17:24 +0100
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
	 <20240703140059.4096394-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 07:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201589

On Wed, 2024-07-03 at 07:59 -0600, Joshua Watt via
lists.openembedded.org wrote:
> This patch series add support for SPDX 3.0 and sets it as the
> default.
> Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> the same time
>=20
> v2: Added tests and addressed feedback
> v3: Fixed several oe-selftest and build failures
> v4: Fixed silly typo mistake in staging.bbclass
> v5: Reworked to make SPDX 3 output reproducible by default. Variables
> =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are documented =
as such.

Thanks for working on this. The patches generally seem to working well
in testing but this does look related:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7109/step=
s/23/logs/stdio

Particularly these bits:

AssertionError: 10 !=3D 0 : Missing objects in the cache:
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/a6/eb/sstate:perf:qemux86_=
64-poky-linux:1.0:r0:qemux86_64:12:a6eb451ebf8142b51d88b66b79ebbfc43019458d=
7e335e0a1b2a79e19cf3eed6_create_spdx.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:qemux86_=
64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7f65dd180=
8bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst

/srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:qemux86_=
64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7f65dd180=
8bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/31/ce/sstate:core-image-fu=
ll-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:31ce987a3b0b34b0d2bba=
cab96b4b9848f851caadd1f1fb1522d38c2b392c65d_create_image_sbom.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/2f/cf/sstate:core-image-sa=
to-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:2fcfbfd93928c643c30f92b69=
cd17e19f4dd9136506e0bf1373a28883593d3a9_create_rootfs_spdx.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/1d/de/sstate:core-image-sa=
to-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:1dded8f18500fb63356331c5e=
4f5eee5fc35c113398ec98ad7bed1d82c3f330d_create_image_spdx.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/6a/92/sstate:core-image-sa=
to-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:6a924154d59877cfc4527602e=
72d0984c1fa7b685ac7f93fa8bee225a5de57e3_create_image_sbom.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/62/47/sstate:core-image-fu=
ll-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:624764dcea54752c3f6f3=
928f6719b440728eecd7516b85d80d37b305c56f530_create_rootfs_spdx.tar.zst
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/7c/6f/sstate:core-image-fu=
ll-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:7c6f212fe1a869ae8edc2=
51f2f9c02e939a5f2b659fd77e9b4bb262eb60f6f5d_create_image_spdx.tar.zst

Cheers,

Richard


