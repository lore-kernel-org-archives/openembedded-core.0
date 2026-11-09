Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2291.1794249965131350303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 10:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Nz24AzL2;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679334baa1fso1574820d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 10:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794249964; cv=none;
        d=google.com; s=arc-20260327;
        b=GE6pzBwV9uYPLjnu2XkO22Fa+rfq9khviA+7U7U0730H7RERa1f0V/kFzr7HFE3V3O
         j9UbmP6DLd3QTmxfKS2gkW2/d50wKpuk1bH2+0Bh8PUN/GHXgsdRmYP/wiL+7nvCtCXB
         NCHE6ooY54uYML+GOfJ0LAeL+Wczeg+SjRaaHkhIyY2sAk23p5rYukS1N8VdeAUkt7bE
         jPWzqRDQRKC+eJzTihE6mMKHQX3afEUbL6v5g5WKXOH3DZNZoM0UPB0pnBKcdiChcx31
         +mS74Q1ItheiTnX1mHGOSUprPWsvpPpU99gcznplPiu48jkylnNE6CdwhX/hRZYznigF
         zAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hliNiK/7b82pQ5Ohh2ZoFeAby8CqBhQziTWwJ0gs1og=;
        fh=AleUWv161yB2R8zWUBSjqQrISOpc033WA1EaxTb7q7k=;
        b=m+jWJ/1K51yF+oU78fpUoaek0kLz58nHIeX4a6N2G6pEFLUWw1NnIQLzRHItgTbm9i
         8tNt64SO44waiaPwQtnUb/jxlL9TUl3a8pLkf+A0X+MO1t49KIUvo3GwoHK+uLgD6voW
         OJvmEdeLTJXrz9L27zXHs/NVsG4KTkUPwC3nuaTdeUNq2aa2+7P3PD4uQeFC/t6WVX3Y
         l8FIWfE0tg2FOo4pZ8y/7KNXtqM8C0o+hjK8fa9w/MPvSpwDgMdmR80cQy8qWsSYfDOq
         McHIC6rq6bCjn0WeX5kRHgnrtIXbMrpBpkA6vv5g3DhYO+1LLq43iU3v96hQvzUy958F
         Hynw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794249964; x=1794854764; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hliNiK/7b82pQ5Ohh2ZoFeAby8CqBhQziTWwJ0gs1og=;
        b=Nz24AzL2XFtlgnpAY/kfdrQVK3sRk8wKC0sXnlUhFEMwb/mjbKI/H1443OKG+BE4zy
         XmKJYVZvEYTbzWev4tcvkucJziSazpB7xTzIQsATQ+e796Z5hPbwVRCf/hKTKAixM+YD
         juxtrDj/h4d604aSWMvaalZFCOjdiagjkV062GRuBoY5BuaXM/J+gXIwmyxbbNR7jVDQ
         ULg2DFjR0W7+YKNEKMVX5cq3x+b2n4MLhi4HB9uya7HEyjIL9bX+NSbtYsZP8nqYmIPY
         YtzLYUYcha5XUXcaSc0XRc8zgn1bZqvrdTnbePDDVo/MRcyt5hLf8ls6Zn7e6jCHNP6Z
         VVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794249964; x=1794854764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hliNiK/7b82pQ5Ohh2ZoFeAby8CqBhQziTWwJ0gs1og=;
        b=k4NZGxkL18qb1PzaXEeDCk9dcgfOVTZWu2+lnACPbTm8FiGjecaOZJWMEeS9LGOTuf
         gfmXqoHlNSkzEJ6haHMX9BbsXDD030iO4W5BUWMUn3GW1ndGTXPxr7smjC9qcBkkIVBH
         FjvMOcfPmAKI5KdLtE4ZnkZMOAc3dcpcCP7htcl8cT2ReOE8qoQBZB0S7YAJ72Ms2cWE
         LTguegsSFo+tdO0ZBpSA5d1JxIOTmb+lCnd3F+rSRZVqls8fqM4RwqdZH/VvvcCrPBlm
         ita0OtzrpY7MBSYt0S1WRLMsSWonyXKFuFo1/q0HEKRZGU1tlta068KV6Gd69IdU8LaQ
         Qj/A==
X-Forwarded-Encrypted: i=1; AL+hErEj9q8pxBP6pHRC/rwK/+5OXbrtV+QbJOaM147DSrzVXi8MoCXmeqZEziiGKRlvQkOhd+tG7f/0xfgZCy6GQbK2sQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/tKunXqz7hDBgcMUUoYBkYebCVzcoHhcqGHLYGCaX249Y7UK6j
	juSXjI2ngLtxkUiPbVV2TNF3c/22ZoFTgLO22TRf+haS+J2DqDa8JHTzNpM3D6kt0zM1xjkuzS/
	0mlJqhOzhMckqr5g89v275kR9xoKQPvmVrNuZ
