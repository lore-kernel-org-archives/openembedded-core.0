Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1E3CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 22:41:27 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.87676.1755038486931790620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 15:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VWRjzsx1;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e8fdbd45e10so4856409276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755038486; x=1755643286; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySsqtRf+iWVLqI1c/+IgvsGsRKTeRoo1toNREzOUSz0=;
        b=VWRjzsx1uMwwykoCda5F2XBwlO/wvLhDnflYwcGoVM7wWJ/hdFalD1IiM+5nqeO0XP
         88vxnlxx/R14sW7ANuEVyxKh6jQPihF/3NQzqM0E6hxLP+CTHxHalsmSe92qjvAVw3M7
         L0LZYPgRaLmyhBay8iZ1zNhb3u+uzK8UPa/H7spYiufmY88CNImU6XgpHCjEZqpDcprr
         r1J4W0RGnJalMdpZ3HnNNipBusO4433pOeaAZqpm+wjHA0Wa+oz7C2E7tmnpsaTncgtU
         FW1kfCm+cp4HAXGR4uKGpQCpOvdtH2n/gPs5QDu/uSxXojspS9wPZ9nHuYhqtKFl6TRf
         GMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755038486; x=1755643286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySsqtRf+iWVLqI1c/+IgvsGsRKTeRoo1toNREzOUSz0=;
        b=cRcdRnz4oP8krW5/6LPw2mjoS+O5rCwy73biNK5pO7PLPMQ3XCF071DGA9JZsO1mkM
         cTMhDood33Yvykj8OzkaS8vRuHZ+9tCIivTCr0P/nyGcEfMQxKL9DOApogq2McCBbkLm
         Fv+8U594ik+YItgwErpGVn3psoHGTXBgUkFiIZvqtiAlsOVs2f7TMHsLNdyl39XEXvTL
         yJKEFdSZf9oAU9SeJEY4Q5NaE3ENnITEYjuydRWBHkafxRQJrbO4xaf5f4gBC3BriJpO
         gp5os9rg/DowaGvx2WJyz+NGlqlTBYXVkl3ic4xQ6Gsj9YZUbB3uOL1oxSeGnVCMkEK5
         A4Ow==
X-Gm-Message-State: AOJu0YxhbF4BCugdI2g+HA8BpXhqOgyHDOqJGX2H2B2hLt+veozea9N6
	JxIqiQ3b1woM/w7X5OiRLGXxN6gQapiCOoxwcwNGZTtXE5iD99LMq+7G9BTme1WCAgv9wxvva94
	l0uxkfBGq2F9c9no9lgFuWUUzDoCv9fE=
X-Gm-Gg: ASbGncvIx416eSHGuw6LKjvVdiYsTKj7WfoLunW1xcSyT0hW4THgmofz7BneeqnGocE
	zSP05tYcIAVK+oUr6P4JqPQwcOLWura8DXh5vk1w2Nk203UgpAeJXtMSkkEVtRvtyvEZuXoohdr
	sGmDuPAPybiFZ0qcl1Q2YqsFaitEiV214qLu2+IPc6dYavZ6Fhus4JOcFq4fTEdE3JsSzMBdo51
	GGtF0/twqBNsCCsLj3b
X-Google-Smtp-Source: AGHT+IE1flLZvQUJVLY8U/6JE6F9m1xxme+c8CodPN0wLSFNzzxcCGed/Me6rn3QV/A00kRuM+AD6iRDWDaUoJYd/Lk=
X-Received: by 2002:a05:690c:4c0e:b0:71b:f810:5096 with SMTP id
 00721157ae682-71d4e515e85mr10680127b3.25.1755038485992; Tue, 12 Aug 2025
 15:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250812222142.1761197-1-jon.mason@arm.com> <20250812222142.1761197-2-jon.mason@arm.com>
In-Reply-To: <20250812222142.1761197-2-jon.mason@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Aug 2025 15:40:59 -0700
X-Gm-Features: Ac12FXzh_xIGDvA2Vc4Zca9tu6faNJ3-phOzhAilYqDISviSOvZ9PoN0NvB0hmQ
Message-ID: <CAMKF1spDxd0=hiyqmJBUWg-WGJLunF7=TgBuVVj8giqUupG6EQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: add nocrypto TUNE_FEATURE to complement crypto
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org, Ryan Eatmon <reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 22:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221783

On Tue, Aug 12, 2025 at 3:21=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrote:
>
> Add a `nocrypto` TUNE_FEATURE option to `feature-arm-crypto.inc`
> to explicitly disable ARM crypto extensions via GCC flags. This
> provides an opposing state to the existing `crypto` feature,
> enabling more explicit control over crypto-related tuning.
>
> Some vendors ship cores without crypto support, and this change
> allows disabling it without requiring extensive audits of
> dependent code paths. This approach avoids the knock-on effects
> caused when `nocrypto` is applied implicitly in the absence of
> `crypto` in TUNE_FEATURES.
>
> TUNECONFLICTS was added to prevent both features from being
> enabled simultaneously. When both are added, the following error
> is seen during build:
>
>   Feature 'nocrypto' conflicts with 'crypto'.
>   Feature 'crypto' conflicts with 'nocrypto'.
>

This looks fine to me. We need to add additional tunes in the
cortexa72 tune file to have a tune using it.

> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Cc: Ryan Eatmon <reatmon@ti.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-crypto.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/=
conf/machine/include/arm/feature-arm-crypto.inc
> index aade6ce08d5e..c1f5b1225dfd 100644
> --- a/meta/conf/machine/include/arm/feature-arm-crypto.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
> @@ -3,3 +3,8 @@
>
>  TUNEVALID[crypto] =3D "Enable cryptographic instructions for ARMv8"
>  TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cryp=
to', '+crypto', '', d)}"
> +TUNECONFLICTS[crypto] =3D "nocrypto"
> +
> +TUNEVALID[nocrypto] =3D "Disable cryptographic instructions for ARMv8"
> +TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'nocr=
ypto', '+nocrypto', '', d)}"
> +TUNECONFLICTS[nocrypto] =3D "crypto"
> --
> 2.39.5
>

