Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9697DC4707B
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 17:44:27 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.29793.1704476659377801239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 09:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Df4n2X/2;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbd6e37af4so1275672b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704476658; x=1705081458; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lq18IRpeX1bppogI3DVaBqfRJMGGmvdnV8+yVmZrfJU=;
        b=Df4n2X/2E5aonn8Xik6j/FyTmq5DjdtFbFCay53cGPF2Cnn2igGAtPtPTJtJd7H4cq
         X03LSBDqlaXjCi+TLh2+jurEbEZip03sExjbEZOpeBRVlQCpJHS0Ue9LmsO5MThsjkXI
         B4Xa7M6CGkSfCJcRjw2gLxcQV4EUgiNO6Z2BK0S3kb0TZn0FhJMmtN7yLhZMtJ3Z2Odc
         YKgzWT4IjpyF1gzaemsBV3rMvzUsdc+hsf+CqaXVR8IceKvagKuviu+No6Q5OLlrycUk
         lIX4GXHmfqnNNhTJImezqbJHgdINkyZLROHFfNaNkVIPE7d5J+MjxOXAOrLUAATR0GK5
         qdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704476658; x=1705081458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lq18IRpeX1bppogI3DVaBqfRJMGGmvdnV8+yVmZrfJU=;
        b=RTtFKppVgTP1IhQ49hhJpp2CCbln4+57vflbm4vMn0pwMkEkIVlPiRCvpq1n0bJ4ki
         8+wQNWk7sfJIDcaxDHHseaxD3H1Z3L3cJb3smNIV17MrBehII9m3IsJ7lXN/kfzvdn4G
         htEu3arpntZx6RAmmPfVXasBdxpTTCSfzY40z9R2dk6v3JCojd7L8JZLNCnUvlMfWbid
         NAAfiG62iSH+sGJfbf3kHd/IDVbH/LjFJ77ryp86B72GaSiTwW/mkw8p0jZ6Mr/pr84x
         TdQvzuDxnrYodinfgGb8o9TNxV/OuudWdiYrrPvWmm1Mr3K6NEvScw8WTu40cgQ5308V
         Zzag==
X-Gm-Message-State: AOJu0Ywbbd45SXXr7X4W3vAi58fkPXE6dX4QMmlxTVRo61K3s+iUxtEV
	OmoeLvKJSzACEs+2pZVHYKAoRzgCMXiuH1hElcuqvWZV8Ys=
X-Google-Smtp-Source: AGHT+IHhUOTjElvPEtr+uivzJMa592ldvRLj613MYigENLoJbT04EyVS1WvzTSo5UoEiab3vXh5KRVEESpBZ5t5VHys=
X-Received: by 2002:a05:6871:2b24:b0:204:1b7c:83e4 with SMTP id
 dr36-20020a0568712b2400b002041b7c83e4mr2335996oac.104.1704476658526; Fri, 05
 Jan 2024 09:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20240104021052.754030-1-raj.khem@gmail.com> <20240105161633534ec064@mail.local>
In-Reply-To: <20240105161633534ec064@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Jan 2024 09:43:52 -0800
Message-ID: <CAMKF1spdTdLnXFi475OP1ZN6Pc=dAnf34SUZ-tBvMWKYq4L7Nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] Revert "opkg-utils: upgrade 0.6.2 -> 0.6.3"
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 17:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193376

On Fri, Jan 5, 2024 at 8:16=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> I believe this caused:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4191/s=
teps/12/logs/stdio
>

Likely, so because this patch
https://git.yoctoproject.org/opkg-utils/commit/?id=3D8d9953dd8d589e9b740307=
976cbe474e0ce292a0
to opkg fixes mtime to be consistent across runs and this seems likely
to be the reason for
the reproducibiliy failiure. I wish xattr/acl support and this piece
were two separate patches perhaps we could then revert just the
one affecting GID issue. I would say lets wait for above bugs progress
and hold on to this patch until then.

> On 03/01/2024 18:10:51-0800, Khem Raj wrote:
> > This reverts commit a856192be5dd78c621478ed29871191c580686c4.
> >
> > It causes a regression in creating different GIDs in image and ipk as
> > reported in [1]
> >
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15334
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../opkg-utils/{opkg-utils_0.6.3.bb =3D> opkg-utils_0.6.2.bb}     | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.6.3.bb =3D> opkg=
-utils_0.6.2.bb} (97%)
> >
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb b/met=
a/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> > similarity index 97%
> > rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
> > rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> > index b509227e1a6..eb88b9b734c 100644
> > --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> > @@ -10,7 +10,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', =
'update-alternatives', 'virtu
> >  SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;br=
anch=3Dmaster \
> >             file://0001-update-alternatives-correctly-match-priority.pa=
tch \
> >             "
> > -SRCREV =3D "589880d01969eb9af1e66120e731d43193504718"
> > +SRCREV =3D "67994e62dc598282830385da75ba9b1abbbda941"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193299): https://lists.openembedded.org/g/openembed=
ded-core/message/193299
> > Mute This Topic: https://lists.openembedded.org/mt/103515671/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

