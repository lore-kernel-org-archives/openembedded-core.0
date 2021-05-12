Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.8089.1620830533946939338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zbdv2FLZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id c22so27366803edn.7
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IVvCFtncKR+nVvy8CORJKL86w9jQ17RJl6Auvd9bhrI=;
        b=Zbdv2FLZLhKkLN2AXWY1UIocTPxdEO3V44bWklCh6cL2kQGKudEjMynDbJQ4QLvQzZ
         XfHXc+5PfocC4C4t7qa0mpdWbPZvFoaExLZYm/8hLN4k/lSEHpYr+w9uX/cWvIlbfXRg
         pJzRUVbUUbSU3PLm+QjNSxrO4CTOgVVE+73Qz7/xJHaLdmcBH0O7LIJgxzl3lB9JWRl7
         bog8pymAMuqN0XIJahk9LhvYw29I4T8gF0GfXb/oEqy0lTa/kVa6zFR7f+DjieQK8QZ4
         s+OZclEURvk+qkZr1rR1quQKN2wX4YL/mRhsrxajXDlkvA753rFw3EkFOh6TF0f6TyX2
         KAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IVvCFtncKR+nVvy8CORJKL86w9jQ17RJl6Auvd9bhrI=;
        b=UDsy4aDfa0ol+nSLYmfN4o5pgRULwRjjP+NiBRgWbJjYyp2Vdy6PC2jqcYJABqQEfu
         kuo8GgrZY1abk8rlV3aH0HZQlO0sxh09hL6J0QfDjPpgi/B2fYTt0r7OTcGrzVZs7+aQ
         NZzXZLinvculKUMqmVynw8qO4EvyF4tP25fAwDmuvli+8apGmpkUp6cAVCv1suA3PtMg
         D7a4CgHpXoX62YMF1w6tYDPbTPBFjKR3wWT8OYLSAhUW/6KdZAcU/IpHuYwhCwIiaoX1
         r1tcSTSXRy8sQ2B21Esfg7cq8d6cP96C0PAJ+4q+cqWtdCWX7ePs23HN06X18c/BWIUr
         pxcg==
X-Gm-Message-State: AOAM532m1iEmZo243EPV9OfXwWqA0V1r0DJ0OVaQ0l83fbXi/kR7aaNC
	9ppxJD3c1XErYk3l3zwpqMY=
X-Google-Smtp-Source: ABdhPJxU7xp2UEV7KlOv/iNAVVZuqru1oJ5Ok8og8MC8JgtZN5lSpG7g7SoEKTZQknbdsq+ORmzvcQ==
X-Received: by 2002:aa7:c787:: with SMTP id n7mr8394431eds.309.1620830532418;
        Wed, 12 May 2021 07:42:12 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kx3sm14155730ejc.44.2021.05.12.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:42:11 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 May 2021 16:42:11 +0200
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: backport DWARF-5 support
Message-ID: <20210512144211.jqtbdkjq4rffeenp@jama>
References: <20210512124221.61985-1-Martin.Jansa@gmail.com>
 <CANNYZj-wzHbziSLMPVh40qpnHntcRyqxpTa+g+p9JtqSeZv42g@mail.gmail.com>
 <20210512133630.aqqp7ocfbz4wgh2e@jama>
 <CANNYZj-kAt77FZVPQBAkUA=TNp0KjzgUjHKufwRDzOwxzzpU+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-kAt77FZVPQBAkUA=TNp0KjzgUjHKufwRDzOwxzzpU+g@mail.gmail.com>
X-Groupsio-MsgNum: 151638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmnyxtja7zld2nke"
Content-Disposition: inline

--cmnyxtja7zld2nke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 12, 2021 at 04:34:45PM +0200, Alexander Kanavin wrote:
> Your patch is titled "binutils: backport dwarf-5 support"

Which is all this patch is doing.

> and the message
> talks about dwarf-5 in general across the gnu toolchain.

Which is the explanation why we need this backport since the gcc was upgraded
to gcc-11 in master.

--cmnyxtja7zld2nke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYJvpQQAKCRA3VSO3ZXaA
HBAuAJ9Cj5qPqp+IH2q3qoUUaLc33dtH+QCgpTlsIXsrJf1yPm3XcTmcqatABmE=
=bv/e
-----END PGP SIGNATURE-----

--cmnyxtja7zld2nke--
