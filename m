Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F05210BA45C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:32:27 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68096.1774603941351809449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F+9MrnYo;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b6d9c981so1192360f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774603939; x=1775208739; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLLbZ1DoXad71hBS/PIfHDL+dSnAotZ8JJ49T4VJ51A=;
        b=F+9MrnYojxWuv5aj5Qx3E9QgoLg0RXF9ivJRTDzbjl2H48xzZP+5zyclQFR/0pF1Bs
         cuo4x3Y9+pAghsDBa/5m+Qb76Ub4OhAwKUM7Fk5ZKSJrGZ/sDD9dPeT7Oa+Mg3UrVs/9
         R49hsbEJ++8kY7leXNXriDbbxU/qmPyav9nTKiH0xJq9YyjYU3/daqnkol0rMftwc1AH
         kMf1mSNcH5564MyijSjB0bI7ISlKH3wucyXYjTbXwtV9p5liPLktk8bx8YIGgO7Y4n5p
         JAwOKsgZm68dz/Ds723IKf5VFlfZIQqA5Rb8m8uR1R+oNHuQSC7l12ztkbL45ZBUpGkA
         wm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603939; x=1775208739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLLbZ1DoXad71hBS/PIfHDL+dSnAotZ8JJ49T4VJ51A=;
        b=KUSypdzoKIJLBGF9i0mCNX8Sf0nyqkP0y+NmiRBYaZhJuLi2TI2AWoDgm/SaqxAiHi
         S/n8Fvr30Ivh0tWBZvaeqQlSxXPsOVlNvn9cZNjqybdLNS0lKCOfm/pDqrPTnMLDuyrv
         Zx0IVLhsjjklY53DwOKpDFgRhyKwAXvCg+z9CJ+ezx684VOy98fvqHB6+5xIpPxgGBca
         UIEymfDTrFq1gbYKehsSHtCP6KQWtjPzdel8xOB0Ix68zscVJzuF58c92Z1qgSZ5Kz1X
         oRvuhPGxSTFH81H3SPJI2BEuqHFf5FHDh55gAuSYbcGZIY6E9X1L75TTK/1CTAzJeTnX
         u9QQ==
X-Gm-Message-State: AOJu0YzU2lVGDLJzbtN2ka9bOxziVko+NcrAPBYiU+aZNN7zstLFZkqT
	qYMVUiehc5E7reCfsPRlUmSwpv39FnK6UYZcl98geTLaC+GW2Dx/wHP1fpizyw==
X-Gm-Gg: ATEYQzw3ZRpibiiYXTZFQSRVZIy2aNFpQr2wHOy0rxQVZd+OxLVSpud/TbEF8p6vERM
	GTRZscYQBOjWbZZ/Q9DJjELAPr2T+peQAQ82UXpJkWDlCbKmhUXsrSzRA6VNghCvzDHgLDWw8fJ
	PexX9WNYyF0CNDE4QHvSNjLbAQCoLhFy8vJWIoj9eS2PUQy7wPEjcxJE3GVDFE15+vXwGNH5b29
	9wtbK4pY39420VU8n+BhelmNjNnNTkeM/FL5sQC56uiKAwp/kiSOjr9bSwePi5Tf/2bgtvyRack
	56XW4lP4NMyxoI3q4InDc3yHQJu74XxZqjiK5j6ldsCB2Rs3f/BUuZZA06wSW7mRllzrq+swfi4
	G9FRbQ3lbjWgU9IswejQmwse66eQpEnFkpA5yqVtUee6bLNG2pFs3BDN3z20Q/uGSZXUzbeFisG
	t9jjZDObJjQL3bsFFmZNdEH/AcV99BiuCHupSBCWJyr6spp8bDoX9vzGU=
X-Received: by 2002:a05:6000:240d:b0:439:bb46:7457 with SMTP id ffacd0b85a97d-43b97a4b813mr8230140f8f.16.1774603939124;
        Fri, 27 Mar 2026 02:32:19 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm14594910f8f.13.2026.03.27.02.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:32:18 -0700 (PDT)
Message-ID: <955df1ca-c94e-414c-a6ae-bb429105ca2a@gmail.com>
Date: Fri, 27 Mar 2026 10:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] python3: Fix manifest
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260327080343.422566-1-zboszor@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20260327080343.422566-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 09:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234076

Please apply this before the v3 series of "Use PYTHON_DIR consistently".

