Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0761FCDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:21:01 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.112912.1697444450643309932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VZDhR2NZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7a26fd82847so171702639f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 01:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697444450; x=1698049250; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IcVH6nlc4ZNyYnh1Pml/TRwT6vdHGZgROAw2pAtvBc=;
        b=VZDhR2NZpampOZvJa9QFwIRxvko0RYc0pU5Q2KshloH0R2IrjSoKIwPHByrmPRxHSe
         Cnhww0SB9Ff5ZlgoDpgLi5GUctXH/6Es/VGmgDEtaqRGyAJa4TAfSc7ROB58EpP4oBjb
         RfJOezZWDvbTADJVYxiJxC6TrcPtJi2r6TV+doVmR/lNeD3VM4zZsQ0DQN1sRwDXtL/8
         0NmEqv47W2v79oZe4bNkm/dTlqhEYSJ3zBBaPz44ilyFqufA5LF9hM1MuYdLo6v834AL
         U/pEkj1NyHjrw+fwE2diDCOPGR52/R00Q97DNXVstqQvIknpfFkrI+jQ6CmSDqXK9PB2
         He4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697444450; x=1698049250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IcVH6nlc4ZNyYnh1Pml/TRwT6vdHGZgROAw2pAtvBc=;
        b=sqk05lqj+HCFBHik9GAFzYMv2iR/aB9f/2AMbfFn+OQXLvPJ26XRUZqEt2b6hGiS4u
         Swf6UQwiipR1s/6WSCvU4OeEmrmGNu5wLySur0vX1mvw/21ZMR2PinAEkMp7XdLkRH6y
         3uiKt0qzfhpj/NvNL/Uu414CaBXwJ1Ar5z30Zi1OFpc+ZQw6e3G5RHcQj7D/1jaaXCjL
         7YzmJA0eKLAo3iJzJJn6ME+x//5Zf5iUX94ykMBtpmeccPW+myPpcGz1iaQMMu3BVwkV
         Ir8GZIRSTPaOYCxRbtlbkLQfiPH3rpTXTMT95EUSAtY/szbO+FUfcAUIJox/UNUaHy9Y
         YOcw==
X-Gm-Message-State: AOJu0Yywfy7040onhiLkPhO5+tSH4hSN4jb2IT44IKMjVf8EKD3oRd5h
	bIhbfUyP8Lmvqd9DaydIppRQ0ZM4PtMqSl+XVjg=
X-Google-Smtp-Source: AGHT+IFlBw62DiPqrJt1OU2IFdZ2w4wDno3SgIZk3HhP946maPUtz7KRS/LYYFh3dw6a7N5U2bD9sUyg/5JFW6n1BlI=
X-Received: by 2002:a6b:dd0d:0:b0:785:5917:a35f with SMTP id
 f13-20020a6bdd0d000000b007855917a35fmr37394937ioc.8.1697444449822; Mon, 16
 Oct 2023 01:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <178E1562A4BE8B56.8679@lists.openembedded.org> <AD0432F5-286C-4C48-963F-93AAA6D7C9C1@getmailspring.com>
In-Reply-To: <AD0432F5-286C-4C48-963F-93AAA6D7C9C1@getmailspring.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 16 Oct 2023 09:20:38 +0100
Message-ID: <CAO5Uq5T-cX0_pecLmLfB7vjQYK358SupgG0EjKFvhBEEJektsg@mail.gmail.com>
Subject: Re: [OE-core] Feature request: Add btop resource monitor
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189270

On Sat, Oct 14, 2023 at 10:11=E2=80=AFPM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> Another thing is that btop is dependent on a utf-8 locale being set. You =
can still run it with the --force-utf8 flag though. Should this be set by t=
he recipe as well?
>
> On Okt. 14 2023, at 11:06 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> wr=
ote:
>
> Hi guys,
>
> I would like to add btop to the openembedded-core. The package does now s=
upport cmake, which eases the maintenance effort.
> Before it would have involved a lot of patching as seen here. The Cmake s=
upport is listed as community maintained though, if that is a show stopper.
>

Feels more like meta-oe rather than oe-core (and the recipe path you
have suggests that's what you intended!)

> tree 7370f6d34c4f1a7d3aed8ef4dc334de1e271e4b3
> parent d59f6c752927f7846dc11c4aa00a2d0c9860e75c
> author Jan Clau=C3=9Fen <jan.claussen10@web.de> Sat Oct 14 22:56:45 2023 =
+0200
> committer Jan Clau=C3=9Fen <jan.claussen10@web.de> Sat Oct 14 22:56:45 20=
23 +0200
>
> recipes-support: Add btop
>
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipe=
s-support/btop/btop_1.2.13.bb
> new file mode 100644
> index 000000000..f780a993a
> --- /dev/null
> +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Resource monitor that shows usage and stats for processor, =
memory, disks, network and processes."
> +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +SECTION =3D "console/utils"
> +
> +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES:${PN} +=3D " \
> +    /usr/share/icons \

You only need the top level directory as the packaging recursively
globs. Also this should be ${datadir}/icons

> +    /usr/share/icons/hicolor \
> +    /usr/share/icons/hicolor/48x48 \
> +    /usr/share/icons/hicolor/scalable \
> +    /usr/share/icons/hicolor/48x48/apps \
> +    /usr/share/icons/hicolor/48x48/apps/btop.png \
> +    /usr/share/icons/hicolor/scalable/apps \
> +    /usr/share/icons/hicolor/scalable/apps/btop.svg \
> +"
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189123): https://lists.openembedded.org/g/openembedde=
d-core/message/189123
> Mute This Topic: https://lists.openembedded.org/mt/101967134/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

