Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.10709.1616409133128175654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 03:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kl+X0Jc1;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u9so20336693ejj.7
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TKWSqX3+ik8psLKtZ2uyp6vM7/6uLKhTMUsKToHLeMg=;
        b=kl+X0Jc15mo1uH6VKgLl5QvMslxO/4T+lPhAksJUfJKdoT6juR4XSIxsk9o53Lf0gv
         AJCjX+l7k28zpCsTfUmzBJl+5m4PHvLOKE9Ff2DdKxL/WTKDiG2+LGqvYykxprjjyCtz
         SajqHVMaa4UIY/sXz40IdeAhVNpoJgQbKCcAkvUHUvFC6C2A4MF6iUN+Z7WvI42NLTWN
         q3Es7t9mLdKC3fwh6Gpo+ajpFNWgN2geFRYwkLC1P8x7/Qz0Lo6I88ZHM13XGZvqRIB3
         +YqLZz9XMvA6toQI9Isr+aiMgO6Z/KmeONoVS+2m0V/rrKjsq+9lkrCTA/KHdFa1EmyW
         xcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TKWSqX3+ik8psLKtZ2uyp6vM7/6uLKhTMUsKToHLeMg=;
        b=sx1Kgl579jUs9u3GAt1qlmUEx2wo60SgirJTpC/61duOWlZGlDCEMSWTRqwfWrQ9lk
         CXL4lKTuBn/3XfkexKXHaGQLc88Qdvxc18lecXDR9dPIXJUnNBfBDpTAmKP1H4w8gtT9
         daunsMfl/pdiFvwWM1stIhsxWIq2DJqQ6SlENGsS5casENnS4qBZPf69weOTysKdaABH
         xDe6ltyliy3U+s0gOH9R32Y4Dvfo/zNLv8WQeSmMYxrRTDhFVuIxTRq2h2moadH/dr83
         DkMrEvvG/V3q9KES343UwB/6sTGsD2S1FFAWfU37tv9jr6ZywTSZ04K+JQC33b5O/dR0
         hAzQ==
X-Gm-Message-State: AOAM531UpYtB/DJhs5XQmvxiune3/IZWHTLp7jIGSGSR+UfAH8FBpPNV
	7f+rNg8iTVSslVQhiJMyEoA=
X-Google-Smtp-Source: ABdhPJwvvi1LOQRzjr6dIV7A/gDJAH66YgBd4wefMFZSUm1gQM080xwZNlKf4efZllbdmcl7q4angQ==
X-Received: by 2002:a17:906:aac5:: with SMTP id kt5mr18862779ejb.548.1616409131691;
        Mon, 22 Mar 2021 03:32:11 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id wr20sm5282037ejb.111.2021.03.22.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 03:32:10 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Mar 2021 11:32:10 +0100
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Changqing Li <changqing.li@windriver.com>
Subject: Re: [OE-core] [PATCH] report-error.bbclass: replace angle brackets with &lt; and &gt;
Message-ID: <20210322103210.7rxqnwufeiix6n4r@jama>
References: <20210315010325.3303436-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210315010325.3303436-1-raj.khem@gmail.com>
X-Groupsio-MsgNum: 149774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4543jh435v3nfcng"
Content-Disposition: inline

--4543jh435v3nfcng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 14, 2021 at 06:03:25PM -0700, Khem Raj wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> when we have below content in local.conf or auto.conf:
> BUILDHISTORY_COMMIT_AUTHOR ?=3D "Khem Raj <raj.khem@gmail.com>"
> send-error-report will fail with "HTTP Error 500: OK"
>=20
> error-report-web do rudimentary check on all fields that are
> passed to the graphs page to avoid any XSS happening, if contains
> '<', the server will return error(Invalid characters in json).
> fixed by use escape of <> to replace it.
>=20
> NOTE: with this change, error-report-web need to add filter 'safe'
> for the string wanted to display to avoid further HTML escaping
> prior to output. Below is how the content displayed on webpage:
> with the filter 'safe':
> BUILDHISTORY_COMMIT_AUTHOR ?=3D "Khem Raj <raj.khem@gmail.com>"
> without the filter 'safe':
> BUILDHISTORY_COMMIT_AUTHOR ?=3D "Khem Raj &lt;raj.khem@gmail.com&gt;"
>=20
> Another patch for error-report-web will send to yocto mail list.
>=20
> [YOCTO #13252]

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/report-error.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-err=
or.bbclass
> index 9cb6b0bd31..8dac854944 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -38,6 +38,7 @@ def get_conf_data(e, filename):
>                      continue
>                  else:
>                      jsonstring=3Djsonstring + line
> +    jsonstring =3D jsonstring.replace("<", "&lt;").replace(">", "&gt;")
>      return jsonstring
>  
>  python errorreport_handler () {
> --=20
> 2.30.2
>=20

>=20
>=20
>=20


--4543jh435v3nfcng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYFhyKAAKCRA3VSO3ZXaA
HG8tAKCcbboZLKszRGtj+l6xzgOaEULW/ACgs7Alacy+dp+00abjDS6pE3uKKss=
=EB7P
-----END PGP SIGNATURE-----

--4543jh435v3nfcng--
