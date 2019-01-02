Return-Path: <jacob.kroon@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 468846BE46
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 19:32:21 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id c2so3167006iom.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rs/6Z2Uq6fBnCuTfflYXX9XrdLG8TlXNJbhpF65v4/Y=;
	b=B0RyFNmxctulXqclz6cfS0WZa9WCCOv0/jn5CwYi61zX16iRGiOga1GGMSRhRyy3vw
	hEQvHyt0Pjz2nOJZQeDBiyJvCzIx/2gfjZDqluShNz/KCgD1gdKqDLI/ASFlhDPOs/Qv
	EVlvnvXZ4TJ6HdJNCVLrKO4JJhuANgQUG326tHeKFwqMCuxcgL8Gu2g83gTIoRCL4Iy4
	n2xEBpgqDWbyTLIyUh7Fsw4B/digM9KkdUqhqMcdTYRnZ6XmQGuvBow1lNf19Uq5bR8/
	7B76qAzxifDCgDQMh6hzbbPFsYT07QwDJKiFBqjJ0OICNJHiYeBFh7aGQHI+mkMji8+F
	sEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rs/6Z2Uq6fBnCuTfflYXX9XrdLG8TlXNJbhpF65v4/Y=;
	b=CPcqAA7kx71uxe6+M8W9N/ied8K/+TlX1JQbgjxnV2M7XwGZDUAYCzll03/Hb05Amu
	sky8i+QK+1gvFWZTVJ9jTRTImPJnChAOg2bc1vWBsNgxGAnSsTi1TKc/Qj0jPJyC0bNZ
	NSZ/WnodRYYUrnw8uuIvXlwSD7dBfbA1DKTXGGtsWb0bSeUje+M6qYeCrkICJXN4OOby
	TKPwWYvnvRqELfknBBZROYYPUutt4Rs0Np4MZxMbzISKlFxgDt1iy6BM8awwXnWJ7KM7
	0R6uuQ5wW8F54V4VIyq2rtzbyUUGhRfA12VeJg7rZ0LLqWGwaaY35Bk2YFsTi6JW2icI
	Hjtw==
X-Gm-Message-State: AJcUukd1jIDBMmKH+J7rFe5SXbr0zBYqKcwfn5zesc5YlMVQ+Jvjw4Y8
	7/2qJ0rxcUEyrXfUBpOHEu7PfqGABs3B8paMb1Y=
X-Google-Smtp-Source: ALg8bN6XyBmlB+w8cm8Hv0UJV0ERSiMn/fEXTdCvtR9AtNC4Bq3mkF7L/v5plN7ZQc1krH2BHpqmoYtbYIwIHQ488zI=
X-Received: by 2002:a6b:3c17:: with SMTP id k23mr19443157iob.182.1546457542270;
	Wed, 02 Jan 2019 11:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20190102192111.33587-1-raj.khem@gmail.com>
In-Reply-To: <20190102192111.33587-1-raj.khem@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Wed, 2 Jan 2019 20:32:10 +0100
Message-ID: <CAPbeDCm6H0C=nKk=z_uB+SAP_3fJya5UDJKKGSQq9oA6wVdJAA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Wed, 02 Jan 2019 19:32:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 2, 2019 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: pino-kim <sungwon.pino@gmail.com>
>
> This fixes RISC-V gdb-cross-canadian cross compile configure failure on missing bison.
>
> Signed-off-by: pino-kim <sungwon.pino@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index 475e4f08ef..e54766bbb2 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -6,7 +6,8 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN = "gdb"
>
>  DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
> -           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
> +           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk \
> +           virtual/nativesdk-libc bison-native"
>

Would it make sense to restrict this to DEPENDS_append_riscv32/64 ?

>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

