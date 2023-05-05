Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A3BC77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:30:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.24582.1683286250573539154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Erog/JpP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f315712406so95254325e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683286249; x=1685878249;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzlDl6C8v14GSsRjY2/RaVg2DWwmhBlXTpGTjtPdhhg=;
        b=Erog/JpPYTYxDp03T/tJ5UfqU+R3ayerNgq1C+2u75qNAg2N2ZvhayZOIDJjk0gvYu
         xkg/Hwgcu5QhSuviBNUBpqnV9jUTdkIJXEmRJ1RBvessX00dMWxnyVHtuWFv5uR9jpWB
         hTR+HQrGFX9GFg8Hhy/J/CfeK7W4yc4V5N/rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683286249; x=1685878249;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzlDl6C8v14GSsRjY2/RaVg2DWwmhBlXTpGTjtPdhhg=;
        b=AGV5JLmhoKCo0GxBHzI/jDvDhnnMzZtcdFDv7HLzOkXbgDsmTc05LnJk365wW+Kapk
         q1H2U4lRnVMMuClQlcd3MQzNCbZUTTdrT99vL2VHiGH9mKEh3ud457zs7oqo3UocBnKx
         7ZO+OhC3PuZPbdZKhWfO5HRN025UJ/HAZexGDwvx1zop8MIwjQ4pSJrIeggimiVotO8E
         ijZ7HQZM9YlfBPjjeHY+DyQsG36pQz92JhfNsSk5/lSUa0pEAqs0zul7PwhdDIuelA+Q
         7+AuOW7YkeRAeHXBC0hIojJPS/KI2rKWmExMV0z8V6hajJV6Nj94Oi2+VO+R30Pt6GtP
         zl5w==
X-Gm-Message-State: AC+VfDxI0hd3L1uLn4xxZf+52GkQW0gGEvtTNYA2GJ2a9nPUc7nCZ56L
	/hrokaOwqNdrpUxY8YoqmRc+9g==
X-Google-Smtp-Source: ACHHUZ6TqEWf6BktkeDaH+mtwlppInIX/zJpfDYqlkUBdGsV/nP5cxIM6ZaE/6wsAp3qFmgtdNCv2w==
X-Received: by 2002:adf:df0c:0:b0:2f5:dad1:41a4 with SMTP id y12-20020adfdf0c000000b002f5dad141a4mr1155552wrl.6.1683286248815;
        Fri, 05 May 2023 04:30:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id f5-20020adff985000000b002fda1b12a0bsm2182895wrr.2.2023.05.05.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:30:48 -0700 (PDT)
Message-ID: <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: andrej.valek@siemens.com, openembedded-core@lists.openembedded.org
Date: Fri, 05 May 2023 12:30:47 +0100
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180912

On Fri, 2023-05-05 at 13:18 +0200, Andrej Valek via
lists.openembedded.org wrote:
> CVE_CHECK_PATCHED - should contains an additional CVEs which have been
> fixed and shouldn't be mark as vulnerable nor ignored.
>=20
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/classes/cve-check.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index bd9e7e7445c..957ea0130dc 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -78,6 +78,11 @@ CVE_CHECK_SKIP_RECIPE ?=3D ""
>  #
>  CVE_CHECK_IGNORE ?=3D ""
> =20
> +# Usually a CVE gets treated as patched when a patch with the name of th=
e CVE
> +# gets applied. Basically this variable should not be used. But if there=
 are
> +# other reasons to mark a CVE as patched it can be added to this list.
> +CVE_CHECK_PATCHED ?=3D ""

We're not adding variables which are documented as "Basically this
variable should not be used.". If you shouldn't need/use it, we don't
need it.

Can't you just use the ignore variable for the same end result?

Cheers,

Richard


