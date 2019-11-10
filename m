Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id EC6D17ED5C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 23:58:57 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h27so8265498pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 15:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tKBf8p4CgFBhHIBxmO+9C7mR4LeD/Qv1wAKcNelPZ7o=;
	b=cSxRjgr3cdbj6uWU0+P9yH4uA13gQU64XETW9DNvkgaFgBmpNwdtiMODiv8HDJUXVJ
	ZsPRHEQyDqHN2XvdVxKvc/DmJJwq1W3kj4TpU3bM5pSBZLTlVsLUxuKOqQc2/IMUopX8
	nj9ZOu4QzXU6hbuaj7i407ao8F5+W/DET8vLA1lB2gdUfJJZsVo55SoqK9zJS8VKTCSj
	PZAviITWCbcHAox6bRkC1XM96vEP1tgDDieVO9Hn5ApzI0qjWaDPDUZ+aXyNyXnkdqmL
	vGA7MHhA88uBOhcydZLYzi17vChV4zihfRPYEMoY5k4MERoctGst8DYStH3onrdbuydZ
	faaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tKBf8p4CgFBhHIBxmO+9C7mR4LeD/Qv1wAKcNelPZ7o=;
	b=tjCwxDL1vFUJRJdUrJd6kCmONL+EBZPfqbpyPhG4oo3F+b4KkEyyCrFe+WcWwmXSu3
	J631YkzWiJojVzukncAxt7wFqe3NwNkOCRgBDy4mNygmfIkWyQlOGjIUpNGqhL9Co14C
	vO+I1HbYYttJTeqtR91IhdEsJKtoWPQbLv5H61LWt4EwueLOdGBgvVB6hcpHEOac0W8c
	Yc5OwTel68avIROgy6MevhTW6fEy4Gp5HsQ6Xlqnr373niKcc3pVX1okZC4f3347qUk9
	03ovrOPR2CAOtufrKqUR3ly0uJs150IZd6LRQSZ7W4/PXoAt043ks9kjmP92ZkRx0p7i
	JJ7w==
X-Gm-Message-State: APjAAAWuSYC+dMU4T8inN2Fg2l/ZqnheuxZly/BoP7MwC+eCP+IzS5Ms
	SV9eCaVNLICoB0s8bbmORO2M5Fft
X-Google-Smtp-Source: APXvYqzU/WCKGItyp2G1MlPqXKVMdnV1H7sCyHkZ9wmkKUB3/gVHc4nEe3bvjQKEBIjkVfhcvenV3Q==
X-Received: by 2002:a17:90a:b393:: with SMTP id
	e19mr1268800pjr.115.1573430338734; 
	Sun, 10 Nov 2019 15:58:58 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7974:a9f:c495:4c6d?
	([2601:202:4180:a5c0:7974:a9f:c495:4c6d])
	by smtp.gmail.com with ESMTPSA id
	q18sm13064758pgv.84.2019.11.10.15.58.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Nov 2019 15:58:58 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20191105214448.2511-10-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <78c2bf06-7a51-5e3a-7794-443afe1a7caf@gmail.com>
Date: Sun, 10 Nov 2019 15:58:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105214448.2511-10-bunk@stusta.de>
Subject: Re: [warrior][PATCH] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Sun, 10 Nov 2019 23:58:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/5/19 1:44 PM, Adrian Bunk wrote:
> 3.7.5 also includes the fixes for CVE-2019-16056 and CVE-2019-16935.

I see a patch is being updated. Reason not noted in commit message.

Also, do you have any issue if I backport the other py3 bugfixes in zeus?

- Armin
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...Do-not-hardcode-lib-as-location-for-site-packages-an.patch | 2 +-
>  ...python3-use-cc_basename-to-replace-CC-for-checking-c.patch | 2 +-
>  .../python/{python3_3.7.4.bb => python3_3.7.5.bb}             | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (98%)
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> index 661f52d01f..ea75262c4f 100644
> --- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
> @@ -70,7 +70,7 @@ index 6e81b2f..671a20e 100644
>   
>   Programs/python.o: $(srcdir)/Programs/python.c
>  @@ -856,7 +857,7 @@ regen-opcode:
> - Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
> + Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
>   
>   Python/getplatform.o: $(srcdir)/Python/getplatform.c
>  -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
> diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> index 5735954628..a0ea897f4e 100644
> --- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> +++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> @@ -63,7 +63,7 @@ index a7de901..4a3681f 100644
>  +  case $cc_basename in
>       *clang*)
>         AC_SUBST(LLVM_AR)
> -       AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> +       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
>  @@ -1426,7 +1427,7 @@ then
>     fi
>   fi
> diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
> similarity index 98%
> rename from meta/recipes-devtools/python/python3_3.7.4.bb
> rename to meta/recipes-devtools/python/python3_3.7.5.bb
> index af3c3259c2..30d4bedef2 100644
> --- a/meta/recipes-devtools/python/python3_3.7.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.5.bb
> @@ -32,8 +32,8 @@ SRC_URI_append_class-nativesdk = " \
>             file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
>             "
>  
> -SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
> -SRC_URI[sha256sum] = "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
> +SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
> +SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
>  
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"


