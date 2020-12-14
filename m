Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.2870.1607989834677698088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 15:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=wK3lpbsh;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.175, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f175.google.com with SMTP id 186so17478569qkj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 15:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OK6R86d6Qg51OyOOODMjkTu5fHuiaCqlHosueg5BHhs=;
        b=wK3lpbshN7Pi599KsDOV2tzMNffh7vErIB2kLC3O/iAmYn8CHBl1J7oVQvT6bBvN8N
         CRq0CjXZy5tccT0A8O/nuZoHLhsFpGhFF/taMCPpV+b3IWjLdWA2vkZSVGN26fPY+1hI
         lpE+6+61v7osAIGV5FUG9xVm303Lhi9JSFboAOgS1UougJNgh34S5EWPeL6hTNA7VKOX
         Q7A/nebWfmzqRAQZL0clXhyNZqZ8lMn8jevMj9+pWwMCI88gUrnJO+KvxpnzSUjFCBk5
         bMm/RIxAsHCv2M3fn555wyy50r/Nm7kUq0BNZXdNux1QRcahlUgDKeiUDXEEsuJFXpIk
         lJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OK6R86d6Qg51OyOOODMjkTu5fHuiaCqlHosueg5BHhs=;
        b=VpkIBfi6K1oWMN9VRxTy9av1rEmPuzU4GCOwh+Zs5yfHDJwGcK0CBH2Bh2PSUmg8wS
         1niTt/QnZn72bkv8rsJZEE6sZXreD2tJ8TX37AieYw0UGsWHNjvH6sAx8lILfUnxt+NT
         ZUp9gC1JXPVy3pDKvPNl1734UiciFH6yMe8EmeZ/+b17vLiWmaHzdhzZOXUaVt/g+CXG
         w1Ia10wv6Z8i59cLNzA9rXTe3b7PCKM2KpNj3cXwX14A+njSBqXACg+Sm8oYNIic7BYf
         Ifq8FRNNuxVU9hw1aW7WNSZ4MO2pdeb766a1DOkseXU14wv2fexDw5XnJDVzC+c0skvK
         zFJw==
X-Gm-Message-State: AOAM533mtSOXZ6kPGxiv27WJOxaSb/M8Twu+bXdzwfSlzL0mRwo1/dPP
	TxqwiT+nMF36RYWAcBgQD/Q8mMaUsJzfId36
X-Google-Smtp-Source: ABdhPJy9jg09zsbIolucbfop6hKG/55V394Xt6IE20E5Bx4hV0vXa+Y3NwaTfJUPC39VdJUJ9XW6Fw==
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr13538865qke.41.1607989833586;
        Mon, 14 Dec 2020 15:50:33 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id v128sm15837887qkc.126.2020.12.14.15.50.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 15:50:32 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f170.google.com with SMTP id v5so4066811qtv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 15:50:32 -0800 (PST)
X-Received: by 2002:ac8:a01:: with SMTP id b1mr34097543qti.217.1607989832363;
 Mon, 14 Dec 2020 15:50:32 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <20201214225851.yqscuyms4pwihtfy@apollo.localdomain>
In-Reply-To: <20201214225851.yqscuyms4pwihtfy@apollo.localdomain>
Date: Mon, 14 Dec 2020 20:50:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqt6mQeckiFPhTrO8b1kZvbPOWE-S27pQp5PNj09EOviQ@mail.gmail.com>
Message-ID: <CAP9ODKqt6mQeckiFPhTrO8b1kZvbPOWE-S27pQp5PNj09EOviQ@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 14 de dez. de 2020 =C3=A0s 19:59, Khem Raj <raj.khem@gmail.com> es=
creveu:
> On Sat, Dec 12, 2020 at 08:52:34PM -0300, Otavio Salvador wrote:
> > Hello all,
> >
> > I am trying to debug a strange issue on native Go binaries. We're
> > seeing it on 'glide' for example.
> >
> > If I build 'glide-native' and I go to its tmp/work/.../image/bin/glide
> > it works just fine. For example, running it we see the expected error
> > as I am running inside a clean environment without any extra tools:
> >
> > otavio@yocto-env ~/.../build %
> > ./tmp/work/x86_64-linux/glide-native/0.13.3-r0/build/bin/glide
> > [ERROR] Error getting version: exec: "go": executable file not found in=
 $PATH.
> >
> > Now, if we run it from the sysroot-native, it segfaults:
> >
> > otavio@yocto-env ~/.../build %
> > ./tmp/work/cortexa9hf-neon-oel-linux-gnueabi/updatehub/1.1.1-r0/recipe-=
sysroot-native/usr/bin/glide
> > [1]    26085 segmentation fault (core dumped)
> >
> > And this segfault is also happening inside the build. I ran the
> > readelf on them and it seems to have been modified to use the
> > uninative libc loader but I am in doubt how if this is the culprit.
> > Can someone shed any light on this?
> >
>
> It looks like a known regression in 1.15.5
>
> There was a linker regression which crept into go compiler in 1.15.5
> which was immediately patched and we also backported that to OE-core
> however, recently we have switched to using go-binary-native to
> bootstrap the toolchain which means the bug was still not plugged in the
> native version even though we patched our go versions, we cant help the
> prebuilts.
>
> Luckily we now have .6 release which came out last week, which means we
> can upgrade to it and that should take care of the segfault, I have
> improvised on the patch which was sent for upgrades and sent a v2 [1]
>
> Please try it out and let me know.
>
> [1] https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_go_=
update_1_15_5/78964072?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,78=
964072

I tried it but it did not solve the problem. The behavior is the same
for this specific issue. The cgo issue documented was indeed fixed but
the relocation one is still happening :(


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
