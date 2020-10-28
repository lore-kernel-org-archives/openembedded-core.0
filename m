Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.747.1603907287649659043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=csANv1BE;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id 63so214247qva.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hz0zJTYIRYrFuEnwmwFGZPdCMHoHEWbO5ex0BCUAHRk=;
        b=csANv1BEaz2Uk6fM0UrydYtT7WUTJQfb8hay1YYGGrHaAjQMx+Xles0RQzGhm5t6WF
         I9BLn3GizAxu/a9iNvvB9EMwVDBCtnZ8+ERPZfQ3kdGqwkQFaUM3o2r7nUAFCnQdLM5/
         Wb+VivdSpWz4jD/sglwjJxMCbzPm2t8kyPeshQR/sXZkU2rBDSZ6shHV/WAupzBKDiPL
         CmeY7O2I2HElyzG0+39UBn+SqpWR6qfVlVJ6mB4vajGWFB3vUQMui3PO8vK4AKoKbHeO
         B4iIrXjsEHbK+NUG/HnEtSFqkN9+qc/KEBeCM+MpP3SCLtAwaeD3k1ZgD6pUfu2FFxyI
         P7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hz0zJTYIRYrFuEnwmwFGZPdCMHoHEWbO5ex0BCUAHRk=;
        b=Ntz6PVKBhVfRi8+KlPQkN8WrQBQrO2U4UiG3yoU/Z5UYBvj/rpvZNcZcwsyQRPtraB
         T4dGdxP/TPfuoOYGkAnUTz027Y/dRWEsJuWPDqc2zm7TdGhK8OeeStoFh+I9lXscd2Fs
         nASlIcSKwsdmgidjoDa/VuSHX56Igoyb4matDOdr3tak8BAMuX/1NXZz6GninqtHxgum
         ywE51SzosqHIqd6ofMiAKaTaHFTiN7mHggVqsZVc7YrBfKnrqKIJYRrbMPIH4TnBlq5O
         eHdVtNJbMMU3GY4FopjaiFy1hdXXE9okvE8QjgEUVbo5W2d+UJP6ADnaKCuxc0sIK4ZL
         jRjA==
X-Gm-Message-State: AOAM531aY7vDSmBV33dACeb1F6sLDkTnDObY6EibbIsvi0V4g8YvEaYX
	CeNKgy7isiwaCSZeCLKy7q7qYW6S9dO30nu4Tmw=
X-Google-Smtp-Source: ABdhPJxv/nHmvOH0PCdIdHjfI20DyGzz7KdjT3jQ3W7DGx6THr8XXRbxnj9efEFo3gZnv1G4AbJMyuIfXxEYZrLz1RE=
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr522893qvf.8.1603907286650;
 Wed, 28 Oct 2020 10:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <1603906894-22742-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603906894-22742-1-git-send-email-Saloni.Jain@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Oct 2020 10:47:39 -0700
Message-ID: <CAMKF1srLs2-O7Tfsdq8kZsvvg9jWz-bjNMQYbWoHB5+jijeSRw@mail.gmail.com>
Subject: Re: [poky][master][PATCH] libxml2: Whitelisted CVE patches
To: "Saloni.Jain" <Saloni.Jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for quick response, this version looks good.

On Wed, Oct 28, 2020 at 10:41 AM Saloni.Jain <Saloni.Jain@kpit.com> wrote:
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
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.10.bb
> index 90890ff..4950beb 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -24,6 +24,11 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${=
PV}.tar.gz;name=3Dlibtar \
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
>  SRC_URI[libtar.sha256sum] =3D "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea=
100edc2f262750611b4be1f"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
