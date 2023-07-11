Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB38C001DF
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 12:20:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6234.1689078010578509966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 05:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LJG7Hhoi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so56969045e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689078009; x=1691670009;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRExy9LUkTLmBK438xfM32U3C/Igv/rriKXHiVx3m3o=;
        b=LJG7Hhoi/YQTOz0SMpFgld88dDSdTruwTp6sE2gspVxB7Z5aueeEflDtpSXj4rPTQR
         1t8hk8SJbsXeyIXOlAB7L+46l6jsDCnwZnPjMtZGu35rABfQfH2cQQuHJpQ1F+MVRCqN
         S1mMz94x333JUqiaQnVsRuPMOKNxxWSu+eXcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689078009; x=1691670009;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRExy9LUkTLmBK438xfM32U3C/Igv/rriKXHiVx3m3o=;
        b=CGhQXXwMn6J+JdENEcY7qu6a6dUkwCxS6/S6XZlgpN1YJQLd4qP24flZ9lvu7a1W2t
         EkH//VbOVGrQMLzWfarSHJ9C9WpycBm0D/rWp7gonCBkUM+0EST9V2kaA78o3TZxdIhf
         M7HQvntumL/JUnN5lWr4kNXPPgOaQyN15/qF3gHlakhC7Bm4YjAFeYRMT/uYYXYRhxVY
         IJeSkyH/gWwwaTR1+T6YORNalDfPPUGwi3+Kikd27lLpiVi+qCqR71sYU9+YmzWvZ64K
         NY5QqRjWPdL8GMHFcoTWDidmRNlYOE9UAZjhFh5fl2GiQs0I2WNlE9VRxsjD6ECcphMF
         /iXw==
X-Gm-Message-State: ABy/qLZ8sWIRwHGCG5y9aHLuAMltr7hr4TWAtvEK3poKMXWJVnH1cixm
	iEDI2Cf6sRWubxBhe+VF+mrwUQ==
X-Google-Smtp-Source: APBJJlFj0zAIaDC6UVl8O1QdZSY9yT9XLonVRzSXIvkHwxg8KscYg4JPX2x/OedkuDgJ5f2HuXM7aw==
X-Received: by 2002:a05:600c:21c4:b0:3fb:b299:6eba with SMTP id x4-20020a05600c21c400b003fbb2996ebamr14785346wmj.4.1689078008951;
        Tue, 11 Jul 2023 05:20:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:645b:1bfa:e637:558b? ([2001:8b0:aba:5f3c:645b:1bfa:e637:558b])
        by smtp.gmail.com with ESMTPSA id k9-20020a7bc409000000b003fc00212c1esm2404428wmi.28.2023.07.11.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:20:08 -0700 (PDT)
Message-ID: <2cf5874fbe01c796046db4698cab3ea823d39137.camel@linuxfoundation.org>
Subject: Re: [OE-core] Merge process?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: aplanas@suse.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2023 13:20:07 +0100
In-Reply-To: <DB7PR04MB4666B31ACC5187EEB96B8940C531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: 
	<DB7PR04MB4666B31ACC5187EEB96B8940C531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 12:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184132

On Tue, 2023-07-11 at 11:23 +0000, Alberto Planas via
lists.openembedded.org wrote:
>=20
> (Sorry if this is not the correct mailing list for this question)
>=20
>=20
> Some time ago I submitted 2 patches here:
>=20
>=20
>=20
> https://lists.openembedded.org/g/openembedded-core/message/183090
>=20
> https://lists.openembedded.org/g/openembedded-core/message/183091
>=20
>=20
> The first one was merged but the second=C2=A0one still is not in master
> (for Yocto at least). Other versions of this second patch to
> rpm2cpio.sh has been broken (and successfully detected and reported
> here in the mailing list), but this version should be OK (I think)
>=20
>=20
> What should be the correct step to do in this case? Maybe re-send
> this second patch alone, or wait a bit more time?

I thought the second patch was merged and in master:

https://git.yoctoproject.org/poky/commit/?id=3Dcc2c3b1b62070db2b84d967ce20a=
1651fd50b7fb

?

Cheers,

Richard

