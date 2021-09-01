Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.930.1630525109998889248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 12:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RDGWKspb;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: grembeter@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id ay33so686079qkb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+fhj0SSSJXyPz6Fa7dw6xS8yGXyt4jQkYeEZdIO6WAo=;
        b=RDGWKspb54Mgx9xlbbmrMG/u7THM/O5NwUsFGJFjtwk8YFSf4KBgBqpWxKV+maXTMl
         xMY8IrUp+n36MIhMkO195lyFoSAsngZafIY1ggTgJaN0pFfi1I4cagtcdjrqemw2pnUN
         GcY2lfF+SKSbgJK7PIgzWbk7Gwcfbz1It0wTWR45lpULmtYp7iko94YzlyUpdSLIt4Q2
         Ijfo4FIkn9M6luzFge0W7fsMLhw10WmGgrZuIZFWfgJ9PlZ45f+0QyEBXw1bZXQ2jmFs
         8wt2v7Bgej4QF/3zwyZH8bHBcpx6gXPqe5MHgFBqjZrfwOynw2ZhEYZxNIaSra4q3ie6
         2c1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+fhj0SSSJXyPz6Fa7dw6xS8yGXyt4jQkYeEZdIO6WAo=;
        b=df98hw5agjFQ23wqJAzwR+NSc9Lllk9I7UoXnNXAphuEzR7t5/3kVy4P0LWGLT5sGB
         F26+i9DHCgt4Z3XcS9EACQziRraRY+TjAuzqcW5Tdoj5CIK6GJg9a1RHbV+UPWcYMpA4
         zdE9HsqoYv0JRVFBolIyYz8WNXZkKfolB1R0pPSUZCdwtm09ZgnBGULuhVe/flFBTFpm
         HS3SJs5J3rrtWlKOCTasTR4JviiykaJIIqHlth4tOYqat1ETI6O11PDNQknqKjpZgvQq
         PE9chPmwBQtmfmE7+vz1bGrtdQpNbPqC6a9h7uVA8rt1kkDbBEwzAN8PcD79Kch/vGvw
         U6eA==
X-Gm-Message-State: AOAM532UF+SqWkVzeSvRnR2GEhBtSWx6OGd3FTf3K3AjaEAzpb/NyQtx
	PgW3ElV/ZpbnUaRQ61/XyNGgjTvJeJI+CLDD/tU=
X-Google-Smtp-Source: ABdhPJysKBVuRH65wCAOcYZe0QOY7JWkyc6zO1WtOC+EH626d/b1Unp+2BrqHik9My+XOBmOClvq8wIfkQ/CWQapcQo=
X-Received: by 2002:a37:8e44:: with SMTP id q65mr1271981qkd.372.1630525109048;
 Wed, 01 Sep 2021 12:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210901193329.2911525-1-grembeter@outlook.com>
In-Reply-To: <20210901193329.2911525-1-grembeter@outlook.com>
From: "gr embeter" <grembeter@gmail.com>
Date: Wed, 1 Sep 2021 21:38:18 +0200
Message-ID: <CAGFuAuzoeSrCK5L6BycFMJEjWxiY29MQPEcQqrWOEof0+KXKCQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH] Revert "sdk: fix relocate symlink failed"
To: steve@sakoman.com
Cc: grygorii tertychnyi <grembeter@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

I observe the same sed messages in hardknott, would you please
consider applying it there as well?

On Wed, Sep 1, 2021 at 9:33 PM grygorii tertychnyi <grembeter@gmail.com> wrote:
>
> This reverts commit a155c4d4ca841ef492213a5f0b9121703c62e2b4.
>
> Otherwise, SDK installing fails with:
>
> Extracting SDK...........................................................done
> Setting it up...sed: -e expression #1, char 0: no previous regular expression
> sed: -e expression #1, char 0: no previous regular expression
> ... tonns of lines ...
> sed: -e expression #1, char 0: no previous regular expression
> done
> SDK has been successfully set up and is ready to be used.
>
> Original commit message mentions commit bc4ee54535 ("sdk: Decouple
> default install path from built in path"), that is not part of
> dunfell. Hence, revert this fix.
>
> Signed-off-by: grygorii tertychnyi <grembeter@outlook.com>
> ---
>  meta/files/toolchain-shar-relocate.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index ba873373e29e..54337412966c 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -72,7 +72,7 @@ fi
>
>  # change all symlinks pointing to @SDKPATH@
>  for l in $($SUDO_EXEC find $native_sysroot -type l); do
> -       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
> +       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
>         if [ $? -ne 0 ]; then
>                 echo "Failed to setup symlinks. Relocate script failed. Abort!"
>                 exit 1
> --
> 2.30.2
>
