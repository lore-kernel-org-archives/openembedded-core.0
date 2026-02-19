Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30B5E9A04A
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 15:49:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16886.1771516190610932603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 07:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ykKxEMj9;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso8939505e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771516189; x=1772120989; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMjmhMe/jh29IU/az0Mv9DP8Us9wsFxynOFKB8EquFU=;
        b=ykKxEMj91cDBvZly0xO1nKdypGW3kGDDizI8jfKSZ9ptqdaacJBvufl+6PmqYgflcX
         NB9TMKUM1miZ3Vm0BRmetZeTX8+Z9/zyXKG1o49pv2jWl8cwglcTzeK2SIQkD/ay/2AI
         iWVKAw8elCoSausPGUJFr5zqRGgL1Lx9SONb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516189; x=1772120989;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMjmhMe/jh29IU/az0Mv9DP8Us9wsFxynOFKB8EquFU=;
        b=FDbwbm4HMLssQLhEALrlACQYiQ96xVtC0P25LhYCSVXSMqaiAdEWzreg1o9r97ySp3
         EsLArudhBfibRvOb7YgNkaisCj7HndNqXItWfqMRAdcj0hqX/lAw+N04ANyUzHbJ+scM
         nm9Smq85bvQ6ybs3sLmL9IJNR8PfHd0ndjbd0li89hcX8d7kmCgx73uymZ+sIJgd3wHd
         z+8D2KX4pxL+rdRbrvFrGfZfhQ3+SUQE/pRchrNoksAnxgp0+hZuKH9XCyqJpvrFgZwg
         t9z2QPszdY9ViyMz1q/GQaJ0bKqO6KJTatvFG7VaSQQT0gkHuj64M6iQLNG/ToNIc+zW
         flpw==
X-Forwarded-Encrypted: i=1; AJvYcCUvUyV0OdPPoN54yWq0nInOBzbeW4bsb1Cc8H8ueJ3+fvnaLgBTXfqMxA41tqK+BWs1q29IGjv9eJ6+l8xlATP9TA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5ZYW3bfwgDaXxT4cLBaxVzF8+GNwnr6sef/YBkmG3VOWKY3Hh
	5yuq9ZuwwJilq9sWsb7baXhtZIqI3yFMo5ZuJjhz0RRXEJbka6KG8+aJlI6KcQoYUOs=
X-Gm-Gg: AZuq6aJCvGpT9fITj4ic5JBajVHTQ7T7Ji5mi/5aRp3KyoSjItVOTejwn3rqzbfjNzm
	FOqtXwNfmr1XeWxDPoMVzUc9W2YNnIx73+hYSjBnK77XhkszLVjZ0p/lVY7YCn3Lhrh8OTOVn5w
	2J1ovzGGktbRzSWs5FMcPzXqfQ3N0MHMd2KUKRi6IarWkTQhxr8fGySx93LBWFXcUSVXI9BqSoz
	yXB03BwHBOGutLHVO/5OAsgquabPGHhyE7dm06BG+Rfw5BJNs/D5CBbh7zV4jGF254IezoyUj8U
	ps/MU1ymYiNMtr41oKGq2eNd3Y3dwFCcwHlAIUnF98sGs7b6SVJUXv5ei0eiv5RNC3GC8YS3spI
	3kvrCedcGglfsJ/vqTOW5bhomltsyo3lTj5h1EgGtZseuIgfROWSJC7Vg5fxLL+/kIKf2gGzonx
	Hc5o5ows8Ts2QOv7SAaHpjLdd/mKVBKI6a2rBj0Z/1onjtxewxkFzAdbVptmUdzN+pWCHMg4MYb
	ZzRDaOSe5eKb6xMX9pK+GmWhg==
X-Received: by 2002:a05:600c:4e42:b0:483:76b2:cacf with SMTP id 5b1f17b1804b1-48398aee83amr97097195e9.32.1771516188927;
        Thu, 19 Feb 2026 07:49:48 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b1d79sm30735115e9.3.2026.02.19.07.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:49:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 16:49:48 +0100
Message-Id: <DGJ22TW6NQ7J.26KZXIRN87D9B@smile.fr>
Subject: Re: [OE-core] How to backport latest go version?
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <navinreddy23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <nOYT.1771515503207887946.99kd@lists.openembedded.org>
In-Reply-To: <nOYT.1771515503207887946.99kd@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 15:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231433

On Thu Feb 19, 2026 at 4:38 PM CET, navinreddy23 via lists.openembedded.org=
 wrote:
> Hello all,
>
> I am currently using scarthgap branch and was not able to successfully ba=
ckport latest go version 1.26.0.
> I have created a custom layer (meta-dummy) and added all the files from r=
ecipes-devtools/go of Whinlatter branch. Yet, when I invoke bitbake recipe-=
name, I get the old version which is present as
>
> =E2=9D=AF tmp/sysroots-components/x86_64/go-cross-armv8a/usr/lib/aarch64-=
tdx-linux/go/bin/go version
> go version go1.22.12 linux/amd64
>
> I am able to set the preferred version in local.conf and it builds fine a=
nd I am able toverify the binary version for the host.
> PREFERRED_VERSION_go=3D"1.26.0"
> PREFERRED_VERSION_go-native=3D"1.26.0"
> PREFERRED_VERSION_go-cross=3D"1.26.0"
>
> Am I missing something here? Is it the right way to backport?

The usual solution is to use the mixin-layer for scarthgap/go:
https://git.yoctoproject.org/meta-lts-mixins/log/?h=3Dscarthgap/go

See the note in https://docs.yoctoproject.org/dev/ref-manual/release-proces=
s.html#long-term-support-releases

Regards,
--=20
Yoann Congal
Smile ECS


