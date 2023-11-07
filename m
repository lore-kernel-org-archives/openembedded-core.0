Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DF8C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:34:13 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.8430.1699356847143658184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4cdRB0N;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so79836491fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 03:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699356845; x=1699961645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rwy9mbrMg6a6Rvw2rXRTCC3fCCw26HgcKsf3tZo8j1s=;
        b=S4cdRB0N0g59AYUhMu9J9YifBXPK4qW9AdZVC1+FlJ9xJCmSAE3roDRLrtaqeMiuGb
         mGRPW7wM99q3ozpXIDqQ1xIy7GEGywxT8iZx8w3lIhGJNusg3zSk7P/irBpmcGhvm+9f
         u5mOl6toEvpo/r99dsCmqs/UV2HbVWXOr3jyBX5B5eNjnwVF3ZJNZpgGaW13V83V1xni
         YJvzPGku3A8L63ePeZh52uOIOaDiRhU7QeTnnqoTyTU/PbW91/hIwShzS79Y3mKwL3xf
         eSbFZpvgyvLMUgCGL9GnE18YceSUV+zcAWUXjoMnMshbi3SIcOBcxSnKxEUhEOyPjkQS
         AqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699356845; x=1699961645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rwy9mbrMg6a6Rvw2rXRTCC3fCCw26HgcKsf3tZo8j1s=;
        b=sZcFzXam9bOx/ecJwXyJK9L2o+hIYu0gCgCQiQ5qhMLSsMpKpPL9Gn32OVocXS1A1j
         DMNqtJp4wjlLBqy5XUfG63iVZqj/LeoYVbasBaD/V/jO1lyBa9nu2ZFMVrhCaxNBXtxj
         ++xMyfro1i6RR0zIcyISfgQCikqrhUTCSQY1Y74JYB4uZOeF0o10WYsM/F9Se1i7VZTC
         qVCvYdt6LvWNu7WUNrsJVBM3Sm93E93z9gWW13l3JlYX0bhNImHEjpS2gYS631AKDkrO
         zD0j7ruLCrs42/ueWRTnkQE5Bx2OuvxPMBZHnpEFYS50pmsTGDjz1gCSwK8kaeP+o53F
         0iWw==
X-Gm-Message-State: AOJu0Yy/f1KdPg9Xq8hgJDlmu8DrYORpxSZlN4Guiu25mLBUM5C2h0l0
	5hop+zz7lVCKrb6HC0lDJSQI1t1q9IPmzQ5qQ+M=
X-Google-Smtp-Source: AGHT+IE8+v8IbnhPiC6HYZT/uT5QX/ELqpetryoS1PyPl7WNfk6+VaFHytypmxvBEVU4kQu0KOu/1vT3cbEy7RF62Bg=
X-Received: by 2002:a2e:b0dc:0:b0:2c5:174b:9a53 with SMTP id
 g28-20020a2eb0dc000000b002c5174b9a53mr24749575ljl.26.1699356845006; Tue, 07
 Nov 2023 03:34:05 -0800 (PST)
MIME-Version: 1.0
References: <24b92a7a-aa29-45e7-8a5e-7c34fe131971@gmail.com>
In-Reply-To: <24b92a7a-aa29-45e7-8a5e-7c34fe131971@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Nov 2023 12:33:53 +0100
Message-ID: <CANNYZj8FSghPy3TPwbJPR8_TG4gErAddgj6q2gQW-+SGUYM9aQ@mail.gmail.com>
Subject: Re: [OE-core] Baekmuk license is not known by Yocto
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190268

I guess you can send a patch?

Alex

On Tue, 7 Nov 2023 at 12:30, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> Hi,
>
> I have a font package recipe for baekmuk-ttf-fonts
> which can't be built under Yocto 4.3 do to these:
>
> WARNING: baekmuk-ttf-fonts-2.2-r0 do_populate_lic: QA Issue: baekmuk-ttf-=
fonts: No generic
> license file exists for: Baekmuk in any provider [license-exists]
> ERROR: baekmuk-ttf-fonts-2.2-r0 do_create_spdx: Cannot find any text for =
license Baekmuk
> ERROR: Logfile of failure stored in:
> /data/test-yocto-4.3/tmp-sicom-glibc/work/all-oe-linux/baekmuk-ttf-fonts/=
2.2/temp/log.do_create_spdx.3195121
> ERROR: Task
> (/data/test-yocto-4.3/conf/../layers/meta-sicom/recipes-support/fonts/bae=
kmuk-ttf-fonts_2.2.bb:do_create_spdx)
> failed with exit code '1'
>
> The recipe uses the source tarball from:
> http://kldp.net/baekmuk/release/865-baekmuk-ttf-2.2.tar.gz
> and this tarball contains the license in the file "COPYRIGHT".
>
> The SPDX page for this license is: https://spdx.org/licenses/Baekmuk.html
>
> I know the workaround is adding these lines to the recipe:
>
> NO_GENERIC_LICENSE[Baekmuk]  =3D "COPYRIGHT"
> INSANE_SKIP:${PN} =3D "license-exists"
>
> But this license exists and is known by SPDX.
> So please add this license name/text to Yocto.
> Also, please backport it to nanbield.
>
> Thanks in advance.
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190267): https://lists.openembedded.org/g/openembedde=
d-core/message/190267
> Mute This Topic: https://lists.openembedded.org/mt/102440652/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

