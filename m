Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FACC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:47:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.19664.1739886453064048694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=caVHVhWf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a39e659cso37784325e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739886451; x=1740491251; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMQi9cyZRAxyftokzw/cjXvdBb1bXgjmWC314gebhdk=;
        b=caVHVhWfifXLnxvlHKfV16QEhGToeqbo/GBZJy7fzrqhWK/3wZWTNXHTv8X5zy/jXE
         YyihLDq6Bm/iL9yfnpJ9ITUSEcnxBU2ktp8OgWMvMPxgMat1l4CzsXGjHu/bd1eFvYwK
         ACM5nevqA8VqVOIS/m6RavphvCnKn6tmn4PdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886451; x=1740491251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMQi9cyZRAxyftokzw/cjXvdBb1bXgjmWC314gebhdk=;
        b=rrg16+/foneYWBldM8L/X79dDjTKi7ocSN5j1e0A/Q7eEiO6dfh/WQckU5MSayrLaJ
         PqtgFI1rN6/gXr4jkOK5sI7rGSTC6NLzXig/g16MlAhAGWeJ9o8bmFd4WPWySB5o26ZG
         /pC2FielpnmkGKbGLYoEkYPhgkmfVA/oQkN9TuNIFVmsL+9EYvt7YGr9iYAQK9+t4KGg
         Xj5LFZfunXihkOBTZLnbM5EIS/0fHyQzriFvnGN6ZjiLkvhhF/ePB6OEfawtUsVS4jIp
         7kk0PeCu5nokLeMaUSn3bYjKI5XhPSw/7I4GMLBwYEZgOziMEe84KIONrWyi8rz4XB9B
         tVWw==
X-Forwarded-Encrypted: i=1; AJvYcCVA27lyJvl7CnGVbWU4Wsbtvngt0a4wnRNMjsZU+aslcjNK+5uGHm/HczNXD9IWijdISRIjYdyzZxqoe+s1/FKk/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzH9X/Bi2LGYpBD3nNemJG9fbnxm4Kl1zXZ4vBPwc5aBa36H1pC
	7tThZoPID2hSmmNSsXc9VNU9WXTBDMpVepkQbUyJMva+wvjeh6K2c/QS1DpDUVs=
X-Gm-Gg: ASbGnct/ohGv5JziVg81qGqnPHcs9Pjb4VnsNFbhEVnBzw0Ca1NcK8dcMNttzH0bNzR
	FAfx9QhHXvo5pP5FVxBv3Twpv8aNYZRtZJ9tiZEmysO2cHV7/0Ds0H/G3kt5OkYshsT4VkaGCwd
	/LYxxs2dWlSKUZOuxIqaH7ZB9qON0GYnQAyD04fZAe6R5VanDWI7CGz2KD6tyZ2CkowXq7Qz2ny
	FvduqSQZZLrpC3x+ju0n+R77dBU66gbV6+jWaqF6deCBWJUTqTOiy0sizVoau/TfveTyYgKTlen
	Y6hr62q5Q1yM4P39L8Uju8bdozf7l/TcAEwpw8KS2G8sSEqyTvfp5VKi7bUUCDsZCejjoD1ZUgo
	=
X-Google-Smtp-Source: AGHT+IEXeHpi7BLZwDPngDv3F1g6RGQYMocn1ZipOQCwBFQBe3RHv5VatIPz1N9jKRsjF45tStpeoQ==
X-Received: by 2002:a05:600c:4f0b:b0:439:8e3e:b0d6 with SMTP id 5b1f17b1804b1-4398e3eb2efmr43976435e9.13.1739886451138;
        Tue, 18 Feb 2025 05:47:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2? ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f22fsm181447275e9.5.2025.02.18.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:47:30 -0800 (PST)
Message-ID: <e2ca1bdfe2a8e15a843d8c8a1808d111b8adbc96.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/32] btrfs-tools: upgrade 6.12 -> 6.13
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2025 13:47:29 +0000
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211620

On Tue, 2025-02-18 at 15:39 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * mkfs:
> =C2=A0 * new option to enable compression
> =C2=A0 * updated summary (subvolumes, compression)
> =C2=A0 * completely remove option --leafsize, deprecated long ago
> * btrfstune: add option to remove squota
> * scrub:
> =C2=A0 * start: new option --limit to set the bandwidth limit for the
> duration of the run
> =C2=A0 * status: fix printing of Rate unit suffix (SI/IEC)
> * qgroup clean-stale: check if quotas are enabled before starting
> filesystem sync()
> * print builtin features and options in --version output (mkfs,
> convert, image, btrfstune)
> * build:
> =C2=A0 * Botan minimum version is now 3.x
> =C2=A0 * target to build compile_commands.json (for LSP)
> * other:
> =C2=A0 * a bit more optimized crc32c code
> =C2=A0 * sync some headers from kernel code
> =C2=A0 * command help updates and fixes
> =C2=A0 * build warning fixes
> =C2=A0 * error message updates
> =C2=A0 * cleanups and refactoring
> =C2=A0 * updated tests
> =C2=A0 * lots of documentation updates
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

Fails when being used during oe-selftest:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/947

probably from compression option changes.

Cheers,

Richard


