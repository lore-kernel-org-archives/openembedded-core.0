Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 46BE17BDAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 21:59:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r200so5612387iod.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BZjbOLICKfR/dJSG6LJqzpQN3lb+hgZuzyTF6QOXSbg=;
	b=s8+avaClSNNehPs+Al4uvZbcHY5QIa3KLaZCsOVg7/M46G/9AesiyRWK5oILhyVv5R
	YAM+TecxCQja9bxLieEw8Xe3ozMVxVo5yuEl222TUpxeJ46zDgrzmM+NBG00zK4B1wy4
	Z6vbFLlyTcT5mG9Y4Ger65Ar2eY5d0tUdINn6SLLxO0a/tBMWITKOMKGAnsMHqk2vom7
	zws3Uhct/WEADOryvqf0RMq6Mpj6zV2LChJVBDEeX2e/Wa+428+ovCfOrHheizJEGskm
	JX43mr1nzImF25x1Mk+Rm2g34C/rwtxAiatO2pyHBvYa8ckCOO4Xwqgq3WPKCsmMQw8a
	Q9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BZjbOLICKfR/dJSG6LJqzpQN3lb+hgZuzyTF6QOXSbg=;
	b=cTalONZBo9ndpzIxmSpkgdWPJcPLwBB/Zfd7ZWahf34mx2md4LTwg0GmBcxiULvkV0
	ygUSotcdrzXHR96Dqqk5VJ68TikvRyOmHk6zgrrR11qQFdQFvnqSO/HfcW4yCWEWcFgp
	RiwqzUKzVVtxXxY3DWqp71vGvplGv7pGcGOfZPNwFvuHlVghv9jGbe+sHYWbJDF5DoNq
	VLM8253jqO1cEESm0JaKUDjTF9s/U3P5Ays0JUhKASnmQ/Fk+mHSc+NBgYLhbIB4BFn6
	CnYBfRfsu5DIwRS2Y6y4LpZD0O+Z6JHU0sxj88GcxyFPWoSFuibNQNTsvyHk9MbNmKy/
	M2bA==
X-Gm-Message-State: AA+aEWaVcc95VGDBFJ3dtPPYj3G79aRwdIQazP/NwwPfmriFiw7ovger
	VUKWVUpkTEuVOWA0g/7w02RrLumylkiq91flhuFfXLLV
X-Google-Smtp-Source: AFSGD/XCipw2jyNz/LZpBrROVQ8tJEIPHaNOobUhU0Xmp9MLkWb+eSgswy5OWea0YusrX71q+9gYb3/WBDN2H67oHMQ=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr3594821iog.270.1544824785120; 
	Fri, 14 Dec 2018 13:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
	<20181214181430.1517643-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20181214181430.1517643-1-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2018 21:59:33 +0000
Message-ID: <CAJTo0LZ-n+qXh84xGuUw-GtEceutXV0pXshdDZ6UNgjakY+p+g@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: build with recent attr
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
X-List-Received-Date: Fri, 14 Dec 2018 21:59:44 -0000
Content-Type: text/plain; charset="UTF-8"

We also maintain pseudo so lets get this upstream first, and then
backport the patch.

Ross
On Fri, 14 Dec 2018 at 18:16, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>
> Recent attr package removed <attr/xattr.h> which is shipped by libc
> for a very long time already.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  ...001-use-sys-xattr.h-not-attr-xattr.h.patch | 54 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch b/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch
> new file mode 100644
> index 0000000000..5eddea5ba1
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch
> @@ -0,0 +1,54 @@
> +From 7132668ce2409e0919a79d6f236827665f068427 Mon Sep 17 00:00:00 2001
> +From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> +Date: Fri, 14 Dec 2018 18:41:04 +0100
> +Subject: [PATCH, pseudo] use <sys/xattr.h>, not <attr/xattr.h>
> +
> +<attr/xattr.h> has been removed from recent attr package:
> +
> +   The xattr syscalls are provided by glibc since ages, so there is
> +   no need to use the indirect system call "syscall" anymore. This
> +   removes the need for the <attr/xattr.h> header; use <sys/xattr.h>
> +   instead.
> +
> +   http://git.savannah.nongnu.org/cgit/attr.git/commit/include?id=7921157890d07858d092f4003ca4c6bae9fd2c38
> +
> +For Linux, we have to include <attr/attributes.h> to define ENODATA.
> +
> +Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> +---
> +Upstream-Status: pending
> +
> + ports/linux/subports         | 4 ++--
> + ports/linux/xattr/portdefs.h | 3 ++-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/ports/linux/subports b/ports/linux/subports
> +index a29044a..44e0e9e 100755
> +--- a/ports/linux/subports
> ++++ b/ports/linux/subports
> +@@ -29,11 +29,11 @@ fi
> + if    $port_xattr; then
> +       cat > dummy.c <<EOF
> + #include <sys/types.h>
> +-#include <attr/xattr.h>
> ++#include <sys/xattr.h>
> + int i;
> + EOF
> +       if ! ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
> +-              echo >&2 "Warning: Can't compile trivial program using <attr/xattr.h>".
> ++              echo >&2 "Warning: Can't compile trivial program using <sys/xattr.h>".
> +               echo >&2 "         xattr support will require that header."
> +       fi
> +       echo "linux/xattr"
> +diff --git a/ports/linux/xattr/portdefs.h b/ports/linux/xattr/portdefs.h
> +index 367ca60..bb577f1 100644
> +--- a/ports/linux/xattr/portdefs.h
> ++++ b/ports/linux/xattr/portdefs.h
> +@@ -1,2 +1,3 @@
> +-#include <attr/xattr.h>
> ++#include <sys/xattr.h>
> ++#include <attr/attributes.h>
> + #include <stdint.h>
> +--
> +2.19.2
> +
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 79e0b6bd21..a0147d2d19 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
>             file://fallback-group \
>             file://moreretries.patch \
>             file://toomanyfiles.patch \
> +           file://0001-use-sys-xattr.h-not-attr-xattr.h.patch \
>             "
>
>  SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
> --
> 2.19.2
>

