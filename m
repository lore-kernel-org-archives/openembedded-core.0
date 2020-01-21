Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A52D17FD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:04:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 20so1153466wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2gQciT/ECAZL55ftUBgZ5BaiZVElAJlvHXD3GFCXNxk=;
	b=KgpMvTdgb7e0hv0nii87KaJT0oUrcRBeZHp9+u2N+xtTAD+pLCkWz4K18gk/BIk5rp
	POgaug6MKvj4BaShMG+eWBKcNyCDeYebeKRiTSGh0NqlViRA4OsmFnzhdMCm57fXVRDQ
	cE3Zc1pTay+0WlD9lq/vgiFwrJJ+gL3r8ksEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2gQciT/ECAZL55ftUBgZ5BaiZVElAJlvHXD3GFCXNxk=;
	b=bb/XwbuRJUnt5f6nctbL5cEH5sB0GiokhA9+XpHnv8rjJnnWwDvEcd3sH/sC/eznHl
	xaavNhGgpzl3LvRHEdqj45OJWX2WVuXRritAsOMMvdV+6GUzwWCP09HN1ETGIuX50Ajl
	vpJ4r03lbrfd1xeYRV8ePP9Kw2mOR986Ez3s/Tr7fzFq+McuMx9n2w5LhC66FXV/WTrm
	3xV9AZSSLekMvUblx7KAD/+n94J0SLYMJXwUH9AYN3Zvw4+aTYxrKBDIfl++5aquBCdf
	WQxtZlsBqstyanLrwK6fDPClwoHVqwsfo/xwDfx017920FEosrNDNSAE1X02SLo+La6z
	LBKg==
X-Gm-Message-State: APjAAAXZ+gUg5DKvOPqn1PNBpRbMdfTNPjnWZPh37dORNy+tFfy60N91
	K0m9tBv7PuZdWTop2jly4SLGfg==
X-Google-Smtp-Source: APXvYqzGstarGJjp4RAc8SwZv/XpgrUj42oc9KkyCA70LYQ8EtePUYfZssB/bs5eky7omp1jOWPFKw==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr1262262wmf.133.1579565097417; 
	Mon, 20 Jan 2020 16:04:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n67sm1289677wmf.46.2020.01.20.16.04.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 16:04:56 -0800 (PST)
Message-ID: <193655c483d8c4cab252878fe9c857bd8d609187.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan Callaghan <dan.callaghan@opengear.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 00:04:53 +0000
In-Reply-To: <20200120234818.13068-1-dan.callaghan@opengear.com>
References: <20200120234818.13068-1-dan.callaghan@opengear.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] gdb: add PACKAGECONFIG for xz (lzma) compression support
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
X-List-Received-Date: Tue, 21 Jan 2020 00:04:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-21 at 09:48 +1000, Dan Callaghan wrote:
> Similar to elfutils, when xz support is built into gdb it will be able
> to read xz-compressed ELF sections containing debuginfo. This is used by
> the "mini debuginfo" format:
> 
> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 08f615addf..5d670561b0 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -21,7 +21,7 @@ EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
>  
>  EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
>                  --with-curses --disable-multilib --disable-sim \
> -                --without-lzma --without-guile \
> +                --without-guile \
>                  ${GDBPROPREFIX} ${EXPAT} \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
>                  --disable-rpath \
> @@ -37,6 +37,7 @@ PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python
>  PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
>  # ncurses is already a hard DEPENDS, but would be added here if it weren't
>  PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
> +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma"
>  
>  GDBPROPREFIX = "--program-prefix=''"

Is there an extra DEPENDS needed when enabling this?

Cheers,

Richard


