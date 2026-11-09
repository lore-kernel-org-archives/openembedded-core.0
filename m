Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7883.1794236249887487506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZTIOrQIg;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67921b515a7so964126d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 06:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794236249; cv=none;
        d=google.com; s=arc-20260327;
        b=B4mh68QJkPssZFr0tLZ0Y+Nqo3F3s+LfXVrbFWBlYZZOkI2VTwP4iJmsXldpNt86HJ
         H2SKfG4Fws8x4OBAjsfQJrpbHN3HdQogQZgFOcOGSoJ2rvit/JCE7IqOIg+Fiz1r/Jxd
         Yx34UXhWnCITi7i6vh0bPr0+Zelp4HBOWWVCVyqVkc8d+S3VxYIaDkZowy7K25ppsWEQ
         HhT2fRgBs8vc64DO10U1Mz8ZevlvPFWMsYy+an2qUQHGVaC2cMYpEx8i5bpbKfnMrL7m
         +mDym1tV+u0Cwe4/ps1CriP073yoG90UjMcAOM3BmWNIv/J7K3RMRlTn3d9YE/GzO83j
         nzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ckfP152y9/YgUf80nk1capwQALn2VxzMqzTrWlCqxA=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=ZFXjhdB4KsdA40z+lenkvFGcm/kHNprILHsY+fr/RJy/bwQv94bNDwl4UNmR0VXtOh
         ao8d1G9tC21KqZ5P2svi6XhFsRu42Hdog5lo0vVae4aaOUCzYz/vTUPHdCDvEKFTml/8
         ZHLSVFM/Alh9xCfsKKZu+74zEpYZeQN4G6rWqrkAWNE0imdwn2oe74sXs/dFWnKE5KKV
         57PA4JEy/UKSCeb6HlZEHeZRLz9Cj7hz4gFizSGVPGXEhRwx9Veab86GNpLyPtzXWtyz
         YUULDMB4Wh3uBJotSmUEjjgGdFxwYRlGrcoTluk8Anj8e5Jc0kOOFUVZw+/1ToXJcr+9
         3JNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236249; x=1794841049; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ckfP152y9/YgUf80nk1capwQALn2VxzMqzTrWlCqxA=;
        b=ZTIOrQIgvuqApIvIoWL4bhs4UiIX+GHnDQBZyiElkdGOCxdIQD7hqz2tgw5yq3cQta
         Pb6FrKBE8Mmf9JT3KEtcdBQrt5njoYcNlwPB12S3A1GvGgQzDlYrIXSyGiVWt+Epzmq+
         t+Soc/rA0TeOypJOU9QyxLYAkkVKQQ1o4YIr8wTnOOBbl4Qz3ETfNofyTPWc7K3chkdt
         NBlcZMCyesi7AD5tiyHn+HQR7LiQ4/db7oVr5Q7PVRQivLY9ZXlqrE/OujjbRvenccTq
         MCCmanRm9ULMJ3w+c+ClNMrBBwlhYm3IL1GOBkF/DzBOlRrObdNnjgqaMMft3SAyQArp
         ohYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236249; x=1794841049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ckfP152y9/YgUf80nk1capwQALn2VxzMqzTrWlCqxA=;
        b=ijlwR7L8cKe0qa5M1EsgmgnbIhARjNPl/gq+iR6nAEXivrRUEd1Ze/FE1iu67xvLbp
         nojX26XPrfB1WJxJ1QoOFg+sJcUdB//Uw/ynMF8wesVYZTn6JehP+fQqtCwxDGOVvoOL
         ZidnZjc1Eqb8sCsqEE4gtcoYnSRBy+c+N98elqLC/h5EtFv7SdlD5U8Qhps/sN1v1Ks9
         UUa2FBAwmZJcpztclzSiZpfl51epG4T+39rk8cxE/Fqa61o9gewI16Lmuq8ZrHfk1yJa
         lbKg2GAD67Y769MS2XzpsCjOq58fvKehVqSAGhYy+fFcIxgS1fnc26xcnPceKjunkv69
         BEAQ==
X-Gm-Message-State: APuU4Z+n6ET7+XJbIq+0RrJE3Zh17pTdcf61HXU6WY41sa5EIIJktVFm
	USjdU8ghosgDFC7S16m3HqDm7f9hbRPlnIVo3KrOsAbWMzWjW6ZRFrMWqaYqp8WTGfXfFjv/nJ3
	HU/fpvnJ/vqdEsPdAo+R/GCol+V3RPlM=
