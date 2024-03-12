Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B344C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:14:28 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.8804.1710249263795672573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSsjRq94;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51321e71673so6114565e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710249262; x=1710854062; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTwJpqEY3+CfvURZbUrKaZuhNV7DkNFyy6zkmkn1VAo=;
        b=PSsjRq94Dog+A4qp2mBZRMRYtF96mDgM6REtLEopELDBFsT3DfiQlzOJvR7qwDu6wt
         g+DToNM4kplKMlnhPNKGGnNfurCnb8k0gQ2Uu/FFpEzxmyuB6VyXfwMOle73nGsPER7m
         QBgnRKx+pC59H8InbLAkOrrMkyJKhjo7G0/9a1rtoGf4yPDj6nPDyRmd6yKXvxziIkoN
         nzg+MPzQsC8VHcb7EnFOzFgQywrrg8hbCht+q4B+xR9xJBcdqUN2t98BwtD0g6klRFbP
         kZLLTXleLIMQITC0Xtu5xorda9yAEpWls1dJ8Xj/q+3bsi4BHvnM6PcsZ/GC28u3jEgw
         wLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249262; x=1710854062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTwJpqEY3+CfvURZbUrKaZuhNV7DkNFyy6zkmkn1VAo=;
        b=O7eJpnyp7flGXD/BoydlzYGelIklOA93j1LOkqBUDM2DWCXt33NSLJNq5X6cIe9Qx2
         ta8Z6sQpKzM4H/qk3ZRLvY02gintwPJYFDFXpVYk/5GCmea3qcHxrYA/gqVDYIEsa/Jw
         4SN704PSGFmMSxawxZz2YLJk/z1mM3t8Nln7vp9jOPs3HPNRVfPrMOIzGhEwFZZv5rou
         X4GWNniaHlIlhiRchBsHCjCci3q3eY41H3BtB34hylQExt8hdwDalix6PWRz4GP42pNZ
         xGuZYizuwg1r0S9gcS1YP/rHNAKFQFfLg40ALd6NbGBivOWj86K33eLAqy+E3r1qjk4p
         hEDg==
X-Gm-Message-State: AOJu0YzJI7DbqGe72qYwdkmV+4iHa3L+DXxQ64XhcFNnUgQ9kLy++QKP
	yyjGfdbgMxjJq+tWDJXy/byYiBcywryFWCVlJ5wRvBx02z4KHRTpLXwG88WijTHI+Kg5Mye9G38
	ss4dYUo8T9xjnFopB3UN0XyVNIyekb2nd
X-Google-Smtp-Source: AGHT+IFN2399KKUABl5xYz+5qbYf/7N3LuGy6Uf6zAuCTs/vQwA9tqaviWZcwo+JFZ8Qgt1SN043yCl3R07+FSroS5g=
X-Received: by 2002:a19:ee0f:0:b0:513:c25b:5ceb with SMTP id
 g15-20020a19ee0f000000b00513c25b5cebmr731227lfb.11.1710249261721; Tue, 12 Mar
 2024 06:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Mar 2024 14:14:10 +0100
Message-ID: <CANNYZj-qQYatBM6uthPoyyjd-S8_TvZoSY9skJj+VwqTbTt96g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] Replace sshd_config patching by snippets
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196979

It's a very much welcome refactoring (existing code is an inconsistent
mess), but there's also a feature freeze right now, and this patchset
is invasive. Can you resubmit once the LTS is out?

Alex

On Mon, 11 Mar 2024 at 18:19, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
> To deal with system setups, sshd was configured in the following way:
>
>  - sshd_config is shipped completely by OE and DISTRO_FEATURES (pam,
>    x11) are patched in during do_install
>
>    --> this is difficulty to maintain; e.g. sshd_config must be
>        synchronized between OpenSSH releases and OE adaptations
>        manually inserted
>
>  - two different configuration files (sshd_config + sshd_config_readonly)
>    are created; IMAGE_FEATURES decides which one is used and it is patched
>    in a ROOTFS_COMMAND in the system
>
>    --> this make it difficult for third party recipes to incorporate
>        their changes (they have to go over both files)
>
>    --> the readonly HostKey locations and algorithms are hardcoded
>        which makes it difficult to place them e.g. on a persistent
>        /opt partition and disable e.g. ecdsa
>
>  - depending on IMAGE_FEATURES (empty passwords, root login), both
>    files are patched by a ROOTFS_POSTCOMMAND
>
>    --> these changes are lost when pkgmgmt is used for the image and
>        openssh being updated
>
>
> The patchset:
>
>  - reduces changes to sshd_config to
>
>    | Include /etc/ssh/sshd_config.d/*.conf
>
>    --> This is already the done in current recipe and most mainline
>        Linux distributions are doing it
>
>  - moves configuration in new openssh-config recipe which is a weak
>    dependency of openssh (and can be replaced by another IMAGE_INSTALL)
>
>    Recipe ships configuration as small snippets which might contain
>    dynamically created content (e.g. 'UsePAM yes')
>
>  - IMAGE_FEATURE based setup is done by creating subpackages with
>    the corresponding options.  These subpackages are added to
>    FEATURE_PACKAGES_ssh-server-openssh
>
>  - readonly rootfs setup has been enhanced by
>
>    | RO_KEYDIR ??= "/var/run/ssh"
>    | KEY_ALGORITHMS ??= "rsa ecdsa ed25519"
>
>    parameters which can be overridden.
>
>
> Enrico Scholz (7):
>   openssh: replace complete configuration files by patch
>   openssh-config: initial checkin
>   openssh: move configuration tweaking in configuration recipe
>   image: prepare openssh configuration
>   openssh: replace 'allow-empty-password' rootfs scipt by configuration
>   openssh: replace 'allow-root-login' rootfs scipt by configuration
>   openssh: move read-only-rootfs setup in configuration snippet
>
>  meta/classes-recipe/core-image.bbclass        |  19 ++-
>  .../rootfs-postcommands.bbclass               |  25 +---
>  .../openssh/openssh-config.bb                 |  51 ++++++++
>  .../60-allow-empty-password.conf              |   1 +
>  .../openssh-config/60-allow-root-login.conf   |   1 +
>  .../openssh/openssh-config/80-oe.conf         |   5 +
>  .../openssh/openssh/include-conf.patch        |  32 +++++
>  .../openssh/openssh/ssh_config                |  48 -------
>  .../openssh/openssh/sshd_config               | 119 ------------------
>  .../openssh/openssh_9.6p1.bb                  |  20 +--
>  10 files changed, 112 insertions(+), 209 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh-config.bb
>  create mode 100644 meta/recipes-connectivity/openssh/openssh-config/60-allow-empty-password.conf
>  create mode 100644 meta/recipes-connectivity/openssh/openssh-config/60-allow-root-login.conf
>  create mode 100644 meta/recipes-connectivity/openssh/openssh-config/80-oe.conf
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/include-conf.patch
>  delete mode 100644 meta/recipes-connectivity/openssh/openssh/ssh_config
>  delete mode 100644 meta/recipes-connectivity/openssh/openssh/sshd_config
>
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196955): https://lists.openembedded.org/g/openembedded-core/message/196955
> Mute This Topic: https://lists.openembedded.org/mt/104868003/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

