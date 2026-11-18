Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15221.1795015758798962823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=V/ksLjzW;
 spf=pass (domain: smile.fr, ip: 209.85.218.47, mailfrom: bastien.jauny@smile.fr)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5118deebcfso105037366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 07:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795015757; x=1795620557; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1eUy0EIwe8QQZwHJ0ntkv6ruIJLa+zAoE/6cAN/xT78=;
        b=V/ksLjzW5WcSOl4zjxbUslTCGph4/2BGcGQr3iyfmVgtJpjLdGyx5cA6sUNONpFwMC
         dSNwlt23ouFNCpjTlDRqg3XvrgcIMWSubAWkZR6dIWRGDKLA1IlNC61kOKQUbRpyDxGO
         s16yUic73xfN55ZD3/bcvm65BhsmN1gRbPHafjpyIHBBCgYtkdDfBJlJmQ5hErf3gY4/
         HbBXtZDkQmA9NuRDDSNh6O/zI0lh+/V1BShTe414h8DMqg46qSi8Q2PCr8uGGxgB2Vb2
         dguzA5QGqdl7QMYRW5B3BFuAu1B4FVaajBxKM0yBJYLAzf2mTrG886H/VTojkGXOeZbe
         XM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015757; x=1795620557;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eUy0EIwe8QQZwHJ0ntkv6ruIJLa+zAoE/6cAN/xT78=;
        b=BMZSYFkhM7K6JevG5JIcT4MlUtQ/Q8llOy7G7oVwJCdgmawCAdnEIOlcWn58TI0/HF
         WgWsT3ctOvMyz/b+bm3xhllxbxd2GGIAQ4/8wd6psKGoX7wqYN4HAj0dDWDB48zefYCe
         qkq8sXfkVirDWIyvVjBYPHSRtN6SPBXo9U/G8VQYuJHSJdyfuwkllGrzAOERh7uHRuOJ
         cZTxJdGKubb+pTcZMBd3yNaQbF431ZE3EtRV2k2AKGFwefG3O2/ffzSgbAxRfQYkZSOy
         o/GJwruq8StEDGlxmXU7mG0insRIGDyN2wmQuJziW0wj4wTYReWVh0Eo9gtVdFePOFyW
         kHTA==
X-Forwarded-Encrypted: i=1; AL+hErHMI0S04mSC9dYkeWSUG1ZG+WcEdFvTOwFvgMqMFe0FOCSslyVCy9xuKMuers0dTfEsUF9c+DD7pdjOHxm3cbNdDg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/AEY8032sF8ARh1zOJF6QRqrLWIiUdEwhvYmcn8K8hpOT7J1DO
	G9BU6kZjdDSu6Ow+ytC1bU4RADAJ3CuA96vfa/rwyztoSHFRU9Dymykb2GDOObhKNC8=
X-Gm-Gg: AYBFou1vQqFVzR6yUBFo5fjDPt5t+U3AyrYYn6zmrNJtJj/FruC/W7IR0u4PwWo+seQ
	u1ML54z1eXFXvRvuDr5+jf1PuXV+yKPbNTDgEb4R5x9kMQzEgqWvaMYnSonbQDHVb2cX284oZ1e
	I6lpAr4rPsl/KwuZLsnnAVZvaDJzJlZwltinorINztWpr+gPeCEISNMivWGu8RFldJzakNpWmdq
	PqsvJTlkHdvkzD/L3q6xMAWtZmaAdC8EaHcBiu4Ss6hY2sjhELJXkbg5cBd9UALzcGit11y1vPi
	nSHyBo+TiA9NFoXAmkmnvhs+dpnVfn/z05Ly+YszqT1pTA2/TAg7MKEZg4SyfYzdYIHnkl5jEhI
	e4b8CK1bo6PosY9/NftuHeeOG8gi5BS+OsrMxTJRG7dxIwEoSRrNm1M5tXA8OAdfQ7/UluPNTW3
	lIaJncCHXaAoHMk7RkvVjlemoEW/r7DgXy1AC23mv2CkT0rAncVFU6LkCuw6cxCfOCWRM/eJ+c9
	9puBtREc9Woe4lXVXeY2I+c64pI7hepge18IGNU1qDizKWjsXQPYvMsQKpjkAwxGDKVQBNXvyl2
	g43EH+F9A42GDDWpK9MC9ZBywhd2BrWpiXldAh80xfaWFVkiAAatWVguW9XGhRjjJb0KuOyYlui
	arx/aBpTiw9RlRA==
X-Received: by 2002:a17:907:da16:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c510e31b1a3mr278725866b.44.1795015756832;
        Wed, 18 Nov 2026 07:29:16 -0800 (PST)
Return-Path: <bastien.jauny@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm9992766b.59.2026.11.18.07.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:29:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 16:29:15 +0100
Message-Id: <DMYFZA08GN5O.1NH2ZMPJFRX2B@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/7] curl: fix CVE-2026-87865
From: "Bastien Jauny" <bastien.jauny@smile.fr>
To: <bastien.jauny@smile.fr>, <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0-38-g09b49b623995
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
 <20261106144134.1370928-4-joaomarcos.costa@bootlin.com>
 <18E92C06A5741D4F.1359844@lists.openembedded.org>
In-Reply-To: <18E92C06A5741D4F.1359844@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250566

On Wed Nov 18, 2026 at 4:05 PM CET, Bastien Jauny via openembedded-core wro=
te:
> On Fri Nov 6, 2026 at 3:41 PM CET, Joao Marcos Costa via openembedded-cor=
e wrote:
>> This vulnerability, marked as High [1], was fixed upstream [2] since
>> v8.23.0.
>>
>> Backport the fix to curl v8.7.1.
>>
>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
>> [2] https://curl.se/docs/CVE-2026-87865.html
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
>> ---
>>  .../curl/curl/CVE-2026-87865.patch            | 212 ++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>>  2 files changed, 213 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch
>>
>
> Hi,
>
> According to the versions affected, this should be seen upstream. I see
> it has been submitted for wrynose but nothing more.
>
> Could you please submit this one for blacksail also?
>
> Thanks,

Sorry for the double mail, I should have reviewed the whole series
beforehand.
Patches 3/7, 4/7, 6/7 and 7/7 should be submitted to blacksail
before going forward.

I will drop 5/7 because the CVE is already taken care of in a
previously submitted patch.

Regards,
--=20
Bastien Jauny
Smile

