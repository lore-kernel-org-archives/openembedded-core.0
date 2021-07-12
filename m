Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.13961.1626108899868481798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 09:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pzr+TWEz;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id m68so3163934qke.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 09:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UaSNQrOIuy1lL4+Df1dHu7bTUMeOWnvgYaiAjQk09Us=;
        b=Pzr+TWEznRJmE3O63S5FWBYz0np874aQLGYGNjhaUdOvn8Iwn/wkuWinMVUu//1CjH
         8Hh94uklnMTv6daRBxdJYJnB3/+G9wjqzMF3JtSJURvFEyWfUCRIL67r1SxROF7tuOL6
         jCqmWgH6DdXF8qhKolmC+O0adi7VU1LCp/Z1HMwtuW1Q6Ky/PB7dleWd96GjHIq4h+F8
         xEGYZPQgLcJgo+Ud2Yqtrird8Hh9d/t+Fr7ZQNN91wYoos/dfYPa9LgRFqcSJ3tjPeUc
         w4yzZ/VQd5pyaMmc90SEbvZ1R33YuT57zYriv73+Wulz6WZh3Wh9TWF3S5ToXFqyj44e
         buGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UaSNQrOIuy1lL4+Df1dHu7bTUMeOWnvgYaiAjQk09Us=;
        b=cv8F2X4l5oyEpfH+nCPiByD4zxcWxt+q8QfKS7WnmEt1IbPdVlhN/zq2jsznU+HRfK
         r7jH9K/cogVqWLtF5T9tVZdLFCj37ZbeSfG2GMnaMPih/bG7sYx9G3UxSaQszVrFqKJ4
         CzyysaqCQt2chux7qtdhY/fSFTPtvX++POm7Pa6h0u4CTLLCR+R6yc31RRHs1BKDIa7Z
         FlFZNU1rv6nkSYuDv3HzuCWdjUxQUCW6pu8m3LZCp4k/RzIgDGvxH8TS3nHbXutgssgS
         1SiaXBJmAZ4akF7OJI/IZH98LcegkRSsp+O8DgVuGlYhwW/2WHDkTBHmmhoblMLNE1pg
         PzuA==
X-Gm-Message-State: AOAM533Oiu1y5wmpHFZ7ub7i5sR4yhCGfjx2f6LpP4yJKgmuDKmSXXI3
	xYBnCSHxMQqg2SFTZ0G5Bp4C5h0V7J+xJ1tRWUo=
X-Google-Smtp-Source: ABdhPJy5jZqYa5/2cdoOBlIaL80kdHMD38xQ5WiPdMjZDor5VkN335Nq4ZBfQ5zSIdDBRH0L91t6ndFt3CIZlM07zFU=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr53026406qkf.119.1626108898946;
 Mon, 12 Jul 2021 09:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210530103704.8081-1-Saloni.Jain@kpit.com> <MA1PR01MB410893C1E68E55F70EA90A1687159@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB410893C1E68E55F70EA90A1687159@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 12 Jul 2021 09:54:32 -0700
Message-ID: <CAMKF1srqBL65c=AaWOA_BvbU7-SSnGbr8o=1V9px6k79NypeUg@mail.gmail.com>
Subject: Re: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, 
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>, 
	Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

meta-java has contribution guidelines here
https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/README
please read through Contributing section and follow the right mailing
list and CC the maintainers please

On Mon, Jul 12, 2021 at 6:35 AM Saloni Jain <Saloni.Jain@kpit.com> wrote:
>
> Hi,
>
> Please take the below changes and merge them in upstream dunfell branch.
>
> Thanks & Regards,
> Saloni
> ________________________________
> From: Saloni Jain <Saloni.Jain@kpit.com>
> Sent: Sunday, May 30, 2021 4:07 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
> Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Saloni Jain <Saloni.Jain@kp=
it.com>
> Subject: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
>
> From: Saloni Jain <Saloni.Jain@kpit.com>
>
> Whitelisted below CVE:
> CVE-2018-2799:
> CVE only applies to some Oracle Java SE and Red Hat
> Enterprise Linux versions which is already fixed with
> updates and the issue is closed.
> Link: https://access.redhat.com/security/cve/CVE-2018-2799
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
>
> Signed-off-by: Saloni <Saloni.Jain@kpit.com>
> ---
>  recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerc=
es-j/xerces-j_2.11.0.bb
> index 98ef32f..f2a4434 100644
> --- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
> +++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
> @@ -14,6 +14,12 @@ LIC_FILES_CHKSUM =3D " \
>
>  SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.=
tar.gz"
>
> +# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux v=
ersions.
> +# Already fixed with updates and closed.
> +# https://access.redhat.com/security/cve/CVE-2018-2799
> +# https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"
> +
>  S =3D "${WORKDIR}/xerces-2_11_0"
>
>  inherit java-library
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
