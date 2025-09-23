Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6729ACAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 13:17:53 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.16773.1758633463464020458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 06:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUVHIBAa;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ea5c06bd2b2so5662671276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758633462; x=1759238262; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqyX6T6/qRnKnJZ1XUmd/JiSHfFtmNqoo4P1RFYOcus=;
        b=VUVHIBAaOiQfqFyOE9LU3LBBZ6tcRQzQ+LLvAoFBccQfZ4SFxrkoSXrnJ7LN+b2WqS
         18oDSLy+rmHI88vs6dYDRGlrGA3O2qG66WBGemq7A1Xx1RK04hdiOgi5T0dupU2WGxhP
         RkVtadzzIbbHytZ3owy96CPJmo1eJ6ArFEHpYVz+tSCeSpekZXZ1kidIOUSo3tu4w7Om
         a/bvStwYPpuPSyy11Pg/fmyEo3cxKc4bG22Hr0mDKKDn8tgLu3zUHuw8M7N0yfCaGGDj
         eP+NL6t/Wp1sziAbS9mvPW1MkIrXvW94pGSWHiaWq2DyWRjD1rNGQGsdZz24J7abXJKQ
         0/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758633462; x=1759238262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqyX6T6/qRnKnJZ1XUmd/JiSHfFtmNqoo4P1RFYOcus=;
        b=uxVRe+u8gx8EnGDQ4bRHhXsRNFIL+MbTE0SsENW6cC+fqAMQa9N3B2di1ktFo4wecU
         DwXT9BRg5pQSCyKWxGTAFdaPBB/5qln/ewcYFQGlsNjJ4k2q2LRgSy2FG4WRH7XMeS6i
         yICFyq6K8WvO8eFo0yHkgiLmhHP3oEbvTmayi6z3sZtJXD6M5rZUUASbBd6V5Wg22swC
         WdrAXJmdyobZKLAWem70E9JDNDwI/v6ej2zuVIcCmBgztrt4DeZ/kx0xWbB3Wb4o7m3Y
         g7zuKe+7LPyY4FtZqXIW8Trffx2+KN81+v+5SUEopAI7f6B75HKNCeS9MuCAkrYgQVgG
         /F2Q==
X-Gm-Message-State: AOJu0Yy3rE3RzZz2mil40JN0BiHBlc0ISXdoeIi7KSpLYxWBgRL4OVFY
	7dWz1/Sij5fIcnzjPOiIOsEgPH6RkvHLF8n/thuC4j3rjrHNe87u8jybT1DHpkzdf8sbW2Ez4DO
	00jTK7vDA3MeP5k6/IFlwwGtzA2QdcrM=
X-Gm-Gg: ASbGncuFbbHfQy7jg9I5crblotV7boEiVGiNHn8+s0Iq6kIPn2j+FJcBeochC9esm5t
	Bop3MtCwAHIwyZswvLfz/ZNDLA+NHK0vgGXOiPiESUItOUl4NeZr2iTNU0GwzvAu4gQkaH+Y6R0
	fb0F9Uo7koiupI8l9mEMwc8I6j3gVAbRLhG5OfC9CCJGLxlImZMCm/EKgnF8MUKS3a4U2AVcOkQ
	QZmXi6jXZukpqBz1SngK2Hpr9VlSyd8UjG7CvH7yPzcSmK+fBBBei9FoaKWDAKy1k/occEno3o1
	5MefwL6Fcrnv4S+JyR5lsZkRNY9P083mZhmCtbHp
X-Google-Smtp-Source: AGHT+IFibOEti0ItLfteQiq3Q00BS8iQPGmhzgjBG98G0xa7pSSzlNaJLpnlyJF59kBE108tEKiwqfVbtah6ON5VJLs=
X-Received: by 2002:a05:6902:154e:b0:eb3:6261:1c2f with SMTP id
 3f1490d57ef6-eb362611e60mr1525583276.2.1758633462480; Tue, 23 Sep 2025
 06:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250923005234.2952070-1-Randy.MacLeod@windriver.com>
 <CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com> <27eb27a1-578e-4feb-a69c-adf1cb588fbd@windriver.com>
In-Reply-To: <27eb27a1-578e-4feb-a69c-adf1cb588fbd@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Sep 2025 15:17:29 +0200
X-Gm-Features: AS18NWBJ3nVzoxvzSq1HD59_EoYj5yYb9pkyJRe3lhblKoNYMWlqxFVj27iM-Cs
Message-ID: <CANNYZj8Nu3W3uXvoF4b=rBFu4_Wmp1qT5CKohXoPd1Jdf8E38Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gawk: disable persistent memory allocator
 due to licensing
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, "Yang, Liezhi" <Liezhi.Yang@windriver.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 13:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223878

On Tue, 23 Sept 2025 at 15:08, Randy MacLeod via
lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
> I don't think that rule/guideline applies here since pma.o is added or excluded from
> being linked with the main gawk binary based on the outcome of configure.
> That's now determined by what PACKAGECONFIG is set, so one or both licenses applies to the gawk binary.
> There is no separate binary produced using uses pma.o unlike the cairo case that

Neverthless, LICENSE is supposed to cover everything in the source
tree, regardless of build time choices. There are a few recipes that
violate this, they should be fixed as well.

> Do we really want:
> LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
> LICENSE:${PN} = "GPL-3.0-or-later"
> LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' & AGPL-3.0-or-later', '', d)}"
>
> ?

Yes please.

Alex

