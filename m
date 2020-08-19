Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web11.97996.1597871667478590332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 14:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0GeMZ/o;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id d20so7313578ual.13
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I630esikJ4pjOr2CSIwJ4RuvYqDnCAyHVLjTnO7Fdx0=;
        b=L0GeMZ/ovWEYklfF923ewDrhx8DcOTF3MkOvbGmEH0hdeFRJwNkea7zLhenb9OVMNl
         vi8zaZiTZPPSiB0Q+wvOP5gtimIgXc+VnXZVJAsxrO0f2m3sIwU1/c8bf0J6aerbEtnw
         a1wrmD3KFVBJuNA1Hovzwf63jJwtDgNO88Ski8GCwXQDWNXdCHtaRW7zJOiplx2dzH5i
         KQnwsEMrlM1wvk9oHrJy+qYL0vCJd6YnWjTGSQds1OK/ml3E25Y2i7XPBbJDVa9nbZPK
         yVb/TRUUhL1Y5AZBDN1iSi9efT+WthaUOHS1uU886O4325rBYziSM6a0DU7I4Iw5e9fb
         Kl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I630esikJ4pjOr2CSIwJ4RuvYqDnCAyHVLjTnO7Fdx0=;
        b=UY6fFCEqwZkuFL99ikXZjJnBtdABZJIsitGFRxHU7m2Ue6MlYu+Xdf4+annd6XcXoR
         gcWemgc4Ga06f1R+q8nxER9tnMKKjUaIy5RJc7ilunauE5VFBNetest6vlFiUnoy3KGv
         F3yb7rWow+TksBzMHVslSIX4idOCNl095fTuNpVXokjTI527CbANJ5MTXpQDrJXbW8Th
         H9nOs7+vOksPY3okp7+PYdwfsYSyNFFOgTCvVcCRULBY0CNb7RywCLlg3mFB7ZOMpLen
         f1so4vkBqRdZeGuzkJCNkvJC2zeIycNKOXUQhh1ot9nAXKUf4gvVbtaOZ8XyZ3kW/ScW
         gV8Q==
X-Gm-Message-State: AOAM5309p0IPYG4TdKdK956tx3yikf5brdfazuBN5fO3+2VCghR1Kw4F
	mQUW4f6j+bGydTyCLrlhejm9ThLqB/bCWCIlvbE=
X-Google-Smtp-Source: ABdhPJzQVToHHRfJI5Rkvdg1nHOksJBXRiC0FvZoZS/esWOeFZzGoRXOdB71tT8wmhrVfO5CD7p5wfEsgkIOtcN7paU=
X-Received: by 2002:ab0:5fc8:: with SMTP id g8mr15205355uaj.92.1597871666504;
 Wed, 19 Aug 2020 14:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <1597438000-20251-1-git-send-email-leon@sidebranch.com>
 <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com>
 <20200815075529.GC31467@localhost> <CAMjhiJh_QwJLavAEcEkDsrBgaT4AJUz+f-Qzy80PJ_NOAEUKyw@mail.gmail.com>
In-Reply-To: <CAMjhiJh_QwJLavAEcEkDsrBgaT4AJUz+f-Qzy80PJ_NOAEUKyw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 19 Aug 2020 14:14:14 -0700
Message-ID: <CAJ86T=XxkO51-_uB-TV828u3YAjcAPhqmWjm9jg9H1w-E0C59Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH] cmake-native: Use cmake-provided zstd library; supported host distro zstd may be too old.
To: Leon Woestenberg <leon@sidebranch.com>
Cc: Adrian Bunk <bunk@stusta.de>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 1:49 PM Leon Woestenberg <leon@sidebranch.com> wrot=
e:
>
> Hello Adrian, all,
>
> On Sat, Aug 15, 2020 at 9:55 AM Adrian Bunk <bunk@stusta.de> wrote:
>>
>> On Fri, Aug 14, 2020 at 11:44:17PM +0200, Alexander Kanavin wrote:
>> > This needs to go to master first probably?
>>
>> Better for master might be moving zstd from meta-openembedded,
>> and then DEPENDS on zstd-native?
>>
>> IMHO moving target zstd to OE-core is already overdue,
>> so this would not be solely for cmake.
>>
>
> Good point, makes better sense then my proposed fix for cmake-native onl=
y.
>
> More breakage of master against Ubuntu 16.04 (still supported by Yocto) =
that supports Adrian's suggestion:

If cmake-native is auto detecting zstd support from the host (and
therefore building non-deterministically depending on whether or not
the host has zstd development libraries) then the build breakage is
just a symptom. Adding zstd to oe-core would be a good approach to
fixing the bug for master but not for older releases.

>
> | ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-comp=
ress.c: In function =E2=80=98int lto_normalized_zstd_level()=E2=80=99:
> | ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-comp=
ress.c:120:36: error: =E2=80=98ZSTD_maxCLevel=E2=80=99 was not declared in =
this scope
> |    else if (level > ZSTD_maxCLevel ())
> |                                     ^
> | ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-comp=
ress.c: In function =E2=80=98void lto_uncompression_zstd(lto_compression_st=
ream*)=E2=80=99:
> | ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-comp=
ress.c:160:74: error: =E2=80=98ZSTD_getFrameContentSize=E2=80=99 was not de=
clared in this scope
> |    unsigned long long const rsize =3D ZSTD_getFrameContentSize (cursor=
, size);
> |                                                                       =
    ^
> | ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-comp=
ress.c:161:16: error: =E2=80=98ZSTD_CONTENTSIZE_ERROR=E2=80=99 was not decl=
ared in this scope
> |    if (rsize =3D=3D ZSTD_CONTENTSIZE_ERROR)
> |                 ^
> | ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-comp=
ress.c:163:21: error: =E2=80=98ZSTD_CONTENTSIZE_UNKNOWN=E2=80=99 was not de=
clared in this scope
> |    else if (rsize =3D=3D ZSTD_CONTENTSIZE_UNKNOWN)
> |                      ^
> | Makefile:1118: recipe for target 'lto-compress.o' failed
> | make[1]: *** [lto-compress.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
>
> Did not deep-dive into this, nor test with Adrian's suggestion yet.
>
> Regards,
>
> Leon.
>
>=20