X-Gm-Gg: AYBFou3y3QY/dwcBXIGqQFp8mzLfLGLH8mAIV9w7bhnklMyFww+RGQq8MimRwweBV7d
	HR5WIBYWIgN+Zlm0RWhidz+wUE+7pwNp0QoxeL0lqmDoeMiBt7u8zaEYs2GtXyELtRY4GbtoypA
	prMVOm43uA1HeidHa86IDnWmNgn1K5W6qzMvQt0i9WJn5OqHqwRrTzKoFeuWsnKkTDhltk7Sx5w
	kCG5hQbwTDy5qmCsn8U9UZwVkk0p2YY+q4LRbxczIe5DJ4am+8uFgH1cKW4dry9kST/gGnUSDEn
	WRvMO4jmD8auQRUn56AewfOkffRJl3/UIVjwAEC0GHateQEHhV/Dm8DTpNnaWPP07R4Ai06m+pE
	1GDL+tlC6s4PryUaZfAeEJSKIQA3EJv3t6pDJLLYRhcf25UQG8BKJ6BxIMtvLudo=
X-Received: by 2002:a05:690e:418e:b0:675:3585:242d with SMTP id
 956f58d0204a3-67c56800383mr193410d50.123.1794249964100; Mon, 09 Nov 2026
 10:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20261013-fontcache-reproducible-mtime-v1-0-950f07b80f0f@gmail.com>
 <DMQQVSTB0X1G.UN5EOW5V25PS@pbarker.dev> <18E6685CF84244C0.681194@lists.openembedded.org>
In-Reply-To: <18E6685CF84244C0.681194@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 9 Nov 2026 18:45:53 +0000
X-Gm-Features: AclHuK_mtHmBfHW84HrdAZBkrnz_p_vsLJwwwR0dEaTqM3QYN7DPPfPTT2e73dU
Message-ID: <CAO5Uq5So4YXX6KDTj+2d1uW=RTEisFsG76+OBcKmYq5DEdtQaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] fontcache: make the caches built into an
 image valid
To: alex.kiernan@gmail.com
Cc: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 18:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249864

On Mon, Nov 9, 2026 at 2:57=E2=80=AFPM Alex Kiernan via openembedded-core
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Nov 9, 2026 at 2:20=E2=80=AFPM Paul Barker <paul@pbarker.dev> wro=
te:
> >
> > On Tue Oct 13, 2026 at 11:49 AM BST, Alex Kiernan wrote:
> > > The fontconfig caches update_font_cache builds into an image are neve=
r
> > > used on the target. fontconfig accepts a cache only while the directo=
ry
> > > mtime it recorded matches the directory, and three things disagree ab=
out
> > > that mtime:
> > >
> > > - fc-cache records min(directory mtime, SOURCE_DATE_EPOCH). When the
> > >   intercept runs, the font directories still carry their packages'
> > >   mtimes and SOURCE_DATE_EPOCH is the image's fallback value.
> > > - reproducible_final_image_task then sets every mtime in the rootfs t=
o
> > >   REPRODUCIBLE_TIMESTAMP_ROOTFS.
> > > - mke2fs clamps every inode time to the SOURCE_DATE_EPOCH in its
> > >   environment, so an ext image ends up with a different time again fr=
om
> > >   a tar or squashfs image of the same rootfs.
> > >
> > > So every process using fonts rescans and writes a cache of its own, o=
r
> > > fails to on a read-only rootfs. fc-cache also deletes a cache it has
> > > just written for a directory newer than SOURCE_DATE_EPOCH, so with th=
e
> > > default values some caches are missing from the image entirely.
> > >
> > > Patches 1-2 run fc-cache under REPRODUCIBLE_TIMESTAMP_ROOTFS, with th=
e
> > > font directories' mtimes already set to it. Patch 3 keeps that time i=
n ext
> > > images, as oe_mksquashfs already does for squashfs. That moves every
> > > inode and superblock time in an ext image from
> > > SOURCE_DATE_EPOCH_FALLBACK to REPRODUCIBLE_TIMESTAMP_ROOTFS, which wi=
th
> > > the bitbake.conf defaults is from 2011-04-05 to 2018-03-09. Patch 4
> > > adds a selftest that boots an image carrying a font and checks that
> > > fontconfig accepts every cache and writes none. On qemuarm64 it fails
> > > without patches 1-3 and passes with them.
> >
> > Hi Alex,
> >
> > If the selftest case in patch 4 is ran without the other changes in thi=
s
> > series, does it fail? I'd like to confirm that this test case would
> > catch the failure case.
> >
>
> Hi Paul
>
> It does, and did - that's how I found the ext2/3/4 case, initially I
> just had the squashfs code, which covered my use case, but it failed
> when I built for qemu.
>
> I'll go & rerun it to double check just in case anything else has
> moved since then.
>

Yes, fails with just the test case commit cherry-picked:

2026-11-09 15:44:50,879 - oe-selftest - INFO - Ran 1 test in 218.834s
2026-11-09 15:44:50,879 - oe-selftest - INFO - FAILED
2026-11-09 15:44:50,879 - oe-selftest - INFO -  (failures=3D1)
NOTE: Starting bitbake server...
2026-11-09 15:44:54,103 - oe-selftest - INFO - RESULTS:
2026-11-09 15:44:54,103 - oe-selftest - INFO - RESULTS -
fontcache.FontCache.test_image_font_cache_is_valid: FAILED (217.83s)
2026-11-09 15:44:54,105 - oe-selftest - INFO - SUMMARY:
2026-11-09 15:44:54,105 - oe-selftest - INFO - oe-selftest () - Ran 1
test in 218.837s
2026-11-09 15:44:54,105 - oe-selftest - INFO - oe-selftest - FAIL -
Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D0=
)

--=20
Alex Kiernan
