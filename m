Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.8686.1593085936339644949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 04:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ICOz9mmq;
 spf=pass (domain: konsulko.com, ip: 209.85.210.51, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f51.google.com with SMTP id n24so2707496otr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KfFGWU/9+2J29udiQXUc+C9CQsv1nPhH0AnyTDZDP9o=;
        b=ICOz9mmqV4lQrZOrElM/iWL7Wo0+IDWUOcvyk/E6JNOwp2vhVVNsC8hEMdbXH1zM6B
         5doD0twBe0rjRuwTC0QxXLO8yGAXY7oNOfgGeKAoCZqjOVwvv+V3zUN441w0tUs7ZVWg
         wHQMRE6g44hM310mRWvNcDDePT5eQF4kbEnF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KfFGWU/9+2J29udiQXUc+C9CQsv1nPhH0AnyTDZDP9o=;
        b=MWAxnc8xckb0Xj6DI9xuMUFiOC+GcZsQxwGTB7N7G+eeWo5RRucnSumiYycr7PWtIr
         lhGp7geVpAMcgVo8V7joLm8FjrpGnLB1TSlyY/P0oXNUWnN/iFLtmMGfFm+bdyXQpGDM
         CjSH5QdMuCeW9j8K2Je5cDTfNAkXO+zsRoIOQPfk/CjoA4IUp1xvzvU4OAKSPn3ryF3Z
         VFFuKJWRly7Ry5j6u7GcTLv++gK24qTT1x6Lc7S8VytKdZBPPsOGjyPtddCMJycXDeyr
         NgAj/NXokkvybenUWC1mM1LQl0xQOjO8LllqzBjSKtlSwVMOAXoLUGczNI8bYJSgUNrd
         +CLw==
X-Gm-Message-State: AOAM531WLVfwB6r84zId6ehnEydMDzRJl2xVEJsP4/pDtWp5BWPvZGnv
	gM7mh0/hPFZPvTYY+FPnzVRqS+HIoJZS7xRUEss54A==
X-Google-Smtp-Source: ABdhPJw4e5a74+OFOXlUoqqVcnj/WhY2p+GWDkLDf7Cie+03Qi6ZPVHVjixqeYMKx0oLV/6zrNECh9acvDh/me+zohs=
X-Received: by 2002:a9d:6c02:: with SMTP id f2mr11696638otq.258.1593085935608;
 Thu, 25 Jun 2020 04:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <Groupsio.1.QkZO.1593082325223977941.NSzh@lists.openembedded.org>
In-Reply-To: <Groupsio.1.QkZO.1593082325223977941.NSzh@lists.openembedded.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 12:52:05 +0100
Message-ID: <CAM9ZRVuwQ3xAS4wmL-wtMBjOnUoHY3xFWx_StA-V9GvajW4TKQ@mail.gmail.com>
Subject: Re: [OE-core] Distro name
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:52, Pankaj Vinadrao Joshi
<pankaj.vj@exaleapsemi.com> wrote:
>
> [Edited Message Follows]
>
> Hi,
> i have built image for raspberrypi4-64 using openembedded-core and i am trying to run some test specific to lkp but i am getting issue with the distro
> which is nodistro.0 but the test needs distro for it
>
> i am attaching the output of  os-realease
> ID=nodistro
> NAME="OpenEmbedded"
> VERSION="nodistro.0"
> VERSION_ID=nodistro.0
> PRETTY_NAME="OpenEmbedded nodistro.0"
>
> i am getting following error with respect to lkp
>
> ERROR: "Not a supported system, cannot install packages."
>
> detect_system distro=$_system_name_lowercase
> DISTRO=$distro export DISTRO
> [ -x $LKP_SRC/distro/installer/$distro ] || {     echo "Not a supported system, cannot install packages."     exit 1 }
>
>
> can somebody help me how i can add distro for raspberrypi??

If you're unsure what a distro is in the context of Yocto Project /
OpenEmbedded then I recommend you find one of the many tutorials
online and work through it. Also, his question is not specific to
openembedded-core, please use a more appropriate list like
https://lists.yoctoproject.org/g/yocto for questions like this.

-- 
Paul Barker
Konsulko Group
