Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C3FC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 16:47:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17213.1787762822766116236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 09:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ugzUS4ul;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49978908b35so8009665e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787762821; x=1788367621; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tJhEgJ9NRrrHJFSoh9rskgn0/Zth67YXl1B1ZPsL7Hs=;
        b=ugzUS4ul+Ch4JFw3Z7wdYL9urraXv5JRDJgUNXWCQ4YNfN/LRBtGtcUaMwljht9r7X
         AABm29g9LJIE+s0KONWyE9yBhnF6xozgN3338R01cUlvLFSv0WA4mqvPpQlkWZCLyu0B
         1fKzgtlmNGbVg98GAbJH65WRkJmk3DgsvfFJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762821; x=1788367621;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJhEgJ9NRrrHJFSoh9rskgn0/Zth67YXl1B1ZPsL7Hs=;
        b=DLSPJnFXDYwW+W6xIEK2m9vnFK1M7n2Ww85dY50gP4k+6wKSwylZNQjBmoY1Be8CWv
         X6rgp+W9wxHupD4NAvDQP8Dp/xgkdDoG/jITM5qdt7HRHvfym8LhZXCEeTv1Zj545SD5
         hTSjYVP/vA3NM8usB5or5csCpp/QEtTsYmnNxNz3HtWR0bvou9v2WYnccfDXx4x2i2Qn
         Tha6gerPbZGJFcfn0Qb8SHmYWOtaWA9M1HZ9X6TFC88fonEtU/OpNCYxMKISgX5gxBwk
         lHkiBxo52dePn3cFWZQQOQUSNtsjA80fIH5vWAFnEJL+xaCs6uPMw1mZ4nA5qKDlnjZ2
         SUSg==
X-Forwarded-Encrypted: i=1; AHgh+RoWWk5ebK/9VJs/aBBgcQCrG+mhHNmXuQOpsudhNpJYWU6WYz5cYwWIRPAnVH3t+a6MRoV3ItVVg0k07OM81hVBPA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kzrdEXHI/oelyTWKLbA4YAZcu+VHhjWZ8kie5b2FMsU6G43CHj
	d3DBT1rZYCE+va1ek5ktO7NscKRCnGBUQaJ2GHQCafhZ+PnkgzArc8+xwwoLYYl2AWo=
X-Gm-Gg: AR+sD10hXKWojEwXONZFxPcfdDJewwQUBoxztckw983ibCr0qT8BCH3asmL3VT43EYs
	NwAnmhXOmQZcouINM402VAne1wTKBubEL7mlwNDWtc/JAJ1+WxWzzLEkMCwbCHJEliObZ05jz2L
	o+WeKVL8jMMX0lVJjVoUkfZGdGPCWg/MP5vog/N01F/YAyVjHuvPiBCGB78oD/YNXiNHrMImPVz
	NY/l3zC/oUniR3M3B8SI199MFay+qi8CvihbARzpfQqR35zqp2WPYG/Z7O3l8ZwHPwQuEyRAa18
	l4A39Sh24Yl80chDheUOHnEMRUhwcaIQBxKv/VmaKe3X6apqP//oFymEB4luH8yk6GoCPDXVVGL
	avS0qYo4ITfi6XnR/OckCj0fwS4QDOHu961KjuRMRs289SmIqZ/XfvWYHNzz7xaH4Xb106rny8v
	tsAueGJq+YunA/98IGvjg8Px4BMwQ5d4Zo48RYAsaio9GmZW+6xpGNqk/TBJuwtjaDCBIM4KqFn
	wW1uWsBfXtPEVSEsHEXto4qoDnokPXIObCKBsyCCGfrg+aVPhtH
X-Received: by 2002:a05:600c:3144:b0:499:d639:8475 with SMTP id 5b1f17b1804b1-499dc6fcd3fmr83092335e9.6.1787762820784;
        Wed, 26 Aug 2026 09:47:00 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm20450945e9.4.2026.08.26.09.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 09:47:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 18:46:59 +0200
Message-Id: <DKZ111A76XZ1.1W1MDCFR6JXMH@smile.fr>
Subject: Re: [OE-core][wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260814101941.873295-1-vanusuri@mvista.com>
 <20260814101941.873295-3-vanusuri@mvista.com>
 <CANQUz19Omf0=PS3QMYQBHwuvwZu2QXGTcBnXKh9aHq1c=vPCSg@mail.gmail.com>
In-Reply-To: <CANQUz19Omf0=PS3QMYQBHwuvwZu2QXGTcBnXKh9aHq1c=vPCSg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244407

On Wed Aug 26, 2026 at 6:26 PM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> I couldn't find this patch in the wrynose-nut branch, while the other two
> patches in the series are available.
>
> Could you please check if this patch was missed during the merge?

Hello,

What you saw is part of the series from Peter Marko that does not have
the 0.26.4 -> .5 upgrade.

I'll review my current -nut branch first to send a review series. Then
I'll add your "[wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5"
in the next series.

The queue is ~160 patches long right now, I can't take all of this in
one go.

Thanks for your attention and patience.

Regards,

>
>
> Thanks & Regards,
> Vijay
>
>
> On Fri, Aug 14, 2026 at 3:50=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.co=
m> wrote:
>
>> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>>
>> ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5
>>
>> 0.26.5 (stable)
>> * rpc: guard against overflow when decoding nested attributes
>> (CVE-2026-18938) [PR#777]
>>
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5.bb}            | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb =3D>
>> p11-kit_0.26.5.bb} (98%)
>>
>> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
>> b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
>> similarity index 98%
>> rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
>> rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
>> index 9219e9eefc..8229cf96c9 100644
>> --- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
>> +++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
>> @@ -14,7 +14,7 @@ SRC_URI =3D "gitsm://
>> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D
>>             "
>>  SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
>>  SRC_URI =3D "gitsm://
>> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
>> <http://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
>> "
>> -SRCREV =3D "a14788849d1ef44422d679534a13821eab5bb5f4"
>> +SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"
>>
>>  PACKAGECONFIG ??=3D ""
>>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native"
>> --
>> 2.43.0
>>
>>


--=20
Yoann Congal
Smile ECS


