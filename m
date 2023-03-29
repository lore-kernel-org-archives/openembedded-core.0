Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B757C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 10:53:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.21451.1680087192077398453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 03:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QsaLc7Y9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id l12so15163017wrm.10
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680087190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rdrhrNpi1DmKDJrXrV2wn0zWN0014KuVywPdlCfVsvc=;
        b=QsaLc7Y9FmhufrFolInkTZWkryqqirq/ehSF9hEMbiP1prNeOnaECL+oKcHqhszGyK
         ncKme776sisZQRojcRHXMlxojEP+yO7KlVuLxpQh08Bi6Wp7wG4kitXiKYy6CsxoUeoO
         /+0ydW2NSSjZg2EVXc/LaKBN/RoJUoydt2ASM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdrhrNpi1DmKDJrXrV2wn0zWN0014KuVywPdlCfVsvc=;
        b=66e6jJkYC1pMJx+n3YSytqzUkH6HsylUtuJHRayDBUyQJxGCTs8+s6idKKIRVDf04q
         m9Pd+NRzPVuDAB65KoxrOUbTwCZJHUs+fm9ybnYKyL7LsGEHIHMWmwFXKbH8zI1gZ+Sh
         yvcfAsUL8nkDD+63Q5wOBUO+VfnJU0c2D7lg1OjgSpTQZFQ82oStk8xomL1SFd1Eylde
         ucGYEVBUhBNXT2hmROWLEFmzDK5Bxw1wCT6NGNYQFxiYLbSDvIc7Zgl7e5QqUwXZyzq+
         JU8uSp28w7nL/sIGYXtpS82U0zBS/QVp9DH3gO31QTVfwIquA0kzbRuF3EfbWp99JWhU
         L/xQ==
X-Gm-Message-State: AAQBX9c8wiASrEBK9hUxhDSgoXd/dB3tjTxg4ZwUbs+RVzdIRU/nf72g
	IfgFoq8Qm4FAnVEZZE+Yh2pp8Q==
X-Google-Smtp-Source: AKy350Y8BXvrbaxEjbVkHIRG/jxBOheYkDrN9GiSiG92V/1xspRhLHBMtaYyD03gt5mA5mulBBDpzw==
X-Received: by 2002:a5d:51c8:0:b0:2d4:53d7:ea7f with SMTP id n8-20020a5d51c8000000b002d453d7ea7fmr15948664wrv.3.1680087190381;
        Wed, 29 Mar 2023 03:53:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7? ([2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d4ad0000000b002d51d10a3fasm26596428wrs.55.2023.03.29.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 03:53:10 -0700 (PDT)
Message-ID: <8cb5371cbfacac03d340142b36511a73834669d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/1] Change the serial runner usage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com
Date: Wed, 29 Mar 2023 11:53:09 +0100
In-Reply-To: <20230303090139.207454-1-lrannou@baylibre.com>
References: <20230303090139.207454-1-lrannou@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 10:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179273

On Fri, 2023-03-03 at 10:01 +0100, Louis Rannou wrote:
> The actual serial runner has a different usage compare to the ssh runner.=
 The
> return status is different and failure are not raised as exceptions.
>=20
> Initially, I wanted to create a new run_serial_socket and modify the old
> run_serial to use the former. And there was a second patch that changed e=
very
> call to run_serial to run_serial_socket. But that is not easy as each tes=
t
> can have a different manner to handle the exception.
>=20
> Therefore, this patch only suggest a new runner and add a comment to depr=
ecate
> the former runner.
>=20
> Louis Rannou (1):
>   oeqa/utils/qemurunner: change the serial runner usage
>=20
>  meta/lib/oeqa/targetcontrol.py    |  3 ++
>  meta/lib/oeqa/utils/qemurunner.py | 57 +++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)

Sorry about the late reply to this. I think the idea of the new runner
is great and we should improve and clean this up.

As the patch stands, it creates a largely duplicate function with no
users. Experience shows this tends to bitrot quickly.

For that reason I'm reluctant to take just this change without
converting at least some of the existing users to use the new API.

Ideally we'd convert everything but at the very least the new function
should be usable by a decent chunk of the existing code, even if we
have to adjust it to make that work.

Cheers,

Richard





