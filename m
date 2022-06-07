Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C17C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 18:00:15 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.715.1654624813451971018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 11:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvUW3ZJk;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id 2so13235782qtw.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JXCd78ua7DEPS43yFBhYfpYyx+gdR/KyePxZvPfEXgQ=;
        b=GvUW3ZJkCCerdpzz4yNSvKRMhKdrlkfYSG4Y6yXsjrHg2VOjSNx15qRFIE70sWzZWD
         7fDLCqZ3tV9BPdGj0ez2aC5HgQoqCO2WnTTt2i+e7j/030Qh+LEFpAoWFckZ2DjIh/dW
         elIBZIkcE9InBTuct0HzhXraJP9e3sS3SipTxxgdbIkxsGhHb9p+BIE3biUIsDl3k/9j
         A1e8kFw4ZISkWJLhAmq92CzNnUmcVfMCI36OPlg5EmH+Ri0Ws9fRxNStG1ZSVaSuDE5Z
         2iYlyTFX0cgSd7bwZi2k6Gw4U7p/TiCQg5L2wN0XxnWJ3F8sDD0s3XX9rhAL41K70irr
         Fctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JXCd78ua7DEPS43yFBhYfpYyx+gdR/KyePxZvPfEXgQ=;
        b=IULOT1Qfau5QylCKmo+Z7hqeNa/31jd3zecYojG+RV8RjVguBgd9P4CJU74sFxIIgl
         JNcq/Y7occh8/MmRILK/lqPaaEk++K2NdYW9mx1mabWxL3tDWPJzmLndImCjXvfYo6k0
         OV5xtX8FE6a7KtCWogHIJWl3mzNEUzdSkMRYZVdtRta5SXNOgdHDoiqqndkBy10h+34C
         0+Rgg9JLzG7W40Dh76WvilJ0jYAVeJ3sTGkFY6NzNoLDfTtqZSjIvajsy6+wtoj7RSzq
         YYYY8gQDkAkx4jWWpx+yxpeif7nA+cAhFUzds6xR8UFTROP1ijrE3er3P86UU4+rm+eN
         gOgQ==
X-Gm-Message-State: AOAM533i8Ck0nBcEKFO1vWLYNGdBLHeBfnSYmzLAuqXBz4Pdle/Xr8pR
	DeSj0rmaMdq2IU9oZoEjP2IE3znAHq7SyL1o/HWk6QUTde8=
X-Google-Smtp-Source: 
 ABdhPJyhOECAS7gkJmyy1rL/cTFHqtA26WmbSA5dD2KC5QfmDYWCfFKvS+KD3vmc5GQxb22EuWtV3EoYyAY35ExKdr8=
X-Received: by 2002:a05:622a:4c9:b0:304:b650:683d with SMTP id
 q9-20020a05622a04c900b00304b650683dmr24001137qtx.229.1654624812428; Tue, 07
 Jun 2022 11:00:12 -0700 (PDT)
MIME-Version: 1.0
References: 
 <AS8PR02MB83920BF4108BDFCB2FCE492EF0A59@AS8PR02MB8392.eurprd02.prod.outlook.com>
In-Reply-To: 
 <AS8PR02MB83920BF4108BDFCB2FCE492EF0A59@AS8PR02MB8392.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2022 10:59:45 -0700
Message-ID: 
 <CAMKF1sp8_OjT3D6uZHHos2C0-TrSYWFVxqMckOW8OVXgrSph7g@mail.gmail.com>
Subject: Re: [OE-core] 0001-dropbear-Allow-root-login-fix.patch
To: claussen.j@eppendorf.de
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 18:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166683

it should be in postprocess for rootfs task I think.

On Tue, Jun 7, 2022 at 4:56 AM Jan Claussen via lists.openembedded.org
<claussen.j=3Deppendorf.de@lists.openembedded.org> wrote:
>
>     dropbear: Allow root login fix
>
>     This enables root login when either "allow-root-login" or "debug-twea=
ks"
>     were set in EXTRA_IMAGE_FEATURES.
>
>     Signed-off-by: Jan Claussen <claussen.j@eppendorf.de>
> ________________________________
> This email including its attachments is intended for the person or entity=
 only to which it is addressed. It may contain confidential and/or privileg=
ed material. Any review, forwarding, dissemination, other use of, or taking=
 of any action in reliance upon this information by persons or entities oth=
er than the intended recipient is prohibited. If you received this email in=
 error, please contact the sender and delete the material from any computer=
 system.
> ________________________________
>
>
> Eppendorf SE, Hamburg, Barkhausenweg 1, 22339 Hamburg, Amtsgericht Hambur=
g HRB 171526
> Vors. des Aufsichtsrats: Philipp von Loeper
> Vorstand: Eva van Pelt (Co-Vorsitzende), Dr. Peter Fruhstorfer (Co-Vorsit=
zender), Axel Jaeger und Dr. Wilhelm Pl=C3=BCster
>
> Eppendorf Instrumente GmbH, Hamburg, Amtsgericht Hamburg, HRB 69077
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Bernd Petersen und Dr. Alexander Papra
>
> Eppendorf Liquid Handling GmbH, Hamburg, Amtsgericht Hamburg, HRB 92250
> Gesch=C3=A4ftsf=C3=BChrer: Dietmar Stadler
>
>
> ________________________________
> According to the general high quality approach of Eppendorf, we apply to =
our mail traffic the latest protection technologies and methods, including =
extensive scanning and DMARC, to help our communication partners in protect=
ing their IT environment.
> Privacy information according to Articles 13 and 14 GDPR can be found her=
e: www.eppendorf.com/gdpr
> ________________________________
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166659): https://lists.openembedded.org/g/openembedde=
d-core/message/166659
> Mute This Topic: https://lists.openembedded.org/mt/91598485/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

