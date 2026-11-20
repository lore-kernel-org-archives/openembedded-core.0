Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1639.1795161180129595713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CjaIpF5v;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e46e449e8so335480f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795161178; x=1795765978; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWO49HMOmBeA7wSmzk7Xd8Y98BCmXya1y2bYvP81yxs=;
        b=CjaIpF5v+3Chy133LbMB6eUUzKu65m5wwxIKnUWhr0yPiOoWOfYjj9xMDbeIAkbcs6
         5DTwnMdDoPzwzbplkBmgFOYQDrX5ns43Buw9qeUo10HslI4c+86Fy29cV23dLIWhdMti
         X6Phbgxd8S86fNruV0W4ocGs6YsExoTPPGJcS5RaxYqSfd3dYo6FXdgNqV96sRfiQ+Ou
         qv0CBC/BYBSzcGWlBbGe1iqQ4xFPWVu/eTRoTOkNP/6EeErUhz486PFQGTysY5SURLyv
         XjzMhNSNhvyoSAE5Xz15W/zo7EW/aUeT+E+MZ0yKnEpjg8zzMWAPlOPzeTNJPKmHuPU6
         zI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161178; x=1795765978;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWO49HMOmBeA7wSmzk7Xd8Y98BCmXya1y2bYvP81yxs=;
        b=ENZvy/qvm8qXD+DhCc5gmOFiDvgwmi/bwCRNcn9wGVS5rOGd+yXk5S/75+Z0SsbdLX
         LWjc/c8+9d7ZAPbj4qoDYEmVOKX5v09iiPfdhEfWFePJxFLwKyljS9XU/Zq8vCHExIoS
         acIlatwhV4OsF2VDTerCw4jhNlJDYHIimWwgWEpDbt/3hX7FkIabDvt00FGSRbtelLio
         rSQY3qMHqtAOdFXqJ4z59JpT89gfXd8izvNGl+uISazF0RtzXce1OniFLyRpJrJNJQIM
         u6sTCdX7TraWrkhJ5AuPatikHQ+/BnYjTzHfwgp38eJiEONh4BtwI0+7A6c6G3XsM9o6
         NYZA==
X-Forwarded-Encrypted: i=1; AL+hErH2kQxDzS245PUEMavijiNgo9n4l04V1j/N0c/X1BigWRBjnxTGglb7P6J9TL6pim3JWrYLVLCIP2BIBbpNh/+yfw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z++Gc9j8EocrMEEcuV1VsrYkqkb1P6rjoUf/KtFaB0IvI8p8JKv
	nzEA8JL1ixeenOwNi3HPhjZCQlfcCP+YWkyK50Yvj4yqUFCWBRzkzRtnZzA6G7+T1bc=
X-Gm-Gg: AZFdTZfuEfIvcnCxmT4lmUjpPsO4syjQtAGjPcJd+yD/je+qn4sn9HgGfzhVd/WTGC4
	9D9fBHc26V7MnRM7uUL+yREi5NZg864kqJxHRAb6Cqor8lvxTYPeFqNH+mLTbHZ1p2iOa7Zpu5d
	RAGJMYuDtvxe1jdm9U0QCX8Qntxqq5Ma5UR5VROpArWMcNDDK3pEzRa3ByPmkxDvDz4ijriLqXf
	r6P5cbWJ3KxpPcx0MoQcqYRB1zflreqYsywkdE2EgcDKdYhO0i0bfvlAffxH+86nS9JyeTayQb9
	rtL8wq5HPwId/lG/bOITPUQGNcpYhMBK/x4C5z24s3U6QE4ULWz57ynailXNxEGZBenE8F+MPB9
	GRYqBoyEhaL9usVCS5TOgUdvz0Xnth7fQY7PT0S/EFBP+4Hj/QzWBpF3cVSrjAqYq0cD50Sfg6H
	YbYWUEK9BiVj3BSu5OD+PRYZ/FHl6gSaBJyG3h/GL93JR43sp/y5qkvHl9tNpDYM3pGPKv/NRH/
	VTyUVXu9x/HnQMjeLAy/dmzje7FMaLtTQD4ZSxxQ+43tW9V9wZnfCey7pakCVJRRQshFRHB+RjM
	wjW7nCZNSV/EUfmJWjv/4Eu+JlDOcuTm/aaz6vsu+pFDowxJQzvKyeeOqMu+Sx+x0MtVEFDkzd/
	+Y95djt/N7lvDi2vg
X-Received: by 2002:a05:6000:4009:b0:4ab:7c3:101 with SMTP id ffacd0b85a97d-4abb514617emr4289296f8f.22.1795161178346;
        Thu, 19 Nov 2026 23:52:58 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm3298387f8f.46.2026.11.19.23.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:52:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 08:52:57 +0100
Message-Id: <DMZVJ04NAGFS.201JYQTCSJN0M@smile.fr>
Subject: Re: [OE-core] [blacksail][PATCH] image_types: keep the rootfs
 mtimes in ext2/3/4 images
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <alex.kiernan@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
 <richard.purdie@linuxfoundation.org>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <DMZV3VHOJ2E4.13Q2IBH3IK94@smile.fr>
 <20261120074528.2738167-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20261120074528.2738167-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250746

On Fri Nov 20, 2026 at 8:45 AM CET, hsimeliere.opensource wrote:
> On Fri Nov 20, 2026 at 8:33 AM CET, Yoann Congal wrote:
>> Noted. But
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20261120072058.=
2724815-1-hsimeliere.opensource@witekio.com/
>> is indeed for blacksail, right?
>
> Yes, that one is for blacksail.
>
> I also mistakenly resent it as "[blacksail][PATCH v2]" after my
> "please ignore" mail; it is identical to this v1, so please take
> either one and drop the other.

Ok, noted (kept the v2).

>
> Hugo


--=20
Yoann Congal
Smile ECS

