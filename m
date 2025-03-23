Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7181C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 13:01:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.15429.1742734879520865817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Mar 2025 06:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CavMLlp3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso23860435e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Mar 2025 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742734877; x=1743339677; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuLgwshpfHbBuqTen+qwMC2l6vrNJjWES43dw7Nv49k=;
        b=CavMLlp3Pn2CVfPb0A+pRkG2aCJnyj7r9YKrVAJ5AOfkq9N3f/16/ARm/9SvSJB/A7
         qn4IsLOah+kWzXJAX7pG1hpVfdRgViSdlI2TCJLJewgMM5nFXBdilLBONjlvimRn940A
         dgIK6qs+dV201tW5lOhDOMbWjuhih+3TCGST0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742734877; x=1743339677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VuLgwshpfHbBuqTen+qwMC2l6vrNJjWES43dw7Nv49k=;
        b=T4xAwtD/HBwyloLsYLrV11euvghd6Z5N5zvqiUnlYCT075C0WVWVYFeHXTm10VbHmZ
         MoLGYEu5Db7K/bIcrGfF70tMqUPvaD/S4Q8ardV8xb00u5WQWsKfNIpIC1MB7ecB+A4j
         cxLrwkJlljCYNBcOtjaocldwHyFqQy5bLlv0V4fGEJT+17OpGx1f69spA+H6sKypb/qM
         2EQGqEu1e8rpjKrHsroesLMms98UkQVzDwlIyEeCYOQF0JLv5SPRpcoGsZyeHSLTnMce
         joMZlC+5sEa6Gra2cGJCFP7CJKqrwoHnKUzYynLYkXJPJeVXRUkOqg3rRtfD3b0739sL
         7jMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrU/7oUthaNLcyaPHhSKuxSC+LOaQDW7gP+CIrNM4l7Qy61wa10bO/O3M9O2EMK1yzgmrRRqyxvLvfRGdH0TftHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YybsEOeaaeG4PZ0y4ffCuweIUZqldDWmO5HRncH5xbZ6c0liGDW
	xDzMeRtTtTHHEO6b3pvi4IWVqVG1oWw1UL5C3IheKafsJ7Omx3k5b7s5ipU77oA=
X-Gm-Gg: ASbGncuGpOmfaD5XQMP51SguDY00Ot2vPv4VDMJkK3iucEdL6UHWQqA6a+9Zb/mZHHA
	x5sT8P7hbSP9ZN07ta4q5GqF/z072DQuzPf6Vv/8P+aLVWFzkT+nBycxtGbhr6VbuQbLTPpXZhN
	D6GpcTBMk29Snx1QMDCd5FDA5pxgQnR9//8S2j2238FF+9PmK+7WronYb9eot95uooxFFuY28Zp
	aQfL/EfcozKI/Wj8eavBgXkbZFmqMHlT3bcaxA+Q8Kd87oIDlZFVaImaw37aWlOH6FY3umok1BD
	1Bqx7Y71iJDT0IiIHOyNBdaOZur/RbUWqqrjEGjcamuZYxNX3SBKaNbmW3hPMQpDSSDs9ICrDt9
	iS2wFL6pNZ2mq4k5F0aI/5oE4HYphLuY=
X-Google-Smtp-Source: AGHT+IGLXRGgH0RMk5LD1s/WoaucRLtOgG7LLyzur+lq7QU1fzhKqSy1KKguWh49p5McuRm2xbkPFw==
X-Received: by 2002:a05:600c:46c7:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43d509e3904mr95278115e9.5.1742734877560;
        Sun, 23 Mar 2025 06:01:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:975:45cc:33c7:7995? ([2001:8b0:aba:5f3c:975:45cc:33c7:7995])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b25c9sm7628660f8f.42.2025.03.23.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 06:01:16 -0700 (PDT)
Message-ID: <6c0ab22ecd155f42befda502fd06707444b1da1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.79 -> 5.80
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 23 Mar 2025 13:01:15 +0000
In-Reply-To: <20250322173249.1201369-1-gudni.m.g@gmail.com>
References: <20250322173249.1201369-1-gudni.m.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Mar 2025 13:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213504

On Sat, 2025-03-22 at 17:32 +0000, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> Changes relevant for the build:
> * Four patches are dropped because they are included in 5.80.
> * Removed changes to etc/bluetooth directory permission bits. They
> are
> =C2=A0 now set correctly in 5.80 [1].
> * AMP code has been removed [2]. This means "tools/amptest" can be
> =C2=A0 removed from NOINST_TOOLS_BT
>=20
> [1] -
> https://github.com/bluez/bluez/commit/b1fd409960001a77cda2a09ecc00147ebd9=
c3667
> [2] -
> https://github.com/bluez/bluez/commit/1474c11618bc1092f7dd4b304d3768ce9da=
02b13
>=20
> Changelog:
>=20
> =C2=A0=C2=A0=C2=A0 Fix issue with handling address type for all types of =
keys.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling maximum number of GATT channel=
s.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling MTU auto-tuning feature.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling AVRCP volume in reconfigured t=
ransports.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling VCP volume setting requests.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling VCP connection management.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling MAP qualification.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling PBAP qualification.
> =C2=A0=C2=A0=C2=A0 Fix issue with handling BNEP qualification.
> =C2=A0=C2=A0=C2=A0 Add support for PreferredBearer device property.
> =C2=A0=C2=A0=C2=A0 Add support for SupportedTypes Message Access property=
.
> =C2=A0=C2=A0=C2=A0 Add support for HFP, A2DP, AVRCP, AVCTP and MAP latest=
 versions.
>=20
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
>=20

Thanks for the patch! Unfortunately it does appear to trigger a new
ptest failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1174/ste=
ps/12/logs/stdio

Failed ptests:
{'bluez5': ['test-vcp']}

https://valkyrie.yocto.io/pub/non-release/20250323-67/testresults/qemux86-6=
4-ptest/bluez5.log

This build on an arm host will probably fail too:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1173

when it gets there.

Cheers,

Richard




