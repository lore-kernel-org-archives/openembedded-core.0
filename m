Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA00FC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 18:51:16 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.295.1637088675910971587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 10:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=il9Usrij;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id e64so90123vke.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=q+XPW7ATD4SDgYqTMJ1FVQDD+q7WcTyA9o+7HVcLwy8=;
        b=il9UsrijXBrzwb9yQPZHTjmfa4G6pRhSvtM/RSCcCDBS5tMKZZqVJNQipf0osfWA8i
         hOyINK3/P4VOOom4FZKn7d5tegYZEkcHlmclpKZgB4xLbWNii+Nbyvb9nLs8s15/kLQY
         Zjd/bXz29igNayEgXwlTbO0dPUx+OIR98ITp1381tbhvqxqPSgOE4ko1KtfUsVeAE2KB
         R4j0MlUCogrikDFKZGZnlwxRqqXHgWy0Q3Vji/rblj/rdmSPH/pRtXiid9rfe4VOdQb/
         3u2k+Rj9Mrgo/Z/74l6RbTFx8cFkWV5PujdSRDXxHYhlITVB6wvTfN/FcE14waDl4Dbl
         Cw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=q+XPW7ATD4SDgYqTMJ1FVQDD+q7WcTyA9o+7HVcLwy8=;
        b=cfUXLqvi5rOoyK5LTlYKkeILHkIJkou3vx4WlE0IK5uaynG2WypTNe5KNdI3XjNkrr
         NCSDwvOqspPwA/VcC8MZK1CuwLTlmKR6aY1WwgebPU3Vtq6kPST6daPIJQpNnrckGVqi
         p/NEmQuq+TGXYoAUOs0Eml2FchuwO6aYY9LO/DI1jage0yISX7nM3mAyT1FcDj//1goY
         PQytfGHV9ive08fUr0lcoJJzcvfQU+tgNm7pzgDCGFz5BH6AIbOnCpYEPDTMtZMnjIrN
         4oKh6BgO0Pioo5GXxXiZVIDZx2Znlaqp8ZU+ADPeHhNzTo87dCk1Ncf7gWjMEAwYiGPc
         xYOw==
X-Gm-Message-State: AOAM5321cnnofa6P/U18yAYbF781YMXhxj9NqGBRLQD+GYnxy0HpQ0Yp
	ElSsh0EHmF4Tc2AXEzo+7hI=
X-Google-Smtp-Source: 
 ABdhPJzli3xKZBB6RsI6YiD2O6RhUsly0nvSA4Zg20Iw4sHvp6o4MKhvfjw/RKvkeDeuK+vU8F2+lA==
X-Received: by 2002:a05:6122:2201:: with SMTP id
 bb1mr77398243vkb.19.1637088674929;
        Tue, 16 Nov 2021 10:51:14 -0800 (PST)
Received: from smtpclient.apple ([187.59.247.30])
        by smtp.gmail.com with ESMTPSA id
 j21sm10644134vkn.4.2021.11.16.10.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 10:51:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [oe] [meta-oe] android-tools: Add flag to enable adbd service
 (#147)
From: Devendra Tewari <devendra.tewari@gmail.com>
In-Reply-To: 
 <CAH1Ww+R6_C3Cq755HhOdPAM72SBxUdxJjm7PTd=CsWSxOoPaVg@mail.gmail.com>
Date: Tue, 16 Nov 2021 15:51:10 -0300
Cc: openembedded-core@lists.openembedded.org,
 Khem Raj <raj.khem@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E59A6DBB-BB6B-4645-975C-9F4FF276A9DB@gmail.com>
References: 
 <CAH1Ww+SPR6j1_SV-=Ev+XOgHsUismWxGXHPx6_RHwP-W3AJ9Bw@mail.gmail.com>
 <8CE95620-93AA-4B0C-B20E-3A5E3ECC0E06@gmail.com>
 <CAH1Ww+R6_C3Cq755HhOdPAM72SBxUdxJjm7PTd=CsWSxOoPaVg@mail.gmail.com>
To: Daniel Gomez <daniel@qtec.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 18:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158372



> On 16 Nov 2021, at 15:47, Daniel Gomez <daniel@qtec.com> wrote:
>=20
> On Tue, 16 Nov 2021 at 19:17, Devendra Tewari =
<devendra.tewari@gmail.com> wrote:
>>=20
>> Hi Daniel,
>>=20
>> Em 16 de nov. de 2021, =C3=A0(s) 11:49, Daniel Gomez =
<daniel@qtec.com> escreveu:
>>=20
>> =EF=BB=BFHi Devendra and Khem,
>>=20
>> I'd like to ask about the 'recent' commit you integrated in the
>> android-tools recipe a few months ago:
>> =
http://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-devto=
ols/android-tools/android-tools_5.1.1.r37.bb?id=3D4271cc28279b79140fc6bbde=
32c9110aec8d1d86
>>=20
>> Basically, you are adding a postprocess rootfs command to the =
$PN-adbd
>> package to include the '/var/usb-debugging-enabled' file in your
>> rootfs image or not using the 'ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd
>> +=3D' line.
>> I wonder if this is a new feature or perhaps an error, as I'm trying
>> to implement it in dunfell and it does not work as expected. Should
>> this work also in dunfell? Are the rootfs postprocess commands
>>=20
>> executed inside the recipe?
>>=20
>>=20
>> I verified it at the time (on master pre hardknott) with rpi-sdimg =
image type (from meta-raspberrypi) set in IMAGE_FSTYPES. Later, I tried =
to get it to work with wic / bmap image fs type but haven=E2=80=99t been =
able to.
> Thanks for the confirmation. I'm using wic+dunfell and it didn't work.
> I'll try to replicate it with the honister release to see if it works
> there.

I=E2=80=99ve tried with honister and it doesn=E2=80=99t work for me.

>>=20
>> Well, what I'm trying to do is to include a configuration file for =
the
>> dropbear recipe based on the IMAGE_BASENAME so I can include =
different
>> files depending on the image at recipe level. It works fine if I move
>> everything to the image recipe:
>>=20
>> meta-qtec-distro/recipes-core/dropbear $ cat dropbear_%.bbappend
>> dropbear () {
>>   touch ${IMAGE_ROOTFS}${sysconfdir}/file1
>> }
>>=20
>> dropbear2 () {
>>   touch ${IMAGE_ROOTFS}${sysconfdir}/file2
>> }
>>=20
>> PACKAGES =3D+ "${PN}-conf"
>>=20
>> ROOTFS_POSTPROCESS_COMMAND_${PN}-conf +=3D
>> "${@bb.utils.contains("IMAGE_BASENAME", "poky-qtec-image-netboot",
>> "dropbear;", "dropbear2;", d)}"
>>=20
>> Any ideas?
>>=20
>>=20
>> Official documentation is not clear where all  =
ROOTFS_POSTPROCESS_COMMAND can be used, but using it in image recipes =
works reliably for me.
> Thanks again. I'll do some more testing then.
>>=20
>> Thanks in advance!
>>=20
>> Daniel
>>=20
>>=20
>> Regards,
>> Devendra

Regards,
Devendra


