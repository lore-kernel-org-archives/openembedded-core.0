Return-Path: <lifeofthanks@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614C9C25B08
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 08:59:24 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.3596.1660121962699185264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5m+gC0O;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: lifeofthanks@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 73so13779065pgb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc;
        bh=6zcCi3jGttvKYfziRInRZmiJC6a6qMp3nZyZOGuzHE8=;
        b=F5m+gC0OrHMoE1nsyTiw/NSL451ex3mKLqDu3ZPa/jMrs4MUdVR8DtvPDX9Y8KUNJ9
         iu8VqWZdmlAwv46Zt23FI3MokX/mptAkJ9B6HkRVCK84bvMUvCktH1SRv+vI1DVQPIfU
         FLchHIE8xKUwcPFUdezCpkjcLdWICuq1itbp+RkeCKtmfzhQPqoYqWUMruBGP4eWrgAc
         2PJ77a1HCCTypJZIjSoLTiUroOUc71fukohRku9QZxlESX2Zwz0HQoWGoCxBxnvZNvS+
         sImmsvCwpjzpGVw8fUKYTmZOEaxvutsaco+7HADBLYjRozqhzRPI9HxOU/tLPuSaqSxW
         Y3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc;
        bh=6zcCi3jGttvKYfziRInRZmiJC6a6qMp3nZyZOGuzHE8=;
        b=kvU3O0CO+aLEP2ozNWiZewzXUWF85hlch3d36UBb957DpcqhJ2VGSz7xw+ELze8D4I
         UwU79b45MK3eCu106LnkXk+D3ReUEMi/mactUs1ew0QOOz1OiMWY+4sF41a5j2dfWLsG
         86qs4S5+E40OI0hPMojpBQU+onkbeG/ScpuUWfvagPfuZIenTQ/8/MLfQxMhKBu2Gs64
         3633AO6sLY8vZMUI0blX4tpn5+JsIE1D8MH39/yxjBUvk5BSfVXs+XHsfD04u+mES1XV
         rXwn9gha1rrEjwOWEZDl8j7tQ/2Z++4WwUPzYb/GJNEh7w8oDpcifaGOuGxif9e8L218
         XUdw==
X-Gm-Message-State: ACgBeo2Y+tdGWH1hU0S1flGVyCmRBF20tK4hH8RUczqLLbP0QQSQA+oD
	CLp1wkuqlD+kD8lAEvMe4EGvej6iPVyisg==
X-Google-Smtp-Source: 
 AA6agR7TDVipbf76Le8u94SEsWpsmIvw0bco+3F51g1lL7sMU/Uod6A96DSUvQs8kpAkvnb7WZBrRg==
X-Received: by 2002:a63:5f92:0:b0:41d:f447:76f1 with SMTP id
 t140-20020a635f92000000b0041df44776f1mr2129275pgb.456.1660121961549;
        Wed, 10 Aug 2022 01:59:21 -0700 (PDT)
Received: from smtpclient.apple ([117.111.11.145])
        by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016dbaf3ff2esm12325716plk.22.2022.08.10.01.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 01:59:21 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: lifeofthanks@gmail.com
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH] wic: add 'none' fstype for custom image
Date: Wed, 10 Aug 2022 17:59:18 +0900
Message-Id: <ED44FD47-635D-4937-BAA3-AE9C4F277969@gmail.com>
References: <YvNi59exCGgnhioM@mail.local>
Cc: openembedded-core@lists.openembedded.org,
 JeongBong Seo <jb.seo@lge.com>
In-Reply-To: <YvNi59exCGgnhioM@mail.local>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: iPhone Mail (19G71)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 08:59:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169188

Thanks!
I resent it after the master rebase.

How can I request to merge this patch to the dunfell branch?

Regards,
JB

> 2022. 8. 10. =EC=98=A4=ED=9B=84 4:48, Alexandre Belloni <alexandre.belloni=
@bootlin.com> =EC=9E=91=EC=84=B1:
>=20
> =EF=BB=BFHello,
>=20
>> On 08/08/2022 04:57:10+0000, JeongBong Seo wrote:
>> It's not possible to set the label (of gpt entry) normally
>> when I want to use non-listed fstype as a rawcopy.
>>=20
>> Example)
>> part ? --source rawcopy --ondisk mmcblk0 --label mypart --sourceparams fi=
le=3Dmypart.raw
>>=20
>> To resolve this problem, this patch addes a 'none' fstype
>> and ignore do_image_label on rawcopy (that actually set the partition lab=
el.)
>>=20
>> Signed-off-by: JeongBong Seo <jb.seo@lge.com>
>> ---
>> scripts/lib/wic/ksparser.py               | 2 +-
>> scripts/lib/wic/plugins/source/rawcopy.py | 4 ++++
>> 2 files changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>> index 452a160232..298e593ad4 100644
>> --- a/scripts/lib/wic/ksparser.py
>> +++ b/scripts/lib/wic/ksparser.py
>> @@ -157,7 +157,7 @@ class KickStart():
>>         part.add_argument('--fsoptions', dest=3D'fsopts')
>>         part.add_argument('--fstype', default=3D'vfat',
>>                           choices=3D('ext2', 'ext3', 'ext4', 'btrfs',
>> -                                   'squashfs', 'vfat', 'msdos', 'swap'))=

>> +                                   'squashfs', 'vfat', 'msdos', 'swap', '=
none'))
>=20
> This doesn't apply on master, can you rebase please?
>=20
>>         part.add_argument('--mkfs-extraopts', default=3D'')
>>         part.add_argument('--label')
>>         part.add_argument('--use-label', action=3D'store_true')
>> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/=
plugins/source/rawcopy.py
>> index 3c4997d8ba..a71629282d 100644
>> --- a/scripts/lib/wic/plugins/source/rawcopy.py
>> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
>> @@ -21,6 +21,10 @@ class RawCopyPlugin(SourcePlugin):
>>=20
>>     @staticmethod
>>     def do_image_label(fstype, dst, label):
>> +        # don't create label when fstype is none
>> +        if fstype =3D=3D 'none':
>> +            return
>> +
>>         if fstype.startswith('ext'):
>>             cmd =3D 'tune2fs -L %s %s' % (label, dst)
>>         elif fstype in ('msdos', 'vfat'):
>> --=20
>> 2.17.1
>>=20
>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169013): https://lists.openembedded.org/g/openembedde=
d-core/message/169013
>> Mute This Topic: https://lists.openembedded.org/mt/92886214/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

