Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00944C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:59:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.18346.1683118736557532346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Usc8fxxR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-2fddb442d47so4814665f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683118735; x=1685710735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//rhpnCnKZjnYccKJAouwyO6M9eDsfTLzn/gmn2XZOM=;
        b=Usc8fxxRDfOqWlZdw1PUfHAwBte+8s4c5Wej/esdithu5vLJDd30mE7KSb7hKaYzuW
         HlbLW1ug5LDw0Mf2lY88tzW6MPTEVDVdtPxIOOp0W6YwGpNMuc7imqnZ+b3x1khSr7f0
         6L6g+1sHQ/miLA90zp2kjGNLbS5HW0kZQJO6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118735; x=1685710735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//rhpnCnKZjnYccKJAouwyO6M9eDsfTLzn/gmn2XZOM=;
        b=cocyjpx7+PtNBaGJ6yzo+NMaKy/qVMyic9D6FITbs0cHYFJ9zDTGU5rMFJHF0lG6ki
         b8o2JFODOXF6hUbUJQ7qL2YglwJrkjliwrJ3KtbH+fpqCzc00GgZ8+0NS0LUUsVMnWh2
         1ViNt7EH1LJzAcXrldh269QIor/IIf2PTbkHFOHJ6Lmp7/NrAV3oa5S2/aCd7qjllLMw
         y+zJ8Auy/qpGYB794oIf/HaUW7PTgHsjk2XPL8Dxp2kdfNrNl3H514x5UXzxE/WRWwou
         3hewT2OAKScmrmP4P28584reeOYd660wH6e4ezKxqQK+MHmAgPeQOshXrDMM3Pu/RpRx
         1zZA==
X-Gm-Message-State: AC+VfDxpDrzGcsWeBL/DBMbuLYfkIy+bhiUAVpP2IiXU8Kps1zkMWR5i
	pcu5J9h3tYAXdpnut6djWVO6Jw==
X-Google-Smtp-Source: ACHHUZ6IqBQ+SxGfEfV0lMY0lEolwJOQsG+ggHRfsos8w9v/x/ip69WdHExUtY8hJsUouDTHMncFiA==
X-Received: by 2002:a05:6000:1819:b0:2f9:a798:602f with SMTP id m25-20020a056000181900b002f9a798602fmr13967245wrh.48.1683118734956;
        Wed, 03 May 2023 05:58:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4d8c000000b003063408dd62sm5747684wru.65.2023.05.03.05.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 05:58:54 -0700 (PDT)
Message-ID: <f6aeec9f69d053a97cc36f5cfb6306ce1200f038.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2][PATCH] os-release: Add CPE_NAME
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 13:58:53 +0100
In-Reply-To: <20230503125120.944934-1-akuster808@gmail.com>
References: <20230503125120.944934-1-akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180824

On Wed, 2023-05-03 at 08:51 -0400, Armin Kuster wrote:
> Its time we add the CPE_NAME to os-release.
>=20
> The vendor field is hardcoded to "openembedded" as it is the base
> framework. We will use "DISTRO" to identify which variation of
> openembedded is being used.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>=20
> ---
> V2]
> Add CPE_DISTRO
> Improve usage text.
> ---
>  meta/recipes-core/os-release/os-release.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> index 860ee97224..3f93711efb 100644
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
> @@ -25,6 +26,22 @@ VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODE=
NAME if 'DISTRO_CODENAME' in
>  VERSION_ID =3D "${DISTRO_VERSION}"
>  VERSION_CODENAME =3D "${DISTRO_CODENAME}"
>  PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
> +
> +"""
> +The vendor field is hardcoded to "openembedded" deliberately. We'd
> +advise developers leave it as this value to clearly identify the
> +underlying build environment from which the OS was constructed. We
> +understand people will want to identify themselves as the people who
> +built the image, we'd suggest using the DISTRO element to do this, so
> +that is customisable.
> +This end result combines to mean systems can be traced back to both who
> +built them and which system was used, which is ultimately the goal of
> +the CPE.
> +"""
> +
> +CPE_DISTRO ??=3D "${DISTRO}"
> +CPE_NAME=3D"cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
> +
>  BUILD_ID ?=3D "${DATETIME}"
>  BUILD_ID[vardepsexclude] =3D "DATETIME"
>=20

That looks like a parsing error to me? How did you test this? :)

(needs # at the start of comment lines)

Cheers,

Richard




