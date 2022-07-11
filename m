Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F22C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 22:06:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1946.1657577195259721505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 15:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NY4qeIvr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r10so2583046wrv.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 15:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Rb+C/HLtWu0act89ui+sO79wfHfvPc5SNdo2+AH6b0w=;
        b=NY4qeIvrzKHg+QxcqO5kVe0u9CyyowHPEURRNIFVckLyRxt6c6wpfQFZALDNyd6SXT
         7spigRyOuP2S8lfyxGKZoZJUUqPqlh8SXDa2ywrImUcdUQDZHs/kfxA9DUjI0jJIDdv/
         J53EYw/i7t5PQjM/JsjQ2QUpvKXCmtAkFmy+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Rb+C/HLtWu0act89ui+sO79wfHfvPc5SNdo2+AH6b0w=;
        b=WyXb1fVcA8zto9L0wkCq67qYFLdkOott9OBPGufiAmUnbEnYYTVySHNQcAOcgboVuD
         0I/d+w/xaWgdKGCK/XB9NFHmoB8uTo5nBvI9fVwVwCwH+5FLEz4ApYf2JQlChVqIzFSA
         xTnY5Yb6Cnb2yWYL0AvfXJKrc+mPmXhHQGeN9RRInS37gdhJP7KvPJ9BAmMrX4CQDcvz
         owm6kXCS0+Y1vhDPHaP/jeQpUJAtbdPCAkMaZg3yR8qy/maQvr43DVgVQSw/o2CKAFay
         G5Pc12SfLMzycxvHqafg+BBUcgtVf1SviE8J6O1gkMmh1v1KF6wuttIl5nnD5x8OBa6t
         31jQ==
X-Gm-Message-State: AJIora8QAfE1HdjCfExT3RwshpbXyLb8EPiIRvJqmLXwS6k9yM7hLwia
	Az0QHRLdpNglH53Es3sV/n/U5g==
X-Google-Smtp-Source: 
 AGRyM1t2/qwDcN7iBGUqQgBD38qOt+T8nrHoEXVLHxWcn/F43EbNKKBENN+q+tKyDAYvqnSQtmTSYQ==
X-Received: by 2002:a5d:4201:0:b0:21d:7b63:1b43 with SMTP id
 n1-20020a5d4201000000b0021d7b631b43mr18046390wrq.225.1657577193414;
        Mon, 11 Jul 2022 15:06:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:375:1449:b69:de14?
 ([2001:8b0:aba:5f3c:375:1449:b69:de14])
        by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm6495832wrb.102.2022.07.11.15.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:06:32 -0700 (PDT)
Message-ID: 
 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2022 23:06:31 +0100
In-Reply-To: <20220711202929.3839971-1-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 22:06:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167884

On Mon, 2022-07-11 at 21:29 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Support for unmerged-usr is deprecated upstream, taints the system and wi=
ll be
> removed in the near future.
> Enforce building merged-usr images when using systemd.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> We intend to deprecate unmerged-usr at some point, and we are doing the
> rounds ensuring distros are moving along so that there are no surprises
> when the time comes.
>=20
> See:
> https://lists.freedesktop.org/archives/systemd-devel/2022-April/047673.ht=
ml
>=20
>  meta/recipes-core/systemd/systemd.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index b8dbe2263a..f9e109bba4 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -21,3 +21,8 @@ SRC_URI =3D "git://github.com/systemd/systemd-stable.gi=
t;protocol=3Dhttps;branch=3D${S
>  "
> =20
>  S =3D "${WORKDIR}/git"
> +
> +# unmerged-usr support is deprecated upstream, taints the system and wil=
l be
> +# removed in the near future. Fail the build if it is not enabled.
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES =3D "usrmerge"

Given none of our systemd testing on the autobuilder is done under
usrmerge and we've never mentioned this requirement to any of our
userbase before, this is going to come as a bit of a surprise to
people. The above change will break the autobuilder as things stand :(.

Cheers,

Richard






