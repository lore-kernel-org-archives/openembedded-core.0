Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web10.14683.1598365030214152162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 07:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hqXN2z8a;
 spf=pass (domain: gmail.com, ip: 209.85.219.195, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f195.google.com with SMTP id i10so7222657ybt.11
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h8rU4NpuncYH5Dw3g/YqyBatLXmAM5ffxh3L0bbrK+E=;
        b=hqXN2z8aoLolHzPOptrVNIL4AGFgDhYxYW/v5keB/ggkD8gheY5H+qm/FeQ1I1ECEz
         vh9zaTQ8knC/XiG3rOeU04vZq8TNMa0/m9+r7tX8iX4zJ8EbBjRpL6ffDDqO7C3VElZw
         70P4NiLNO+M6IY4Tu3zfs9QgGHSRVb553UkdJc318nJfMMdybfbVu6HWFL4LO+fXyjpy
         FdDSL+f3jFLg+89beAotLVxDKUojj1My4saQ/BMYdz7Mici1/bNhrweYoyAEnvjEgT1F
         pSsEZn9JvOv0z4XdZrs2MF0RKdazS3zsjsLM6BdNpvjgt8w4rshlExcCz7HUbqpJckrs
         8KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h8rU4NpuncYH5Dw3g/YqyBatLXmAM5ffxh3L0bbrK+E=;
        b=QSzOAXnmTlhpST6DPG6IVhZo9aaWArUt5QP+i5N49Cs090GBv5UogEuBx8LLtscG2S
         ASQJAyOSNktvNmkXZpY23QE4XmdqDPAXWoREmDsicwS9WagUVr0zyS0mf6hrvJjNVtrs
         +VkA2lvG9Rn2q1FlwJKjiuVBPVywEzD32aiDimbkjZn3MtZI8X68ktBFFc5O3E6rW32S
         mbrZA19NiA58qyG+cN6IWcETl0qvKhtAwDmpGUz9sfdZvq87HVqOYvJQ7RJDAvas2qn3
         m5MIKqP/29pGqsAXq3pTfokhxUHNUgTKvUlNUfyDOj5DrJCbhX/1au1PBV4YvBDMFMRy
         UWkA==
X-Gm-Message-State: AOAM53176yRcyfAQ+4N6iYlHhYhGdaxlhvFdv+kSUe1KG/B8OoaUXjzB
	TYFFcq9WqwRlIZyU3ZfrPGmcQzEgVJVf4KZlFF0=
X-Google-Smtp-Source: ABdhPJw3b1GYeG6Otz4pl2hwzVEeZe1iuH1E4mtFCB3CaK6MMO1B/pbCM8IQBx86p4/q0yRr6dDJF2SxpMV23NEKBGo=
X-Received: by 2002:a25:4149:: with SMTP id o70mr13772685yba.290.1598365029285;
 Tue, 25 Aug 2020 07:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200822152207.32161-1-liu.ming50@gmail.com> <20200822152207.32161-4-liu.ming50@gmail.com>
 <ad755709393c57c583a79c8b9d2308f2f2c3fafa.camel@intel.com> <CALatG=4yamjD-WJAS5WsS8s6UATJx=5jb_4ACXB3afU6MWQrHw@mail.gmail.com>
In-Reply-To: <CALatG=4yamjD-WJAS5WsS8s6UATJx=5jb_4ACXB3afU6MWQrHw@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 25 Aug 2020 04:16:58 -1000
Message-ID: <CAGDS+nn-QUSAP1n9i5oncgXM8i+PMziQnDx2yu+o1ftmXeB2pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [dunfell 3/3] libubootenv: uprev to v0.3
To: Ming Liu <liu.ming50@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"sergio.prado@toradex.com" <sergio.prado@toradex.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"stefan.agner@toradex.com" <stefan.agner@toradex.com>, 
	"max.krummenacher@toradex.com" <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2020 at 8:56 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> Hi, Anuj:
>
> Thanks for the review, I think this is a good suggestion, maybe we can l=
et it inherit uboot-config bbclass. Will send a patch to master.

Yes, good suggestion! I'll hold off on taking this patch series for
dunfell until I can cherry-pick your new patch from master.

Steve


> //Ming Liu
>
> Mittal, Anuj <anuj.mittal@intel.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8824=
=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>> On Sat, 2020-08-22 at 17:22 +0200, Ming Liu wrote:
>> > From: Ming Liu <liu.ming50@gmail.com>
>> >
>> > Update libubootenv to the latest 0.3 release, which comprises the
>> > following commits:
>> >
>> > ```
>> > 1efed83 Increase max length for device name
>> > 6f4fc1c uboot_env: Use canonicalized pathname when reading device
>> > 23b3086 Fix bug introduced by commit 52a70114
>> > ed1a53e Dont store to device if no value changes
>> > 4a0a466 Merge pull request #7 from TomzBench/cmake-fix
>> > 6117831 Added Coverity badge
>> > 49372a1 Fix coverity #293496
>> > 69a6819 Fix coverity #293503 and #293507
>> > 258bf52 Fix coverity #293501
>> > aa52e61 Fix coverity #293505
>> > 52a7011 Fix coverity #293504 and #293506
>> > e822218 Fix coverity #293495 and #293497
>> > 23b305f Fix coverity #293499
>> > 25ef1f6 Add coverity setup for Travis
>> > 41b5188 fixed install for static target, fixed BUILD_DOC
>> > acknowledgement
>> > 86bd30a Restore ability to feed script file via stdin, using `-s -`.
>> > c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP
>> > f4b9cde Allow negative offsets
>> > 45bf92a Detect sector size if not found in config
>> > 9f59db6 uboot_env: remove unused variables
>> > 65d243e README: libubootenv is now in oe-core
>> > ba952d0 BUG: variable lists not released in close()
>> > 690f868 Variables are not removed when loading from file
>> > 9e3586a Make sure there's no file descriptor leakage in case of error
>> > 03647c4 Check config file defines a non-zero Sector size
>> > 3b2d4f1 Check environment size from fw_env.config
>> > 879c073 Do not hardcode path for install
>> > d9c639b libubootenv: add pkg-config support
>> > cc628ee libuboot: wrap libuboot in extern "C" for C++
>> > ```
>> >
>> > Also add u-boot-default-env to RRECOMMENDS since
>> > /etc/u-boot-initial-env is being referred in libubootenv source, and
>> > turns libubootenv's PACKAGE_ARCH to be MACHINE_ARCH since
>> > u-boot-default-env is a machine-arch package.
>> >
>> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > (cherry picked from commit 02d55cd35aac15095fc44f0cf8f9e7a71638f485)
>> > ---
>> >  .../u-boot/{libubootenv_0.2.bb =3D> libubootenv_0.3.bb}      | 7
>> > +++++--
>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>> >  rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb =3D>
>> > libubootenv_0.3.bb} (82%)
>> >
>> > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>> > b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
>> > similarity index 82%
>> > rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>> > rename to meta/recipes-bsp/u-boot/libubootenv_0.3.bb
>> > index ea29b668e8..47e64f9114 100644
>> > --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>> > +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
>> > @@ -10,9 +10,8 @@ LICENSE =3D "LGPL-2.1"
>> >  LIC_FILES_CHKSUM =3D "file://Licenses/lgpl-
>> > 2.1.txt;md5=3D4fbd65380cdd255951079008b364516c"
>> >  SECTION =3D "libs"
>> >
>> > -PV =3D "0.2+git${SRCPV}"
>> >  SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps"
>> > -SRCREV =3D "f4b9cde3815abe84a98079cedd515283ea08c16b"
>> > +SRCREV =3D "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
>> >
>> >  S =3D "${WORKDIR}/git"
>> >
>> > @@ -24,4 +23,8 @@ DEPENDS =3D "zlib"
>> >  PROVIDES +=3D "u-boot-fw-utils"
>> >  RPROVIDES_${PN}-bin +=3D "u-boot-fw-utils"
>> >
>> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> > +
>> > +RRECOMMENDS_${PN}-bin_append_class-target =3D " u-boot-default-env"
>> > +
>>
>> This causes world builds to fail when uboot build is skipped for a
>> MACHINE value for example when UBOOT_CONFIG or UBOOT_MACHINE is not
>> defined. Perhaps this recipe should also be skipped in those cases?
>>
>> Thanks,
>>
>> Anuj
>
>=20
