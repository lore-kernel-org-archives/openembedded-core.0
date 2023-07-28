Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1C7C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 10:57:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.29650.1690541833642218800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 03:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GysdWRSY;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so3475129e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690541832; x=1691146632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YRNen5YkNMgzpLoh8uOsDdCo2SRprLutmMC8ZKaCFmQ=;
        b=GysdWRSYtTlRYUhogl7xF5LMtXR0ZyWnvLSIE1s4FJchMqmsCH1rxA6k7kgdXF5jAi
         0rht5TvfBsVQQ0Ly+Z0BX2J+mzTKTqqOI0yEP9UK2aiJcKd89a0A/QMDvHs9baD0IOO2
         BwbEFHduymzytdyj/7p4CGobjxck729A1vzIR7qLHSUqobXZYFgGOaAFNJV+u3s2YYEu
         bWy0ifWkCAdETe/gPSQ7zEFJgwq/mydID5Kn6a+PCx+lh60QFdFEgjguhCTdym39DoCl
         0noiVQ64VO9Y6dqp60pFal/hWCYyUkkur4f27e6p4cFjIh2FE5aDsjrbBtpP6gRy3EzV
         LUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690541832; x=1691146632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRNen5YkNMgzpLoh8uOsDdCo2SRprLutmMC8ZKaCFmQ=;
        b=fR8vGJql3RhEClxEtOEcjX5aMTD9L40jw4NC0h8CViCwfuj0vD9f8TM7rC+730/63g
         +Qp0L0PCjtPCdtqiNYf8CytTQdftPsKToRRrM+6V3WdnoTNh3BiO//H4ABoaScin976e
         RjHfhnJjZDp6rYxp1LGu0jrw43xS/508uza8ewK9BBJeZ1jK5QfyzTJT+PE0ltwv2yw3
         PJHHPHzpXG7PZP47VmSqqJrHmaUGFUxEL4M20YkHD/xoDWkI4xLsUNI+p1z39DmKFQcW
         JXxG5C+jTi5BZeag7LoqqdFRrpJUXmpEaXLikBmVZx2+3w+26igeLcFd0BMs/ApSduCr
         a/SA==
X-Gm-Message-State: ABy/qLZHGr8SEzfQHf19LA5T7YUS+IuQhL/DouwexSAucR4LwmvbBQ0N
	JSVmAauMq4NSRVv6MmynNRrzXARTTp1Xux4hgFc=
X-Google-Smtp-Source: APBJJlHEOfL3l9WdAw36Xyh56WmQMSHMbCVnWWbJia6mKracRm4di5JTfhrFbEkSQOtDLyIiu//BGVPJbw9XPpzSwKw=
X-Received: by 2002:a19:9111:0:b0:4f9:5580:1894 with SMTP id
 t17-20020a199111000000b004f955801894mr1301639lfd.15.1690541831453; Fri, 28
 Jul 2023 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-8-alex@linutronix.de>
 <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com>
In-Reply-To: <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Jul 2023 12:57:00 +0200
Message-ID: <CANNYZj8pdcvQebawV2q4gnH09VRs=hgM9WNoJYQaa+4y-dUhRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 10:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185019

On Thu, 27 Jul 2023 at 18:09, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 7/27/23 7:36 AM, Alexander Kanavin wrote:
> > Unset LDFLAGS as the standard ones do not work when linking EFI binaries
> > (the new version of gnu-efi adds various apps).
> >
>
> curious about which ldflags are problematic from OE env.

| x86_64-poky-linux-ld
--sysroot=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot
  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map
-fmacro-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=/usr/src/debug/gnu-efi/3.0.17-r0
 -fdebug-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=/usr/src/debug/gnu-efi/3.0.17-r0
 -fmacro-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=/usr/src/debug/gnu-efi/3.0.17-r0
 -fdebug-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=/usr/src/debug/gnu-efi/3.0.17-r0
 -fdebug-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=
 -fmacro-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=
 -fdebug-prefix-map=/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot-native=
 -Wl,-z,relro,-z,now -nostdlib --warn-common --no-undefined
--fatal-warnings --build-id=sha1 -nostdlib --warn-common
--no-undefined --fatal-warnings --build-id=sha1 -shared -Bsymbolic
-L../lib -L../gnuefi ../gnuefi/crt0-efi-x86_64.o ctors_test.o
ctors_fns.o -o ctors_test.so -lefi -lgnuefi
/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot/usr/lib/../lib/x86_64-poky-linux/13.1.1/libgcc.a
-T /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17//apps/../gnuefi/elf_x86_64_efi.lds
| x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'
| x86_64-poky-linux-ld: use the --help option for usage information


> > -FILES:${PN} += "${libdir}/*.lds"
> > +FILES:${PN} += "${libdir}/*.lds ${libdir}/gnuefi/apps"
>
> Do you think if there is any positives of these be packaged separately?

Not really. gnu-efi is a static library that consumers (e.g.
systemd-boot) link with at build time, so the main package has nothing
other than these apps, and one small .lds file. If there's a better
way, it should be done by someone who's an expert in it.

Alex

