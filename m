Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734B2C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:56:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.49588.1746449797102810653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 05:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jaZCInFm;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so594426166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746449795; x=1747054595; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3730aFGpxHIeZcvtqMWNfh93bh5DnDm6SEb/qfZ7A+g=;
        b=jaZCInFmqYCiKmUyXzTNJJAeaiVY7qV5Oq4EuXLXQ1dCbwodRZsL2pMSS9E+d8bcWi
         +btQwjBsE0v97HbSPohlck+UBoHZghCKf+s/PJNUDl51Jel9QMGBOhf89NTQIKkichno
         b30VOorxWtkmHJd3Vqms613pP54feNESQ+LHR7EWClv9SA4wJyzWxWNvOoFxdFXKK2HF
         ShPdX7ywKjuoPlczbeEVhTRxoeF2C1gx/9IyQzOrQ00PSMTd8CqaAtluIPK3MT638MkT
         9/Md7U2nyg8CYnyYSg1KohKu2GL8atUUS/6ipxtDtkXtGOTwfbmwKepzqPh16EL4U77m
         YoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746449795; x=1747054595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3730aFGpxHIeZcvtqMWNfh93bh5DnDm6SEb/qfZ7A+g=;
        b=wZLXcjn61uziS1hJBhd9iaoqr9rEyPpGQrNTbl/fgxE85vfTzWjcUXIxFgr49pnYQt
         gdd7NgMqD5MbxJPUO/PW2NQ5X4EP92ofFv7SVY0dKbm7yxevSGOOJPtSXdKanUzQc+PO
         WY4DIVZRJCxzhQOlU+2T3wwTMkGcx697gk46d+2d4Eg9firN6vCmLYobDkktdTwGvzyn
         tbvirGOAkXwvZX8NnsJdXtEhRJJYWRcyKJSUIRmpM4UP0NmVggRgCLzGwrI6Hk05W5Ba
         FaoP+mG7ZCVlJJGcnjHxBSQWeaAK/5SdIUZP+2dFBfaMY0SRRu1Lfc4e1aLfyEp4Qem4
         oa6w==
X-Gm-Message-State: AOJu0Yw/kjKWN0MW2EWiZuDajbNLYDmYS7okHvPThpAOw504mpLqyscO
	mjHz54Zki+NDOue94RLnkhyJCqJQum6ZxkYGL/xgaZPmjvSlMH6n
X-Gm-Gg: ASbGncu7OpwVM3FiEDrUKrr4Y33MwslHtzrtyI8IZrz/ORg9kmVS0Um0nAwvJ4fYKB8
	pUeGTsRSLiL6Tz9M7OcDE/u9sW/ebShrUDQYxebHytoncfcJn5jHBM1ponJMvuoINcYuscPNlZv
	LB8xqBUKAPAyCIlQJgfRHG6I9kBSi1bfznRo3OGV18WhBOk1tV+3zYLHAwAwkrSp9uEa7vYqWEA
	YP4lUyiu3BTncP6DUJfjTN+Fy67X8s4G1jTbyFr3qbUZPy5/uUuEqeyROzMNfu2rsS6OqJDHhYP
	DI3rCf1kMGK/ndAe8fiJiRR6xE6ErpHo2d1AiBDPhjFr5ecak5iUC6dONO6w52RONOv5GzNEhNv
	vKeWkTSiroAXXUT7XCMS9lxwSVANwWtFy
X-Google-Smtp-Source: AGHT+IFAfXaUBpgrz5unjR/KGumu3+D8WcRe/LkG5SFlTT99IZd6Zq6GSJGoJZ0VdhrMEEpJVT0KPw==
X-Received: by 2002:a17:907:1c1a:b0:acf:30:7e9f with SMTP id a640c23a62f3a-ad19083710dmr829156066b.40.1746449795213;
        Mon, 05 May 2025 05:56:35 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540478sm489561566b.169.2025.05.05.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:56:34 -0700 (PDT)
Date: Mon, 5 May 2025 14:56:33 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBi1gWY-xOVOBxjI@toolbox>
References: <aBilFkr4HF-MSBd6@toolbox>
 <CAKHfEahGyPFdLcB0LZqxaBpuKKWGWzhmxFHY8V+8Bv+7EdN4ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKHfEahGyPFdLcB0LZqxaBpuKKWGWzhmxFHY8V+8Bv+7EdN4ng@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 12:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216010

On Mon, May 05, 2025 at 02:33:22PM +0200, Vyacheslav Yurkov wrote:
> Did you ask this in the systemd issue tracker as well?