X-Gm-Gg: AYBFou1oXT0n49uaauz/dCokOGQo2RO5E1LJr/wYBP6iBaQikYWoQSgIMZ8UoZSYNOk
	/hUXZKFKAcd35SsaM/Aim9zreeA4mgZ1l0N5QD4f/cQucgvUllADf+CPUUcqr5g+qtKAe3GMl9S
	LB33LGcVLltANIHmF5Y8QbZlos3X5j3kcFl+KX85wHRCz5tp5pkIfpa9KpEX+2uOvdb+XrDzU3P
	FxQLQbD9S3sVqwULwLqsO0QW+GZM07dVUWSaf/LeJ38pimPX0EtmcWbMxB6HZMLxWq7WCpyfZ5b
	2OVo8AvIJf7Ti3LcmwmF0X0wuyODDL+h85ug5WTQheAtqPHbzLacj9Vnr1zgY/T4+EyLAoRO2fA
	0VHjcyYrQ0vkXbnnbAgoa4nPmzMhkDaW/QP/cFZ3r8f62zL3lRYDyuV/0STTAjwk=
X-Received: by 2002:a05:690e:804:20b0:67c:a2c:8212 with SMTP id
 956f58d0204a3-67c3d9e74b5mr1656630d50.53.1794236248780; Mon, 09 Nov 2026
 06:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
 <DMQQVSTB0X1G.UN5EOW5V25PS@pbarker.dev>
In-Reply-To: <DMQQVSTB0X1G.UN5EOW5V25PS@pbarker.dev>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 9 Nov 2026 14:57:16 +0000
X-Gm-Features: AclHuK916_WlvkpEK8s_Jx-t2N1bMq7hGTuvWQrkW0INhWCrIBFho-o29iz_brU
Message-ID: <CAO5Uq5QPEBQckJQreGNtY1GB=Ttw7SA7+4GtgnXdLe_C7A1DeA@mail.gmail.com>
Subject: Re: [PATCH 0/4] fontcache: make the caches built into an image valid
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249856

On Mon, Nov 9, 2026 at 2:20=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrote=
:
>
> On Tue Oct 13, 2026 at 11:49 AM BST, Alex Kiernan wrote:
> > The fontconfig caches update_font_cache builds into an image are never
> > used on the target. fontconfig accepts a cache only while the directory
> > mtime it recorded matches the directory, and three things disagree abou=
t
> > that mtime:
> >
> > - fc-cache records min(directory mtime, SOURCE_DATE_EPOCH). When the
> >   intercept runs, the font directories still carry their packages'
> >   mtimes and SOURCE_DATE_EPOCH is the image's fallback value.
> > - reproducible_final_image_task then sets every mtime in the rootfs to
> >   REPRODUCIBLE_TIMESTAMP_ROOTFS.
> > - mke2fs clamps every inode time to the SOURCE_DATE_EPOCH in its
> >   environment, so an ext image ends up with a different time again from
> >   a tar or squashfs image of the same rootfs.
> >
> > So every process using fonts rescans and writes a cache of its own, or
> > fails to on a read-only rootfs. fc-cache also deletes a cache it has
> > just written for a directory newer than SOURCE_DATE_EPOCH, so with the
> > default values some caches are missing from the image entirely.
> >
> > Patches 1-2 run fc-cache under REPRODUCIBLE_TIMESTAMP_ROOTFS, with the
> > font directories' mtimes already set to it. Patch 3 keeps that time in =
ext
> > images, as oe_mksquashfs already does for squashfs. That moves every
> > inode and superblock time in an ext image from
> > SOURCE_DATE_EPOCH_FALLBACK to REPRODUCIBLE_TIMESTAMP_ROOTFS, which with
> > the bitbake.conf defaults is from 2011-04-05 to 2018-03-09. Patch 4
> > adds a selftest that boots an image carrying a font and checks that
> > fontconfig accepts every cache and writes none. On qemuarm64 it fails
> > without patches 1-3 and passes with them.
>
> Hi Alex,
>
> If the selftest case in patch 4 is ran without the other changes in this
> series, does it fail? I'd like to confirm that this test case would
> catch the failure case.
>

Hi Paul

It does, and did - that's how I found the ext2/3/4 case, initially I
just had the squashfs code, which covered my use case, but it failed
when I built for qemu.

I'll go & rerun it to double check just in case anything else has
moved since then.

--=20
Alex Kiernan
