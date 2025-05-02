Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0A7C3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 18:53:50 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.27136.1746212023658558012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 11:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsLFVxcH;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c173211feso647569a34.1;
        Fri, 02 May 2025 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746212023; x=1746816823; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utfB8SlZxhhkUIFUm+3+cTqCo+xY/D0FHJWPxO9FDH4=;
        b=jsLFVxcH/4XvFUrPFxb0dIoHwGni9D7MwCZmkuJN+Yw2/Mi4tP4qcxDUlToPXZvBFs
         VR0qep0NxrGEYzBn5SkjVrnDpv0s+sPJ3wTB1+8mivr1+k5Z8lDpiZIt2rEnhSCIqwVW
         dE9sgcYdxaP8MNJmfhAHwJ/Jfk63Ln/887/Rde05d1byBr/RKtz2MHOVERjqV16lXnvv
         +ZPvzUvApuF/1hBRiTolJ2MwxVHWg0HGnVotpfxefJvP6Fxp+IhJLgnQVorFHd3c6iNV
         JG/EXu/MQ4rQTADmP67DrEaRT7cyrvrytTpF1TOmzY59IKt1HgxO6ZaZ4gdDo3v+I5B1
         R5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746212023; x=1746816823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utfB8SlZxhhkUIFUm+3+cTqCo+xY/D0FHJWPxO9FDH4=;
        b=vRreg58zyzfu/p15/ExDwlNM6YKP1FftfDpdra2oHzdU1QFU+HywFRYfsDXPpysOHy
         A7IYkQTg0AJI70ZS/NLMvV5M70RwOrZp5OLHTNBJc29DRDFwGfEd2XU4LxxHJMV9ECf1
         VHpJ49mz7SzJ2CmSd4AFvN+7yUpuQj2BEYClxHhPaUFk1Uld/omgsvBI20CD+l0mrQ5J
         2DyC3MoKjl3+ggMr1Fjx4titx0K+LRCs2HNQkVV4ksfTl5VGyMnz69gDIqlFq5lpWw1i
         jF/zPm9RjwGFrw8VcbkU4/TZozOTBCMgqVk3TqK8OVMQWpwWZ5DyHFbdZan1h508yJYu
         suvg==
X-Forwarded-Encrypted: i=1; AJvYcCUdNvKZ17mEgbeTVlo46WYpxmgkhysavrYSBKHE9CZ7jopDCKbNRMCjFQWvsN4lViIzc9hvhBeoZ08iQShQEm+pVv4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyF65eGQCkl2HRJrXShrBnT0etbS04R4SHqxbcnJL0iMLjQLTUX
	kvSP3Gah5HmYfrqDDoDCa+4KJyO6cBRuyShG6OKaNiYMxksPBk7T+bSj/lX219UbCKFwAsGvVuo
	0RLzEUy4yYTt5IIBfSZ6ePg1fX7E=
X-Gm-Gg: ASbGnctUJIgE7rKYlQJPpTx2rFm5FP3FNMsmgdqyN9pCuyNodaudxi7oHx8ZvZbMYP/
	XfmptuPS+V1BhWcYoT+KC8DavGOKBFj3MmDd8KXud6ABNCoS14ElzbBPBAM72aiXX23/H0ZGTTE
	7K+BvV2XVTsKw08Smq+RBx
X-Google-Smtp-Source: AGHT+IFM1rXA4annFr6pPl93YD2EZCdxYmhhsNvBlPsiLRzxhvDlrMH18uaOJHDpCznVJ5aEkz3jyExLZS1VbltcZgs=
X-Received: by 2002:a05:6870:9601:b0:296:beb3:aa40 with SMTP id
 586e51a60fabf-2dab340172bmr2202353fac.36.1746212022687; Fri, 02 May 2025
 11:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250502020808.1038389-1-wen.yang@linux.dev>
In-Reply-To: <20250502020808.1038389-1-wen.yang@linux.dev>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 May 2025 11:53:16 -0700
X-Gm-Features: ATxdqUHE9Am2U9vqc1uJ3S_1Z79n_VOyoJLH9EDJRzmrTAJU0Te-EAgiKJnVofo
Message-ID: <CAMKF1sp-_41pw0yX4JpZFu7PuxVBbuAr=QUinnFu0pm+7wTofg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] testdisk: add recipe
To: wen.yang@linux.dev
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, Wen Yang <wen.yang@blinux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 18:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215918

fails on musl target build

./../testdisk-7.2/src/hdaccess.c:1016:7: error: call to undeclared
function 'basename'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-
   =E2=86=AA declaration]
   |  1016 |       basename (disk_car->device), file);
   |       |       ^
   | 2 warnings generated.

On Fri, May 2, 2025 at 5:52=E2=80=AFAM Wen Yang via lists.openembedded.org
<wen.yang=3Dlinux.dev@lists.openembedded.org> wrote:
>
> From: Wen Yang <wen.yang@blinux.dev>
>
> testdisk is a free data recovery software primarily designed to help
> recover lost partitions and/or make non-booting disks bootable again
> when these symptoms are caused by faulty software.
>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
>  meta-oe/recipes-support/testdisk/testdisk_7.2.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb
>
> diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/r=
ecipes-support/testdisk/testdisk_7.2.bb
> new file mode 100644
> index 0000000000..81d89c8e99
> --- /dev/null
> +++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "TestDisk is a free data recovery software primarily des=
igned to help recover lost partitions and/or make non-booting disks bootabl=
e again when these symptoms are caused by faulty software, certain types of=
 viruses or human error (such as accidentally deleting your Partition Table=
)."
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "jpeg ncurses e2fsprogs"
> +
> +SRC_URI =3D "https://www.cgsecurity.org/${BP}.tar.bz2"
> +SRC_URI[sha256sum] =3D "f8343be20cb4001c5d91a2e3bcd918398f00ae6d8310894a=
5a9f2feb813c283f"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES =3D+ "${PN}-photorec"
> +
> +DESCRIPTION:${PN}-photorec =3D "Photorec is file data recovery software =
designed to recover lost files including video, documents and archives from=
 Hard Disks and CDRom and lost pictures (Photo Recovery) from digital camer=
a memory."
> +FILES:${PN}-photorec =3D "${sbindir}/photorec"
> +
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117279): https://lists.openembedded.org/g/openembedde=
d-devel/message/117279
> Mute This Topic: https://lists.openembedded.org/mt/112579605/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