No, I didn't. I hoped to get some insight from OE first.

To me it looks more like an issue with the way the toolchain or
systemd or openssl gets configured rather than with the upstream
systemd codebase. I might be wrong though.

Regards
Max

> 
> Slava
> 
> On Mon, May 5, 2025, 13:46 Max Krummenacher via lists.openembedded.org
> <max.oss.09=gmail.com@lists.openembedded.org> wrote:
> 
> > Hello
> >
> > I'm seeing a strange warning resulting in a failed build when building
> > systemd with tpm2 in DISTRO_FEATURES.
> >
> > GCS seems to be a new feature supported with GCC 15 and friends
> > targeting the AARCH64 architecture. Whatever it does ;-).
> >
> > Ways to reproduce:
> >
> > Add the needed layers for tpm2, add tpm2 to distro features and build
> > systemd.
> > E.g.
> > bblayers.conf additions:
> >
> >   ${TOPDIR}/../meta-security/meta-tpm \
> >   ${TOPDIR}/../meta-openembedded/meta-oe \
> >   ${TOPDIR}/../meta-openembedded/meta-python \
> >
> > local.conf additions:
> >
> > DISTRO_FEATURES:append = " tpm2"
> > INIT_MANAGER = "systemd"
> >
> > MACHINE=qemuarm64 bitbake systemd
> >
> > Results in:
> >
> > | FAILED: src/shared/libsystemd-shared-257.so
> > | aarch64-poky-linux-gcc -mcpu=cortex-a57+crc -mbranch-protection=standard
> > -fstack-protector-strong
> >   -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
> > -Werror=format-security --sysroot=...systemd/257.5/recipe-sysroot
> >   -o src/shared/libsystemd-shared-257.so -Wl,--as-needed
> > -Wl,--no-undefined -shared -fPIC
> >   -Wl,-soname,libsystemd-shared-257.so -Wl,--whole-archive
> > -Wl,--start-group src/shared/libsystemd-shared-257.a
> >   src/basic/libbasic.a src/libsystemd/libsystemd_static.a
> > -Wl,--no-whole-archive -fstack-protector
> >   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > -ffile-prefix-map=...systemd/257.5/git=/usr/src/debug/systemd/257.5
> >   -ffile-prefix-map...systemd/257.5/build=/usr/src/debug/systemd/257.5
> > -ffile-prefix-map=...systemd/257.5/recipe-sysroot=
> >   -ffile-prefix-map=...systemd/257.5/recipe-sysroot-native=
> > -Wl,-z,relro,-z,now -shared
> >   -Wl,--version-script=...systemd/257.5/git/src/shared/libshared.sym
> > -pthread ...systemd/257.5/recipe-sysroot/usr/lib/libacl.so
> >   ...systemd/257.5/recipe-sysroot/usr/lib/libblkid.so
> > ...systemd/257.5/recipe-sysroot/usr/lib/libcap.so
> >   ...systemd/257.5/recipe-sysroot/usr/lib/libcrypt.so -ldl
> > ...systemd/257.5/recipe-sysroot/usr/lib/libmount.so
> >   ...systemd/257.5/recipe-sysroot/usr/lib/libssl.so
> > ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so -lrt
> >   ...systemd/257.5/recipe-sysroot/usr/lib/libseccomp.so
> > -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
> >   -Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro
> > -Wl,--warn-common -Wl,--gc-sections -lm
> >   -Wl,--end-group -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro
> > -Wl,--warn-common -Wl,--gc-sections
> >   -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
> > -Wl,--gc-sections
> > | ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so: warning: GCS is
> > required by -z gcs,
> >   but this shared library lacks the necessary property note. The dynamic
> > loader might not enable GCS
> >   or refuse to load the program unless all the shared library dependencies
> > have the GCS marking.
> > | collect2: error: ld returned 1 exit status
> >
> >
> > I already found that adding to the systemd recipe
> >
> > 'CFLAGS:append = " -Wl,-z,gcs-report-dynamic=none"'
> >
> > prevents the build error. However I'm not sure if that would be a good
> > way forward and if there are other recipes / configurations which would
> > result in similar build errors.
> >
> > Any comments? Thanks.
> >
> > Regards
> > Max
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216006):
> > https://lists.openembedded.org/g/openembedded-core/message/216006
> > Mute This Topic: https://lists.openembedded.org/mt/112627480/4455192
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > uvv.mail@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

