Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2C5CD37B6
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 07:49:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.44729.1725436156791357842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 00:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OoUck5xv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so35427805e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725436155; x=1726040955; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYMIAAx3x9Z+7ozpZ1BjQ2Eom8VXx+6eUrFwMgnY4po=;
        b=OoUck5xvBbfvzuVxr4UsVKSW/oA+nUFZ8uSPWV7CO9VHGmuywV+TbgFWE9No9ihWCV
         72Ej4bX0VC/STCKwd9ExLjx6rveDf8w1b3G7RfLtB388iJ7zyXagTnTI/gEHdKm1whWb
         Zg2AmJdXJ6kuiHQ1qvJPAz2Lgury7Y5VKvEsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436155; x=1726040955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYMIAAx3x9Z+7ozpZ1BjQ2Eom8VXx+6eUrFwMgnY4po=;
        b=AGSM/EelVsczxhaUGP4ZCVXx+k08kKndyHHUk4ZkW/cZvuQpWNRWQFECDA3ybs9owd
         r2guvh99xEbNaySqMNHK0kSjbwr8N5l2UB3AEGUXYgLX3e7+tD+oquzvKmI1QAsL2QXg
         bnw1sIWeC+jTfGMCpW5U756+jnJBTf4F2QguWoSyWPdZ9GuHD5uvlVaH7GG4auI1rK9w
         NhR3tChCmfGMaCSpPmQysrnYZWHKcA5Kec2AP7GyquEfBIPXwWIg5EHHp6Di4gbaP2re
         fHWO+GCWrjLZUFW/s3pIlD0J/qUvMTIoOR/lWxqO2Qxe6RgIxlGRAfiUrq2HCA3C8eiT
         Pp8w==
X-Forwarded-Encrypted: i=1; AJvYcCVIJCBJg8ug0QYTgQo+fW7U37ydQi8jr+OnEtE70Yv+bxSl67ZCYRjCE6BqU3bIM69sfr3Y7Bo7S+D2voJgUNHYvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyc8k3D5+XFOEPhm1T3ONIC1HK5wqWcaotFmnMNt2cCpueukYaV
	vCNEHp6wIDJKOhvAeR1ED0C45brdgnHLjrirsbj5glQqoMulxjj6KG8ARsUwpGQ=
X-Google-Smtp-Source: AGHT+IGw+yrPEsxzESmYBR/gNSkEjN2g1cxRvjfi/o7fOHHl+tjZr5ZqmZDdw4HVlA8+5fBcBhkdeQ==
X-Received: by 2002:a05:6000:2188:b0:374:bde1:6dbc with SMTP id ffacd0b85a97d-374bde16f16mr11121098f8f.4.1725436154903;
        Wed, 04 Sep 2024 00:49:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99f4:e9dc:3777:c785? ([2001:8b0:aba:5f3c:99f4:e9dc:3777:c785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef7e109sm16058081f8f.67.2024.09.04.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:49:14 -0700 (PDT)
Message-ID: <cb42ff87d8f75d838619c9073dd9e1e9781d7235.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Sep 2024 08:49:13 +0100
In-Reply-To: <TYWPR01MB11861E7CD3D6346AD5F7A1748DC9C2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
	 <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
	 <42ac587c4e691d9c2526e9088de9bc27bb92b0b9.camel@linuxfoundation.org>
	 <TYWPR01MB11861E7CD3D6346AD5F7A1748DC9C2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 07:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204193

On Wed, 2024-09-04 at 01:25 +0000, Mingyu Wang (Fujitsu) wrote:
> I set machine=3Dqemux86_64, DISTRO=3D"poky-altcfg", but I did not
> reproduce this issue.
> Is there any other setting necessary?

That build also adds:

DISTRO_FEATURES:append =3D ' api-documentation'

Cheers,

Richard

