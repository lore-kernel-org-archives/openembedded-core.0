Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 76C6B7FBCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:22:54 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r14so28507633qke.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EFSswnpZKdBCWapoJB9IgAq3pOnzLWCT9oVhAayn95M=;
	b=noAidIxe2zSdC72sJnMfzg6ZsHbnnjNq23b4Xp72Fw0Q+YpbeZ6Y+WaEhM3QqOvDgX
	RTkazBOB/nDb0yLu7MGJMkxyIGZZK6t5Ra2HYYU08syotWs+HAVaETdxqJb3OJROu08B
	miibUL/wb+AeN+gcFnuhDxjn+VHw/Xk7nd1y8oDwslwyeijoWfT7O68X95EfSRZCy5/e
	PMD9MYupExcOa/uJKZUZloVK7jc/wq0g40JAMXVf+B9D3Nj8G4fJe+1PeH+fXVmPQH+y
	I/It9fkANHOMXjEICGqxGK1vmzN6ZQQpDP2tXa+i7zeD3YCSosNRjhrqp8J7CV2BLBDe
	IpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EFSswnpZKdBCWapoJB9IgAq3pOnzLWCT9oVhAayn95M=;
	b=idwIJYJFLb4cJqmELxyIw91Ri/n/XhGr8di8LKqqWEe6Ng5KJtKdtOpnU0fTkzii6Q
	0PWzZtINLplwIG/D8wws3JtW2xYmGWoW2eD59DHK+MwFL4NwMxWR0O2exdIJ9oIMJuFA
	aFSNEYcHNQRTsVCbr3gVdr562B1lh+R24dRjtnCxX3XqltIA2go9rir6Xe+RvT0ZGr1t
	s65RFUFXhjG5c0avuhic2eRdaNlp7YRGWZKjJUfWCrZpD791jA/tf6HQBMqLSXGIt5bu
	1VvrAnOAgiav1MAqxkrCAE+Vs3/xqXqazW28iwIV4tNw8RTSRvaZntqRBWXoyKVsKXHl
	7zXw==
X-Gm-Message-State: APjAAAV3rx+NgAM8NrHT3fLJ9QM+wOliLhBDg8zZGHBatKD2jbycvpni
	6r1Sn2HU8O/VemACY/bdpnK6vjZksCN2wHM6TpQ=
X-Google-Smtp-Source: APXvYqwDvsC/smv6b1TmB+Eb00J1aCHKzVswF4Xl/vDvIWExrY1PH9s2hXV0GDaW4B0Qhjkd86e/ioPkd1rR00oMjTA=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr43047712qkg.71.1579479775113; 
	Sun, 19 Jan 2020 16:22:55 -0800 (PST)
MIME-Version: 1.0
References: <1579402907-13849-1-git-send-email-alejandro@enedino.org>
In-Reply-To: <1579402907-13849-1-git-send-email-alejandro@enedino.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Jan 2020 16:22:27 -0800
Message-ID: <CAMKF1sp1usXA9Ybu-PgYB7-s2gZS=U8NZdtC-0hdPp=SvSL_rw@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure: Enable the use of different symbol versioning
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
X-List-Received-Date: Mon, 20 Jan 2020 00:22:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 18, 2020 at 7:02 PM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> While the gnu style for symbol versioning is the most usual,
> --enable-symvers[=style] can be provided several values,
> gnu, gnu-versioned-namespace, darwin, darwin-export, and sun,
> depending on users needs.
>
> Introduce the SYMVERS_CONF variable to allow the user to
> configure the symbol versioning in shared libraries.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 24ba8ce..bb4f692 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -17,6 +17,8 @@ GCCTHREADS ?= "posix"
>
>  GCCPIE ??= ""
>
> +SYMVERS_CONF ?= "--enable-symvers=gnu"
> +

just turn the RHS into variable not full option

>  EXTRA_OECONF = "\
>      ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
>      --with-gnu-ld \
> @@ -27,7 +29,7 @@ EXTRA_OECONF = "\
>      ${GCCPIE} \
>      --enable-c99 \
>      --enable-long-long \
> -    --enable-symvers=gnu \
> +    ${SYMVERS_CONF} \
>      --enable-libstdcxx-pch \
>      --program-prefix=${TARGET_PREFIX} \
>      --without-local-prefix \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

