Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E731103A9AB
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:14:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20023.1774437277662119350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xlXlgy/r;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso44670835e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774437276; x=1775042076; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=727OqDW80IhOsyNd8Hz826BdImSMXkuQDdp+kJETC34=;
        b=xlXlgy/r2v8bjCNX29cSxe4w++eUM2Becq/XrIsMbc0xjwOyeaRmwQsYmVBZFVU6Y9
         31JyMTX/JKBkJV+x2D0xdZIzas/r0V+eNdYvRlg+c9u4FLTYDejE8P23L9P+U2QsrmxW
         YZOx4eiF8lF1v86vDPQknmCS2eXyEbxu4BmDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437276; x=1775042076;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=727OqDW80IhOsyNd8Hz826BdImSMXkuQDdp+kJETC34=;
        b=HTj6pMYHK29r2wgEn5xYRAdaGAFrmtc7byBxEsQYwh0edoiohnkGdi6Y+bDz5BZ3/T
         nulCTpcM8gY/cbO+dtTqdM5ASL+SQQn1xlsdpF8aDKGCjAWc5x4I3nKJJ+xQUaUlmS07
         s/CtSSx4/O1d88ON85aHOnFZ6/0Prbt96/Vsv4rY19CCMLGusi8KHgXOpRoYaIAlclRh
         u3Yk5wMwV42awfNx/ENlR7ZHuYNAOEJwsZmeFfUyNu2YioY485GsWAljjpZ+yXLbSR2M
         wimRkIQHYCb0h1SFclAeU2nUKFnvIy3FejAJgRXt2yQE0idzO49MnNKvjp4ozRTpTGQr
         trGA==
X-Gm-Message-State: AOJu0YwwzV+IzrMcDvRqOwekwCjdZ1RSDbOGR8T1s3vbDR3+YQDFMbWe
	dod624DpVaRmCh7I5opdVhyGafvqCWuBj+FVRylMR3fX9sBlYq9nhPVmE7OvAK+an4Q=
X-Gm-Gg: ATEYQzwPDpa8UFPy/wKenNwje/z6IbP8M8qpyVdtiyUEk/Kb6oe0httA771llbUNNzi
	iBmfhK85cRL4G9p/g6qyZtQVNtOLOlkS2dvkKKv3m7gE/J8lNxM/DFkWtBCqSqaX+11z2V83rW/
	jf32I1GVXBQ2TNQ4Uqg7wYWvZNd9EZCwQ7Jshc5haSTniTtY5XAysq5UDCqxanFJxtr7CA9Ykru
	UyFwwN6QI3WQEli4rsBcIqva6w8K11+51X1TWAxlPSvPjhEdrRJWkGYx4MpAKJHrS+zQaXpnRmQ
	kLA8w++ZVn78asItL6SehD4T5bjEjAmcG814RU7/Nbhof5h/6speGz1pcDvDr4aEZMpeKnRzzRA
	CmV/W/gHj7RnJLtFFfgQmMRiY9ejz4JtZQDY4m/F/z/Lo+LJdyvbVxu/8Iquwq/OHkfDa90o/om
	RbWKcFp/E961hXrJetRcS3M2FxcqyOKNxPeO1ZPO94+VK12yY1M3xh+WBDSMNGE1fBrF4oo/0OZ
	2ccSKg3Q9UPTP+uL4T1nC8//w==
X-Received: by 2002:a05:600c:1e1c:b0:487:e2d:f649 with SMTP id 5b1f17b1804b1-4871605bf1bmr44975345e9.26.1774437275798;
        Wed, 25 Mar 2026 04:14:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116939b8sm188804145e9.3.2026.03.25.04.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:14:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 12:14:35 +0100
Message-Id: <DHBTIMO2OYUL.1CSF3TOJY67TI@smile.fr>
Subject: Re: [OE-core][scarthgap 00/15] Pull request (cover letter only)
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Paul Barker"
 <paul@pbarker.dev>
To: "Ernst Persson" <ernstp@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1774391127.git.yoann.congal@smile.fr>
 <CAD=4a=X-6A-gOmq9M=Vx6x-2YjLP8QGLJP-DE2V6iYGvCoCtfw@mail.gmail.com>
In-Reply-To: <CAD=4a=X-6A-gOmq9M=Vx6x-2YjLP8QGLJP-DE2V6iYGvCoCtfw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233873

