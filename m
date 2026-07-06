Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F2DC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:50:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151469.1783345846866433420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dHUwDF/q;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1750278f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783345845; x=1783950645; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k064ppXfFDp7J1crH6OjoF4rqSzvHDYfT/tVLqodYp4=;
        b=dHUwDF/qEp6ElR/gSN6ZreXHQxYsosAQVKzz34swo+EiAyGFm63/KWU+3+OQMdSJiC
         vZ2Eadk07zuQ+gnygHrKwvFCPQ0XxRxHov7WQukzrsj6nOjZBzaN38HdEkmMHLdWfNrI
         t939Y6m6nrQF3UXj+WZQidEZ0ue3yoIEQViEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345845; x=1783950645;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k064ppXfFDp7J1crH6OjoF4rqSzvHDYfT/tVLqodYp4=;
        b=ho17FiDHVnqefrAC0gALTmxIxWXw6PDg+C/tS3zeJguOVFpifhsHmF5CMUEHsXYDCi
         vQGBXXojFdg9oQ0DWlxMsfrVB8QR6dpG4Y+Dm+IBmh7amuOjFWNleL25zg/JL0QdIUpW
         FW1YNE48x9UOEiwj9+2hQH/mz1wG8H3O8DX8CgX6GWFZLadupNBOkC0OjkDYcLeAZnl6
         asWEz6Npe8UkgiNQbR9V0UGjxb3t0zrqeuP5V+Hgo1exMq/W5qPyOoa+A/DPbV+TNuin
         vYG0SrK7t8lOk6jhrQFBoO2qiTXnoxwPA+S+bptCJ6BDAng9FScLtsKFAn507KwHWgXN
         2w8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrBxntj2ffDCeJnoe4yQZMdjdjJpyFX/kPzgYnk8eXNM5+BBdcfdnd5gws8RSBQlCi1EjXwMcsPOGZ+cUNHvgG4Dg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZM/nwiSt35powrCzaDfTpWtmAMVVKUjzdH0K36yCD+bxqR9ey
	mXxtGCjarowKyp/DNnNgWds4cKxcUrYbNzlymqEs4iV9R9/TsMF2ehvpGSuBvfFHMfc=
X-Gm-Gg: AfdE7cmmytrZ/wX3G9CSPMsFo+VYZMjLoua7DFKhyKkI+ykyDbwzis98cBp7yz57BqW
	wqN7lc2yopDLuVwtS2S29To+9g3SS9okYvouzEdVrPjnV3o3+G32y+FTPDQFUBW9bd0TJwNoaCv
	TfFNri1nd2bLwSAREF6dUbXJsHLHNCwQmSJlpHAjCUyhVVI3FdJGY8/XIm56om0M4x6WjoL9XDr
	1IBEP9OYGEIBveilWp+7TgcMUhvIex4MKfog3QzlHylUzpkIvkMSSEmSXiZsXpfmU+xeNiWuAeH
	SPZP3BU190muXs2jZooukyrmfNhhT5Js+zW3rLNMG8gEF2QA+75mir8vy5tiX0NUHt7kbvtmd0T
	6D0BYg2XvPRo9fAfyXyOWSDPRp1f4ohG+NPDnIFJen/OA1wEswdJBr2EImhYwRF8YpujkLDj1Ae
	L9zGlFZVDQA08iBfg=
X-Received: by 2002:a05:600c:6d86:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-493df0786f2mr5208995e9.30.1783345845007;
        Mon, 06 Jul 2026 06:50:45 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb62d3sm310660745e9.8.2026.07.06.06.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:50:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:50:44 +0200
Message-Id: <DJRJCATTYQ54.2XO9156CH6Z7T@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/2] util-linux: Fix CVE-2026-3184
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: <jeremy.rosen@smile.fr>, <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260520105959.3115597-1-hsimeliere.opensource@witekio.com>
 <20260520105959.3115597-2-hsimeliere.opensource@witekio.com>
 <DJ4MKBK72LA7.1ZVS07CUD82E@smile.fr>
In-Reply-To: <DJ4MKBK72LA7.1ZVS07CUD82E@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 13:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240272

On Tue Jun 9, 2026 at 5:30 PM CEST, J=C3=A9r=C3=A9my Rosen via lists.openem=
bedded.org wrote:
> Hello Hugo
>
> This patch seems to also be needed in master and wrynose, but I could
> not find a submission for these branches
>
> please submit for those two and then ping this mail so we can continue

Hello Hugo,

As far as I can tell, this patch is still needed for wrynose.
Can you send it so I can accept this for scarthgap?

Thanks!

>
> (note that the other patch in the serie is applied correctly, so I will
> continue to review it independentlya)
>
> Regards
> Jeremy Rosen
>
> On Wed May 20, 2026 at 12:59 PM CEST, Hugo Simeliere via lists.openembedd=
ed.org wrote:
>> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witek=
io.com>
>>
>> Pick patch from [1] as mentioned in Debian report in [2].
>>
>> [1] https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c=
1ac53d88ae07e1331984
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-3184
>>
>> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
>> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
>> ---
>>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>>  .../util-linux/util-linux/CVE-2026-3184.patch | 63 +++++++++++++++++++
>>  2 files changed, 64 insertions(+)
>>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-318=
4.patch
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-=
core/util-linux/util-linux.inc
>> index 8380419634..961a7318aa 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -47,6 +47,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linu=
x/v${MAJOR_VERSION}/util-lin
>>             file://CVE-2025-14104-01.patch \
>>             file://CVE-2025-14104-02.patch \
>>             file://CVE-2026-27456.patch \
>> +           file://CVE-2026-3184.patch \
>>             "
>> =20
>>  SRC_URI[sha256sum] =3D "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b968=
10bd572e167dfed0f"



--=20
Yoann Congal
Smile ECS


