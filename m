Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F16EC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:48:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.14063.1685983703574909835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 09:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=JxnkbVlk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso51668635e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685983702; x=1688575702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ckvmmnKdk4nfgokTsOI0eSP4oVsjetGeXjZx953ZQRc=;
        b=JxnkbVlkr1vreBK9xYnUr4RDbv6RsKqm7DVYNZyiIQd6CJ+HTVB6Vvg/4Axv5HkQHm
         KsIbZAhSWUK480Cuvl4pyKv3S8LvJ1Wa+D3mqv8I9Xg+WjsORnrGzZ3Lb+k5qxgM6J6s
         PmyTfJczv6PLTcpjXrzu0+SA5EZnOa2xB1CNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685983702; x=1688575702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckvmmnKdk4nfgokTsOI0eSP4oVsjetGeXjZx953ZQRc=;
        b=Mlr+DcfLq4N3exfBzR0691zAavHvedySBY2dO36cNHcxd476t6XO3MqvukeFRniVWp
         MQmUKNYTCtdXYxIdii8fAbxmoBdENYmIJC5Lyx0gT/6X20LY2q7khu9sHvd3qDTpNvn1
         OhX+TijiYNGTD2dUXmxqq+8bPKRJRPOBjEzTGbFu4T3vhfXy5BImUwpei8rUaRoFPcZO
         xH2fP85ThmrZlTXyxrAm3sgV0uGoz96JYAglkdz+UmEGk15RwDcUrKSEY/pdFKmTFQJ7
         b/6atYzZBxvVBQyJe0gxTP3MnIw5yBQE18vdeLDTj3UXjBp8l02Qc88a84U/O0tdsVry
         20NQ==
X-Gm-Message-State: AC+VfDwH0IJLMh5WkDQUlRhsNWarwsp9WFW1JcAf0SrPt7CLHMlAf+xY
	dz+hOW1/YcoDynmH8XTKX+q0tQ==
X-Google-Smtp-Source: ACHHUZ5iecBl0f+ztKFyta2wOxPjGybW7yJnHvtFh4cI7wrZfGLmYeKU71GAk/eCCRA4ZCuRpE/P7A==
X-Received: by 2002:a1c:f60b:0:b0:3f7:5d:49ff with SMTP id w11-20020a1cf60b000000b003f7005d49ffmr8593966wmc.1.1685983701905;
        Mon, 05 Jun 2023 09:48:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8415:6703:e020:26d9? ([2001:8b0:aba:5f3c:8415:6703:e020:26d9])
        by smtp.gmail.com with ESMTPSA id z6-20020a7bc7c6000000b003f17eaae2c9sm11426828wmk.1.2023.06.05.09.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 09:48:21 -0700 (PDT)
Message-ID: <02525eece93945f219d18572151b08d0ff1691fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] cve-extra-exclusions: add more
 linux-yocto CVE ignores
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 05 Jun 2023 17:48:20 +0100
In-Reply-To: <06AF5F15-5FB7-45E9-A1AD-8544D7EE7092@arm.com>
References: <20230605162546.3012555-1-ross.burton@arm.com>
	 <06AF5F15-5FB7-45E9-A1AD-8544D7EE7092@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 16:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182398

On Mon, 2023-06-05 at 16:31 +0000, Ross Burton wrote:
> I did some triage of the CVEs in this list but realised that this
> file is a bad location for them: whilst we don=E2=80=99t expect people to
> switch out most recipes, we do have to expect BSPs to switch the
> kernel, so by accumulating a list of exclusions in this recipe that
> are based on the current version of linux-yocto we may negatively
> impact on people using a BSP which, for example, uses a 5.10 kernel.
>=20
> Should we move the kernel-specific exclusions, where they=E2=80=99re bein=
g
> done because they=E2=80=99re fixed in a release we ship, to the linux-yoc=
to
> recipe?

A specific include with "6.1" in the name might be a good way to do it
so that others who follow the same stable series updates could reuse
it?

Cheers,

Richard


