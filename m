Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B71A96C0ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 10:58:46 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id z7so3057453iti.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 02:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=llBuDbnj3lSa7YgRI/8iqYL9ghVo/FYGgWV9XbojSoQ=;
	b=d9Sg4xKLZRueY/WOoLIwehy4bvixUqCoy4nOVlRMOGCC7fGqFn5WaKFUmjsALr8Nnw
	Rsxu8KYJ0DIrqfC3Rq3IbHmj2PcNJsmZUcxbD9DRgaeNO6Vqkj7X0t3SDBlt0P+uc09T
	h9oiEawvu2Gu1RjJkD+kwvC3udFVVngDIN/NIOJUuYHFY51pcD7dGqSh5UtJF4Q8G96W
	5BCSmPGpRY3Izjfkila8mB7X0m1qcrSQpzNETsql9+t0OCBiCeYN5JkyvJwVX9Zf9Dte
	TjlXcCOqLk6F9pOmTQUOvkvJqRI6Zc0XyFxnyJGbl5BJaz8Or5+Fj+GX7AJifyu4P8OY
	IsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=llBuDbnj3lSa7YgRI/8iqYL9ghVo/FYGgWV9XbojSoQ=;
	b=G6KZ1zwWoze4F7Jhp4NJ/ehSuYEGqHXvNRzmeod19A/cKExRqev7OqU+gjyvgmEH77
	1u04LF/c0ve2Ziwl4gB+VBO8mpGEi57NIATjxZBdOlG6jYU5WjYt/xW2bZJKACuQ04sc
	Hyex/lX0zUCi8nK9jA2fCQJ9bdhLURmZ+r1UAn6DiVIt4W9Md9jn+5H8G2mXRm2rJtV9
	F92EYbUtmTQB3Y4N/LcG6wRXI4IAJR5x3OAIHuzKUBFjHq1Jff6/CzuERYdhMph0k7eM
	Dr2zwsnEObLU50NkrVK62suOn5EYzKHpisLKJ9qZ/c85RYuMrYmkeWbSHkOnTkHMxcaT
	b9zA==
X-Gm-Message-State: AA+aEWb/eLJxQV2ODICqFg53LPF4MO5J7RTTyTq0vsCXzqztwbS+lB7U
	ZELZGMFdZFdZuvAfhd271D1wNEteDCoM/87QIyqtew==
X-Google-Smtp-Source: AFSGD/Wvq3zphhHJ/2iNkgpHfrytUNBq0J86ItZIh3UvRpEwztgEKFB2BNL7SqOs9LNoanjKMrfmFyPrTfNU5ekELcQ=
X-Received: by 2002:a02:57c4:: with SMTP id b65mr22846690jad.79.1544698727614; 
	Thu, 13 Dec 2018 02:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20181213105006.19131-1-anders.roxell@linaro.org>
In-Reply-To: <20181213105006.19131-1-anders.roxell@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Dec 2018 10:58:35 +0000
Message-ID: <CAJTo0Lat5WK1ne7B0evFMWu2mTzY7j+Tt48_9ACoCnOWr939jw@mail.gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: add coreutils to the HOSTTOOLS list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 10:58:46 -0000
Content-Type: text/plain; charset="UTF-8"

Did you test this?  HOSTTOOLS is a list of commands, not packages.

Ross
On Thu, 13 Dec 2018 at 10:50, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> In newer kernels fold gets used, see output from a build:
>
> .../kernel-source/scripts/atomic/atomic-tbl.sh:
>    line 183: fold: command not found
>
> Rework so that coreutils is in the HOSTTOOLS list.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  meta/conf/bitbake.conf | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 64800623545e..a825be4628b0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -478,14 +478,14 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
>  # Tools needed to run builds with OE-Core
>  # python is special cased to point at python2
>  HOSTTOOLS += " \
> -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> -    cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> -    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
> -    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
> -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
> -    sleep sort split stat strings strip tail tar tee test touch tr true uname \
> -    uniq wc wget which xargs \
> +    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm
> +    coreutils cp cpio cpp cut date dd diff diffstat dirname du echo egrep env
> +    expand expr false fgrep file find flock g++ gawk gcc getconf getopt git
> +    grep gunzip gzip head hostname id install ld ldd ln ls make makeinfo md5sum
> +    mkdir mknod mktemp mv nm objcopy objdump od patch perl pod2man pr printf
> +    pwd python2 python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed
> +    sh sha256sum sleep sort split stat strings strip tail tar tee test touch tr
> +    true uname uniq wc wget which xargs \
>  "
>
>  # Tools needed to run testimage runtime image testing
> --
> 2.19.2
>

