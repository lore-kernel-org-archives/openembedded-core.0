Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.5026.1594295849078406784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 04:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sjGrnS6D;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id x9so1777986ila.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NiAeVZBkQW9oVrlOMtYV9tfeBWEsxos0u4EtV1G4PO4=;
        b=sjGrnS6DztYuFRRLrPfk6I76g+fvWiYTC/sEqeXwMIW1fW/COLJXqN4qpuV5vwRHtq
         yJ+8AqD6fbI0/UoUdPhqR6oyTqDUkQaFjGbXwh8J8+c/kZxV4D7UORwsNJB6BY4WC6Cp
         rkstSATiZScQPQuAuaFRhRxfuz79xOcMcJOCdSBl9GAcrVnjX3izJQuhWY1e7xQeVJHs
         FN25iPJf1NHUTc42p05nM3xvcypHJxlf5MWApaV/cBx3iX+bZTTeu/XwA0pV+nC5jhe5
         p4xWG6jFSqqlocUs7AaC9yadO+A1QCwbtRaugsdWWBkC/yvNbE5qMB6pgGQZQUFZlB99
         NBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NiAeVZBkQW9oVrlOMtYV9tfeBWEsxos0u4EtV1G4PO4=;
        b=dicbBPhwC8UFv4NYVBgbuC+1g6x2lgKIDaUVq9pr2RmE/eq+5hC/+UtojJqr8AUGGs
         z+RuWCKfIL4r0zBiAHIbZVXvtMmYJ7MTVYcC5WjBDp68XVbAvXf/Vo/p19kRt4aIgFHT
         leDu45YxNV0MFB253oeYW0sn7YvrPAxjac3or5SMVz2OXMk3MunAX/YwGRgxEE5ygZ9c
         i/pxoo7044V5cRbgtIGT9ZyPKnNm8/R8eX60Vu5xIqLBG57HmirHTlAy39PkB4uT0uwJ
         yDz7MQ3WX5a9QADZgjcv/2V9m9Sd8WTn8DKIFxEkm8CSLnWDGzxiQHSdxyqWuus1fCCN
         s3Xw==
X-Gm-Message-State: AOAM533uT03niwrKpX91wu5+fyDXBWa6uIVEY8214Dv+7z+Y69Y2rdXQ
	Td+kby2OoG6l4QdQ8dvLM+FfI8riTK3KpMkc/SA=
X-Google-Smtp-Source: ABdhPJxaHzmzeYNdDhXnjpDD/5WEo+eAG37jYf36JGK09uEb4LeTkr/+31iVvCPDDoIJhGbIusSzuMx9QX4PKn7TwPA=
X-Received: by 2002:a92:1bd2:: with SMTP id f79mr47600295ill.115.1594295848459;
 Thu, 09 Jul 2020 04:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB6881E512124C27A177984016A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB6881E512124C27A177984016A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 9 Jul 2020 12:57:17 +0100
Message-ID: <CAO5Uq5TimYvfuX=M4-4ms=4C_yHyo0pKsMfZXhSoopA7J1FhMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rootfs-post: remove trailing blanks from tasks
To: Konrad Weihmann <kweihmann@outlook.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 9, 2020 at 8:19 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> remove the trailing blanks before the ;-delimiter, so one could use
> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
> which are currently hardcoded and not bound to any
> configurable feature flag
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---

I think this duplicates a change I submitted:

https://patchwork.openembedded.org/patch/168931/

Comment from @Richard Purdie at the time was "This does sound like
you're working around a bug in shlex :/", which I started to dig into,
but failed to figure it out.





>  meta/classes/rootfs-postcommands.bbclass | 6 +++---
>  meta/classes/rootfsdebugfiles.bbclass    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index c43b9a9823..984730ebe8 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -1,6 +1,6 @@
>
>  # Zap the root password if debug-tweaks feature is not enabled
> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>
>  # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>
>  # Create /etc/timestamp during image construction to give a reasonably sane default time setting
> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
>
>  # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
> @@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
>  APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
>
>  # Generates test data file with data store variables expanded in json format
> -ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
> +ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
>
>  # Write manifest
>  IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
> diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdebugfiles.bbclass
> index e2ba4e3647..85c7ec7434 100644
> --- a/meta/classes/rootfsdebugfiles.bbclass
> +++ b/meta/classes/rootfsdebugfiles.bbclass
> @@ -28,7 +28,7 @@
>  ROOTFS_DEBUG_FILES ?= ""
>  ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed with 'cp -a' in the format 'source1 target1;source2 target2;...'"
>
> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files ;"
> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files;"
>  rootfs_debug_files () {
>     #!/bin/sh -e
>     echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target mode; do
> --
> 2.20.1
>
> 



--
Alex Kiernan
