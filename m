Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBAAC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 09:34:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6821.1721813690954450596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 02:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O3CS3AcB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-427b4c621b9so44024335e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721813689; x=1722418489; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhN8GrBUE7sDCleAOjBtDvmBb5vHCxHIQDXRSp73rYU=;
        b=O3CS3AcBR6yohnV3oSnT2LW1ArHyj3BYD0hFe+F7HT8jz5wI31K/Hz8JTVLUS96bms
         r0ZKtAje8wZJffJXnE9UXJsYNjvU7Nn/ZEFbV132N77weUrqf/oQfblv2EarTL6mwixm
         FBN0iNUNjj9McODdzMHJDDwu3N8PRLStiWRnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721813689; x=1722418489;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhN8GrBUE7sDCleAOjBtDvmBb5vHCxHIQDXRSp73rYU=;
        b=c5vAR3ZhNuGjg9re9w/42Y2AU9vJJMcGyfzANubuQlwzhq+6LwNRmvatg53lPte+IF
         jKguJyEl2M17tDkepV2bmVGh3KOjW4vKe8PqkNzOZVMxseaxbkzsIOYUWHEVOFE02z3p
         /B8Pwxk5KOBoWuXmXlqL0F/xRSB83w1sDODOpvOifm8igoSd9UzQPBAAHm8AVExsZhjR
         JtQDLf+nsfqVdTA5Tn3aPbroehsMuWU1ptLm0ME1qXRO9A3UYdt9tf01oFaUz0/Qvnse
         4P/jsOMF5KVmf24nIZmDSFtogDs/QLEwUf0Z3GP850XtJpHbVxMPT2j0/9koFY3IKvZ7
         IdQg==
X-Forwarded-Encrypted: i=1; AJvYcCUHq2ghySvWc/BwdtPRVWIQawxl6NxdlrLt47ouyeM+emLItvZuhLNxKbSlh6A7yU5SPdh81+vt6vACowztEJoC9NMJX4r1nGXgfhIZdnFQ0nBJCK5/qNMN
X-Gm-Message-State: AOJu0Yx77id0Vda5F/rdbdzA+2Qu7DxmQAWbmIZgRX/VuPRI+wUttVs5
	zadhh0/ELu0DG+u+Pdmgi96lUMHuyUHfhDYVsUwN5R+UxmWSyc7TxT2kJrkP+zo=
X-Google-Smtp-Source: AGHT+IEiNUtF2A0TIKYiKBWpTqkiDxu7NZV61kqVF4nxEU4J78wtC/o5p/FlVctdPulBUTrUF5Wkag==
X-Received: by 2002:a05:600c:35c5:b0:426:61ef:ec36 with SMTP id 5b1f17b1804b1-427f9372b80mr10795105e9.0.1721813689272;
        Wed, 24 Jul 2024 02:34:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af? ([2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9399b13sm20693395e9.27.2024.07.24.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 02:34:48 -0700 (PDT)
Message-ID: <20ded181ae210a6bdfe14124e5696c925d6f6a95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 15/37] python3-setuptools-rust: remove
 obsolete python3-toml dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2024 10:34:48 +0100
In-Reply-To: <20240723145137.74198-15-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
	 <20240723145137.74198-15-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202433

On Tue, 2024-07-23 at 15:51 +0100, Ross Burton via
lists.openembedded.org wrote:
> As we have Python 3.11+, tomllib will be used.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-setuptools-
> rust_1.9.0.bb b/meta/recipes-devtools/python/python3-setuptools-
> rust_1.9.0.bb
> index 8eb2513d694..62ac4764038 100644
> --- a/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
> @@ -27,7 +27,6 @@ RDEPENDS:${PN} +=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-setuptools \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-setuptools-scm \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-shell \
> -=C2=A0=C2=A0=C2=A0 python3-toml \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-typing-extensions \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-wheel \
> =C2=A0"

Does this need replacing with the tomllib dependency? Is this why
python3-cryptography had ptest failures unable to import tomllib?

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6659
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6836

https://autobuilder.yocto.io/pub/non-release/20240723-67/testresults/qemux8=
6-64-ptest/python3-cryptography.log

Cheers,

Richard

