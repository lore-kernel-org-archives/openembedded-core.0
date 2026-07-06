Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0DC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156220.1783358056089611973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tkpvJhJo;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c19bad03so30770325e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783358054; x=1783962854; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbr9Bs7H6ZDxdZH7qpGoN6wLoGAQVGiZlT2pFSYreTA=;
        b=tkpvJhJoRAOgIjZaMUFxuEj2POz3k+o42Sj89+QmQ2LIXU0jCnUPI41+BGUmT3txR3
         emk7ueKNyn4xqVLDDMlbxxNf+Bo5DMWFaNSF9kVLp7gMw9e/OOLt7mo3+qeHMJKg+EnK
         Ag728947WgQe1fYJR/DPWt2WwQrGyXuFFZ/SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358054; x=1783962854;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbr9Bs7H6ZDxdZH7qpGoN6wLoGAQVGiZlT2pFSYreTA=;
        b=ZhG0SYVIupS+yOw60mYtlWUg1q3oQ153/cBaDnpKxj2rlt6pn+3d5JTLedQSACAwpb
         0GlC9MJ0fyy1K0QOi24/cvr6TKaffP7BAHXzFWYZuIjJkbLwOp9mLs1vuJ4rHtlCjjcN
         AcIl7EujU/S8doYGvk8JFL/ro1V2BkLlwAGnPO973OzcIR3NN2R0fpG1Gg0BADXB1d95
         zYGNucvFqf0XhDqNYwJfKFjpEA2uXvRfPgtT8xylGwXxOrrIqb2hSiuz6yKO2sbz2HBv
         aMiIMfESe/TlQHeDGoD5hrtUd+d5FxJn/T5RXD1Wv6s1uFGin0qpDGJ/0iN4L7I+6h2v
         JwNw==
X-Forwarded-Encrypted: i=1; AHgh+RoD6Gpp57Igc7n+SAWHLoo4kKCk3hQVn2I8iC/0r/Nr0JTqHCBIgTIExo78Cuxg1y4qv1ONc8H/tBlddkPFQ0hh3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVjjuztleEpuEHzYfnDOzvUl3CcaES0MWn0czx2kfbt9oOOMfl
	Ex0HQACu+KAgc2aSOJDQjAm08v6xprJwuY83LFjwNFxNy1aFGKNGcJvCth6RdGGCt7A=
X-Gm-Gg: AfdE7cllQCWgHCpPf4wuQZrLZbNYJ2bxEuAE4egWtbBbhaEEd0X4MZaRNhiaU/zb475
	CgfxodOj59OIK7eExLRp/WCsLHM2mujxFmpVlyrr3AwyrYHSxb6ddQ33iBzYP7AIOaZK1lHrQb/
	6KZIRJZ6a0F9099T8CgQDdujJS0w7HioyENtHj/l6C03a47UyVw6Lr6OjND4q8XGynmhTBdFNWL
	IaJSPQze5Azv0kAMUgL3UDrAs5tn+deuYFv169BVidgNNJYp8Mi0k2fCkcyXAVuFjbWHy0hVoPW
	96E8fuNAWp2hv3Urn/jf7ulGIp/4HxEu/9cJLhzUGcPFcUIZuj5vGsTbHrZE08Tu4N7SRR2+VS1
	C4O6K2paWAC5zBhG6uw4kpzG/rMuTG7hZoQ7uKqdgZHDCias82PGW53z72K3GMUFTAQaQkDL/zb
	tYhhTPMEpZ+jc=
X-Received: by 2002:a05:600c:1552:b0:492:5551:19c6 with SMTP id 5b1f17b1804b1-493df0413f1mr15978755e9.7.1783358054293;
        Mon, 06 Jul 2026 10:14:14 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640170565e9.13.2026.07.06.10.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:14:13 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 19:14:13 +0200
Message-Id: <DJRNO3IHV9C8.25R1KSCEBO276@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <rl@karo-electronics.de>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/5] sign_ipk.bbclass: add missing
 'd' parameter to raise_sanity_error()
From: "Yoann Congal" <yoann.congal@smile.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260602142132.976138-1-rl@karo-electronics.de>
 <DJAJVFJKICFA.NKWQQAQP6953@smile.fr>
In-Reply-To: <DJAJVFJKICFA.NKWQQAQP6953@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240286

On Tue Jun 16, 2026 at 4:40 PM CEST, Yoann Congal wrote:
> On Tue Jun 2, 2026 at 4:21 PM CEST, Robin Lintermann via lists.openembedd=
ed.org wrote:
>> The second raise_sanity_error() call in this class lacks the 'd'
>> parameter which would lead to a python exception rather than the
>> desired error message when the corresponding error condition is
>> fulfilled.
>>
>> Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
>> ---
>
> Hello,
>
> We have a strict "master-first" policy so any patch needs to be merged
> on all the more recent supported branches before merging on scarthgap
> (in this case: master and wrynose).
>
> This patch (and the other patches of this series by quickly glancing at
> them) is needed on master.
>
> Can you please sent it there first, and then, ping back here so I can
> take them for scarthgap.

Hello Robin,

Gentle ping for these patches, do you plan to get them merged on master
and wrynose?

Regards,

>
> Thanks!
>
>>  meta/classes/sign_ipk.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbcla=
ss
>> index 51c24b38b2..9f666998ba 100644
>> --- a/meta/classes/sign_ipk.bbclass
>> +++ b/meta/classes/sign_ipk.bbclass
>> @@ -40,7 +40,7 @@ python () {
>> =20
>>      sigtype =3D d.getVar("IPK_GPG_SIGNATURE_TYPE")
>>      if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
>> -        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), =
use either ASC or BIN" % sigtype)
>> +        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), =
use either ASC or BIN" % sigtype, d)
>>  }
>> =20
>>  def sign_ipk(d, ipk_to_sign):

--=20
Yoann Congal

