Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D50BC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 18:42:20 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.362.1722278531190751762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 11:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTSNdISC;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52fcc56c882so2831298e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722278529; x=1722883329; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CowhWXzvo8950fH/DTUImUbfcML7XVhbdjEBkbkoTUs=;
        b=TTSNdISCy4VPFTo35fGdFJ4iBD5PJe7xHjzWTf/3O0izOwGEMmZnArPjNabtgxc6Pr
         98eduGksJFj/6uaeAKLJqwjjhzmd5lRKhcHr2Ie2CSzRQK15Rj6JbCqL47B94NXWsBcL
         IYVtXod0SG4mIwSDI77IYWrlLwArvq1o+WtdHewol35B8A96zxDHjepEXzWmcn6tKJtR
         tefGblOLQiJEZkR8QDY9+p15UEluBSWFnxRkDTGuGCjNXcdeFt2cHD014DhRTX/J50Um
         0WatB4GzTmIKKOVBA6qcVf/TCGEM3vqbCTDRc+qwltsowAYXUzF9Z4Z/juadwk7AxqAT
         kIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278529; x=1722883329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CowhWXzvo8950fH/DTUImUbfcML7XVhbdjEBkbkoTUs=;
        b=Rf7IUMQDzRwvlGPK50Erw+eRQZOXZ4BySTAMoMRyemY9XBDsG/YM0EKcBGjluKe8Qg
         YHoe5ZK8U0hFIgXDtkCFGEdUt/JArnBhY9+kDUtWibuapZarPwxj7f8mwTEapBE/xzeR
         Bu1HqXCMGCBopJkm9o2vKrBjBPFGG22ow/30uu3p9G7dBG3Lxe+FpzP/91s7S4CurZKC
         EFAWzRPcAO3Hu9lZQcqrxCqqYm4Jg9q3AXQQY6ksvE7qU1MMzYF8mT1qQ3Iuq96cdRuk
         dc3iholBFX5uHgLtRV62S6dkFWFuq7XhOKH/j0U4I9TsV8ZRwV7AtF6gsJC7WYW/FqOe
         oDsg==
X-Gm-Message-State: AOJu0YynU1ZhaxaZDE9zrEAyBR0GydG1VJXRj7lkFiTuLlQguyXikaIF
	f5fRFFJAvmLEiEIS1loYhxvfF0/QBNWdYVU0Al6vcjeTk+Lqp8VyHpI1PXAm2mTJJd0mU1JZiiG
	aIb8EC3jerB7vW1886zB6qQneR6k=
X-Google-Smtp-Source: AGHT+IGypGy2nTzANsNlJJwD2L2woosY+XYnivTIJt8rA+zjpkwdlHF83ZACRsZskUambcy8sgIwuptSu7dk94163V0=
X-Received: by 2002:a05:6512:1393:b0:52c:8a6b:6071 with SMTP id
 2adb3069b0e04-5309b7231fdmr2131684e87.30.1722278529220; Mon, 29 Jul 2024
 11:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <29dc1c80950b25530d55427c1cd97e5be4c0c6e0.camel@linuxfoundation.org>
 <974.1722185188147819674@lists.openembedded.org>
In-Reply-To: <974.1722185188147819674@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jul 2024 20:41:58 +0200
Message-ID: <CANNYZj-DiZRQVPK=_96_8=qw5TQYoHZTVTfi9X7GKUfPno1Dtw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master] license archiving is failed to tmp/deploy/licenses
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 18:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202659

On Sun, 28 Jul 2024 at 18:46, Livius via lists.openembedded.org
<egyszeregy=3Dfreemail.hu@lists.openembedded.org> wrote:
>
> it's been half a year since it is reported in bugzilla issue ticket:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15394
>
> When it will be fixed? At the moment Scarthgap LTS is not able to use for=
 any "production" because it has this bug and we can not generate the full =
manifest and licenses in our SD/eMMC card image build process of end-user p=
roducts FOSS docs in our company.
>

Can you propose a patch?

Alex

