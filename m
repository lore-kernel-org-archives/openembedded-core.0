Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.1335.1603909598553187340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 11:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fBWM0v1i;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id w25so505835edx.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cc/F70yWAsQ1qoaa5OoFBhDdisWAY7jv0mYRceHfNjA=;
        b=fBWM0v1iWiA4r14pZRLxPbT/vXlv7l3MI2VWJzIkNt81ZCnHI2vac0H9YzxiGzCxEO
         f2HyXNPqlHYFW9Ce1F98nmMzrQrbwcr1NqIFswXiveHPbzZHi6NKsWSI9CFbov4zLBYy
         Run8rCE1GjJEjW5a8jXJLwo+Y3DvukNbtG5V68u4TrgHwV6a0u2q6Eiy7dUp3SWPx4WH
         4EYUHjYX3OpKd+76V9cMDEIgM4sOqY6JOUIOvlRPx0rYhx3oql4JXz3bNJdOpF/LTZFx
         wF57Dn4Qb13n/eDwOApX4riuLccXr5OBdT7EUfiAv1UKdO/E2i63slEpWpFOpO3cmH2a
         XK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cc/F70yWAsQ1qoaa5OoFBhDdisWAY7jv0mYRceHfNjA=;
        b=nQNgjj8aCLqZ9DIwPOHQEbA5eF9lFhcwevf/ynV5e/VcFMQU/bwSQhqTZA5pH1WHxa
         Htb+mUHZlIogmODkI+Zx+RRoia8mzAL+9L3h5zllO7hrFAawo9jTJIj+KEeFGkr1NF0g
         YuFhSoa8DKeC2qQ//9fhcm5QveVT2DEb9bbLcdIiXDny4C73kzNots2Tz/2URknteNR1
         mD6CSbqWUKVqXwlLRKRxHkt+ajj1oTfBOPIWk2m1PyTU9+P4H+F485LsCfOPzYGwqOt/
         x7dXpVF/0BQUiGdieLWDrAvKKsXgeyyzgkiSDYzSNEIYTeuL4phpTOI9Da1MiBWBmcVX
         1pOQ==
X-Gm-Message-State: AOAM532JkVzeD0uAzlDAlVHOD+D5TYHZVdYkAeHlCsYFWwZK0VszzU92
	bTWSBvMh82MxYBFO1AmPF/LvqLs6Ier7NE9KczWpxQ==
X-Google-Smtp-Source: ABdhPJx2Why1JIUzK+jM7C4dAqValgXiBW03T9dxBRU2zLepzzFoSv6XJtxxGais+EWPHYGFlsjMSVpIonalWYPL830=
X-Received: by 2002:a50:950e:: with SMTP id u14mr199828eda.260.1603909596948;
 Wed, 28 Oct 2020 11:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <1603905435-21094-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603905435-21094-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 28 Oct 2020 08:26:26 -1000
Message-ID: <CAOSpxdbPXRDTC25OcZFxHtUYAmQHpp7skOe4mV_bmqBKg9VjEA@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] gnutls: Whitelisted CVE patches
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com, anuj.chougule@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that the first three CVE's no longer appear in a CVE scan for
master or dunfell:

https://lists.yoctoproject.org/g/yocto-security/topic/oe_core_cve_metrics_=
for/77795960?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,77795960
https://lists.yoctoproject.org/g/yocto-security/topic/oe_core_cve_metrics_=
for/77796289?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,77796289

You'll see them in the "removed this week" since I sent in database
updates last week. I still need to deal with getting CVE-2018-16868
updated, but hopefully will get that done later this week.

So there should be no need for this patch in either master or dunfell.
In general I'd prefer to get the CVE database updated rather than add
whitelist entries.

If you'd like to help me with this CVE reduction program let's
coordinate off list!

Steve

On Wed, Oct 28, 2020 at 7:17 AM saloni <saloni.jain@kpit.com> wrote:
>
> From: Saloni Jain <Saloni.Jain@kpit.com>
>
> Below CVE patches are whitelisted as changes
> are already present in source code:
> 1. CVE-2018-10844
> Link: https://security-tracker.debian.org/tracker/CVE-2018-10844
> Link: https://gitlab.com/gnutls/gnutls/commit/c32a8690f9f9b05994078fe9d2=
e7a41b18da5b09
> 2. CVE-2018-10845
> Link: https://security-tracker.debian.org/tracker/CVE-2018-10845
> Link: https://gitlab.com/gnutls/gnutls/commit/cc14ec5ece856cb083d64e6a5a=
8657323da661cb
> 3. CVE-2018-10846
> Link: https://security-tracker.debian.org/tracker/CVE-2018-10846
> Link: https://gitlab.com/gnutls/gnutls/commit/ce671a6db9e47006cff152d485=
091141b1569f39
> 4. CVE-2018-16868
> Link: https://gitlab.com/gnutls/gnutls/-/merge_requests/832
> Link: https://gitlab.com/gnutls/gnutls/-/commit/4804febddc2ed958e5ae774d=
e2a8f85edeeff538
>
> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.6.14.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes=
-support/gnutls/gnutls_3.6.14.bb
> index 51578b4..727a12f 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> @@ -17,6 +17,9 @@ DEPENDS_append_libc-musl =3D " argp-standalone"
>
>  SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split(=
'.')[1]}"
>
> +#Changes are already present in source-code, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-16868 CVE-2018-10844 CVE-2018-10845 =
CVE-2018-10845"
> +
>  SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutl=
s-${PV}.tar.xz \
>             file://arm_eabi.patch \
>             file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICEN=
SE-f.patch \
> --
> 2.7.4
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
