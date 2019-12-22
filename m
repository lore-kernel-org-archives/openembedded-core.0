Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 407CD7F96B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 17:04:55 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c26so13341487eds.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mOwKjfiLY043gXBJ4vt+dpXXgFVXZkZgxrQGqilgRx4=;
	b=jDwC8GJj3Ubtd6B4v3yfMj7c5VbuvJzqHz1jQ9qbBYWUl+ZuWAZAcLsuT+CltG+jmx
	81mQWtTpUk2pd3Re5ilRKuZyyLPO94z20ljSI0oNAHlC+y3ChheY4dSVBTJoUe0wSE+I
	WpDkeDiDYRetmNnuoaZNkBhjdFznHH5l6akGxxx5ItsKjf3j+qOyJdNF0F5cwtizu1ZK
	S5PszTwr7+ucMSH74TdMH/dW/v2BWVM0uq5FtHJrU1qEAXm1JvznYuqdwfR75kKnZr0R
	vTRc36hqzixcvfOcQvAsBoWUZSFFlUvnMEC6D4bDCpEgKeJUeAkXfFtSVNRql9km9ROb
	wDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mOwKjfiLY043gXBJ4vt+dpXXgFVXZkZgxrQGqilgRx4=;
	b=BGN275DAojKz2lpn1dsHXS60I1q2peVu5r6RgNKTeFnXWi3UgbX5m6qv58BsLPgcXg
	tJRUyTl6sbdqvYYF6gao9obNN0JmqVBQD/COQ+/AzlsPG2Z4ODTOCzUj/kzggphs7ShI
	N2vxi7VvuvvYAeKQdvjn8dvYaiN/oNRh2SE4+743b+23ZnmO8cuFLu1z1XkbVNIXp7PI
	8WdJbwk2f9KjmOhZXOmNJ3o+x3lRfv/NmnAoHSSaMTTzhGfoBdi11IlOvllON0ao0o8P
	PN0I8gqeakvI9ajVucHnf8hPYRlfVYMYOcH/wZzYyYIbuX5cscpiB0H8/UU5xDaIgaLa
	YjGg==
X-Gm-Message-State: APjAAAU017g0JNRWmugwOJCkFA3gNaUQgjqH1zXCYUPMPhDNqgbQqObl
	/Gb0lTWofbke1ybycjkCQLsE2dbUpwIxcz+SZ1E=
X-Google-Smtp-Source: APXvYqzyqKOnjAiUWleh2wZgPfjRYTRY/Jjb3W8cPIztwcOA3ugQosmVGoPeeVXLA/SBa3PZP1o6TSG5B+LgOk5CCgw=
X-Received: by 2002:a05:6402:1659:: with SMTP id
	s25mr28112463edx.219.1577034295770; 
	Sun, 22 Dec 2019 09:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20191222040549.286151-1-raj.khem@gmail.com>
	<20191222040549.286151-4-raj.khem@gmail.com>
In-Reply-To: <20191222040549.286151-4-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Dec 2019 12:04:41 -0500
Message-ID: <CADkTA4Of55K6p5QwTv01gTA6YF2MeGFSK6_9RYcHtSdSaCyZzA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-yocto: Fix build with gcc10
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
X-List-Received-Date: Sun, 22 Dec 2019 17:04:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 21, 2019 at 11:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

Thanks Khem!

As usual, please don't merge this patch directly, I'll apply it for
linux-yocto* and linux-yocto-dev so we have full coverage on the
reference kernels.

I can send SRCREV bumps tonight, once I've done some quick build tests.

Bruce

> ---
>  ...sed-64-Define-__force_order-only-whe.patch | 42 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.2.bb  |  2 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
>
> diff --git a/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch b/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
> new file mode 100644
> index 0000000000..bd48de6dd9
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
> @@ -0,0 +1,42 @@
> +From 199caf12cdbe24796dc31fbd4fe5729ba2acf659 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 20 Dec 2019 17:42:02 -0800
> +Subject: [PATCH] x86/boot/compressed/64: Define __force_order only when
> + CONFIG_RANDOMIZE_BASE is unset
> +
> +kaslr_64.c also defines the same variable, however when both files are
> +included into final link, linker complains about multiple definition of
> +`__force_order' which is coming from kaslr_64.o and pgtable_64.o, its
> +possible that kaslr_64.o is disabled via CONFIG_RANDOMIZE_BASE config
> +option, therefore define it conditionally only when
> +CONFIG_RANDOMIZE_BASE is not set
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> +Cc: Kees Cook <keescook@chromium.org>
> +Cc: "H. Peter Anvin" <hpa@zytor.com>
> +Cc: Ingo Molnar <mingo@redhat.com>
> +Cc: Thomas Gleixner <tglx@linutronix.de>
> +Cc: x86-ml <x86@kernel.org>
> +Cc: Arnd Bergmann <arnd@arndb.de>
> +---
> + arch/x86/boot/compressed/pgtable_64.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
> +index c8862696a47b..077d19268b0b 100644
> +--- a/arch/x86/boot/compressed/pgtable_64.c
> ++++ b/arch/x86/boot/compressed/pgtable_64.c
> +@@ -12,7 +12,9 @@
> +  * It is not referenced from the code, but GCC < 5 with -fPIE would fail
> +  * due to an undefined symbol. Define it to make these ancient GCCs work.
> +  */
> ++#ifndef CONFIG_RANDOMIZE_BASE
> + unsigned long __force_order;
> ++#endif
> +
> + #define BIOS_START_MIN                0x20000U        /* 128K, less than this is insane */
> + #define BIOS_START_MAX                0x9f000U        /* 640K, absolute maximum */
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> index ff0f547399..5af0924808 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> @@ -29,6 +29,8 @@ SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
>
> +SRC_URI += "file://0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch"
> +
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  LINUX_VERSION ?= "5.2.20"
>
> --
> 2.24.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

