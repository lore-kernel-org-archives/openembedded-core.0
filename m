Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94ACF7D075
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 06:59:58 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w6so13601858lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 23:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=SzT0+vRd14TerWm0WsHe8YarVvqHTQ3nF3NOrQ763po=;
	b=LqualY4tKCqPTdByes6uh0lHhkBib5gWAkhPSR3elzHcL/MUJ1x4eJ8ImFu/BP55Qv
	D27/Bi/7neNs10Qe82KB5TbTdWJ1mWrt05lBLRwtFlUgOy+mFWivVNe8cAooEoHN0iu6
	vqvpB5rtztpkRZDMsfeVKrIkfZUaPYIHIJ5G1jIkPutPZNfqod5decf76iEINUhG1QwH
	zJsvmME9fs2rn//PAK635ETGtkeTwqN5KDivp/Vl1l3ULgaZONr5GwhgJIZfGxmhrKe1
	ycdeiOE4G2SP2cJm7NjEnuWDVHkeMtMmIYwJlGG8XNiY4fNNhqYYtFj7NU0CQrgGSJsf
	boLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SzT0+vRd14TerWm0WsHe8YarVvqHTQ3nF3NOrQ763po=;
	b=ZpAeM/BUbLIbA9PH50KW4OSOMV5Ct4+zyBIzWxf9EBu90FZJVpvb6bnBJjaEQ37csn
	/jTjPlOq50fOlgR9tg8db7if+7d9ZUyp8JgM1iK0NCbnQe+EafLLWdAow1PjstfTZz2N
	M4h+Fh5YnWJZHBtwl8dnMtwSo7+Fpp7jZdbnbH6gu780HvDPnCxYNs7NyWatAiJfJ3Vh
	78BCLB7hJbQHdYw0vNRab0/qreN0P53DcExhsFSispfVTVC7l6sylQNg8bdJEbeVBi+f
	7q7AfOlZOXW6fE6QJubyaO48ApQZZg9q7/GUplVvEtF+S0FqR418+5PAHcDku34IM4iU
	tagQ==
X-Gm-Message-State: APjAAAWz8Ajc9rBGN/VeW7FpcVLJ1rNrnUIWAzKs651aFjrWs+Hq31hp
	GwNv5xhFnJEAuZeJZopDu28h8BmuNMI=
X-Google-Smtp-Source: APXvYqz7591KP9Xdl2zr1sA/JiSs/xlREanmJd0bxwncK/O6zZTU8ry672mRWZ3Wp1wf9aZY0zBWuQ==
X-Received: by 2002:ac2:51b6:: with SMTP id f22mr19486799lfk.175.1571122798634;
	Mon, 14 Oct 2019 23:59:58 -0700 (PDT)
Received: from [192.168.51.70] ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	r19sm5025572ljd.95.2019.10.14.23.59.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Oct 2019 23:59:57 -0700 (PDT)
To: Dan Callaghan <dan.callaghan@opengear.com>,
	openembedded-core@lists.openembedded.org
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
Date: Tue, 15 Oct 2019 08:59:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015061510.21803-1-dan.callaghan@opengear.com>
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 06:59:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: sv
Content-Transfer-Encoding: 7bit

Den 2019-10-15 kl. 08:15, skrev Dan Callaghan:
> Elfutils has optional support for bzip2 and xz (lzma). It uses
> this for decompressing embedded ELF sections like the .gnu_debugdata
> section for "mini debuginfo":
> 
> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
> 
> Previously this support was unconditionally disabled but the reasons for
> disabling them seem to no longer apply. Both the target and native
> variants of elfutils can build successfully against both bzip2 and xz.
> 
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>   meta/recipes-devtools/elfutils/elfutils_0.177.bb | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> index 78c3791936..86e76d706a 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceware.org/elfutils"
>   SECTION = "base"
>   LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -DEPENDS = "libtool bzip2 zlib virtual/libintl"
> +DEPENDS = "libtool zlib virtual/libintl"
>   DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
>   # The Debian patches below are from:
>   # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
> @@ -46,8 +46,12 @@ SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
>   
>   inherit autotools gettext ptest
>   
> -EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
> -EXTRA_OECONF_append_class-native = " --without-bzlib"
> +EXTRA_OECONF = "--program-prefix=eu-"
> +
> +PACKAGECONFIG ??= "bzip2"
> +PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,bzip2"
> +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
> +
>   RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
>   
>   EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
> 

If I get it correctly, previously the recipe depended on bzip2, but for 
native it was actually disabled at configure time. Can't we just skip it 
for native then, since it hasn't been required sofar ?

You can do

PACKAGECONFIG_class-native = ""

Jacob

