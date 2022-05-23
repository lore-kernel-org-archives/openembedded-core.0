Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4F9C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 13:03:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.26878.1653311008292222524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 06:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pu1a0RFp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso6732579wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=DMD0HSnlvGvB0qxecieNqrXXwVSWGcAwmOcWjgBUrrI=;
        b=Pu1a0RFpAICguTnHCoav59UO2Pl++fUKy6wRMTyrsy1VqTu7aWtQxNiYsCJe9c+ljU
         d4YgABDLkAuECtnbsUsqXORiXzRmYzV1/Saq/HrtTZ6LJHN4L3jbKMCyzqH8C2gXdiex
         zWnKcIjA5FTOmGOvBvJXflMEq4fJByz3HTWJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=DMD0HSnlvGvB0qxecieNqrXXwVSWGcAwmOcWjgBUrrI=;
        b=YXGAuEtCmFVlV2yt9vE7pcFtIeHIKFZg4F36rNIvH0tVl9dLzR9OtApbh8EHm9xBVF
         SwFl32TiyJMKV+iD4HTa/wLc61VDLPQMKVV0YyUbbRj82KeM/4LhVozTU502kYmLiFYU
         QfhJc+6A7katuIPhWaJPa2SuM4cOwqhhRZ7wN6grA/KsWXjw5qLQZIOrh1rHwAACmMnY
         bdBkqe7Cf1GYW+gRVQ2Czc5lTOsh4Y0A2ggxLb6rdSMYbVB3Oc0nk5I4u2gKiGTfb7FA
         rtfKzp4QjzUl1dBcZ+J6bquCusnXtx8uY9R1O4NMajkyEPJRoojvQ6JOI7fngvOggW+G
         BYmg==
X-Gm-Message-State: AOAM533nVVCvyvCDKzNm3uKQvTtvuwTYg+jTvazKY6wgNKOK4FICt+m2
	PaVYjQeg3FmGWDzPt7n39Nt5WA==
X-Google-Smtp-Source: 
 ABdhPJw/nSbiEu012ALdF0n0XVes6ybxSVJRFENTrb8GHNCtu59L65doAUf4c9rIQirTI6Z2agHunA==
X-Received: by 2002:a05:600c:1c22:b0:397:4ca9:fa69 with SMTP id
 j34-20020a05600c1c2200b003974ca9fa69mr3885531wms.2.1653311006300;
        Mon, 23 May 2022 06:03:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24?
 ([2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24])
        by smtp.gmail.com with ESMTPSA id
 b13-20020adfc74d000000b0020d012692dbsm4483908wrh.18.2022.05.23.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 06:03:25 -0700 (PDT)
Message-ID: 
 <a99237d81aa73024f6982c34e9d9e1ff74ac7e0d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] local.conf.sample: mention other QEMU targets
 in OE
From: richard.purdie@linuxfoundation.org
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2022 14:03:22 +0100
In-Reply-To: <a22fea43-b04b-6b2a-91a3-225718da358@crashcourse.ca>
References: <a22fea43-b04b-6b2a-91a3-225718da358@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 13:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166020

On Thu, 2022-05-12 at 04:38 -0400, Robert P. J. Day wrote:
> Mention that there are other QEMU targets available in the OE layer,
> and leave it for the reader to check them out.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
>   i think this is the happy medium between not saying anything about
> the additional QEMU machines, and promoting them to full equality with
> the other layers -- just let the reader know where they can examine
> them.
>=20
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index c05691de58..c28ff62468 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -29,7 +29,11 @@
>  # This sets the default machine to be qemux86-64 if no other machine is =
selected:
>  MACHINE ??=3D "qemux86-64"
>=20
> -#
> +# Note that the openembedded-core layer defines a few more QEMU targets =
that
> +# are not listed here as they are not tested as robustly as the above, b=
ut they
> +# are still available for the adventurous; see the full list at:
> +# https://git.openembedded.org/openembedded-core/tree/meta/conf/machine
> +

I don't mind adding a note about this but wouldn't it be better to
suggest the user look at the meta/conf/machine directory rather than a
web url since they might not actually be online?

Cheers,

Richard


