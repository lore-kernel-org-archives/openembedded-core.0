Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.228.1602195102010952187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 15:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D+H8EUd+;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 188so8635845qkk.12
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 15:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jWAuMFprE5aexHcTAeg4st8dzqqBywjO/8mZM0M+OYU=;
        b=D+H8EUd+SsRz46g7Ij7Ph+gXzATNGDxII4Nj/De+rLPcDoKE6PKXWnACrQEMPsCiq6
         awRC9Ychp/Fm418xxXD/j4gu9yGiBBTgCcl8KO2RHZSIvciYVtTXPKPC3e2xA5rRrKwL
         QUDkdnSU9MVkKK0JSNH/m898FoPHTIugw8NBrxIqxSvOXwtb4XGY5gMt7DUXX9gxTL1s
         YIC2tQiaBnD9tzVp600rMg1JdcjGtbTuBu6ZHAoJkcEdyAPz+OU5TVVad9RcF9C+Hs3o
         LXHUJIRKFEcawp+D+8xrs18EtpNlQM8U6C8ZbyuLrHYvNk+OMWfxPQPaB+SMvcIsmCX0
         CVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jWAuMFprE5aexHcTAeg4st8dzqqBywjO/8mZM0M+OYU=;
        b=WuwS673nWHbGi83N4+sXdL/QDdqVYXA1Er+Nw7GIbY1aBjol02k655Yyy8o7zmUJn4
         Q+G99X4Qngn1HPpFTw9EG7keLKQhQVbDqyEcNV9yyE6sW+d3ZxaZ+QTLSKUFD+rTzTFP
         j7cBBGlp2NBpOwuqQUXKXiz3DXYuPynAel8Wqj3fz0kHR1sE1A93/ag2xwUvDWiQmdUN
         YS+7Zzo5DBUwzlenyNoAP9c9XYpnBTtDoZoBEo13MG1RYQt0ngKReJcc2psPnfg4Kpnb
         H1bKwGofuB9aQfhwymu07vXSPEJ3Fz+J15RWwIx77xazZPICnnF/EwH/nj6Xl4FD53jO
         qDMw==
X-Gm-Message-State: AOAM5332h46Zhc+SL//45KErQvv7oGv9Rrfm6eZaTaVX4CHhDyq9r236
	RwfbE3PGQ5ZaSVkPsB5ZVw+A+7qacqMWpn5qPrw=
X-Google-Smtp-Source: ABdhPJxScpede0fEk/RWwo/9RQ9bc041zRpwY06jqVitW5YiazjZTYlMrAX6jQ4fAw2S/wL1sw9wkM+R50Mid7EzqY4=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr10436341qkk.337.1602195101020;
 Thu, 08 Oct 2020 15:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
 <CANNYZj9oAoE_Se7HPd3y=sce9Mak-6n9zEBqyxikZr8trgJQvw@mail.gmail.com>
 <DB6PR0801MB203898E9E50E203D01B848C98D0B0@DB6PR0801MB2038.eurprd08.prod.outlook.com>
 <CANNYZj_RSJHxOYOWk=LGFKqbS3TH937J3HZtTn79drkM-HpgTQ@mail.gmail.com>
In-Reply-To: <CANNYZj_RSJHxOYOWk=LGFKqbS3TH937J3HZtTn79drkM-HpgTQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 15:11:15 -0700
Message-ID: <CAMKF1sqiXdHUDNTknBQMkJd=g28dtSRhSt1KvqxpXDP8r7ibQA@mail.gmail.com>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Brett Warren <Brett.Warren@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

someone may decide to allocate large amount of RAM to the machine as a
distro policy so images should not be overwriting that unless its less
than what it requires to run,

On Thu, Oct 8, 2020 at 3:01 PM Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>
> Can you provide a bit more context? Why is that setting desirable to hav=
e in meta-arm's machine definition?
>
> The problem with setting QB_MEM in machine configurations is that differ=
ent images need completely different amounts of memory; for some (such as p=
test images) even 1024 is not enough, for others (core-image-minimal) 256 i=
s plenty. The right place to set this is in the image recipes, with qemuboo=
t class providing the smallest possible default.
>
> Alex
>
> On Thu, 8 Oct 2020 at 13:51, Brett Warren <Brett.Warren@arm.com> wrote:
>>
>> Do you mean instead of the machine configuration changing QB_MEM, it sh=
ould be done via another image recipe?
>>
>> For context, I'm trying to enable the following line in qemuarm.confv (=
meta-arm):
>>
>> QB_MEM =3D "-m 1024"
>>
>> This is prevented by core-image-sato.bb overriding it instead.
>>
>> Brett
>> ________________________________
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>> Sent: 08 October 2020 12:36
>> To: Brett Warren <Brett.Warren@arm.com>
>> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org>
>> Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM defau=
lt strengths
>>
>> Isn=E2=80=99t it better to just make a custom image recipe instead?
>>
>> Alex
>>
>> On Thu 8. Oct 2020 at 12.53, Brett Warren <brett.warren@arm.com> wrote:
>>
>> Previously, to satisfy opengl's requirement for at least 512MB
>> of memory, QB_MEM was overriden by core-image-sato. This made it
>> impossible for machine configurations to specify their own values,
>> so this was changed to a default asssignment. To accomodate this,
>> qemuboot's default assignment of QB_MEM was changed to the week
>> variant.
>>
>> Signed-off-by: Brett Warren <brett.warren@arm.com>
>> ---
>>  meta/classes/qemuboot.bbclass               | 2 +-
>>  meta/recipes-sato/images/core-image-sato.bb | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbcl=
ass
>> index d8f62ef6ea..8e4ee9e49b 100644
>> --- a/meta/classes/qemuboot.bbclass
>> +++ b/meta/classes/qemuboot.bbclass
>> @@ -73,7 +73,7 @@
>>  # IMAGE_CLASSES +=3D "qemuboot"
>>  # See "runqemu help" for more info
>>
>> -QB_MEM ?=3D "-m 256"
>> +QB_MEM ??=3D "-m 256"
>>  QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
>>  QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
>>  QB_DEFAULT_FSTYPE ?=3D "ext4"
>> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes=
-sato/images/core-image-sato.bb
>> index 673106eb6d..ec5e2e20fc 100644
>> --- a/meta/recipes-sato/images/core-image-sato.bb
>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>> @@ -11,5 +11,5 @@ inherit core-image
>>  TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0=
"
>>  TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intlt=
ool nativesdk-glib-2.0"
>>
>> -QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512"=
, "-m 256", d)}'
>> +QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512=
", "-m 256", d)}'
>>  QB_MEM_qemumips =3D "-m 256"
>> --
>> 2.17.1
>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>
>
>=20
>
