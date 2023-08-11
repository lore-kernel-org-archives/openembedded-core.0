Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE67EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 15:19:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.45411.1691767191334624118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 08:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hFPR040a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so437725266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691767190; x=1692371990;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4/8f9KVV6skIvoaDJG0eOUYGe4sVpQ8pMihjDRQFYI=;
        b=hFPR040algjUK8mqR+84XHa8aRv9/mt4bwV2aZ1zhxxYL1NqExWZMk0aSKEC2J5Nci
         5f/dVxnXgl0iJb2iDPM0NNFcbMhYWcpL4DlGv3Ci1mnQaq9aImgCCRrqaImBNOVlhXYj
         /yUIXZIa3QSnQ4RL+XauMNC3dy9kEbTFQbhg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767190; x=1692371990;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4/8f9KVV6skIvoaDJG0eOUYGe4sVpQ8pMihjDRQFYI=;
        b=Xi+jwrrKlRopXfar9vvUjzbk4+F9fZdBBSp8zD0byRy0GJISAG1LecTQ3l+GmgSQH7
         t4orT3eBbKI76yj0+eJH5KOZQ4rLBiqYbq+ueNLVqA46xePqHRqH+0vZSrrgvnqRPVf2
         A+qD/C6obcbpYiKpSDblJ2A8ELGh8VRRf2Q0/Y/nWA/X7qcZwtbyN2MIRPpYMF3472Y8
         3YoW4vhqBN7AnfBdc9C7dQge55T2/eSoGhY7DokJrrwHQnVxsn8/HCMflV6DB7CWJ6c2
         hVSpzVbe8VrMEc0HoTtFSFgnRmU+Vqt5CZR2G/R2K3kRgv9v4DUmwWtoXx0fn+hohF3s
         57yg==
X-Gm-Message-State: AOJu0Yzytq7ne7XbfzXCjzZhSezwPsHowkdKoGUuKBM4mYh25tIHI8Cd
	RKGrHJV+r0lqoANaD5ZHRxJCEw==
X-Google-Smtp-Source: AGHT+IHkDCYyar7JbyeZpSNiK7Tui4XP7XphNih7iTdFv0YrDvDRNDJpePOghL9wUmMvIzBbwlZhGA==
X-Received: by 2002:a17:907:8a04:b0:99d:ae3:80a3 with SMTP id sc4-20020a1709078a0400b0099d0ae380a3mr6680227ejc.0.1691767189799;
        Fri, 11 Aug 2023 08:19:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f961:7656:a74a:6fde? ([2001:8b0:aba:5f3c:f961:7656:a74a:6fde])
        by smtp.gmail.com with ESMTPSA id r24-20020a1709067fd800b0099cc1ffd8f5sm2371233ejs.53.2023.08.11.08.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:19:49 -0700 (PDT)
Message-ID: <6629fd52038c8e0629f2543fae27b1a0bc2bccfe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 3/5] sstatesig: add a new info level for
 SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2023 16:19:48 +0100
In-Reply-To: <20230802142432.2296716-4-jstephan@baylibre.com>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
	 <20230802142432.2296716-4-jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 15:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185849

On Wed, 2023-08-02 at 16:24 +0200, Julien Stephan wrote:
> as of now, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK can take 2 values: "warn" and
> "error", displaying respectively a warning or a fatal error message
> only when a task is locked and the task signature is different from
> the locked one.
>=20
> The "info" level is introduced to add a "note" message to remind the
> user that a recipe is locked even if the signature is equivalent to the
> locked one.
>=20
> The "warn" and "error" level display the warn/error message for each
> task having a mismatch of the signature. Doing this with the "info"
> level would result in very verbose output if there are several tasks
> locked, so the info level will only print once the list of recipes that
> have locked signature.
>=20
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/lib/oe/sstatesig.py | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index f943df181e6..90002f67550 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -104,6 +104,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>          self.lockedhashfn =3D {}
>          self.machine =3D data.getVar("MACHINE")
>          self.mismatch_msgs =3D []
> +        self.lockedsigs_msgs =3D ""
>          self.unlockedrecipes =3D (data.getVar("SIGGEN_UNLOCKED_RECIPES")=
 or
>                                  "").split()
>          self.unlockedrecipes =3D { k: "" for k in self.unlockedrecipes }
> @@ -264,6 +265,12 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>          warn_msgs =3D []
>          error_msgs =3D []
>          sstate_missing_msgs =3D []
> +        info_msgs =3D None
> +
> +        if self.lockedsigs:
> +            self.lockedsigs_msgs =3D "The following recipes have locked =
tasks:"
> +            for pn in self.lockedsigs:
> +                self.lockedsigs_msgs +=3D " %s" % (pn)
> =20
>          for tid in sq_data['hash']:
>              if tid not in found:

How about something like:

if len(pn) > 10:
    print "There are XX locked recipes (XX matching and XX not matching
parsing)"

so that in the case where lots of things are locked you get a summary
instead showing the amount of match/mismatch?

Cheers,

Richard


