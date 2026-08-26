Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B436C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 17:10:04 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17521.1787764199258874314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 10:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2Z5j6iB7;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso694345e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787764197; x=1788368997; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tZy/5GIBmkdHWVObVljmBzJ932aST6wJ9rwCS+6yk4M=;
        b=2Z5j6iB7hZylaULUEICV80YEfnylesG36/1qp+XtCJLvLWmWvap1pwSsdspB7rRhZr
         SjpsamMT/NYBKBxfgGLYI0RHhMy2HLZ9eXKfcfGnsc27lGueDYoaKlIOu87ZbW/E70Th
         Ij2WdlqzJkadyk4xYc8fNtReCq0lKFF6C+8jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764197; x=1788368997;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZy/5GIBmkdHWVObVljmBzJ932aST6wJ9rwCS+6yk4M=;
        b=jLgkavJIoQYuL7aM2yr0HOFvbETljykd5F64xWh38xg0gzHigHl6Pe9uZAmx9CWkNR
         SlH4ezpAmKIuq5QmzANhVDw1YeLpUV2yYWa1qoSxg9kOVvVqtY0NxQ34GoHXu6AyOrCX
         rrIHuLxpq0gW4e/ZR2SJuirbz9fTG8+o/ml6YLIaeslR8WaUUg6znQVjoIlrnhHmQct1
         4taHickt7H6Nj+4BoUcWtfK57bC75hE4jXuye7fHZXFs6+OeLqZ0u1t1+ZsLndQMSUVL
         5zwZFSaca5iJp3gbtq6dqkhCMIBUVXb5ftutFe5j5zkLF19oaiKWhWJWyWO/Ppf2cQ05
         yoPw==
X-Gm-Message-State: AFuF++kX5Ya2gnLKdEleDkzN0mLZPJUAc4634KObKROLdG+ZBFP2usUC
	dVSAhtTyDscyihKRlMjf19MQyI2JOwz1zYKv/7j58yv0xIC8xRlK3oFlzhfdaT0DT0g=
X-Gm-Gg: AR+sD13LkfsivcUlK0A9554rizXKrFoVDaCHNH5OD/6QRChgrbf9t8e0+UpM84t3TMQ
	VZ+cZLi6ITQ5Hl4pZvpFANl8jkyJ1PvBke/gQhxxsrtHq3FQBJDbJo3ZIxoSNsWUQq7Zl0nmnQk
	ryBTx1+OqHdWHfkI5uz1PwCf7LUti+wP2O9XvzEmGVfLJfYAyWxA+X6yfjfjFGuNzW/GTjyUsOy
	PBTgZKH7JEzEdpZSi/YDcdbDkpqkugcfEfoK4B3EVoIhPCIFOURsStUD9Ifx8UVxAULQApQo5yG
	V2wTp/v9HnMRSYCZfSqdhnYd5Momr3p25E30HxjkhHgwa97xy9l4q+CIZDqhKjA9dXKusqLZIyn
	75GBMQy5KFKbD9LTJxLkI6KYJRVwgJTI0/MODq2MD2vY6btN0zWe+5BNm4tr9BvbaUE7Bb6OmQD
	+brnc073TkOZIJBtFBpD4VFSGmgOAdINACianJAJFLrk7/+/FYxQ40DInWG3MSLz5tvnHFHCuiW
	2j7gqDcVrujZYiRHRzHLkkPQie9edK6az64L24BOtXkhcTWoJci
X-Received: by 2002:a05:600c:3151:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-49b0deb14d0mr7150875e9.3.1787764197427;
        Wed, 26 Aug 2026 10:09:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm20842135e9.4.2026.08.26.10.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:09:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 19:09:56 +0200
Message-Id: <DKZ1IM1Z8T8O.1D5HCOURS6TZP@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCHv2 13/13] vim: Security Fix for
 CVE-2026-59858
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>, <sdoshi@mvista.com>, "Fabien
 Thomas" <fabien.thomas@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260723092354.54697-1-sdoshi@mvista.com>
 <20260723092354.54697-13-sdoshi@mvista.com>
 <CANQUz18xEMFKxx9QpXjfBomaJkzJWyj1nkF_vp96fna=dG7LmA@mail.gmail.com>
In-Reply-To: <CANQUz18xEMFKxx9QpXjfBomaJkzJWyj1nkF_vp96fna=dG7LmA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 17:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244410

On Wed Aug 26, 2026 at 4:51 PM CEST, Vijay Anusuri wrote:
> Hi Team,
>
> Any update on this?

For this series, 6-13/13 are in "awaiting Upstream" state[0], that mean tha=
t
I will check if their equivalent merged on master&wrynose (I plan to do
this next week)

You can check this yourself and send the missing patches if you find
any (please be mindful of exiting patches on -nut branch and on list)

Regards,

[0]: https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D4905=
3&state=3D%2A&archive=3Dboth
>
> Thanks & Regards,
> Vijay
>
> On Thu, Jul 23, 2026 at 2:56=E2=80=AFPM Siddharth Doshi via lists.openemb=
edded.org
> <sdoshi=3Dmvista.com@lists.openembedded.org> wrote:
>
>> From: Siddharth Doshi <sdoshi@mvista.com>
>>
>> Picking patch as per [1], and same patch is mentioned in [2]
>>
>> References:
>> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-59858
>>
>> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> ---
>>  .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
>>  meta/recipes-support/vim/vim.inc              |   1 +
>>  2 files changed, 135 insertions(+)
>>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch

--=20
Yoann Congal
Smile ECS


