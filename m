Return-Path: <max.oss.09@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 418C86FEFE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 09:50:07 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t2-v6so3681710edr.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zCqCS8U6nE1pkt3XWLJF/XScJReBy6kRhtP4R5FjG5c=;
	b=lvJtuNoGwa584cYFRn8CpF4xCeYljy4m5w+0DfLUerFEZ139UDfpg5RkQHh4/QFNxj
	aBipTCJMZY8mVaD2EUdcjHpVk3vb7YpO4mje23wE0mGcnxLIRokDka9+tPPrlTle0ELX
	jLWOVg/Gg+NeMFgQ9xc8c60kOuHZfnlG7CXI9rSucwkgl6ZnbNzmXQIFD74fvtv9IfXA
	ZJy+5dvS8vM7zKcnU9reXxOuYmH82LIx8W1G0ayoHf65890b6SPHzSZ61g7XhW+wQE0L
	nKbpFM8+OvxccKQ0MvSCqNz0jZhh7bIN5uLqG68Lmbq8KJg6sncXurrhMe0TDhqA287W
	KXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zCqCS8U6nE1pkt3XWLJF/XScJReBy6kRhtP4R5FjG5c=;
	b=iz/ArCVp/UnJh0Zsb0a7CspYW6kCcnqvgDgDoYGz67rsGn5whE+Wd+2YZtYWSRkp7I
	/27BEzeBekz61D7ctOfmaEopCOM6fhoIFdgnk+IenTHwvGVGNXW5CVG58siQX8bQxaAc
	4zZvUtOfsiPLfj+qh/JSIiupMqMWF2J9UfVxRPz5qva8EhoZhFw7mWRIHtimLPWa6iAf
	AY1ctY+3yHwrYhNlqWfyY3cFiEQegTiwr1lpFSAxkkkRSfWK6MfmKLd0B+ZfJOeF4sMK
	C7/Cc6/9X4T8pnLz3aMV15GxjkIrJ48JsfaTpdp6uhn5u5gepxE0e/cn40BNChCEjczC
	m1ZQ==
X-Gm-Message-State: AOUpUlFWJGCTUqLq+lSDzv+3aZO9FcTddnyal439BObt1wwkfN6Sjglc
	BRLVqFu2cpFrj/vqnEBKVREFr2KX
X-Google-Smtp-Source: AAOMgpf97Vu6dxYYaDQqP/TVUFZIUU8rz8+zvDIJc1mxIokHOJfDMtZirLYBmXK/zkjAbGevoBlrqg==
X-Received: by 2002:a50:9084:: with SMTP id
	c4-v6mr14020315eda.179.1533462607997; 
	Sun, 05 Aug 2018 02:50:07 -0700 (PDT)
Received: from Saturn.local.all ([195.48.14.138])
	by smtp.gmail.com with ESMTPSA id
	w3-v6sm8751157edb.16.2018.08.05.02.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Aug 2018 02:50:07 -0700 (PDT)
Message-ID: <1533462606.3114.1.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 05 Aug 2018 11:50:06 +0200
In-Reply-To: <3257c4ab40a5ed8f6df7fa7273c02939fb27ac75.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
	<3257c4ab40a5ed8f6df7fa7273c02939fb27ac75.1533434674.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Subject: Re: [PATCH 08/10] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 09:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Samstag, den 04.08.2018, 19:07 -0700 schrieb Khem Raj:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-tests-Include-linux-stat.h.patch     | 76 +++++++++++++++++++
>  meta/recipes-devtools/strace/strace_4.23.bb   |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> 
> diff --git a/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> b/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> new file mode 100644
> index 0000000000..cbb9c60de7
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> @@ -0,0 +1,76 @@
> +From 264889246fcdd486867e8ca923094afa1689126c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 4 Aug 2018 13:18:03 -0700
> +Subject: [PATCH] tests: Include linux/stat.h
> +
> +Starting with glibc 2.28, sys/stat.h header will have the
> +definition for struct statx, in which case including  linux/stat.h should be
> +avoided, in order to prevent a duplicate definition.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2018-August/008329.htm
> l]
> + tests-m32/statx.c  | 7 +++++++
> + tests-mx32/statx.c | 8 +++++++-
> + tests/statx.c      | 8 +++++++-
> + 3 files changed, 21 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests-m32/statx.c b/tests-m32/statx.c
> +index 816b7eb..7364a02 100644
> +--- a/tests-m32/statx.c
> ++++ b/tests-m32/statx.c
> +@@ -30,6 +30,13 @@
> + 
> + #ifdef __NR_statx
> + 
> ++# if defined(__GLIBC__)
> ++#  if !__GLIBC_PREREQ(2,28)
> ++#   include <linux/stat.h>
> ++#  endif
> ++# else
> ++#  include <linux/stat.h>
> ++# endif
> + # include <linux/stat.h>

Shouldn't the unconditional include be removed?

Max

> + # include "xlat.h"
> + # include "xlat/statx_masks.h"
> +diff --git a/tests-mx32/statx.c b/tests-mx32/statx.c
> +index 816b7eb..e9f9993 100644
> +--- a/tests-mx32/statx.c
> ++++ b/tests-mx32/statx.c
> +@@ -30,7 +30,13 @@
> + 
> + #ifdef __NR_statx
> + 
> +-# include <linux/stat.h>
> ++# if defined(__GLIBC__)
> ++#  if !__GLIBC_PREREQ(2,28)
> ++#   include <linux/stat.h>
> ++#  endif
> ++# else
> ++#  include <linux/stat.h>
> ++# endif
> + # include "xlat.h"
> + # include "xlat/statx_masks.h"
> + # include "xlat/statx_attrs.h"
> +diff --git a/tests/statx.c b/tests/statx.c
> +index 816b7eb..e9f9993 100644
> +--- a/tests/statx.c
> ++++ b/tests/statx.c
> +@@ -30,7 +30,13 @@
> + 
> + #ifdef __NR_statx
> + 
> +-# include <linux/stat.h>
> ++# if defined(__GLIBC__)
> ++#  if !__GLIBC_PREREQ(2,28)
> ++#   include <linux/stat.h>
> ++#  endif
> ++# else
> ++#  include <linux/stat.h>
> ++# endif
> + # include "xlat.h"
> + # include "xlat/statx_masks.h"
> + # include "xlat/statx_attrs.h"
> +-- 
> +2.18.0
> +
> diff --git a/meta/recipes-devtools/strace/strace_4.23.bb b/meta/recipes-
> devtools/strace/strace_4.23.bb
> index 0c159fc6f6..d966a77b89 100644
> --- a/meta/recipes-devtools/strace/strace_4.23.bb
> +++ b/meta/recipes-devtools/strace/strace_4.23.bb
> @@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://mips-SIGEMT.patch \
>             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
>             file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
> +           file://0001-tests-Include-linux-stat.h.patch \
>             "
>  SRC_URI[md5sum] = "fad4bba0947553cef34d46a9fd78f039"
>  SRC_URI[sha256sum] = "7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad"
> -- 
> 2.18.0
> 

