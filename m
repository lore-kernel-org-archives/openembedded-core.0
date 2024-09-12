Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C443EE6456
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 06:44:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.41354.1726123476146519097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 23:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fweoRixk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbaf9bfdbso4405895e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726123474; x=1726728274; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LvnNSWLnT9TJGqiJC4CcZromWshmVuAF+u/FCcibsLs=;
        b=fweoRixkYiRUuxHY79mzmI1yqngGiZi7rgeCur+5G3EDZkvaTWcBbnQcGfNkoGx8iA
         3yafoJZtnG9VNOhbkeYxWYPlUL2B7GJy5aJHGAQRuZVC0tYVeqWhI8mP9ol8uj18wCwM
         GjbJnTy0auwDVIkwppmdKJd7cvOa9BgtVNbSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726123474; x=1726728274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvnNSWLnT9TJGqiJC4CcZromWshmVuAF+u/FCcibsLs=;
        b=tdW6fSH/qU5dBu9MGurh/tNdWMa+5pavQ/Gt17n69jZwxDBfhNbL8J78RvzdMjTUWX
         AtYMV/W85xQYqeCFrDjlSberRFOKAKfYsR90cQfSNov1Z+TWE323N/xZcjktBBUJrICV
         bT8JRhzyvGhsqvchzrAq5CMCSQOoOwn6KdCnvZRwZoMy/t02duzi0UScmYWBOTYp9m8S
         Zy04tWCtDRNvwKEXrNaazsTqAWPuOHzG8moK6sIxmb7+p3vfQq2fImPxTo+ja+Uao+wv
         mMkb6N0Q0rjys6fRLrL3iuTK9Wr7K31Qs599WpG0VKRvgcv9Mq2q0TxyIk/ac0R9vBV9
         pSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/5XHryLscffnlPJoboa+HRORU6sLuvNT27XOJaoAJBnDtnjJT/ObvsP3A7B+SFnfvp3XCoEcvZaVnwcR5WapZMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVHaEUwtX7Zk3OPF9X/VifkRW+3TsDssi5PO8PwDdQ6/e/zlWJ
	7q3PURnfd+Ia757EEP0cIq4DvSeve7VxkkrWVA1SWmfwngmzCKcX30N1ZD5scto=
X-Google-Smtp-Source: AGHT+IFntImMbKHCFZwHhYMpmaGKRKJDKaqWveRCNx20ex73kVc2dyUInPpXguxx/S5QZiUMRWTgeg==
X-Received: by 2002:a05:600c:4709:b0:42c:b949:328e with SMTP id 5b1f17b1804b1-42cdb58f82dmr12435965e9.31.1726123474357;
        Wed, 11 Sep 2024 23:44:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cef5:72f6:fcf1:91e6? ([2001:8b0:aba:5f3c:cef5:72f6:fcf1:91e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cae117aeesm166924325e9.6.2024.09.11.23.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:44:33 -0700 (PDT)
Message-ID: <6c8dfca6bf09ecbbbd94467fa74d3fc597d6d789.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/3] nativesdk-packagegroup-sdk-host: Add
 missing perl modules to RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Thu, 12 Sep 2024 07:44:33 +0100
In-Reply-To: <20240912054628.1539323-3-Harish.Sadineni@windriver.com>
References: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
	 <20240912054628.1539323-3-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204426

On Wed, 2024-09-11 at 22:46 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> In SDK, missing perl modules causes 'x86_64-wrlinuxsdk-linux-gp-display-h=
tml --help' to abort with below errors..
> =C2=A0 - Can't locate bignum.pm in @INC (you may need to install the feat=
ure module).
> =C2=A0 - Can't locate Math/BigInt.pm in @INC (you may need to install the=
 Math::BigInt module)
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0.../packagegroups/nativesdk-packagegroup-sdk-host.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index c1d3c25060..70a7d3e494 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -30,6 +30,9 @@ RDEPENDS:${PN} =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-bison \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-flex \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-integer \
> +=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-bignum=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-bigint \
> +=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-math-bigint \
> =C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0RDEPENDS:${PN}:darwin =3D "\
>=20

Those dependencies should really be added to binutils-gprofng?

Cheers,

Richard

