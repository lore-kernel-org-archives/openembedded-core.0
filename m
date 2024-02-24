Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED64C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 17:22:44 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.23081.1708795357395438164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 09:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aBkOgKH2;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d862e8b163so696845a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 09:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708795357; x=1709400157; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ug3heC7wkgTZ6GCHT0CF/Kof9UFWms5GJDk2450Fcs4=;
        b=aBkOgKH2/ttwjBjBVb78gtQwtWutAszpXFWtCpDUKxZt9GBOXP4cPifiS/RWbqfwU1
         D6ru/8uwi/X8F4hKrlDK3KJeT0H8+N7KtVT5so48scjb8fjj8HD0laa0Kjt7RPEsnXnE
         XD/bpCOUiV8QLTF5WDNgxaiImvoo2UTPF5GsuTWWLf3uWnz4+Zm5bIJNsvT0l7+zc9RS
         eWfRRr3xJf7VGaI1mCIKwaREVE/kakvegcXuDsYYyABXiflw2YTKfj+GdnERV9j+L5QW
         F6iNvWVznq6Clytqi71xvvh0kGlvLj1cC8xolbmSUxEe7hzYX9zCY4speFawBzTe7y34
         IZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708795357; x=1709400157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug3heC7wkgTZ6GCHT0CF/Kof9UFWms5GJDk2450Fcs4=;
        b=NQhKIO8OQdes6Lvd2ifzJ1vJT4Sjd5sohQjtf1Ui2PHgmBaTGVd9tg9/CFy/wI2fHV
         cMX0ootd/1lFbwfNODwsWcl6YS4kNJ19MoxlZdmd/6bVMFNXaXsE9S87jJIq6SAAjnL7
         RqHP43abaq3mBxl5yLsr0hWytHT5pM0qyrr1G+ivaFSGM8TzYZEtPDAA0E2+PjaL+3Qp
         HaCou3hFkZLKK1502Ypzg+MwtKIiXY+JDWzxWkAYk5YL58pJhaky+6lAeAOghx+IcK4T
         yWL1mNciYY5311V7sf4WGAqkwl57QoegpV4C/A/ZGDcIHn6hJXiWAbiZXlbpR2Z7E9oY
         b6kw==
X-Gm-Message-State: AOJu0Yxq69dJFyBLhW0jcqB4eMNYuWN8hA8qALKSissxlQeIQCH+wSaO
	912RZEKxBXxl9360EELu+4V8mFI0owf1i9x8WRGWM+WNPHrM7Ao/r4vJyymvb2AxVgOYHjezTNg
	MRSD0FwVHPyWCRHQIMYgzBelfTnk=
X-Google-Smtp-Source: AGHT+IHjA5IjD5TrEazBl+oCWlevLLDmKsyPiwPwgQlZOmt4cmezU2AE+48ZWGoil/Oaeo0WntkO4vKcd5d0oZNiHSo=
X-Received: by 2002:a17:90a:1344:b0:299:c3d:c00e with SMTP id
 y4-20020a17090a134400b002990c3dc00emr2423468pjf.3.1708795356660; Sat, 24 Feb
 2024 09:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20240224135444.1180166-2-wuxiaotian@loongson.cn>
In-Reply-To: <20240224135444.1180166-2-wuxiaotian@loongson.cn>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Feb 2024 14:22:26 -0300
Message-ID: <CAOMZO5DK9_i=Ti04SgvU=DpkHXp8bBYU+wgW5hmH6cAfuoaD0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: add loongarch64 support
To: Xiaotian Wu <wuxiaotian@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 17:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196134

On Sat, Feb 24, 2024 at 10:54=E2=80=AFAM Xiaotian Wu <wuxiaotian@loongson.c=
n> wrote:
>

It would be nice to put here the same text you added in the cover letter.

Also, you missed your Signed-off-by line.

> ---
>  meta/recipes-connectivity/openssl/openssl_3.2.1.bb | 3 +++
>  1 file changed, 3 insertions(+)

