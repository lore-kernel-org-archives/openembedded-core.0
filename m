Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DACC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:47:20 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.2484.1709668032423235499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jhd9sDLf;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21f70f72fb5so4374902fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 11:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709668032; x=1710272832; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJjGEi/lekGKXk0XPKFd6ALrZyVE3QKegooPGkcz8pE=;
        b=Jhd9sDLfPf6GG/Foe4LvXvdez3Hy5nxhV71OHAazdAIiDc1gDrK8DLgAXwPaKGRN19
         2CA7XGB29tgKfxfVbThxQRZxQDzRrmfZCYj2yyRtp8CdZ4FSbOh5o7b5VIktXYkZavMm
         Fi3N4LByV0DW5s/N+nH+qtzzh8SHKoAe/XQXjNpoG8ApX8kRJ2XPul6TyHwNEXTmF3A9
         k1ap8SfmGyTnIqCH9zOqpPo1lYqaQatLZ3bELWweRT/9aPxOmUUg8Z5WhGK7AjDqnS3B
         m6iY+SxB0AMF+auRolI4dkxrTFf5VChGbyjoCC+C2Go6DRDRzeMwgYAHMEhzOGe62eW7
         U1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709668032; x=1710272832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJjGEi/lekGKXk0XPKFd6ALrZyVE3QKegooPGkcz8pE=;
        b=NnHfg0rOv5SdunXxj0CAwUGt28SziUubKKsxHGo2sDNmWI81ECo75tfkFdLTWn5P8i
         hSSYgwFIStrTucRl2rOQyY+A1D+RWEhGI8255O9TulEnzHPg1s7XtmGQM2RIMp0Zd9yd
         DDg4gdkk1cXGBj2qQmppeNlSzQOJ65pZ0PcBn1QzRiE0kEqKbf7PH086tL7cnIbIzY7B
         krx/x2pM8syWcRZH8Zrq//SP9RjH+YbdWSt9a7KISR7BXLcQWeIo3QZwhFQHVg1cIrFp
         7k2GiVzKHkOoL6w6niSaJD8fRw7flRLKxK6oYRBSZYNGbX9fy9e5H2akCvamIxwH+aln
         uz3g==
X-Gm-Message-State: AOJu0Yyh6H0DRBCqisvFSt6UNeWNNCMoPPgjMvheH6sPXkLHrUc4bA7C
	T7+xhYnm1b6ZAdKIujEU69HVjV3kIwwwf3PYWXyOJeMyAalD4EC91oOKpmOEExU0ULUel0QaWV2
	IkLAH5tYIR0Pa/nHgjpQ22NQfo9c=
X-Google-Smtp-Source: AGHT+IGdisSYXpePf+2gabov6K9aFf0sh70DYxtD4/8/ejTXRYbmTSktKxgyTotTbxQloBHUqSWjiYVIfXRpGYUOKfY=
X-Received: by 2002:a05:6870:418c:b0:218:afdb:bb67 with SMTP id
 y12-20020a056870418c00b00218afdbbb67mr2932203oac.11.1709668031610; Tue, 05
 Mar 2024 11:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20240305194552.1098165-1-festevam@gmail.com>
In-Reply-To: <20240305194552.1098165-1-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2024 11:46:45 -0800
Message-ID: <CAMKF1soFD-PfPupV5_WEmxWKSpOYFit97zvoCACYf-80X-PN6A@mail.gmail.com>
Subject: Re: [PATCH] dev-manual: Convert to 'bmaptool-native'
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196647

Thanks for doing this quickly.

On Tue, Mar 5, 2024 at 11:46=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Since commit 7a036b1a1ec7 ("bmaptool: now part of Yocto Project")
> 'bmap-tools-native' has been renamed as 'bmaptool-native'.
>
> Adjust the references in the documentation accordingly.
>
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  documentation/dev-manual/bmaptool.rst | 6 +++---
>  documentation/dev-manual/wic.rst      | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
> index 9add72cf3b80..3a2a61d8cdfe 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -22,7 +22,7 @@ system image files much faster.
>     -  If you are unable to install the ``bmap-tools`` package, you will
>        need to build Bmaptool before using it. Use the following command:=
:
>
> -         $ bitbake bmap-tools-native
> +         $ bitbake bmaptool-native
>
>  Following, is an example that shows how to flash a Wic image. Realize
>  that while this example uses a Wic image, you can use Bmaptool to flash
> @@ -45,13 +45,13 @@ any type of image. Use these steps to flash an image =
using Bmaptool:
>
>     -  If you have write access to the media, use this command form::
>
> -         $ oe-run-native bmap-tools-native bmaptool copy build-directory=
/tmp/deploy/images/machine/image.wic /dev/sdX
> +         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
>
>     -  If you do not have write access to the media, set your permissions
>        first and then use the same command form::
>
>           $ sudo chmod 666 /dev/sdX
> -         $ oe-run-native bmap-tools-native bmaptool copy build-directory=
/tmp/deploy/images/machine/image.wic /dev/sdX
> +         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
>
>  For help on the ``bmaptool`` command, use the following command::
>
> diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/=
wic.rst
> index 312f78c403a2..05e9cb381b31 100644
> --- a/documentation/dev-manual/wic.rst
> +++ b/documentation/dev-manual/wic.rst
> @@ -503,7 +503,7 @@ Continuing with the example, you can now write the im=
age from the
>  built your image, and boot from the media. You can write the image by us=
ing
>  ``bmaptool`` or ``dd``::
>
> -   $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-20180419101=
7-sda.direct /dev/sdX
> +   $ oe-run-native bmaptool-native bmaptool copy mkefidisk-201804191017-=
sda.direct /dev/sdX
>
>  or ::
>
> --
> 2.34.1
>