On Wed Mar 25, 2026 at 12:12 PM CET, Ernst Persson wrote:
> What happened to [scarthgap][PATCHv2] busybox: fix for CVE-2026-26157,
> CVE-2026-26158
> from Hitendra Prajapati?

It came while I was building this series. I'll include it in the next
review cycle.

Regards,

> Den tis 24 mars 2026 kl 23:28 skrev Yoann Congal via lists.openembedded.o=
rg
> <yoann.congal=3Dsmile.fr@lists.openembedded.org>:
>
>> Those are the patches from the last patch review:
>>
>> https://lore.kernel.org/openembedded-core/cover.1773966414.git.yoann.con=
gal@smile.fr/T/#t
>>
>> Passed a-full on autobuilder (with an AB-INT):
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3502
>> * qemuarm64-tc failed on what look like the bug 16058 =E2=80=93 AB-INT: =
rust
>> do_test_compile/do_install segfault
>> * rebuilt successfully in
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3396
>>
>> The following changes since commit
>> 077f258eb2125359ffe3982c58433ee14cb21f09:
>>
>>   busybox: Fixes CVE-2025-60876 (2026-03-16 09:21:34 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/openembedded-core-contrib
>> stable/scarthgap-next
>>
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/s=
carthgap-next
>>
>> for you to fetch changes up to 9f2a6cfda6a2305f52411ca8121f27c8a5a91fa2:
>>
>>   python3-pip: drop unused Windows distlib launcher templates (2026-03-2=
0
>> 10:56:43 +0100)
>>
>> ----------------------------------------------------------------
>>
>> Ankur Tyagi (2):
>>   wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
>>   tiff: ignore CVE-2025-61143, CVE-2025-61144 and CVE-2025-61145
>>
>> Daniel Turull (3):
>>   improve_kernel_cve_report: do not override backported-patch
>>   improve_kernel_cve_report: do not use custom version
>>   improve_kernel_cve_report: add option to read debugsources.zstd
>>
>> Eduardo Ferreira (1):
>>   go: Fix CVE-2025-61726.patch variable ordering
>>
>> Krupal Ka Patel (2):
>>   python3-setuptools: drop Windows launcher executables on non-mingw
>>     builds
>>   python3-pip: drop unused Windows distlib launcher templates
>>
>> Martin Jansa (1):
>>   lsb.py: strip ' from os-release file
>>
>> Peter Marko (1):
>>   inetutils: patch CVE-2026-28372
>>
>> Ryan Eatmon (1):
>>   oe-setup-build: Fix typo
>>
>> Trent Piepho (1):
>>   systemd-systemctl: Fix instance name parsing with escapes or periods
>>
>> Vijay Anusuri (3):
>>   freetype: Fix CVE-2026-23865
>>   python3-pip: Fix CVE-2026-1703
>>   inetutils: Fix CVE-2026-32746
>>
>>  meta/lib/oe/lsb.py                            |  2 +-
>>  .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
>>  .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++
>>  .../inetutils/inetutils_2.5.bb                |  2 +
>>  .../systemd/systemd-systemctl/systemctl       |  7 +-
>>  .../go/go/CVE-2025-61726.patch                | 21 ++---
>>  .../python/python3-pip/CVE-2026-1703.patch    | 37 ++++++++
>>  .../python/python3-pip_24.0.bb                | 13 ++-
>>  .../python/python3-setuptools_69.1.1.bb       |  9 ++
>>  .../freetype/freetype/CVE-2026-23865.patch    | 54 ++++++++++++
>>  .../freetype/freetype_2.13.2.bb               |  1 +
>>  ....10.07.bb =3D> wireless-regdb_2026.02.04.bb} |  2 +-
>>  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  2 +-
>>  scripts/contrib/improve_kernel_cve_report.py  | 37 +++++++-
>>  scripts/oe-setup-build                        |  2 +-
>>  15 files changed, 295 insertions(+), 20 deletions(-)
>>  create mode 100644
>> meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
>>  create mode 100644
>> meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
>>  create mode 100644
>> meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
>>  create mode 100644
>> meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
>>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb
>> =3D> wireless-regdb_2026.02.04.bb} (94%)
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#233828):
>> https://lists.openembedded.org/g/openembedded-core/message/233828
>> Mute This Topic: https://lists.openembedded.org/mt/118492584/4947266
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> ernstp@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>


--=20
Yoann Congal
Smile ECS


