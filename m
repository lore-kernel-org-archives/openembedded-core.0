Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54907CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:00:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23887.1781107202536146230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lFEchxjj;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so57648095e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781107201; x=1781712001; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq69yNONEzRP3WOJiagmrFt46j4q0RbpWswzEsjlLB8=;
        b=lFEchxjjuJAzdmOwig9d+DJ7g/wElXUNN8RftGyzbN01MdEfagDUTDnUFVQ9Xpteod
         kn1mky8BrUR1MEhWwyrzhmPaJ5M3xankcN/W9ZWSDCQlR44zwkI7NYr5fZqFuJyJwnmN
         OKHKwBk9hBLMFWLo/xg0+NeQaKZFsJYp3JprY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781107201; x=1781712001;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xq69yNONEzRP3WOJiagmrFt46j4q0RbpWswzEsjlLB8=;
        b=lYs8ExJzQ4IoMrzv3qdu3en6g1LK/vEjvLuXtE86V5rswMjWrRmDu96z4/ud+P96LR
         MSeRU7qkwN23hDxOX7Py+k0/ePZvKyyNhEXcjxzz00Uz70qwTALuk3uGNTUC+08G8Efg
         6ldJNpjkexx4TA6WX+6G5FYY2PzzXGDfK4SPfuMA3Wd/TKvJ+Inw/kI3CAqXG3m0J6GF
         vGrwCYl7atg1AW3orLr9Xu+pZHZWVDYvwF3A3JfSAFKcq8wbaVYuLS2oOTXYID7dLfm0
         Pv7JqczS4nTPfUK1xPWQxkQYML9VdVAur/1y7ZQbSa7cBRmLk5A/vgEJksEJrJkEN2D2
         jsSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OYDWhHElMXucojwYV7fWWgVj91PcfMI7Zt1fyemOC5xFD6PdnlAi8C/O+Frnf6gMt2TRIMhVLlOb2pRBD68Mcpw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1fRd4YdfpK9YtTfGd1EWKiKOnOJ5wgchNXcSByCW3QBI73x1y
	8M17cBDTTk3YgjAb6XEt+QjzDXN33S4zCe+VRDZtWm5UfxhIbwnEjFsufpKj46bPeg==
X-Gm-Gg: Acq92OG9nv9YZHNgHRkI+n1f+5SKGbemVXkunYsUM/QKBgqZBzVmf83TdjvNqlARaj8
	HqcHC7Fbz81Bhgz8zh4dS592kaW6W5qPglNIkfhlC6SpCmEYa/+MQ0MmpB/l6N+4sPHh1eFOJ8G
	edj60rP2SpxzXkCdFipr7zGYRoG/hac6j5w1AxadKOs5RV2w1O9dvQTdK1hue8wO7TzRXzg+ku8
	eqVEuqKgquIxQZqwwqvk/LNHBYUmUr+hCpsVNshc5Pa6NWjbxAFMOoXKyBfrMJwWtRGPBlNhsfh
	0mZIDLYpaN9byrbvmI6LnJWGKaj1VEgee/DoaUeYfRaERelj4iC4WmwRVpPUTqzFD10FiSknuxw
	f09MS98bbt5nBwsOLQYFq1q/0KALs5mtLCn4b8XgMA87+G/WW/+ifYuxOXFvS5MQqb7A5uGuPqz
	bn6JebPmcNYZrCN+aNOPVEOcUV5CvT0tV3
X-Received: by 2002:a05:600c:5248:b0:490:cb90:3e00 with SMTP id 5b1f17b1804b1-490cb903f1emr267583035e9.14.1781107200872;
        Wed, 10 Jun 2026 09:00:00 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918d7sm540426835e9.2.2026.06.10.09.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 09:00:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 17:59:59 +0200
Message-Id: <DJ5HT3S1FBU4.36LRQBILYK0UF@smile.fr>
To: <bindudaniel1996@gmail.com>, <openembedded-core@lists.openembedded.org>
Cc: "Bhabu Bindu" <bhabu.bindu@kpit.com>, "Sana Kazi"
 <Sana.Kazi@bmwtechworks.in>
Subject: Re: [OE-core] [poky][scarthgap][PATCH 2/2] libarchive: Ignore
 CVE-2026-5745
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
X-Mailer: aerc 0.21.0
References: <20260522101808.175426-1-bhabu.bindu@kpit.com>
 <20260522101808.175426-2-bhabu.bindu@kpit.com>
In-Reply-To: <20260522101808.175426-2-bhabu.bindu@kpit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238370

Hello Bhabu

This patch does not contain your Signed-off-By

Could you prease respin with the correct SoB please ?

thanks a lot
Jeremy

On Fri May 22, 2026 at 12:18 PM CEST, BINDU via lists.openembedded.org wrot=
e:
> Ignore CVE-2026-5745 as libarcihive maintainer rejected CVE-2026-5745.
> This is reproducible only with UBSAN, using with
> '-fsanitize=3Dpointer-overflow -fsanitize-trap=3Dpointer-overflow'.
> The root cause remains a UBSAN violation, not a NULL pointer dereference
>
> https://github.com/libarchive/libarchive/issues/2904#issuecomment-4257068=
822
>
> Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
> ---
>  meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/=
recipes-extended/libarchive/libarchive_3.7.9.bb
> index 6b31256960..e402a485b3 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> @@ -80,4 +80,9 @@ ALTERNATIVE:bsdcpio =3D "cpio"
>  ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
>  ALTERNATIVE_TARGET[cpio] =3D "${bindir}/bsdcpio"
> =20
> +python() {
> +    if not bb.utils.filter('CFLAGS', '-fsanitize=3Dpointer-overflow -fsa=
nitize-trap=3Dpointer-overflow', d):
> +        d.setVarFlag("CVE_STATUS", "CVE-2026-5745", "not-applicable-conf=
ig: sanitize is disabled")
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"


