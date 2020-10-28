Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web09.1460.1603909898512651914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 11:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cToed7Ih;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.66, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f66.google.com with SMTP id j24so226446ejc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 11:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IMFLSfwrGISjz+MFeBRszoSqClUp8ilKq7hAISD86Eg=;
        b=cToed7IhgK8xNvKS9xu30Tb9X4ZbuAh7dwARyOAVk4z+Uz8OxiyvOgnitMdjWWjUOC
         vKt7n1uoitK6anz6nNOBe70evTyuIzbOw4tiAsb7W5p2h9jBstsOs3yaqJvIOCiuAEX/
         BjMBEuqT7nQCxU6qOqpHLe2AArwv9UacXtkzBKfmrq4WOoZTs1XsA6LH/l+OXwhB92GG
         y49PydDX9I655rcvStLT71ShQGn2Fh64mZDoD1SSw9ndpnjHqRTf44daaGAqJiWELNI+
         GfiyBl88BVwkYZC9g5igjGad99poDxv+UcN9+HuxLnCj3TigGs09PcSNgWuDACABvKsY
         Fr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IMFLSfwrGISjz+MFeBRszoSqClUp8ilKq7hAISD86Eg=;
        b=c3x5DYUc/PclJNTHhwDqJktrRCEm0YwZKoHbFOP6ibLquZyycDUs4xhpUr9npzwdST
         czAWQu7Ws5x/Z8fK5pdx8Q1wcSReiSI+jEjR8BFz7OBqHeNC2WirUtwYWpjZY2M0Lfgr
         TTC/vzzRmHkW9T0pcLpXa+78VzHFpf6v6BjIG+s9n0dIpCqr59KW+oqBZGe4M07KmBH0
         QSFhpK6cFyFwUjN0PpJC+IS70yTgHRnZ+KBx4rS3ACvXa/bHsro7FB/dRQbjErOJ5i6k
         Tj4BhscYPMXJG6cnkTjPKlrGFfARgvGsaDcNPl5eKtjDXEJeVC8hA1F7TQjXM9A1Gw4t
         +bzA==
X-Gm-Message-State: AOAM5329MeX+RqTSfGJD1AfUGCqyQeErZcl8hvIl7+Q2TObTWnVPt6dW
	DSjlcbK+tkLLNrz7Q+vtt0ruUGZwZvhJjSIZiR+h+Q==
X-Google-Smtp-Source: ABdhPJzdcF+iDT4GtZDICK7B6Py+nLWjuJEFmAYR35m6aXVVkigL7nhhUeFSd8wsZgOHoxEw4PxcWs54qmUOi7T9Ah4=
X-Received: by 2002:a17:906:f6d8:: with SMTP id jo24mr396953ejb.173.1603909896813;
 Wed, 28 Oct 2020 11:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <1603906894-22742-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603906894-22742-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 28 Oct 2020 08:31:25 -1000
Message-ID: <CAOSpxdb3BRD7Q_7i5kjaO85V0aBSYiwzWo2fe-NWnSHCXWLmmg@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] libxml2: Whitelisted CVE patches
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com, anuj.chougule@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Again in cases like this I'd prefer to update the database rather than
whitelist.

Let's chat off list to coordinate this!

Steve

On Wed, Oct 28, 2020 at 7:41 AM saloni <saloni.jain@kpit.com> wrote:
>
> From: Saloni Jain <Saloni.Jain@kpit.com>
>
> Below CVE patches are whitelisted as changes
> are already present in source code:
> 1.CVE-2016-9596 (Duplicate of CVE-2016-3627)
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1408302
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1319829
>
> 2.CVE-2016-9598 (Duplicate of CVE-2016-4483)
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1408306
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1332820
>
> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-core/libxml/libxml2_2.9.10.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-c=
ore/libxml/libxml2_2.9.10.bb
> index 90890ff..4950beb 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -24,6 +24,11 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-$=
{PV}.tar.gz;name=3Dlibtar \
>             file://CVE-2019-20388.patch \
>             file://CVE-2020-24977.patch \
>             "
> +#Changes are already present in source-code, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "\
> +    CVE-2016-9596 \
> +    CVE-2016-9598 \
> +"
>
>  SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
>  SRC_URI[libtar.sha256sum] =3D "aafee193ffb8fe0c82d4afef6ef91972cbaf5fee=
a100edc2f262750611b4be1f"
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
