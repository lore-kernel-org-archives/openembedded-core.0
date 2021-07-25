Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.13741.1627179341757012820
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jul 2021 19:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=JyiCn40s;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id b20so5457609qkj.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jul 2021 19:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TKGBDFrZF1wC2XB0pauKHEbCyrnSot491XSBJyknyCo=;
        b=JyiCn40s1MkXH8/84YzSN4N66vU942n1oepvdiMXqe84bkFegjvr12NolQqJMpurOE
         yvceI9NKP6fOdsjzQVKceGES+rEbRjCrraMkR9rgUbcWh8MxQoQ2ST2SiD5zsKRaUukF
         syKf/QwFNZ8k9lywxSj50KMpLPD5X8N3lD/ZvZVOT1c4qavwBOTNG/oIBFXYjNCYZXXr
         hr5wkwScsC8QMpLa05RvPfKl21XiwXUa2wT5Yhxa8HEJwxfQn7ESkN6bH5bzlwMJ8tNP
         8F8r/pCRaB7mMcUQKgZDU1qW+BojQ+Tms1fCFaD+sW8+PuEQpZ4sSqdPObJJfDrAJVRZ
         ht2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TKGBDFrZF1wC2XB0pauKHEbCyrnSot491XSBJyknyCo=;
        b=CHDF00/M/6UFifcDGV8s1QUN+QE1yMwnOSz2AULNX2R2eYELcccTtp4RMMZMEt4nMG
         oiOusWpr6qM9LuClo5eXoOjQuN+cb/Ub0mMBfcm3eFoCH3dELmP+oEFqYRZLHHjE9jgA
         fIWGWS2kAuKkui6BHFtArS20KBAfF5Wr2ji5kPa/yvWR821KVdMNagJRWg24BewPzUXi
         bWdMv9h95Zg8t6/p2sx6muiOl6hwd6c9dzcChNy0wvuhhTFVtsaUctkp2c4DstReaXoz
         0YibVBCHe8hU9qPMo06e9lbsOtoub74BWO66XvYb8o3YzRtH2E97Zs+FAH13QfAYrk7m
         Qstg==
X-Gm-Message-State: AOAM531M385e8LaAQrXMr4V5MjfauFnNTfeTFjPHavqXfrYkjQCAgusw
	X/BWfFbD/DtKCKzqBpRM1RvxSlPD493zweGh
X-Google-Smtp-Source: ABdhPJyjtfGa3tjZH7NGROwhbX3qSQtg3hqT/9NO1CjMH3PCIiUWuyEcC1p7dnriEFY7GVkdHgt7Lw==
X-Received: by 2002:a37:7141:: with SMTP id m62mr3271982qkc.496.1627179340737;
        Sat, 24 Jul 2021 19:15:40 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id r13sm13384942qtt.38.2021.07.24.19.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jul 2021 19:15:40 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id x3so5435944qkl.6
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jul 2021 19:15:40 -0700 (PDT)
X-Received: by 2002:a37:67d5:: with SMTP id b204mr11839725qkc.197.1627179339905;
 Sat, 24 Jul 2021 19:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210723001927.42892-1-anuj.mittal@intel.com> <CAP9ODKrhqfHAQHgJz-CvJWoObGmgB-Yp-7kOv3Bz3ZWwfEz74g@mail.gmail.com>
 <abec867fa70351470199343d00f511065db25778.camel@linuxfoundation.org>
In-Reply-To: <abec867fa70351470199343d00f511065db25778.camel@linuxfoundation.org>
Date: Sat, 24 Jul 2021 23:15:28 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2E4c0-p80mULZ6WGr4qMcfBp3OHEfXB8xpqa+J18sZA@mail.gmail.com>
Message-ID: <CAP9ODKr2E4c0-p80mULZ6WGr4qMcfBp3OHEfXB8xpqa+J18sZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "Revert "libubootenv: inherit uboot-config""
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 23 de jul. de 2021 =C3=A0s 18:10, Richard Purdie
<richard.purdie@linuxfoundation.org> escreveu:
> On Fri, 2021-07-23 at 17:52 -0300, Otavio Salvador wrote:
> > I am against reverting it again. We discussed alternatives, which
> > could solve the problem.
> >
> > Em qui., 22 de jul. de 2021 =C3=A0s 21:19, Anuj Mittal
> > <anuj.mittal@intel.com> escreveu:
> > >
> > > This reverts commit be1cf223bf9c514ee81820ded5b13318458c0daf.
> > >
> > > The original change was added to resolve build errors [1] for MACHINE
> > > values that don't have u-boot support. This recipe was, after that
> > > change, skipped in world builds for those MACHINEs.
> > >
> > > But we should be able to build libubootenv with or without u-boot
> > > support [2] so the original solution to inherit uboot-config was not
> > > perfect. But until we have a better solution, revert this so
> > > builds don't fail for others.
> > >
> > > [1] https://lists.openembedded.org/g/openembedded-core/message/153508
> > > [2] https://lists.openembedded.org/g/openembedded-core/message/153614
> > >
>
> Something needs to change. Perhaps the RRECOMMENDS should just be removed
> as that seems to be the cause of the problems?

I'd be fine in dropping it. This would be a better fix for sure.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
