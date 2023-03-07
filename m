Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29ACC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 10:16:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.11133.1678184189561607734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 02:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KbRcRAUz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so10034569wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 02:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678184188;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS6vThZ7biNvPjlFnsDp5R+XCnfErx65ixeIpRS0qwM=;
        b=KbRcRAUzXEElUBp7p2bhwfhv4GzsPU4/GA9d6wWIOurTsHrPvCWxZkCxD22pwgMo9n
         nzrWHbDKTmrxyquWVVbpbC6Y1yWo97yciGgPEtwQ72G24ku6rZ6ML3Y28/7aytrIuRBU
         GfYsdMI8rx6Ild/yjAYLHuM8baLlJd9ZjiPF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184188;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS6vThZ7biNvPjlFnsDp5R+XCnfErx65ixeIpRS0qwM=;
        b=152qNiCeHXsb66QooAJ/10lSZwLqnShdF9Mfyo6q5ib4BhbTcN4YwqcwahPT8OKe9Y
         FGvNYkXfwVWXQb2FRRdoPYL48QA6aaXpvt5nUGqFY935nUVJYtkYp2+plL7KF2NCh1ZK
         m7SdeDd00hbtw6EvOW/ULT5yEPv63BOPXZfx/wV5DJXG78KVOebglYxwMBOx+TYkwWl/
         rZIbYQL7fpzA/xuWRBgqVE/JozJSaiKd5fy7WXIaERO00D9MxA+WbsxKxhfYVZjeGvy+
         rsAjRWVWyR9xLzPh7VMY8uBmYYx3lC2yevYjyaXUQvE7Z2FDSqHUITeTd7jpnbO7VHLz
         AUHQ==
X-Gm-Message-State: AO0yUKVKdTroxXo1UjAp4EMyEIDvYfKtdzq4yLAsrA+zoR6v+yQjWVj8
	oAq4qBF2NKVCDAKhpk9KY5f4tg==
X-Google-Smtp-Source: AK7set+Z/+lmiyjQIrQZahFWVJZdhChq4vudZ3Y+fDR7eJhUBCZ5yoJceEat769+Xv0zSUhyeagP1Q==
X-Received: by 2002:a05:600c:358a:b0:3ea:c101:72b with SMTP id p10-20020a05600c358a00b003eac101072bmr11259631wmq.17.1678184187848;
        Tue, 07 Mar 2023 02:16:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e718:9e1:49a8:9d75? ([2001:8b0:aba:5f3c:e718:9e1:49a8:9d75])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d6052000000b002c53f6c7599sm11935701wrt.29.2023.03.07.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 02:16:26 -0800 (PST)
Message-ID: <954c150e939a7afe32b14ae20e22349904343445.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] vala: Fix install conflict when enable
 multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 07 Mar 2023 10:16:26 +0000
In-Reply-To: <1678168291-14150-1-git-send-email-wangmy@fujitsu.com>
References: <1678168291-14150-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 10:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178100

On Tue, 2023-03-07 at 13:51 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Error: Transaction test error:
>    file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted ins=
talls of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
>    file /usr/bin/vapigen-wrapper conflicts between attempted installs
>    of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/vala/vala.inc | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Alex's comment is correct, we should remove the wrapper.

I'd also remind about my previous comment on patches like this. I'd
like to see any changes for these kinds of errors containing a=C2=A0
"diff -u" of the files so we can see what the issues are.

I will not be merging any without that information present in the
commit message.

Cheers,

Richard

