Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D561AC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 15:57:18 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.13901.1663689428738541425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 08:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eoR+lHF8;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id r18so7198597eja.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zF3y1hWB2H9tmbYSlPae5xwyXhtuU3phnZYif81p+FI=;
        b=eoR+lHF8kD905Jmzj2S6J/XSsnsczwcsz2h+rs9cqnANd6q5cjj4/ONayhrWDKwooJ
         BjSLmpbrLr3mk1A86hGtB3YxID4KLP6lMrB5M8HfGztalT/8AhscUhxsTFRGkQKXlXdF
         e1HyphnORyRmw/ap+k0UGPs9LTfNPAknEe1SzPKJNAtDibDkwSUHu4C+q2CYeaHtjony
         dNoqmMy+vkOImgk2DhGd4L6WrGc8Ntp7bawSEZTpOGBf6eDpZSY2mxLXl8j7sHWlX/rU
         +s5DMbfrnyH1sVyCIYUvqzuhCMBH4cXnRS7MHR3kohnVU81/rL1PeezJB88v/ikLckBn
         UvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zF3y1hWB2H9tmbYSlPae5xwyXhtuU3phnZYif81p+FI=;
        b=LX6KhPbgmwot2xUFX9oW5sSbu6ayQw3yBjNBuL2sIAu2q4K8a4ztA3QtFTFRnFcd9v
         JzZ6KeZvHcWq5AAmVi2xskVIJI91oUC0WviUwWa46ELgZvArfWse7J/Gv1Dzkt3KnrXr
         pAiaUA131fuV/H4ITt64KFfkIli/N3qlYuJ4zkZ646JGwD507MT2P1hqyiWfFNhBBacc
         jhz36h5IDkfsDoe1fD9sPUvT27R+ZDZYDF6umjkf4RPZH+7pfQktw1xW+4ljAb/vLlu9
         wChfSDMK0shCYjoKjDOrbZ11mqlQ8CpzteJxXbCFwJumV3Ug0WgQSx7d77HYDY6wCNoN
         3ZUg==
X-Gm-Message-State: ACrzQf1EXQNFwKPZ530TasxHrLHUs3wlGyVp1FY+0zoetRG8vvxJQTol
	C+s91GQMvu28DgqOM/a37Z/0Y/R9wEGd12TUpsE=
X-Google-Smtp-Source: 
 AMsMyM6OyWv9f2oWdM7nTkw6KsvNsP9VXMWQvDLZQV6T+ZvWZdSLT/fhuZKR69MFPneOPsuFAYNruKKGDRZaw6GZOek=
X-Received: by 2002:a17:907:1c9c:b0:77b:226b:4b85 with SMTP id
 nb28-20020a1709071c9c00b0077b226b4b85mr17750506ejc.586.1663689427052; Tue, 20
 Sep 2022 08:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220920110856.18019-1-florin.diaconescu009@gmail.com>
In-Reply-To: <20220920110856.18019-1-florin.diaconescu009@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Sep 2022 16:56:55 +0100
Message-ID: 
 <CAO5Uq5Q2-QpL82BaZx2FB0paWeUq61nCqtVf16T-BmdS3q6xdw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] expat: CVE-2022-40674
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 15:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170903

2.4.9 looks to have landed w/ this change in it.

On Tue, Sep 20, 2022 at 12:09 PM Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> Upstream-Status: Accepted
> [https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b]
>
> Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
> ---
>  .../expat/expat/CVE-2022-40674.patch          | 56 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.4.8.bb        |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
> new file mode 100644
> index 0000000000..468811fefa
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
> @@ -0,0 +1,56 @@
> +From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
> +From: Rhodri James <rhodri@wildebeest.org.uk>
> +Date: Wed, 17 Aug 2022 18:26:18 +0100
> +Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
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
> +Upstream-Status: Accepted [https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b]
> +
> +Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
> +---
> + lib/xmlparse.c | 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index e986156..eabe0fc 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
> +   {
> +     parser->m_processor = contentProcessor;
> +     /* see externalEntityContentProcessor vs contentProcessor */
> +-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_encoding,
> +-                     s, end, nextPtr,
> +-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> +-                     XML_ACCOUNT_DIRECT);
> ++    result = doContent(parser, parser->m_parentParser ? 1 : 0,
> ++                       parser->m_encoding, s, end, nextPtr,
> ++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> ++                       XML_ACCOUNT_DIRECT);
> ++    if (result == XML_ERROR_NONE) {
> ++      if (! storeRawNames(parser))
> ++        return XML_ERROR_NO_MEMORY;
> ++    }
> ++    return result;
> +   }
> + }
> +
> +--
> +2.35.1
> diff --git a/meta/recipes-core/expat/expat_2.4.8.bb b/meta/recipes-core/expat/expat_2.4.8.bb
> index 980c488640..93a2f98b38 100644
> --- a/meta/recipes-core/expat/expat_2.4.8.bb
> +++ b/meta/recipes-core/expat/expat_2.4.8.bb
> @@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
>
>  SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
>             file://run-ptest \
> +           file://CVE-2022-40674.patch \
>             "
>
>  UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170894): https://lists.openembedded.org/g/openembedded-core/message/170894
> Mute This Topic: https://lists.openembedded.org/mt/93800770/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