2026. 03. 27. 9:03 keltezéssel, Zoltán Böszörményi írta:
> bitbake -c create_manifest failed with this error:
>
> | ERROR:
> | The following files were found in more than one package),
> | this is likely to happen when new files are introduced after an upgrade,
> | please check which package should get it,
> |  modify the manifest accordingly and re-run the create_manifest task:
> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.so
> | ${libdir}/python${PYTHON_MAJMIN}/string
> | ${libdir}/python${PYTHON_MAJMIN}/string/__pycache__
> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so
>
> It needed a minimal hand-editing to make it work.
>
> The first run of bitbake -c create_manifest then moved some things
> around. The second run created an identical manifest.
>
> Noticed while working on the free-threading enablement.
>
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   .../python/python3/python3-manifest.json      | 90 +++++++++++++------
>   1 file changed, 64 insertions(+), 26 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 11ce2c97d2..23289ab8c5 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -98,7 +98,7 @@
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/*/test",
>               "${libdir}/python${PYTHON_MAJMIN}/*/tests",
> -            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
> +            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test",
>               "${libdir}/python${PYTHON_MAJMIN}/test"
>           ],
>           "cached": []
> @@ -117,7 +117,8 @@
>               "${libdir}/python${PYTHON_MAJMIN}/asyncio",
>               "${libdir}/python${PYTHON_MAJMIN}/concurrent",
>               "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debugging.*.so"
>           ],
>           "cached": []
>       },
> @@ -165,11 +166,12 @@
>               "core"
>           ],
>           "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/compression",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
>               "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
>               "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
> -            "${libdir}/python${PYTHON_MAJMIN}/compression/",
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
> +            "${libdir}/python${PYTHON_MAJMIN}/zipfile"
>           ],
>           "cached": [
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
> @@ -178,7 +180,7 @@
>       },
>       "core": {
>           "summary": "Python interpreter and core modules",
> -        "rdepends": ["compression"],
> +        "rdepends": [],
>           "files": [
>               "${bindir}/python${PYTHON_MAJMIN}",
>               "${bindir}/python${PYTHON_MAJMIN}.real",
> @@ -213,6 +215,11 @@
>               "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
>               "${libdir}/python${PYTHON_MAJMIN}/collections",
>               "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_streams.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/_zstdfile.py",
>               "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
>               "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
>               "${libdir}/python${PYTHON_MAJMIN}/copy.py",
> @@ -252,11 +259,13 @@
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
> @@ -282,6 +291,8 @@
>               "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
>               "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
>               "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
>               "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
>               "${libdir}/python${PYTHON_MAJMIN}/platform.py",
>               "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
> @@ -324,16 +335,19 @@
>           ],
>           "cached": [
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_ast_unparse.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metadata.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_py_warnings.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
> @@ -403,6 +417,11 @@
>               "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__/pager.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__/_streams.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/__pycache__/_zstdfile.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
> @@ -415,6 +434,8 @@
>               "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_abc.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_local.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_os.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/types.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*.pyc",
> @@ -446,6 +467,7 @@
>       "ctypes": {
>           "summary": "Python C types support",
>           "rdepends": [
> +            "compression",
>               "core",
>               "io",
>               "math"
> @@ -477,8 +499,7 @@
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
>               "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
> +            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
>           ],
>           "cached": [
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
> @@ -500,7 +521,15 @@
>       "debugger": {
>           "summary": "Python debugger",
>           "rdepends": [
> +            "asyncio",
> +            "compression",
>               "core",
> +            "io",
> +            "json",
> +            "logging",
> +            "math",
> +            "netclient",
> +            "numbers",
>               "pprint",
>               "shell",
>               "stringold"
> @@ -549,9 +578,17 @@
>       "doctest": {
>           "summary": "Python framework for running examples in docstrings",
>           "rdepends": [
> +            "asyncio",
> +            "compression",
>               "core",
>               "debugger",
>               "difflib",
> +            "io",
> +            "json",
> +            "logging",
> +            "math",
> +            "netclient",
> +            "numbers",
>               "pprint",
>               "shell",
>               "stringold",
> @@ -586,10 +623,13 @@
>       "ensurepip": {
>           "summary": "Support for bootstrapping the pip installer",
>           "rdepends": [
> -            "core"
> +            "compression",
> +            "core",
> +            "io",
> +            "math"
>           ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/ensurepip/"
> +            "${libdir}/python${PYTHON_MAJMIN}/ensurepip"
>           ],
>           "cached": []
>       },
> @@ -598,9 +638,7 @@
>           "rdepends": [
>               "core"
>           ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
> -        ],
> +        "files": [],
>           "cached": []
>       },
>       "gdbm": {
> @@ -649,6 +687,7 @@
>       "io": {
>           "summary": "Python low-level I/O",
>           "rdepends": [
> +            "compression",
>               "core",
>               "math",
>               "netclient"
> @@ -813,10 +852,12 @@
>       "multiprocessing": {
>           "summary": "Python multiprocessing support",
>           "rdepends": [
> +            "compression",
>               "core",
>               "crypt",
>               "ctypes",
>               "io",
> +            "json",
>               "math",
>               "mmap",
>               "netclient",
> @@ -848,6 +889,7 @@
>               "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
>               "${libdir}/python${PYTHON_MAJMIN}/http",
>               "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
>               "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
> @@ -890,7 +932,6 @@
>               "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
>               "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
>               "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
>               "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
>           ],
> @@ -999,8 +1040,7 @@
>       "shell": {
>           "summary": "Python shell-like functionality",
>           "rdepends": [
> -            "core",
> -            "stringold"
> +            "core"
>           ],
>           "files": [
>               "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
> @@ -1044,12 +1084,9 @@
>               "core"
>           ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/string/__init__.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/string/templatelib.py"
> +            "${libdir}/python${PYTHON_MAJMIN}/string"
>           ],
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
> -        ]
> +        "cached": []
>       },
>       "syslog": {
>           "summary": "Python syslog interface",
> @@ -1104,10 +1141,11 @@
>       "tomllib": {
>           "summary": "Provides an interface for parsing TOML",
>           "rdepends": [
> -            "core"
> +            "core",
> +            "datetime"
>           ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/tomllib/"
> +            "${libdir}/python${PYTHON_MAJMIN}/tomllib"
>           ],
>           "cached": []
>       },
> @@ -1125,9 +1163,7 @@
>               "stringold"
>           ],
>           "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/unittest",
> -            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
> -            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
> +            "${libdir}/python${PYTHON_MAJMIN}/unittest"
>           ],
>           "cached": []
>       },
> @@ -1147,8 +1183,10 @@
>       "venv": {
>           "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories.",
>           "rdepends": [
> +            "compression",
>               "core",
>               "logging",
> +            "shell",
>               "stringold"
>           ],
>           "files": [


