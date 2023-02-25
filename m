Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45966C7EE2D
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 23:24:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.56105.1677367482336159537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 15:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cZYYuR88;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id az36so2068225wmb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/h1rrmj69k+atCz+qpJBu1VfwPptEUZGyjVzokrVCQ=;
        b=cZYYuR88J3Oa8omWn5aKYsU2G83VCELCa9AKqZfkbMYqKhcvWAENMmn9dNrYaZA2SA
         AACiyUREQo1AzRZYntdJY9oQzLKixnD1ikk/o2UL35r1f6bGxR3SK/aFBJ7FHIpyDu9b
         upNmD6ZwgchkSQf+lORgaahSIsD/5T91Y1ElU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/h1rrmj69k+atCz+qpJBu1VfwPptEUZGyjVzokrVCQ=;
        b=JX7I9uN3zC1DpOrx+3vebk9X1pcWY6GwVSVfNq2I8D7eHdoXDDk/a5k6mQUoiGh3NR
         0YYZCfiO5gBx/z5SFpEFId1lYan25fnF+4H0jZko+f/+XiWLv1kekMmHlY1Rg99PwdFK
         lXH7E9SOqDbC4bUBmqHUWPYV9yLizIrLpjM2q0kOLhaaxvAoK4FAMQledUTmMXPYIeHa
         2c0BV1iy2G3mxQpTzM4IV8UiHGMKAzRvTnFJgDk/0URNVh5pg73UReR7JjO5mrLWG7KM
         KEvyU6/DtP4daH+w6Wby0vxiCZgbefr63xLxJMwR1PBwLyLmMTMJpoHBXCMCDKcJ6J/p
         ip0g==
X-Gm-Message-State: AO0yUKVqtuWSLC76jdLXodXBVsXhWD9tZHB8yb2d145SH6irfjUOTc8/
	CiIGXEEcN1tmNs4IGxNwgrrdIg==
X-Google-Smtp-Source: AK7set+Wlt1873BNTYyA5aGv++2RK6D0CZb+SELHiqTIYJueU1yMI0OsnO39u2ltDI5jiGJF0ODbOQ==
X-Received: by 2002:a05:600c:3543:b0:3eb:3945:d400 with SMTP id i3-20020a05600c354300b003eb3945d400mr1721688wmq.6.1677367480516;
        Sat, 25 Feb 2023 15:24:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed? ([2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed])
        by smtp.gmail.com with ESMTPSA id bg14-20020a05600c3c8e00b003eb395a8280sm2208517wmb.37.2023.02.25.15.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 15:24:40 -0800 (PST)
Message-ID: <e297fa76f20375cf686c0e7f06070ce74a37692a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] lib/oe/reproducible: Use git log without
 gpg signature
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bmauduit@beneth.fr, openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2023 23:24:39 +0000
In-Reply-To: <7f21c73e-3e1b-dc78-e030-6ee47360487f@beneth.fr>
References: <cover.1673521664.git.bmauduit@beneth.fr>
	 <1739928B5F55BD9D.23170@lists.openembedded.org>
	 <7f21c73e-3e1b-dc78-e030-6ee47360487f@beneth.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 23:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177721

On Tue, 2023-02-21 at 17:33 +0100, Beno=C3=AEt Mauduit via
lists.openembedded.org wrote:
> Hello,
>=20
> Any update on my patch ?

It merged a while ago:

https://git.yoctoproject.org/poky/commit/?id=3D4c8d17088f33cd23c631cb9b76c6=
ca9bfa5b44ea

Cheers,

Richard

