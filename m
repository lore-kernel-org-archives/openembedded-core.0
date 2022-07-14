Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847C5C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:11:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.213.1657825890966008220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jzr3sojb;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id bf9so4330568lfb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z3dlqYlRswr0NXe0Nhygflq6ZiJfvSDp2zzsS/ys7Ok=;
        b=Jzr3sojbyiBTorAnlTRqFGnjLkROWe8r+22XAF+kk0mEtG0y123wVxfMhiqxgUazgE
         v6ECtis+D8NGi3nTUrffMVbsJkIv9pUVDkctBHHfp+X4xIw3GMxKS+GckuzznpIVn3tq
         PwHGMfcxjD/ERkHdoRslsJYHKSDAy60mgi/kZO7NNPgfsqyThOB77WaQfPF5sZTfJcTU
         X8ucSMGhhPwLq3O4oLhvgDM2UPtTlsMQwKJ0yZYef0OyGQFvDzdsHdL/urruTSOgMQVh
         eH0ZFSEV23T37QuVKEdZ/8nVvoqPSzIjSvnmhIuBYSm89VJpQ+gmxbq0yN28oi+IBoFg
         CMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z3dlqYlRswr0NXe0Nhygflq6ZiJfvSDp2zzsS/ys7Ok=;
        b=CmbcIUmkrSV2ZF541pTn5ohOi1gJ9KqQ0NpQE6ZC1ULVugFbGX4OeF8JuwLYJeBqXN
         oc6hqbO5J9hb2/oTl44JP3hvpyB7MYRK/0zEdEd7QhD8omukNdyg9OlOuiIsr2tQXj7t
         NWR+TUAf1hqdXztd/uviraIhLIGvSgn7d7LmKHAwzmlpfLNIyoDSIn9Q58j5o7fjvrm3
         0qe+s6VIuneJ6GyVpZ1l0zUJtpbNSaYSKkQIaw1qMK76bYBZw6kSj0+RpFQoKe5sXERz
         bzk0TuAokvO7PnzkrpuzHOIGQVQS8IcsdkfZ+Xo6MMaTsa3fQ9vUTXLGo88yOAkpPJGn
         7w0A==
X-Gm-Message-State: AJIora98iHY627PXQc2gl2XK5cUQo5JAh6qiddq2UxXQVBtiNVFBYZ4Q
	PZb9zU2z1F4RqnZrKyXGAWnbb1/oHPKlr+QFVjQ=
X-Google-Smtp-Source: 
 AGRyM1tYtOHTI9XxMlQYyDjXMwgqxBHVJ3O9LBPg0XJxrsCVNHC2csKEIovRO8CG87wcr5o56GMG+m3QWHn7r6E3Fgg=
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr5723149lfr.26.1657825888891; Thu, 14 Jul
 2022 12:11:28 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yge_DgiH6+MzKNooWYSkks5=zJu=V23FKpx1v-1j=UCBg@mail.gmail.com>
In-Reply-To: 
 <CABF_=yge_DgiH6+MzKNooWYSkks5=zJu=V23FKpx1v-1j=UCBg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jul 2022 21:11:17 +0200
Message-ID: 
 <CANNYZj8o2mPjVLfLXjvV6BKD57_NF2ymuTs36_ghc80hVV+HFQ@mail.gmail.com>
Subject: Re: [OE-core] python3-jsonschema: is ${PYTHON_PN}-setuptools-scm
 still needed?
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:11:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168039

You can send a patch and it will be taken to testing. Such regressions
should be easy to spot.

Alex

On Thu, 14 Jul 2022 at 21:03, Jan Vermaete <jan.vermaete@gmail.com> wrote:
>
> Hi,
>
> I think the RDEPENDS on ${PYTHON_PN}-setuptools-scm is not needed anymore=
.
> Could this one be removed?  And how to test it?
>
> br
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168038): https://lists.openembedded.org/g/openembedde=
d-core/message/168038
> Mute This Topic: https://lists.openembedded.org/mt/92386355/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

