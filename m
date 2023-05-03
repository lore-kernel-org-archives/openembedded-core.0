Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0CEC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 11:44:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.17026.1683114244663787722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 04:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ToNs6dyO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-2f7db354092so3169382f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683114243; x=1685706243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYEJfzz+k0EQoxG1Hdjo/vFQmqx+GZ1SFNiT//5ip88=;
        b=ToNs6dyOcMTkVeNtCKZkWlH4U/IpDIEFZVIPJJ6Ji2g0blveD7a5WFVuo9ht3Sr01X
         vDhR8ujd4r8Jz8nAY4w4k5/1UM5/vpX/EtsVSLb0zkPW1rKY4F3+OQnkyi3cdHiZeCdr
         qK/PBgPHGVwOHeMTWI3MbpH82gtrA5nyNtnjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683114243; x=1685706243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYEJfzz+k0EQoxG1Hdjo/vFQmqx+GZ1SFNiT//5ip88=;
        b=J62ql28yqYzPYppTh8KS31EaVNaQyut/u3MXxvpAbFAJj+8v0sNuWMq3O+f+IJz2bI
         0A5HrkdRXqy7cf9SKIetHzJ60xQ4TuFQ1sHsjak20/MxWVVAX3HmiKC0A9LdKmnek+Ul
         rSgdOZh5koVFMzsXP2TILzW2JVSaMzQPbOVE+z92NFOiHdyyJfBKpzuaxL4rOAjQ7geF
         0vkEc1xOB76hVtW+27wDZWGw87jXPK/kSpxJOyY/hBzaMDKz1xrL5P2XJe3W+bEG07yX
         0snFJGbBuPqsAd5CJV9cBu7A7d8fpsWU1QyrHwbQovbxJK8wxCCjWRK2p7jtEFyFbgPi
         Q6nQ==
X-Gm-Message-State: AC+VfDyvyWDnmxoECTe2ADhIGOco1EaecVB1ppSaZlB7nSP9rk9cozgh
	c2MiJlUfzfWQiJAMqDO+WGgvBA==
X-Google-Smtp-Source: ACHHUZ4Yq9a54013gptra7XcHvun9mgKSF5fOmsneQEAcGPNvsi0TwY4jdFV0t0UoPKrPJ5MutIUjA==
X-Received: by 2002:adf:ef10:0:b0:306:340c:4737 with SMTP id e16-20020adfef10000000b00306340c4737mr4077190wro.67.1683114243063;
        Wed, 03 May 2023 04:44:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ef5bb63f13sm1683647wmr.10.2023.05.03.04.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 04:44:02 -0700 (PDT)
Message-ID: <14aba094734c98ead11de151a392d21fff96909c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] os-release: Add CPE_NAME
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 12:44:02 +0100
In-Reply-To: <20230503111938.942018-2-akuster808@gmail.com>
References: <20230503111938.942018-1-akuster808@gmail.com>
	 <20230503111938.942018-2-akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 11:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180810

On Wed, 2023-05-03 at 07:19 -0400, Armin Kuster wrote:
> Its time we add the CPE_NAME to os-release.
>=20
> The vendor field is hardcoded to "openembedded" as it is the base
> framework. We will use "DISTRO" to identify which variation of
> openembedded is being used.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> index 860ee97224..aa37dec7c7 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -16,6 +16,7 @@ do_configure[noexec] =3D "1"
>  #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
>  OS_RELEASE_FIELDS =3D "\
>      ID ID_LIKE NAME VERSION VERSION_ID VERSION_CODENAME PRETTY_NAME \
> +    CPE_NAME \
>  "
>  OS_RELEASE_UNQUOTED_FIELDS =3D "ID VERSION_ID VARIANT_ID"
> =20
> @@ -25,6 +26,13 @@ VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODE=
NAME if 'DISTRO_CODENAME' in
>  VERSION_ID =3D "${DISTRO_VERSION}"
>  VERSION_CODENAME =3D "${DISTRO_CODENAME}"
>  PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
> +
> +# The vendor field is hardcoded to "openembedded" as it is the base
> +# framework for all derivatives Distos.
> +# We use "DISTRO" to identify which variation of openembedded core=20
> +# is being used.=20
> +CPE_NAME=3D"cpe:/o:openembedded:${DISTRO}:${VERSION_ID}"
> +
>  BUILD_ID ?=3D "${DATETIME}"
>  BUILD_ID[vardepsexclude] =3D "DATETIME"
> =20

I know a bit more about the context of this and I don't think it is
clear in the above comment. I'd like to suggest something a little
stronger, how about:

"""
The vendor field is hardcoded to "openembedded" deliberately. We'd
advise developers leave it as this value to clearly identify the
underlying build environment from which the OS was constructed. We
understand people will want to identify themselves as the people who
built the image, we'd suggest using the DISTRO element to do this, so
that is customisable.
This end result combines to mean systems can be traced back to both who
built them and which system was used, which is ultimately the goal of
the CPE.
"""

Perhaps we'd also want to do:

CPE_DISTRO ??=3D "${DISTRO}"
CPE_NAME=3D"cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"

to make it clear we're suggesting which bit be customised?

Cheers,

Richard





