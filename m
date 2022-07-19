Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BEDC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 11:26:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.39445.1658230006476950808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 04:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f2xNkCGl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d8so1222780wrp.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=LssDZcsDRCLKpb4sdn7kax1slyl/hN2UzzDYlJZ56Fk=;
        b=f2xNkCGlhHxkLL0tJLONSSjE0DGjBOwEJLbq9Qhd2BKrhgh+1Auecu9A6WzpvUnsv7
         GJ9qzIF06GXweg+5N/fhXPgsiw+Tr9wN/sTop9qEBwBpjrdbfLwcZj4GjgvPY4PES97S
         UPiIAw91xlGxEnizNiXf6J4rQCc5Yjj9KCSPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=LssDZcsDRCLKpb4sdn7kax1slyl/hN2UzzDYlJZ56Fk=;
        b=LgrPK8Hcy65Iw10/SQo3InCb3T/JkjliKgUUNnRozdX0kbiNZZgcwtfHkvsejpDtHK
         MZn5bqCZK7TDm0pJHtBQVJlw56RYK24xUExLLEKcjyBnxk6hSrGian6kXoOWbmGa93rx
         bfn22Mk/rZKDdGqx+N2qbq8wHCu98he8hkdn6q7y+GaGoWp7tJiJ58mImo6BOhaiqj+E
         /I/qungUSMpWQP3WB1PMGW/SmkA3mvaS8ICDFY+V5L5wquRTHFQ7vY/wVWsbjRIuhm1V
         1YVuhbn+WgyKJjG7QEEi7oHBrp+Aq45WDBpfIPcrAx3QUfGAz9mnpCuwOvMF6VweCiey
         iFBw==
X-Gm-Message-State: AJIora8P24hCtKrC5ZdHoo1e1T0XSfsBiQdK0hKPVVKfBUgPC3RS9eRx
	5e7kEDLJprX5ia31Y85NTp6KJg==
X-Google-Smtp-Source: 
 AGRyM1t7ds4oYztbJXWN3bO78O/GF9Yl0OBJyUKm3LlHV9UMm69NMXYuuxVYdtHRQcogK+9ljPi8jA==
X-Received: by 2002:a05:6000:100f:b0:21d:779f:fa87 with SMTP id
 a15-20020a056000100f00b0021d779ffa87mr28146704wrx.291.1658230004841;
        Tue, 19 Jul 2022 04:26:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22db:3f70:c684:113a?
 ([2001:8b0:aba:5f3c:22db:3f70:c684:113a])
        by smtp.gmail.com with ESMTPSA id
 i10-20020adfe48a000000b0021b90cc66a1sm12997955wrm.2.2022.07.19.04.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 04:26:42 -0700 (PDT)
Message-ID: 
 <483e9131e2c23c87d885fdab3ea25f26fe946cee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] python3-docutils: upgrade 0.18.1 -> 0.19
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2022 12:26:41 +0100
In-Reply-To: <1658189026-652-1-git-send-email-wangmy@fujitsu.com>
References: <1658189026-652-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 11:26:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168277

On Tue, 2022-07-19 at 08:03 +0800, wangmy wrote:
> License-Update:
>  year updated to 2022
>  url of some reposity and license changed
>  file lists changed
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Drop support for Python 2.7, 3.5, and 3.6.
>=20
> - Output changes:
>   HTML5:
>      Wrap groups of footnotes in an <aside> for easier styling.
>      The CSS rule .footnote-list { display: contents; } can be used to re=
store
>      the behaviour of custom CSS styles.
> - After package installation, the CLI commands python -m docutils and doc=
utils
>   start the generic command line front end tool.
> - Support parsing "Markdown" input with 3rd party parsers myst, pycmark, =
or recommonmark.
> - The default values for the "pep-references", "rfc-base-url", and "pytho=
n-home"
>   configuration settings now use the "https:" scheme. The PEP-writer temp=
late's
>   header is updated to fix links and resemble the header of official PEPs=
.
> - Various bugfixes and improvements (see HISTORY).
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-docutils_0.18.1.bb =3D> python3-docutils_0.19.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-docutils_0.18.1.bb =3D> pyt=
hon3-docutils_0.19.bb} (62%)

Alexandre ended up tweaking the wording of this commit and I've taken
that version. Please have a look at it as an example of a good way of
summarising the license changes. The key piece was effectively:

"list of files under BSD-2-Clause license changed"

Cheers,

Richard

