Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9786AC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 12:14:11 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.19011.1707308047457295921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 04:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TN3n02cI;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5114cd44f6aso722839e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 04:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707308045; x=1707912845; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjC9qOyNjQ4Vp5u9GxHYrlipF7ORRm3ahwcOLB5KCRY=;
        b=TN3n02cI06DSL2uQNUS3S/R1AIj/cX1EBpfX9fuLEXY7PSav6eIucoTlUO1EzcH0/G
         /XrieGjABzXtK/1LDvGXKA2Y/gmw0Y30a4zVLrCrzEqez0pejo2bhG8eiPdXlBz0UfgM
         gXUjaL4WyML8gW2G49LS8Ox3QtKvhFUfFYGUixbEa2CDnpdTNTOEvz5NzXZ5oXKxXvnv
         4DMsQgMS3t7IVv/c/Kn9e3eIhZO7rNsnsCGTkAuTUhcx/9ndZqSt8ousOyEJoSsv97vd
         pOnfEOIaprfLwvfLRjkur3v5Vdv3SV/hYcf75RGGnZaB4r6Nh1KqhQ1CKzvFXOufxfbi
         GSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707308045; x=1707912845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjC9qOyNjQ4Vp5u9GxHYrlipF7ORRm3ahwcOLB5KCRY=;
        b=mEEt35GtZ8Yc7suKy1uBD6KcT8AUs7+JvxhnWFONoTTw3XUietUSbwKRNWHUtIW0BH
         dSU9qoYAYw+6xDr0Et9Kkmy3M1s9mnL59CosnLA9tr2SPZ3FEb6FfFneoWFw6et1nRzg
         /sO3MZr8i0FWBMWazOpvbNCQ2Q8lVS+9bPOGEJQrMJxijeVi9OWIA848NIChAp+aIE/E
         zJFDo4SA3AA0vT0TqY8BukMd0MbjATM/p7W7sDpucAVmlru2bUIOF19PTSFT31KF2cnn
         dXoDuAvdgaBwlcu+ZFJZGspMrl8ib8wFkEN9idTs/0pgNdroQ9qZoAew/jzsr2cgOGgf
         jnWA==
X-Gm-Message-State: AOJu0Yw1xoNgg0TYr1N7ZOmMWCp9SZSMwzu9u913G2Z6XU6GAmoL1DLh
	h4CQVDJJrWFv3xlq1P83D0NwvXcQJHVZ8O9o/i+IcMFzlvsQ9l15yk5ZGgZTQpGeKkTo86tZrua
	kr2LJrvti8rJkZcXgHsWP1Z6R+LE=
X-Google-Smtp-Source: AGHT+IHAbp45V1cfwDQ18QDAmYgBnlN1qfRcYkMbMCIgqHSlwYp7oQhwTwUDQqhbs3iVdrtzP9Sama/3fmGTDXcEMhA=
X-Received: by 2002:a05:6512:318e:b0:511:5ca2:350d with SMTP id
 i14-20020a056512318e00b005115ca2350dmr4164125lfe.47.1707308045347; Wed, 07
 Feb 2024 04:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20240207080823.498290-1-kai.kang@windriver.com> <17B19144C87B4469.2925@lists.openembedded.org>
In-Reply-To: <17B19144C87B4469.2925@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Feb 2024 13:13:53 +0100
Message-ID: <CANNYZj_zch-NxXO_H_37vG8=su7KzjzQEQfjrOr6J6eEHSJshQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ghostscript: correct LICENSE with AGPLv3
To: alex.kanavin@gmail.com
Cc: Kai Kang <kai.kang@eng.windriver.com>, liezhi.yang@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195055

I went through the history, this was the commit where the license
change was missed. Back then less attention was paid to checksum
changes without proper explanation:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=fb52e2f

This patch is fine, thanks for catching.

Alex

On Wed, 7 Feb 2024 at 12:31, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I think this needs additional research. Why was the license change missed when it happened? Do we need to adjust LIC_FILES_CHKSUM with additional entries?
>
> Alex
>
> On Wed 7. Feb 2024 at 9.08, Kai Kang <kai.kang@eng.windriver.com> wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The license of ghostscript has switched to Affero GPL since version 9.07
>> via commit:
>>
>> * 3cc5318 Switch Ghostscript/GhostPDL to Affero GPL
>>
>> https://github.com/ArtifexSoftware/ghostpdl/commit/3cc5318
>>
>> Correct it with `AGPL-3.0-or-later`.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
>> index 2a966afc21..2c965b6451 100644
>> --- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
>> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
>> @@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \
>>  HOMEPAGE = "http://www.ghostscript.com"
>>  SECTION = "console/utils"
>>
>> -LICENSE = "GPL-3.0-only"
>> +LICENSE = "AGPL-3.0-or-later"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
>>
>>  DEPENDS = "tiff jpeg fontconfig cups libpng freetype zlib"
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195052): https://lists.openembedded.org/g/openembedded-core/message/195052
> Mute This Topic: https://lists.openembedded.org/mt/104214872/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

