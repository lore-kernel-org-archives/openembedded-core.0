Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web09.349.1616450821879833303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 15:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Runvk+Fl;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id o66so8228024ybg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 15:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f6zPzIe35Rob9olR/zP0l1EAbsUlUmRF9LwY9prqiJw=;
        b=Runvk+Flc/RrK+YcBdipSIaSSnjXxq4F+WcjIaqKAF5Bmyy7gDIesGaQI/XRzcVsZ8
         /GmEtXA6cY6Ay/AbyL4RI5rjY6Su+MX04qQfX5SGIAq/YD4CNAZkv/OkcqBdlparZYug
         Z14921cJL2tYgng8uDJ0CC0Uszhd+VpHorLaBVx66dXnEZ8G9LBu8KzTgUU0NvFowt9w
         r9BzkuH2awULPedje++zXOtvo+FAfvfSrMzfNYm7yyhnS2NM+QgVZV4W5TaRdo/Kz3kF
         LUJAl65obMJGkwNYsUxNSccrk3vcWHLGkAoR0GyoKfOBxhUPspuz3FDvhg0nROErZ5sg
         rbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f6zPzIe35Rob9olR/zP0l1EAbsUlUmRF9LwY9prqiJw=;
        b=QhY7jkkqUHuS044NaJZlk7LTjxM+Qccw0HEDvGrVFITN7t3Zpcj5gKfREUm84dqbZ7
         HDoF4StYbzqMXpA/mA8Et4S3cbuWi/rIGJGGmxEhSjqj9Xz2bM8iYruQQeN7txo78j4t
         83+UstX1y98IhmruScS+q+brATQ+HSZ+D/gIdMtcKIBYAIstH+0+bxPRdQoDODATFvGT
         rBLy6Vb7Gn1qVkpCzxaNuHq39/sTpBLklg+41Qe+70KBNnX3zUjE0GqFyzuqLG6u2kPI
         3htgipke4t68q+n1nVvcE52t0aUc4vhBAwhz3uUGhf51esGyco7yottprUvHqdHuVpLT
         r23A==
X-Gm-Message-State: AOAM533ZZpFbRrgUI7cJfMEciMOsfkayNbPZw0xAQ30S++SAm+8TxvKD
	c3MbXSCNfhYi8CyU8arp+zo2G4PeK5uIQWBXrSY=
X-Google-Smtp-Source: ABdhPJyo8MJj5nEhStzh5I6Zcvvc5/L63iGUAbB2ma1obdNlOwkaL60buTfX6TDRiiMSdeNbuEibBY6A8p2oaBAi9lQ=
X-Received: by 2002:a25:2386:: with SMTP id j128mr1041731ybj.284.1616450820953;
 Mon, 22 Mar 2021 15:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1614009417.git.anuj.mittal@intel.com> <47cf6739ab182e66d1b73cd99bab961d06f41336.1614009417.git.anuj.mittal@intel.com>
 <DM6PR11MB41059D92EEB011F17928471EB9659@DM6PR11MB4105.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB41059D92EEB011F17928471EB9659@DM6PR11MB4105.namprd11.prod.outlook.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 22 Mar 2021 12:06:50 -1000
Message-ID: <CAGDS+nk2K_pgv2Y6bv2oHKMY5pe-6-iVkjFLZHgQ+gXTOggC_Q@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 01/30] initrdscripts: init-install-efi.sh install extra files for ESP
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 21, 2021 at 10:57 PM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> Hi,
>
> Can this backport to Dunfell too?

Yes, I'll take care of it.

Steve

>
> >-----Original Message-----
> >From: openembedded-core@lists.openembedded.org <openembedded-
> >core@lists.openembedded.org> On Behalf Of Anuj Mittal
> >Sent: Tuesday, 23 February, 2021 12:00 AM
> >To: openembedded-core@lists.openembedded.org
> >Subject: [OE-core] [gatesgarth][PATCH 01/30] initrdscripts: init-install-efi.sh
> >install extra files for ESP
> >
> >From: Chee Yang Lee <chee.yang.lee@intel.com>
> >
> >Currently the install script copy only few hard coded item while setting up target
> >ESP, kernel artifacts, all .efi in EFI/BOOT, grub & boot cfg and loader.conf.
> >While ESP can be much complex, eg: contain multiple initrd.
> >
> >Add a ESP folder to carry any other files to setup onto ESP.
> >
> >Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> >Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >(cherry picked from commit 6eaca9cf20c42501fba27dea3a6446bad948e859)
> >Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >---
> > meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> >diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-
> >core/initrdscripts/files/init-install-efi.sh
> >index b6855b5aac..f667518b89 100644
> >--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> >+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
> >@@ -279,6 +279,11 @@ fi
> >
> > umount /tgt_root
> >
> >+# copy any extra files needed for ESP
> >+if [ -d /run/media/$1/esp ]; then
> >+    cp -r /run/media/$1/esp/* /boot
> >+fi
> >+
> > # Copy kernel artifacts. To add more artifacts just add to types  # For now just
> >support kernel types already being used by something in OE-core  for types in
> >bzImage zImage vmlinux vmlinuz fitImage; do
> >--
> >2.29.2
>
>
> 
>
