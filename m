Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.26425.1629130507624505171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 09:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWmskGzA;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d9so14629996qty.12
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MFWIeZo47oADTUG0pgoVyX1s/VxHtbVkosLUlYzWBZg=;
        b=ZWmskGzAHBpyuk4f4hWH50LocSGCzg77lHTXOL2yKsuAtSIM90MzVcwR7FmQnz3vMI
         aMOG5gILDtzKjOJXiudiRO06p3t7LkJYvC3bMX60xJDON0wCDBI0hn2kCXZTjFKftb8v
         +qgEFqTBF6XzysMbOfkwUqOaomhmsEx1IuLTr7nJYJYjmgGjulJUt6TRofr7G3YTrBi7
         qbVbUXEjxFzRUfhi+nLeVZvOuZRzCL5Br0y4VR4VL2E7m3SoTNbBSR+1uxGTym52JtSN
         ZsBVg/1axR0qrgk7k0ntZLZX2YzFN/lE8tV7Go/H0i+wYwW96YxQBjUIO94HjXlRqp96
         ZETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFWIeZo47oADTUG0pgoVyX1s/VxHtbVkosLUlYzWBZg=;
        b=VgR8gt4i9iFoYXOZRUzeQRXeh0Nw7v2U8tpR8LX7bFwU9Hb7XCDlATDtrTPrfZh4u+
         dW1ml8xKH0kiwVKUx80C1N9tcZNozN4oBhvSZ+6AwPLohsRuXdhGLhI/QPw2I9bcIZUj
         yw/LyjnuyIaP3n3nuOb+ZplBUmN9ghsDg1vSzqfD/WLIEgyMyLWDS38bNGpMoqZu3ZWt
         JWp/TJUbQiwgOYimMynCrT5lKlKlJmUwPc4nts1f5R4FCAZx2S3xLdqitGUPt+Aj/iOx
         hJs8VQXWAlb8G56AjFs3xIvicyyvBuzh9Q/s5cKOs1NeCgPWM3t6RPshlcfzzPy8RSXa
         ST7g==
X-Gm-Message-State: AOAM531WYtWQfNZcASWtKDuy3QIhrWQm1MzwhUHyLO/jDeP3UqBIJc+A
	UIC8v+NAZ+Zk6zEoTYiQXwm14WxPqBuTeVeC9eI=
X-Google-Smtp-Source: ABdhPJwBC0wU41oJM04HyUGAreubh+7cPXK9c95HVR5jdwJq0ygQXQ7V9GjRvgIiZ9cvEueohZnTW9aMk0gfEk0CgYI=
X-Received: by 2002:ac8:7d48:: with SMTP id h8mr14214152qtb.299.1629130506712;
 Mon, 16 Aug 2021 09:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
In-Reply-To: <20210714134248.21366-1-JPEWhacker@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 16 Aug 2021 09:14:40 -0700
Message-ID: <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 6:42 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Adds the command line compression tools which are needed by bitbake
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f451ba6a47..3801db7d42 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> -    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
> +    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> +    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> -    uniq wc wget which xargs \
> +    uniq wc wget which xargs zstd \
>  "
>

on ubuntu 18.04 we will need

sudo apt install zstd liblz4-tool

>  # Tools needed to run testimage runtime image testing
> --
> 2.32.0
>
>
> 
>
