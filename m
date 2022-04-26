Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4738FC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:51:18 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.294.1651006277054098649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 13:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QAliFucp;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id bu29so34095986lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Ik9Cz/D+vM8oj1v9bWkKcToyOBUmlIhoHnsJ1NOHG0=;
        b=QAliFucpuvkiQ/pKmVIDraQ15MFYLGqLtoVDCHbS6Nb7ZifCZX1cCHv7Oe6Lx62G/g
         fEeF9rZFWgMFdNqhv1g8SK0orIWwQ6/b7gv1fOgKrFu4YpnUmcPEYmJZyLRXGvgCgSOs
         LQ2Z3sMH25a6Rir3aOveytUUbGMNZRuV6xwnLxE4+1R56qADS62CfHcmrJRE38P+PW+F
         /q+8cRTLtKWiGOi9wmp/a+NlK4y/X1DT8ajCiO2V/XT5AJID6aNHQXZNtGkgRYeQYaxw
         7kbY3MNHLcFuJQ2PYA1Fng6BrJeaYvgEsRDOuSSjOKlpS0IqqQYu23q204J1ze+C/lr1
         KKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Ik9Cz/D+vM8oj1v9bWkKcToyOBUmlIhoHnsJ1NOHG0=;
        b=r3tiAXBmly/XtbKd8OjLcPWytkY2Jjabq9LcFrNVeIlQNIcaY+9GqBI+3eO+d/0chc
         anncipbxS9srYu3nJFPPB29Ql3e4TmLkwtlk7d4bZacyJEGRGZWDLKhkvjg/FSIYTzG4
         Dx9535djs7YwTHMB0BtCmJoBC1oDJ7Pim9HjEGx8+n/bEvA77GPFqSg5yzAyk8kqPZVo
         9f4lBf04jKmMD4vnlXNb0Rx/bt4f1CIKU9Ux4ZtaoYC/6l/OdbC3SYpG2ryvRjtbTAqX
         +BcrdasNu6Xc0QRqJK2v1wZFyhh4oryjFESLj0ULmY9vT29x6VVM3doyHnOMrB0KA2O+
         VXbQ==
X-Gm-Message-State: AOAM5310uCjz7X5damu72dWVRFwPqslBSObTk7b4ZPWNvZTQ3E6v3r2t
	qYmgsK62TjOlhp9PHNvy0ssD7hLV4BQlak/Rn5A=
X-Google-Smtp-Source: 
 ABdhPJyMf1msSWqkYefaZ61KUmH43FxUiED/0jv9nUEOezCgdolhtjltT66A+P4Ou8SBcxXqCm/UIJTskHLt3A7O12g=
X-Received: by 2002:ac2:4f0d:0:b0:472:1b7d:2a93 with SMTP id
 k13-20020ac24f0d000000b004721b7d2a93mr3069280lfr.684.1651006275078; Tue, 26
 Apr 2022 13:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Apr 2022 13:50:48 -0700
Message-ID: 
 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: skip make 4.2.1 warning for debian
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 20:51:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164883

On Tue, Apr 26, 2022 at 12:46 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> This is a follow up patch of:
> ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)
>
> Debian10 has the exact same version/sources for make as Ubuntu
> (focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
> https://packages.ubuntu.com/source/focal/make-dfsg.
>
> As per the corresponding changelog, the patch mentioned in
> ad5829aa1f8a, is included in both Debian and Ubuntu in make
> 4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index c385d92e8b..c72a7b3ed3 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -470,7 +470,7 @@ def check_make_version(sanity_data):
>
>      if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
>          distro = oe.lsb.distro_identifier()

Not directly related to your change, but shouldn't this be
lsb_distro_identifier() instead of oe.lsb.distro_identifier()?

> -        if "ubuntu" in distro:
> +        if "ubuntu" in distro or "debian" in distro:
>              return None
>          return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
>      return None
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164881): https://lists.openembedded.org/g/openembedded-core/message/164881
> Mute This Topic: https://lists.openembedded.org/mt/90716488/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

