Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web09.12419.1614954043110489974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wj4iSSTt;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id m9so2088325ybk.8
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=URzVlJUNncPIhxH77n0fVUmSbUqa2kiiVCr7dRKM6OY=;
        b=Wj4iSSTt8oF7T85cwGUysOf0QzSbtWC0OuRC51LT9uvRFVgC0WDNCLz9YrVbBqQ3lw
         WxwvtB1Q4DD+jvyp7u8rgrK5MDBVjbu6FKcVU739E11vej9Exc7JJw6Rk5ayg/eV+zy4
         33ZpH+/8XBOBX4sjMpzGsyBQo5DH88gw/dZCqjNYHBnBQZpMjOBhzE2nLYqfQVmZlkDG
         XJPfXLl/G3P/khAeNusZXC2GMJuHwvsb3pTW6fJbIA+m4Z6SJ7kxqSaHLrR7FC0GoCnx
         Ugw+i12M0lXYUvEpab5QcNMmpzjr0Kw3TlOeM4ufVDxxq49RNHTiFJcCmyavulSoesu/
         fVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=URzVlJUNncPIhxH77n0fVUmSbUqa2kiiVCr7dRKM6OY=;
        b=ImVhdlvnNzgplhF5Kt49d0c53fHTN/SKgmDC+PJxOJlKBgpv1ph7jH30ALbAlU2eJs
         iQ5blV01A9TWJYy52CdoaatiyGprS//1qXDcsp82hRpGlFoWOH0uNkiBXoD6/GshYOqy
         qsielXwHfE2dChzXhUHUSAme39eZYamvnu427BKAnimFdzyB4JkneHVSW1CNdN0xBy38
         Jf69x6RIX+tn1nZtbjlTRkdxvsmWsa5ulxbKHEe5fKXOhi36tuIk/IySeUWWGH5ChV27
         S/MsnOyWQMmPPda4x1M7W+U1fUBcn+3LAWmBFWy7JoqALs+Lrq303Nlc88LYs6gCSAj0
         KbDg==
X-Gm-Message-State: AOAM531Qt7QI3wcNs6KFeSYPJKI62nxGQsF+l7rJEhvnXOWHH+XkBSux
	+GQCJ3o1gYXHXCH2rCXqOrSrweCmXpcJBkAEeaU=
X-Google-Smtp-Source: ABdhPJyJQ4m0/r2EnE0Ncnn97Ias5WRuDltupoOCd3PNekI9DCup8eoza3104cH0xjflmXaOD0ott1CKxcf3db7SBN0=
X-Received: by 2002:a5b:985:: with SMTP id c5mr3964220ybq.416.1614954042115;
 Fri, 05 Mar 2021 06:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20210304103708.21368-1-Saloni.Jain@kpit.com>
In-Reply-To: <20210304103708.21368-1-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 5 Mar 2021 04:20:30 -1000
Message-ID: <CAGDS+n=oJOHc1=gdS4nuZJjeV9kywXFhe=3gHtGcP3ynOnfFnQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssl: whitelisted CVE-2018-12433, CVE-2018-12437, CVE-2018-12438
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 4, 2021 at 12:37 AM saloni <saloni.jain@kpit.com> wrote:
>
> From: "Saloni.Jain" <Saloni.Jain@kpit.com>
>
> Whitelisted below CVEs:
> 1. CVE-2018-12433 is disputed and reported for
> crypt libraries.
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
> Link: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2018-12433
>
> 2. CVE-2018-12437 is reported for libtomcrypt and
> is duplicate of CVE-2018-0495.
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12437
> Link: https://github.com/libtom/libtomcrypt/pull/408
> Link: https://access.redhat.com/security/cve/CVE-2018-12437
>
> 3. CVE-2018-12438 is also reported for crypt libraries and
> no details are available for which versions are affected.
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
> Link: https://ubuntu.com/security/CVE-2018-12438

I have a couple of comments:

1. You are modifying openssl_1.1.1j.bb which is also present in
master.  Since we have a "master first" policy for LTS patches, this
should be submitted for master and I will cherry-pick once it hits
master.

2. It would be preferable to get the CPE database updated rather than
whitelisting.  Have you contacted the CPE maintainers about fixing the
database?  We should only whitelist if we are unable to update the
database.

Thanks!

Steve

> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1j.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/=
recipes-connectivity/openssl/openssl_1.1.1j.bb
> index 181790e6ab..3d96533580 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
> @@ -241,3 +241,13 @@ CVE_VERSION_SUFFIX =3D "alphabetical"
>  # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
>  # Apache in meta-webserver is already recent enough
>  CVE_CHECK_WHITELIST +=3D "CVE-2019-0190"
> +
> +# CVE-2018-12433 is disputed and reported for crypt libraries
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-12433"
> +
> +# CVE-2018-12437 is reported for libtomcrypt and is duplicate of CVE-20=
18-0495
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-12437"
> +
> +# CVE-2018-12438 is also reported for crypt libraries and no details ar=
e
> +# available for which versions are affected.
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-12438"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
