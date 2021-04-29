Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.7083.1619704217374688093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 06:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fcwqWqNH;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id w3so100036551ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5xRWG6dZgunJrgDrBid1Okeb6oSbbmzavPb/s8vtfC0=;
        b=fcwqWqNHd/K8awv0LkM5I2VoLlHW9Ez4XnY+XpTqiOfBz2GhwH0sTxMl3YgjlfWzCY
         Rta7L07ZYDs/fXu6OA6etqaNr/njSLPdmgBI2AN89GAi76kfzLQG62QMuun4MeVFymZe
         DCW00QLtr+2fOf/S97vTUQLMrvXQALmwIn/GfSsIQ0R3JEE8MgF7c5WYkBvrb1J4cGq+
         eniVZOKadWMnaXM6n13uJIpzRGqLOgK6UJFNrPifqo52v1iqK337rGoxBCX9g/jlllEm
         32YQNqBYVbc//Sr2vbXNL37XFeTs6txwH8kx99IyZ1lzjWy66FFpOij30KMWrPFUmoct
         Y2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5xRWG6dZgunJrgDrBid1Okeb6oSbbmzavPb/s8vtfC0=;
        b=TDXj2tjVv+JoXpO0P0IcQ1cHk6DzsYzyZDB4GbXglglSOz4mgrIty5ovdEqAmtEEzR
         geY3Eee9GjsV2Vh8th7HI55gCevfMJ8+mObKLOgsB5PisheiCjaqeA9MS/ylRIu4nR4G
         fxhVJvuCHl2PUi4KHcVL1R53xlRWiatg1YJaeUvWTj+mPzQt4xcN4l0Eek0Cx/62cIXl
         YU/TxXycJ56Lk1CcO4VmPhLolHXdU9ccKxKu9344e4oI3fPd8r2DqnyfAkAhWlmpiqti
         xi7SskSIjf9omqGTEkloQQ4gyk8w7TjeHXxOeKiozPG8IKvzRpWtcFWQk6T244E5yGPm
         gSOQ==
X-Gm-Message-State: AOAM531muMkKSVA/wxghlAd219lEuiwwZmVfR7EeC2Qq3DcdrPwWT+OU
	buUtUVO0HbmcHLNwM0JESUsnYJzgbQnkzzA5DKQ=
X-Google-Smtp-Source: ABdhPJwDOzC/wZ0uOB0FVP1ugsFoXMJESToIsMyMvoAPTExQVn5Pu6Gdp7SsxGTJOuitDDxJVPleXnCUixtrPQsy2CE=
X-Received: by 2002:a17:907:9691:: with SMTP id hd17mr23416133ejc.67.1619704215668;
 Thu, 29 Apr 2021 06:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <1619700210-5544-1-git-send-email-zhengrq.fnst@fujitsu.com> <CANNYZj_NcGXDPQT_obKT1kfB08_eO_B7TC96hLCvuY32=-5_vg@mail.gmail.com>
In-Reply-To: <CANNYZj_NcGXDPQT_obKT1kfB08_eO_B7TC96hLCvuY32=-5_vg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Apr 2021 14:51:25 +0100
Message-ID: <CANPvuRkznpRBwBvOpkg20fU9RmHVBo_dYQC=qB0uiUqz08JQdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shaderc: upgrade 2020.5 -> 2021.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: zhengruoqin <zhengrq.fnst@fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex are right, the patch misses the SRCREV update

-SRCREV =3D "f3e39a7eed682faececb73f0b85717f2f44ee9ba"
+SRCREV =3D "bdd134d1b7eca01925c1919d2ea05fd3cd6843c7"

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quinta,
29/04/2021 =C3=A0(s) 14:43:
>
> Neither SRCREV nor tarball checksums are updated. How come?
>
> Alex
>
> On Thu, 29 Apr 2021 at 14:43, zhengruoqin <zhengrq.fnst@fujitsu.com> wro=
te:
>>
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
>> ---
>>  .../shaderc/{shaderc_2020.5.bb =3D> shaderc_2021.0.bb}              | =
0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename meta/recipes-graphics/shaderc/{shaderc_2020.5.bb =3D> shaderc_2=
021.0.bb} (100%)
>>
>> diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb b/meta/rec=
ipes-graphics/shaderc/shaderc_2021.0.bb
>> similarity index 100%
>> rename from meta/recipes-graphics/shaderc/shaderc_2020.5.bb
>> rename to meta/recipes-graphics/shaderc/shaderc_2021.0.bb
>> --
>> 2.25.1
>>
>>
>>
>>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
