Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4812BC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:56:48 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.327.1651006607207415050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 13:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GwQHYRV9;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id q13so6116482qvk.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cn7o4TqDLc3X/8g/umBZ881Q8yLnZ8rx0E3pGPPTxEI=;
        b=GwQHYRV9ckUwnqSd0nRqHtprnPFH9u2fP6Ep5pHJUfLaC5oR+fXJH5QJQb7hVAzeTH
         rLTfzmVBLgQvndn36alB5WfAPXUR4yfP3BLES4i6EQm4RLi2OKdXPJCh0SBgt9la/ydH
         MXzhskXVsU3Cr6SegBiJXEXbDcX6LwYX32YQ6x/E/jo79eDY1UArsEnhOxsI/Ywqp5oP
         IMSJNloQx8ju4t48LThw4B60T9C9IZu4jOgwn2SzpYfW0Z3IMfvfAyNf4rFe8JuAfEqZ
         Rq7NynqL9+R36BuqTrKDnJ6xAaXuyq7v7bIwbUxr6PnNjhxkjUjjbEjq9ooPKsI+cC3l
         YJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cn7o4TqDLc3X/8g/umBZ881Q8yLnZ8rx0E3pGPPTxEI=;
        b=Wy7+U61yh3MCAz9qiFOcs1yJUxR/k2ElPfOxgv0kFqNmVJwqmeUTTEZlMWeQOgzhPm
         aLVRQVXvs8OiOP5QKBZR5C2sL6C87cKMW3KaO+ViwQyW9YLJzL8DWXrEUAQyc1kptm8+
         Jbi+Mf2TkT6ZofEkrai8PBR5U+pJXoQFhsY3ZKcmP+qAlH4LtIVzZlaSpTJ/rt+rvz6V
         Fq2AtON3J3iCq05ZnjUM0CF1KA8EIzR+BIPBzYrTpzUnTPzYmNw5dVLlfT5NT7xgCcEN
         DBatTHMxiT489hRmeG2mIFptwE2snJrWrBXJLO3pTDnpqQONycwgDIHLHWdXp0rfmUrP
         UGHA==
X-Gm-Message-State: AOAM531Zlsu/BERfsLBqdZfiyNCT4H74xjcjdbbRxF5kO+8aBENX8Sgh
	jphGfmRywJ5oe5JioYw09EjABbWk4VnIwSbhVsg=
X-Google-Smtp-Source: 
 ABdhPJzhk/n2LKRC63gbGuVaoM6VSjcoTjNTd0KiErpVoDAfbvnKKaFyFnhs/p1df5EBHpetfwVKFJF2rwiHulcEBV8=
X-Received: by 2002:a05:6214:e86:b0:456:3ef4:6e7f with SMTP id
 hf6-20020a0562140e8600b004563ef46e7fmr6182607qvb.36.1651006606281; Tue, 26
 Apr 2022 13:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Apr 2022 13:56:20 -0700
Message-ID: 
 <CAMKF1srtoJ018V4x3nX2CQ+77DfLgnN2-KizL1Zfje2e-wUEFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: skip make 4.2.1 warning for debian
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 20:56:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164884

On Tue, Apr 26, 2022 at 1:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 12:46 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > This is a follow up patch of:
> > ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)
> >
> > Debian10 has the exact same version/sources for make as Ubuntu
> > (focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
> > https://packages.ubuntu.com/source/focal/make-dfsg.
> >
> > As per the corresponding changelog, the patch mentioned in
> > ad5829aa1f8a, is included in both Debian and Ubuntu in make
> > 4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  meta/classes/sanity.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index c385d92e8b..c72a7b3ed3 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -470,7 +470,7 @@ def check_make_version(sanity_data):
> >
> >      if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
> >          distro = oe.lsb.distro_identifier()
>
> Not directly related to your change, but shouldn't this be
> lsb_distro_identifier() instead of oe.lsb.distro_identifier()?
>

lsb_distro_identifier would work when it is inheriting base.bbclass
otherwise the utility function is needed.

> > -        if "ubuntu" in distro:
> > +        if "ubuntu" in distro or "debian" in distro:
> >              return None
> >          return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
> >      return None
> > --
> > 2.36.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164883): https://lists.openembedded.org/g/openembedded-core/message/164883
> Mute This Topic: https://lists.openembedded.org/mt/90716488/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

