Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1FFC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 21:10:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.2621.1663708242100056863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 14:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OWcjb3D+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b5so6625360wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 14:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=/FMZlHTVhRBjNSTQnAkfrlUZ+Lg4b0x5ILYReuRvh3E=;
        b=OWcjb3D+i6BQ7FW4V2B58DunrP7RagGo35ophfCW5mz35qjn3VeBQF16H57+c16Gzt
         NdszbajylVTvq58ssLV7a3vxRdj488xlq1GVxPY0RdJ6JZ5QgFQyWWkQ/cbwsYuL2rWF
         zfdBAzx9aremBYwcDwutgc8GNpVlCvm+OYs6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=/FMZlHTVhRBjNSTQnAkfrlUZ+Lg4b0x5ILYReuRvh3E=;
        b=ef+vc3pTXy4BLiLtbnmdfOaUnGlXLUng+Q4RrmXPDSMsR3yPLOdcnbmUT1AM3Irou6
         kGOAxpaET0cWPAWVGbHVNjjKpGPRDirMnT8246CTctvhEUJ/XQlW/lQl90Q743cFV3e/
         gOPV+CTsdSt9qUcoMXiMwaLP0PpTReJOavIKgMNmnxwXxuF+32BZmsLaAPfhzBywn/7N
         a3qts5Uf0vmWnmkGoycUsVsKvFTQ8qHwvW/ho2DesAEPhlZ8/5NeTO2kke0JTvsx1vN0
         OokZxRA92AreBqCVCq3CRP3seFzn9NbrFFJJpKDH+zBWBsB8+Gzi3EknBEIAhjU4rZlF
         Oomg==
X-Gm-Message-State: ACrzQf0ivs16GMZ3lJWt6MzsrUSu88yqXBq3LOo4POoG4AzbpBDH4r3y
	kwHohlYFEDM0wCXSKJ61gwN7jg==
X-Google-Smtp-Source: 
 AMsMyM42BHxFvZhcQfp8kalRFyWzc6ZD9TyzXiuNn49ZdnmuS2BaTPar9zNU5hk66Z//xu/bjVZpuQ==
X-Received: by 2002:a05:6000:61d:b0:22a:f5c6:696d with SMTP id
 bn29-20020a056000061d00b0022af5c6696dmr10507701wrb.214.1663708240164;
        Tue, 20 Sep 2022 14:10:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 bj4-20020a0560001e0400b0022a403954c3sm835712wrb.42.2022.09.20.14.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 14:10:39 -0700 (PDT)
Message-ID: 
 <e58d3124e4b7e0aa0f6dee7c110c61a100c6b619.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] expat: CVE-2022-40674
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Florin Diaconescu <florin.diaconescu009@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2022 22:10:39 +0100
In-Reply-To: <20220920103955.17640-1-florin.diaconescu009@gmail.com>
References: <20220920103955.17640-1-florin.diaconescu009@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 21:10:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170907

On Tue, 2022-09-20 at 13:39 +0300, Florin Diaconescu wrote:
> Upstream-Status: Accepted
> [https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba5439=
3d465bb77c40b5c33d343b]
>=20
> Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
> ---
>  .../expat/expat/CVE-2022-40674.patch          | 57 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.4.8.bb        |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch
>=20
> diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/re=
cipes-core/expat/expat/CVE-2022-40674.patch
> new file mode 100644
> index 0000000000..3164edbb49
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
> @@ -0,0 +1,57 @@
> +From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
> +From: Rhodri James <rhodri@wildebeest.org.uk>
> +Date: Wed, 17 Aug 2022 18:26:18 +0100
> +Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityPars=
er
> +
> +It is possible to concoct a situation in which parsing is
> +suspended while substituting in an internal entity, so that
> +XML_ResumeParser directly uses internalEntityProcessor as
> +its processor.  If the subsequent parse includes some unclosed
> +tags, this will return without calling storeRawNames to ensure
> +that the raw versions of the tag names are stored in memory other
> +than the parse buffer itself.  If the parse buffer is then changed
> +or reallocated (for example if processing a file line by line),
> +badness will ensue.
> +
> +This patch ensures storeRawNames is always called when needed
> +after calling doContent.  The earlier call do doContent does
> +not need the same protection; it only deals with entity
> +substitution, which cannot leave unbalanced tags, and in any
> +case the raw names will be pointing into the stored entity
> +value not the parse buffer.
> +
> +CVE: CVE-2022-40674
> +Upstream-Status: Accepted [https://github.com/libexpat/libexpat/pull/629=
/commits/4a32da87e931ba54393d465bb77c40b5c33d343b]
> +
> +Signed-off-by: Florin Diaconescu <fdiaconescu@lenovo.com>
> +---
> + lib/xmlparse.c | 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index e986156..eabe0fc 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, const=
 char *s, const char *end,
> +   {
> +     parser->m_processor =3D contentProcessor;
> +     /* see externalEntityContentProcessor vs contentProcessor */
> +-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_=
encoding,
> +-                     s, end, nextPtr,
> +-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> +-                     XML_ACCOUNT_DIRECT);
> ++    result =3D doContent(parser, parser->m_parentParser ? 1 : 0,
> ++                       parser->m_encoding, s, end, nextPtr,
> ++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> ++                       XML_ACCOUNT_DIRECT);
> ++    if (result =3D=3D XML_ERROR_NONE) {
> ++      if (! storeRawNames(parser))
> ++        return XML_ERROR_NO_MEMORY;
> ++    }
> ++    return result;
> +   }
> + }
> +=20
> +--=20
> +2.35.1
> +
> diff --git a/meta/recipes-core/expat/expat_2.4.8.bb b/meta/recipes-core/e=
xpat/expat_2.4.8.bb
> index 980c488640..93a2f98b38 100644
> --- a/meta/recipes-core/expat/expat_2.4.8.bb
> +++ b/meta/recipes-core/expat/expat_2.4.8.bb
> @@ -10,6 +10,7 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
> =20
>  SRC_URI =3D "https://github.com/libexpat/libexpat/releases/download/R_${=
VERSION_TAG}/expat-${PV}.tar.bz2  \
>             file://run-ptest \
> +           file://CVE-2022-40674.patch \
>             "
> =20
>  UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/"

2.4.9 was just released to include this so I think an upgrade may be
prudent since I've not gotten this to testing yet?

Cheers,

Richard

