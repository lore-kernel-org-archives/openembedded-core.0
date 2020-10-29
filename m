Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web08.9261.1603980092219963867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=HoGmpzcb;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id t13so3162390ljk.12
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y1CYpspl7L8N8WrTgiNwtpOTdbd5fZuzFbAdogimTmk=;
        b=HoGmpzcbJWwr98/oALp7vn8mV67RBbaVLXTH+sLqTsK0W62Y3VS2wuJFMWSnTnZ5qb
         scHR7s2ITKOTmO8wg1gVcH3U8NNVzj9Qg4Bx4briwx0W/e1HpEpZ9WsXRRwNixkQVi53
         PQSt7kYKae5Kd1PB852429eByNwJOb8tzkf0YmZf0ewrZK0+MEeOckN9apTlm6QWwGoo
         S+ZUJtTZk/UPqPeaBV7I5U6IzIoQy7GqcmLlEeyfz975ZAk1WxWyPu7tgVCjHF+9a4jI
         1YoGgKaoy1XJ2BL5pvbHltRCBUa71WSf7z8fSDppUzU58vZ1G+cZEJHdP7ShJ2aoWAKa
         LscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y1CYpspl7L8N8WrTgiNwtpOTdbd5fZuzFbAdogimTmk=;
        b=i6yUYzQMjylgNCWmff+NGhCRVG4Z8vJW1StRB1QFo38OaBbWLNg4159zwBvSbkVv7E
         jYjHEgRY4FpL4OJ2MeYBbZZ3/xVs+NhOEzTy/nrkPiw5b60sxZW62q5wFAJGAH9uGcAe
         nfsZhMjnrGiHnaTOGL8Oczc13zJTmmNxvFuhSMAFvK36E+EApgjbRjL2k+HbvPlEET8C
         S0Jhd6naEfR85yJQfoTAMTaoEzz8gXfFMuon6ARY4dOA/GsYZNig9Gi2/EHEW+fX2AeI
         6BiaaOw4F1lfr2I441h7YANe4GO4fbVwypQj2Zf6eZJRtN5Fi+VApKj7tK0Hr+HUAv/p
         uuuw==
X-Gm-Message-State: AOAM530wZQqRMsmVL18+Sal5wclW/YaNq7KJp0zR+XuRJ9YSYVc4+RBB
	wQYu8bUuF4Z0xyCnJKMUmhc9uvZuPBXLxjxte/7ccA==
X-Google-Smtp-Source: ABdhPJy5Cf62HmLyi/oJsJ5HqmV8CgrvJhMYOLgT838JbG8yrONy9/PoPWbTizW+0beQyWtBhO5k7nY2wNUq8UjVaZs=
X-Received: by 2002:a2e:97c5:: with SMTP id m5mr2098391ljj.22.1603980090166;
 Thu, 29 Oct 2020 07:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <1603905435-21094-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603905435-21094-1-git-send-email-Saloni.Jain@kpit.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 29 Oct 2020 14:01:19 +0000
Message-ID: <CAAnfSTv=q44jBC3W9GRYLhoRZrh1NUJSnQk+5mAbbky5Dn8Ztw@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] gnutls: Whitelisted CVE patches
To: saloni <saloni.jain@kpit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com, anuj.chougule@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Echoing what Steve says: where this is due to incorrect information in
the CVE database we should definitely fix the CVE database instead of
working around this in the recipes.  The only reason to whitelist in
the recipe is if the vulnerability is based on the build configuration
or we've decided that it's not relevant.

Ross

On Wed, 28 Oct 2020 at 17:17, saloni <saloni.jain@kpit.com> wrote:
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
