Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028D0ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 15:05:12 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.26809.1661958310017502281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 08:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ya3bQlzd;
 spf=pass (domain: konsulko.com, ip: 209.85.222.179,
 mailfrom: trini@konsulko.com)
Received: by mail-qk1-f179.google.com with SMTP id c9so11001839qkk.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=r1hf3DVEEjB0uNlRQaEEKLUWiHHwOekkyz2uhijJ76o=;
        b=Ya3bQlzdktLTpEi0SjvUa3eK99vx9cxXY43NEJjngMpI0qASV5SdGTeGbHxRLe3KU6
         kxET5Xk4WcKlUYzJa6UCui+VYgQ/r/8bsV1JexJ6OKSVcPlmmjeFdtFhp0nkVD/guGqA
         W79gNHgEYPJLi2TjwLBuN/dXBi5eDYn+OYbYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=r1hf3DVEEjB0uNlRQaEEKLUWiHHwOekkyz2uhijJ76o=;
        b=w2AKO0XlaGMf6MTeicPOFIBgo6uxHXL7yNWxWKvsiQQip2tr6EfO64vgr5lXEbk7fl
         4IU4PGOtEAbeoHqeDUi4WBrB3OkVh/OJa/coClbP9twNB+1h4vDXCxukl6ix59ICmI9D
         7sIg76IAz4VBa57s4BkIUYWnj6Ec9qMILOOn5XFe7L134iVp/vwfa+imDtSdYzplqxd8
         qU+Z03gQUBz82IuJF//d33ALzA+Ze01vZSBWf2beGeIVvFlTzXxd6F9jj5cbgg0jvVTa
         ylwRixgtSvrFDccctbxUMoRUHAWLMpN+FYJEFCwr00B0P8G/9LDeUI477V/f6k6U2zN5
         JORw==
X-Gm-Message-State: ACgBeo2y/YKpOLJ290lu6pVcf8r5RGgMZcSm2d9xEU1/1CewCt8OMtQ0
	vBaVfnAwVFGinYzclYP5TbkSEw==
X-Google-Smtp-Source: 
 AA6agR7OwwlXn/4Bv+qkbQIbZmI+lztkSiAss7vnfL7H7uxfpyf18OcpSrEbbyY6RwsMJzoT5fAT4Q==
X-Received: by 2002:a05:620a:1709:b0:6bb:85a4:4e8f with SMTP id
 az9-20020a05620a170900b006bb85a44e8fmr15910738qkb.184.1661958308554;
        Wed, 31 Aug 2022 08:05:08 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 y26-20020a37f61a000000b006b633dc839esm9646035qkj.66.2022.08.31.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 08:05:07 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:05:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Minjae Kim <flowergom@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dunfell][PATCHv2] u-boot: fix CVE-2022-34835
Message-ID: <20220831150505.GI7942@bill-the-cat>
References: <20220830190039.48510-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZFN9GYGE3tAy85aa"
Content-Disposition: inline
In-Reply-To: <20220830190039.48510-1-flowergom@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 15:05:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170131


--ZFN9GYGE3tAy85aa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 09:00:39PM +0200, Minjae Kim wrote:

> i2c: fix stack buffer overflow vulnerability in i2c md command
>=20
> CVE: CVE-2022-34835
>=20
> Signed-off-by:Minjae Kim <flowergom@gmail.com>

While this is the full backport of the fix for the issue, at this point
we now also have:
https://patchwork.ozlabs.org/project/uboot/list/?series=3D315609&state=3D*
because the initial fix broke other real uses of the command.

--=20
Tom

--ZFN9GYGE3tAy85aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMPeJ4ACgkQFHw5/5Y0
tywyFQv/ZdcwN/adyp/ojKV6WFctkCKmH9+r1k0S8297NKu3W/gmE4DBK11zflNp
DlO6GQ59hmY9hBXTl8tyeBt/IP4QkcW7OYTlLR3+lJyvDEme5LtwBm81V/gQxtX4
KbY3Dd5Enlrb7/Pe8JhLNKKszNwgCU3EmjOEVm2oDCz/zlUYaqqoFVh3ttgKLAs/
BeByrpNHWJ3+cJujx/cG5nx3KW61E0HIVm3A0Iy9J5bn4leIB/mTb8o6mAazMitJ
+AIwUJ9GLHykPeGeV1B2I+WxWip1ozGH2ddl9yRs1s37i/eGaC/vaa6sO/b/xEkm
DNT+NM6D+CUc3RcPpgZNkiJIhKnaHTpNt9/ZVKbIwp1504ZSNZF+I9wCIut3HG9a
HxF+noD1qGelrew1CjSdf3ZyYCzpaSI2c07FBMIXtVV0KSxbKhjAy+SPmIhz8GCG
0o5+iiCV2hKFS6MuGOqYTRtcw2EgeNqaTgID9QtW9yvSytAl3inu8sJKWdH81GeO
q9Zcbqw2
=i1Op
-----END PGP SIGNATURE-----

--ZFN9GYGE3tAy85aa--

