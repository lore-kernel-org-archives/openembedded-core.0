Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAF1C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:53:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92942.1783086798396806054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 06:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GbH4BDPe;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so602927f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783086797; x=1783691597; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6iTSn6eOP9hB0Ne2gyPwN5PughsO1TbS/rxwqwIPm3E=;
        b=GbH4BDPesh5iPCZa6MWKjY+mPmm0sBMiM4IXd+pUWZ2comjn3jyqLJTW5Ftq/ZS3rM
         NdJA7B9MTuO1t2nhltY9WIUDiMMjVf81y/dAQswYuAUMgrgGMx1TR2HLbNGD/yeeIuaZ
         0TNdhvulBLcnunwhCC+foq8m1jUAkGZmxa46M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086797; x=1783691597;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iTSn6eOP9hB0Ne2gyPwN5PughsO1TbS/rxwqwIPm3E=;
        b=fzLZrWI/LXMTFCxj5DBzSCyZpzqTvw3ckU0fu04CDNlJjn7cm3f1UX+wusFZP8QdDS
         xvyuk2YRdASHumuDIQGGvv/e/nyD6YCRnFaDDjpqJdE8XQIt9wtyuMDRPqJWwgTuBgBf
         xfpNVRQqUxCN6UwDwoyaX8jx84zjZkkEnuPlvB7goV4lDIUKsnRL7ziW0BZSTDOosSgR
         NP9uBu8Xp+kRG1U+5tXuxSHfj0YjLfMdZxJrbag8YTjO7Bv88H/YOAdMRUecWRSbmp7B
         xLCqUaOaR0U4F2TeYGhlRlxK3JK+2a5ZpGzejFOag4RlHBJ1paVRfkioA45udkT7u1Zb
         yC0g==
X-Forwarded-Encrypted: i=1; AHgh+Rp8RZ0Yf5tEUmdefS7ZsGymqKs3Hyi4YPVZaXHv4bY6hbW+AQ//h+bnI0eEvYlf6WW0lpQ0Ezk5NhtDk5o2Q1orcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFIcQnu7CG+NjJ4I+g7EcxX0/XYybWBCMuPY9MGP4zRcjAQAwj
	45YYoeJT+tdzGjCu+Ev3P5L1suXKynT7JZebIUAwHjvgwTlJKZp77cy5NUjnxYAkasI=
X-Gm-Gg: AfdE7ckJcMx8l9bdb1Fm2CK2nTgbZouO03GN/5/qlXMpHrns6xkI+rFeuf5HbtnTfI7
	pszWgap2vFaLQb+byXnriK1b1yC7fkEIYDgi83rbyROVLyUU0Uz4GYQmTiDjRqn2WQm62xsgxTC
	WESFSexIvBaz2BmKzvJDpP9KPr119N4d/aLTq6+ja9RyU7a2cI8B3LnWwfVUmmsh1pxuPoM7PHd
	iV0kEkCxvZhcELhfyY7lC4ET6I3Vm3vjoPbkYJYW/ufUxKKwfLZqlV/ONeC50Fz9duy0qitdGuk
	bjCs9x9tmX4PSN7azruL39NRoHojhb8tLv5jVHvS5GotuocShfo1vBfb44oY/2PFxNtzPwhU7cK
	2ab52GaxtQfqPBtEX1DUAgKg9buP1+bOyXJfmi1BPeI/v+SM8Cn3WOXJykmGn38j/9H+7xT9bDQ
	Q5aPpPGD4T/ENUBUMdz4qxtgZ/IHkKJ1YKicRsB2E6BDVTvhjYHt8q5/FhMA0wGzT23R8xP2UxX
	n2TSg==
X-Received: by 2002:a05:6000:2309:b0:460:6b0e:a75e with SMTP id ffacd0b85a97d-477b39839d6mr14856154f8f.16.1783086796524;
        Fri, 03 Jul 2026 06:53:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94ce4csm19054141f8f.17.2026.07.03.06.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:53:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 15:53:15 +0200
Message-Id: <DJOZILMNU3O5.3VMDRLWHGKGHU@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glib-2.0: fix CVE-2026-58016
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260703-glib-2-0-cve-2026-58016-v1-1-23bfe853642f@bootlin.com>
 <DJOZ3JVV6E0E.1ZS5B4UVCZBLN@smile.fr> <wUwD7u-8QNWeO3TEktmZ1Q@bootlin.com>
In-Reply-To: <wUwD7u-8QNWeO3TEktmZ1Q@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 13:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240111

On Fri Jul 3, 2026 at 3:46 PM CEST, Benjamin Robin wrote:
> Hello Yoann,
>
> On Friday, July 3, 2026 at 3:33=E2=80=AFPM, Yoann Congal wrote:
>> On Fri Jul 3, 2026 at 3:25 PM CEST, Benjamin Robin via lists.openembedde=
d.org wrote:
>> > A flaw was found in GLib. A state confusion issue exists in
>> > g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file wh=
en
>> > processing malformed D-Bus introspection XML, specifically with a <nod=
e>
>> > element nested within other elements like <method>, <signal>, <propert=
y>
>> > or <arg>. This issue can cause an unsigned integer overflow and lead t=
o an
>> > out-of-bounds read, resulting in a denial of service.
>> >
>> > Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boo=
tlin.com>
>> > ---
>> >  .../glib-2.0/glib-2.0/CVE-2026-58016-1.patch       | 92 +++++++++++++=
++++++++
>> >  .../glib-2.0/glib-2.0/CVE-2026-58016-2.patch       | 96 +++++++++++++=
+++++++++
>> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb      |  2 +
>>=20
>> NVD tells this is fixed in 2.88.1 but wrynose is at 2.88.0. Can you send
>> a patch for wrynose so I can accept this on scarthgap?
>
> The fun thing, that this is not fixed in version 2.88.1 but in 2.89.0.

Then,
* NVD is wrong(?). Can you send a modification request so we avoid false
  negatives (those are the worst ones!)
* And, in that case, master is also impacted and need a fix.

Thanks!

> I am sending a patch right now.
>
>>=20
>> Thanks!
>>=20


--=20
Yoann Congal
Smile ECS


