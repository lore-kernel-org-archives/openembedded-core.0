Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0D0CA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 18:20:24 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.860.1755627615676056713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 11:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FUhDtkdw;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e94ee2f1fe2so623498276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755627615; x=1756232415; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evzzT8qp+7U8GnU9r4z6adiYdev6zFu3uI+C3fbTdm0=;
        b=FUhDtkdwYTUM38YJThva4x5ySFVpygjIOt9bQiy01lsLpwG1HBisQ4fBSt4u5eszjD
         oFWk5nhTyXGHIgTbRl7pW0hBtzSJayuZeGAQqsfxzcW0C0mEFXY21i12h4b422Pky6HK
         NZCfGiv1CvGnH1IzJxFTF/8A67p5VixWoiFXGXOSmbwnsad5BhmtqHwPGh17i+dfj4S0
         yOqvnke2ExIXWF+cn8ak9Nawemwbe9BQwnBEs7UUgBbMhKi8XHpnFEBpCdLaXcUNO0Gs
         axnXTznxctIgvVY+kU5w5PAN5eBNFGNVOhWsCqVEgZNUYZgfe8u1sY6FTIEaVOyGvAIk
         4Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755627615; x=1756232415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evzzT8qp+7U8GnU9r4z6adiYdev6zFu3uI+C3fbTdm0=;
        b=nwjLil7LlfwFgsuyjmJtEIwxP59KG25uEbXQC0uYZNj7EdqGGI0bAn4oSZYNp9fWcm
         nT1WXMaXv047io3Dy4J//zyKyJmgbFimp8nJiU2x0cLgptWhREeYRx32LCLmQLRZtvU+
         jxFNAAOBEVk4vFNTPSwuatXjQs7/Nd+fRSiqAW8Kvi/cixoN8/rRxbi9lJcEW3CNMIXa
         Vo/qpRyp8vMoyvwIiyKv036BJKOLHWd2z4WEOZjw6qAcgMsy2XhbEk07MoLknfoew025
         LQwMll17+Y7nZNsOQSZoUFWZDgvVuUmcSUhe0yU+ZpikwXBeELQ9kDbs+LyKGz+6mK9J
         jUZA==
X-Gm-Message-State: AOJu0YzwEjT8wevNfX1w6oiO4w90CAT7joaOVRSwS/n0JxQXsbui7v35
	4SYBkJO6NujXn/g4GLlguVbbzSuFx/OEYIymIG5oLX7/QVopUoO9KRUhtpQJzWHePvPcdJH0xIZ
	jpNReKliT3vxDsmhgH+InUmEAyGw/rhM=
X-Gm-Gg: ASbGncs4Kv+q343+K3JkXLNUmzn0yTfYApU9aulZ43sMcXBN3I4ORzCBZpcBQYdBkCp
	RcDWlBiFLzjNWzCPugj9V30imrAjse47oKXcCZQROdW3Teg88pi5RqppUvVLhUjxmsVDiCIBcfq
	5T3jtzs1LWBZ1slVQ8HW43F9mgmDUbkQ4FnL/P8p4Ca0rklRt9SXcekj9lWIPVUnoOx0stMsYFM
	6Vvfb5PqdwOALpxb6Ki5Lz6t8ss+Mm1i2rb887ec3/5gAI=
X-Google-Smtp-Source: AGHT+IFPBFuZzVpDiXeMsGjmqforSIwjzNpAYRPF0nMybDQVfYLJ8Z9SFPRfYR7thoMOp+EytwFqxHCRs/Ruaegc5qI=
X-Received: by 2002:a05:6902:2505:b0:e93:4a5e:dfda with SMTP id
 3f1490d57ef6-e94f666919cmr80523276.31.1755627614691; Tue, 19 Aug 2025
 11:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250817181630.3234-1-mroj4n@gmail.com>
In-Reply-To: <20250817181630.3234-1-mroj4n@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Aug 2025 11:19:47 -0700
X-Gm-Features: Ac12FXzUTLC0IzaaGLug3Jem34Q4l6tgMXXSxrIqeIuqkvHS7SbJXbHjvFTurDo
Message-ID: <CAMKF1srQ6mzvy7U2iv67dW68QfMhkp+Q1w90tkAmLQzL6y8czg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: add attribute parameter to parted
To: mroj4n@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 18:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222125

On Tue, Aug 19, 2025 at 6:20=E2=80=AFAM Mohammed via lists.openembedded.org
<mroj4n=3Dgmail.com@lists.openembedded.org> wrote:
>
> Add argument parameter which will use sgdisk to set argument
> Certain bootloaders use attribute to recognize correct boot partitions
> and having the option via wic tool would remove the need to do via extern=
al scripts
>
> Signed-off-by: Mohammed <mroj4n@gmail.com>
> ---
>  scripts/lib/wic/help.py                  | 3 +++
>  scripts/lib/wic/ksparser.py              | 1 +
>  scripts/lib/wic/partition.py             | 1 +
>  scripts/lib/wic/plugins/imager/direct.py | 5 +++++
>  4 files changed, 10 insertions(+)
>
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 2e3061f343..fef856dbbb 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -1070,6 +1070,9 @@ DESCRIPTION
>                  an MBR header. Partitions with this flag will be include=
d in
>                  this MBR header.
>
> +        --attribute: This option is specific to wic. This option is used=
 to set

Drop the line "This option is specific to wic."
secondly as mentioned to prior version please add a selftest for this optio=
n

> +                      the partition attribute.
> +
>      * bootloader
>
>        This command allows the user to specify various bootloader
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 7ef3dc83dd..af4fb91d58 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -189,6 +189,7 @@ class KickStart():
>          part.add_argument('--fsuuid')
>          part.add_argument('--no-fstab-update', action=3D'store_true')
>          part.add_argument('--mbr', action=3D'store_true')
> +        part.add_argument('--attribute')
>
>          bootloader =3D subparsers.add_parser('bootloader')
>          bootloader.add_argument('--append')
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index b34691d313..cf5c51f105 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -61,6 +61,7 @@ class Partition():
>          self.update_fstab_in_rootfs =3D False
>          self.hidden =3D args.hidden
>          self.mbr =3D args.mbr
> +        self.attribute =3D args.attribute
>
>          self.lineno =3D lineno
>          self.source_file =3D ""
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index 6e1f1c8cba..877a5d2a97 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -664,6 +664,11 @@ class PartitionedImage():
>                  exec_native_cmd("sfdisk --sector-size %s --part-attrs %s=
 %s RequiredPartition" % \
>                                  (self.sector_size, self.path, part.num),
>                                  self.native_sysroot)
> +
> +            if part.attribute:
> +                logger.debug("Set attribute:'%s' for partition '%s' on d=
isk '%s'", part.attribute ,part.num, self.path)
> +                exec_native_cmd("sgdisk -A %s:=3D:%s %s" % (part.num, pa=
rt.attribute, self.path), \
> +                self.native_sysroot)
>
>          if self.ptable_format =3D=3D "gpt-hybrid":
>              # Write a protective GPT partition
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222110): https://lists.openembedded.org/g/openembedde=
d-core/message/222110
> Mute This Topic: https://lists.openembedded.org/mt/114750349/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

