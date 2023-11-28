Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E29C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 17:07:07 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.38654.1701191219530614021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 09:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IEYKlmo6;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d7f3a4bbc6so3289564a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 09:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701191219; x=1701796019; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auEdUacOq79AhZ7XftiEG9ht4NWprjc8TdDahQ2q0Zw=;
        b=IEYKlmo6ttbqD6aSEbcIyif+Cvy0ZNtaMfRf+iNMpbPmdhhSla9dKKR8n2Gae+JcD7
         yNE+K1QF5lq5GJ3pVk6s+U6yeECOZorIZtVBdRKV3gsqxJ8uzZ+tl+2qUGXC6e3QFFIj
         /z536OHInYaKBm0EkfNBAehiJbCMSZBwFYXxyI7HrjixOj3l/Vk3hD4P0UbzEWBqg9Ae
         InFo7VSpPdDzvaeEWtdrDwqUq3kwXS2/eZ2MAvAQ2QoTF/vxNaerpX8MBqHYcaIhHxYE
         hHg71yjVKG+zEowwXKiwgTZqYtYrw1I7lsgMOipk2PwIhpdtK06NbyKqQMtJRlus2wxV
         wp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191219; x=1701796019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auEdUacOq79AhZ7XftiEG9ht4NWprjc8TdDahQ2q0Zw=;
        b=WqQIzqLnLpoanWtLYJ/Ssrc4nUTBoQrTA+KkeyRhDg9LS7mwlA+eNyLeJ/mg1ihFea
         93/NPyhAUF9OObr/d5ds7qZCTsADzdEjX76sNPwnrS0NXUF7bUxY4vKxsZVHiLL0399T
         9Srx5/Tn/po5SiR+DDZ9EiOwiEoOXYm93n7Iyk/IfzGGPDUQfjFhorU8mo8Ph8811zcu
         3qxWK5Kib1BpprBI7uJB9o6V6U+jDj/aaVugAOi1o8IlgIEJ2Z0FKw5bngPRq435I5GC
         HODx6LBfLGGNS+QuAV0QQUduWNrn0Ueys7J/fSQBJ8+di61pPW4OOBQLCyedHpPg/nuA
         dSPg==
X-Gm-Message-State: AOJu0YxwouN2QdM2Krv3uDWzj8eMM3aTGxZLNSPr4BPZPSqGr9pJHWBT
	a1lxgc0dq3dK0Hl+vOBGqWA3ZRy7bGfjaUbpSNxQEy4fS8E=
X-Google-Smtp-Source: AGHT+IE4DsbXkp+dlBCpjETvBms+d2Xi8M5rXwsENu+KlOzCgQ54MsKKp2I+aw7cSClUbeTyhKsR3cYp42znkBA4tgw=
X-Received: by 2002:a05:6871:6a2:b0:1fa:60b5:b31b with SMTP id
 l34-20020a05687106a200b001fa60b5b31bmr6965043oao.45.1701191218668; Tue, 28
 Nov 2023 09:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20231128095518.2088391-1-jose.quaresma@foundries.io>
In-Reply-To: <20231128095518.2088391-1-jose.quaresma@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2023 09:06:32 -0800
Message-ID: <CAMKF1sqOkz+89g9NJ+9MaBCEeJX8SmBUk2UsbEG4-6G_oDzG0w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] initramfs-module-install-efi: add GPL-3.0 licenses
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 17:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191381

On Tue, Nov 28, 2023 at 1:55=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> Some of the tools used the script init-install-efi.sh are GPL-3.0:
>
> parted: GPL-3.0-or-later
> dosfstools: GPL-3.0-only

if these tools are used and not provided by this recipe then I would
expect that concerning recipe providing them will mark the LICENSE
field correctly.
we do not need to reflect the use here.

>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../initrdscripts/initramfs-module-install-efi_1.0.bb           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi=
_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.=
bb
> index b7499644f0..0f18ecaca0 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "initramfs-framework module for EFI installation option"
> -LICENSE =3D "MIT"
> +LICENSE =3D "MIT & GPL-3.0-only & GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>  RDEPENDS:${PN} =3D "initramfs-framework-base parted e2fsprogs-mke2fs dos=
fstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
>  RRECOMMENDS:${PN} =3D "${VIRTUAL-RUNTIME_base-utils-syslog}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191350): https://lists.openembedded.org/g/openembedde=
d-core/message/191350
> Mute This Topic: https://lists.openembedded.org/mt/102847882/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

