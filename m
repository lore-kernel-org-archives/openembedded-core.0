Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD02CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:10:04 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.68191.1756779002238633724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F76aZGxp;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e96eb999262so3610893276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756779001; x=1757383801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAsf0Cned9eN5Htxgr855ejLaL6QvXw/YD2biOTVXnM=;
        b=F76aZGxp/IG6uz013Nof8CdNs+fdr+TRx7Cf/z8YrVhRGseIEXOHsHjTriKesAthP7
         pvhY0w8sosSxBjyaUHxUgcwgWosDMXdQg1AhymrYaWFV51vxq+BAYbMn4pS5j0LzYUY3
         02a8UL8M1Lr8ioDN96iYnJFXKn6o8cfLd34O4yXKKzyOHlaszJwc9tLkeXfwLcdM68C9
         A85cG98qB3D+iOzwzprFmlnRvUhqpha68fqyaYrMypTEMGewWkFiCXB56P9tBIbV2lG3
         Pd2EXV9qXYpgXz2052iApVftRXIcP7xu3NsIygt0Kw1iJSLWrvO1uOTtHdQYzDIT5Qxc
         GCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779001; x=1757383801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAsf0Cned9eN5Htxgr855ejLaL6QvXw/YD2biOTVXnM=;
        b=WgfGvx5YVqFxHTq1yGBWHGzQNvut0Oam6ZoShGsNqBJf+2vz5odyfs4XQlZ7ljeJW8
         YWoepAb+McnzEHiuE6QS/gpu2AXsCiv4DSJ3r83beRmEn1kPQ4vtgTXgaj+M4KEM3zGS
         FbnbE0hZXThhzQlUKw24yUM7EiAi3Q27E2vn+nDXQuoxBsc7a2ntnTwesxkTxBaL2vAF
         yffhOUZTm8aiy4uteTYpWOGFddYX+CCPSxzYJnjh1fZxvA1NgSlXPbNrkutGfCB0TJuG
         Mj3vG4a+7aKcW+fW3DENwZEMHF6BRhIaDXWAD34Id942lSFeClfpY4ZTU5KOuxIY1MTL
         4FTw==
X-Gm-Message-State: AOJu0YxVFk1FEHVTQYYUyMJMRq+4x3XQQX0KAXwT0QfI+15e/dGkSPXh
	PbZzUlft+exIND1Gbafk0ZGlYI9iqk9AcjxN57mJ5eIXhEFaS37tA8Hb2tW0Eqm/QnYfv/FPqa7
	G3z3ZoKd3xups/sMquCTFhdjT6JZ7MRo=
X-Gm-Gg: ASbGncvCxb7oIgBKtpW0WWWj64ks/i/CLS9iUiebtUHN0uQhuKeOBxsDG7oJHnozw4G
	q8ROKeC10LRaFt6wlmgi3sFB/VOH9S92S4xP7aQ+bLRbjSNnL1eQJaioP56cyItD/cgkExfxyau
	8AYDAwG0UsGU+7kAXCrhgbblwNT5BBlcUNixcnfOrutUBxjCqm1T+qWaaGotlX0G9yzTQmejIit
	kmxV46cx1rPpQTZiv8plJUkaLC9eIY7lTLfxWQ1yQLV4ErzM2MH5YOQ3S67AR3g4JxL8In7akkb
	etXmDUIFtAYVYrpvjbregCKPDcWlvtYDk/O0x/UmCM8zKAB3YgoQAH3eBH2WWIwHwkfD
X-Google-Smtp-Source: AGHT+IGRNHoHEa7OujWm0oMBuwaeLAKP2N7fkW9uvROukkjTDrBzMl27+bYOsN1x2CGJ3AuscttIHBPOQsycZPwWV84=
X-Received: by 2002:a05:690c:9688:b0:721:67c7:936e with SMTP id
 00721157ae682-7227658a1e4mr111765917b3.50.1756779001163; Mon, 01 Sep 2025
 19:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250822183352.2811555-1-raj.khem@gmail.com> <065c6f4c-8091-4465-a7d7-8b3272f940e5@cherry.de>
In-Reply-To: <065c6f4c-8091-4465-a7d7-8b3272f940e5@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Sep 2025 19:09:35 -0700
X-Gm-Features: Ac12FXy2fzaGRYNkqBYuT_znGyGtBrn5kJdvA1pQPsNRZ7ihBjEm1GwnqTk5HOE
Message-ID: <CAMKF1sp7d9sBVCXE6ZvGyTWtngw2mq4CpC3tChV+RN0+t7eQVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Address failing ptests on musl
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222691

On Mon, Sep 1, 2025 at 2:40=E2=80=AFAM Quentin Schulz <quentin.schulz@cherr=
y.de> wrote:
>
> Hi Khem,
>
> On 8/22/25 8:33 PM, Khem Raj via lists.openembedded.org wrote:
> > Take a partial patch to disable portion of test_makedev, its also appli=
ed
> > in alpine. NODEV does not exist on musl
> >
> > Add test_null_dlsym to ignore list on musl, it needs GNU ifunc support
> > and musl does not implement GNU ifuncs
> >
> > fixes
> > Failed ptests:
> > {'python3': ['test_null_dlsym', 'test_makedev', 'python3']}
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../python3/test_posix_nodev_disable.patch       | 16 +++++++++++++++=
+
> >   meta/recipes-devtools/python/python3_3.13.7.bb   |  6 ++++--
> >   2 files changed, 20 insertions(+), 2 deletions(-)
> >   create mode 100644 meta/recipes-devtools/python/python3/test_posix_no=
dev_disable.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disa=
ble.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.p=
atch
> > new file mode 100644
> > index 00000000000..85767e1e898
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.pat=
ch
> > @@ -0,0 +1,16 @@
> > +Disable part of test_posix.test_makedev that depends on the NODEV
> > +macro being defined (missing on musl).
> > +
> > +Upstream-Status: Submitted [https://github.com/python/cpython/pull/317=
94]
>
> Uh? This is merged already (for a year) so should be Backport instead
> with the commit log.
>

I think I should have said this as a reference to where the issue got
introduced.

> Additionally...
>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +--- a/Lib/test/test_posix.py
> > ++++ b/Lib/test/test_posix.py
> > +@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
> > +             self.assertRaises((ValueError, OverflowError), posix.make=
dev, x, minor)
> > +             self.assertRaises((ValueError, OverflowError), posix.make=
dev, major, x)
> > +
> > +-        if sys.platform =3D=3D 'linux':
> > ++        if False:
>
> This change isn't in the linked Pull Request, so this is all very
> misleading.

Right.

>
> Cheers,
> Quentin

