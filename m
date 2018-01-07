Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA8678913
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 18:24:18 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 23so1720829pfp.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 10:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=kJTxUcQzIebVRbFkqiEbERPl5dmn1L0BXFXgmhE8Kaw=;
	b=MfNz2zPCLvBHOadIxvio964W+nn4gijXAKXAD0hL06ADskpMiXEL4bi/kuMCsqhOVB
	yfZyIuDRZuadoJcZzAmVHgZBolu6Bey/6oWNNj94Y9YK65tqer7w+Wc6FtVBocb/ngNN
	NSmUjMfQ7rnUMt9lGVw4rBBBX7NHShzBKS4IE+PiaGInwp6rrCf+Sr7RQfMfhoTin16A
	yGTVGTHKeHqgKl9tnacKy+9C7ZIlz7Wjs4xA3lSU1Fva0nqj39YzDpedyRpPZYa6WpLo
	DhZAHuzu8NhDrZmZIJUSP1212WS7Xuu3H+7yAw6f1cVN2kbxktLApaONcd+8C7b2aTSH
	k6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kJTxUcQzIebVRbFkqiEbERPl5dmn1L0BXFXgmhE8Kaw=;
	b=DCriQqH1ugdBOf++fJ/KVUwv9hJjssxOiLLaVBL+0515hY2Km1HzsPQi4t4nf8JJau
	3tif1urujJVSwvZvggH9odtpLey7SjKoUfteDPYyW0lqTsI3brrFfP4B/3UPvXqqNF2L
	QasQG1z3rnUgMPyhJG0NQHCGx9gRqDcJMZICtLF4z9h65427ARIh9XCkC5y0Z6nVTpCM
	ZcrBLX3M+4A+9vmXqRY9ZLHsQUDQQ7G+gQa4BRiMkStOYxBfR5yfmu0ZDcbmGFcd34HL
	74u+U3zbi0RL6UtJ01bnAcOQWBwZDMa34rhn71x7ftP8umXN+UNOFSKXiRCzYdoOyhEi
	Gh2w==
X-Gm-Message-State: AKGB3mLcJme+oRp/6Y0uZvwZhEUg31izOtudLwavDijh/usEQeyhZz4J
	+7jYL1hILmG4DN4DuRW0lwM6IA==
X-Google-Smtp-Source: ACJfBovoL2TnU/CwgI8YhCJJ5bn6zKPHeVeTr/PRBmng0rkPUQq2/SnPXrLp7lGLlarn0weq26mmQg==
X-Received: by 10.98.144.19 with SMTP id a19mr8588205pfe.139.1515349459742;
	Sun, 07 Jan 2018 10:24:19 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:d3a:c846:b190:ee80?
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id l8sm4088984pgc.58.2018.01.07.10.24.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jan 2018 10:24:18 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1513213231-16818-1-git-send-email-armccurdy@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d99adaab-fc5d-bb99-139a-3eb84ff0b9b6@gmail.com>
Date: Sun, 7 Jan 2018 10:24:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513213231-16818-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [morty][PATCH] cmake: avoid configure failures if CFLAGS contains -Wstrict-prototypes
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
X-List-Received-Date: Sun, 07 Jan 2018 18:24:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

this in now in morty

thanks,

Armin


On 12/13/2017 05:00 PM, Andre McCurdy wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit 0c89b010ce2e426f55ac7c6f94befef988913834)
> ---
>  meta/recipes-devtools/cmake/cmake.inc              |  1 +
>  ...void-gcc-warnings-with-Wstrict-prototypes.patch | 42 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 4fcb0b1..821bb81 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV', True).split('.')[0:2])}"
>  SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://support-oe-qt4-tools-names.patch \
>             file://qt4-fail-silent.patch \
> +           file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
>             "
>  
>  SRC_URI[md5sum] = "d6dd661380adacdb12f41b926ec99545"
> diff --git a/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch b/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
> new file mode 100644
> index 0000000..8b8d480
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
> @@ -0,0 +1,42 @@
> +From 4bc17345c01ea467099e28c7df30c23ace9e7811 Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Fri, 14 Oct 2016 16:26:58 -0700
> +Subject: [PATCH] CheckFunctionExists.c: avoid gcc warnings with
> + -Wstrict-prototypes
> +
> +Avoid warnings (and therefore build failures etc) if a user happens
> +to add -Wstrict-prototypes to CFLAGS.
> +
> + | $ gcc --version
> + | gcc (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4
> + |
> + | $ gcc -Wstrict-prototypes -Werror -DCHECK_FUNCTION_EXISTS=pthread_create -o foo.o -c Modules/CheckFunctionExists.c
> + | Modules/CheckFunctionExists.c:7:3: error: function declaration isn't a prototype [-Werror=strict-prototypes]
> + |    CHECK_FUNCTION_EXISTS();
> + |    ^
> + | cc1: all warnings being treated as errors
> + |
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + Modules/CheckFunctionExists.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Modules/CheckFunctionExists.c b/Modules/CheckFunctionExists.c
> +index 2304000..224e340 100644
> +--- a/Modules/CheckFunctionExists.c
> ++++ b/Modules/CheckFunctionExists.c
> +@@ -4,7 +4,7 @@
> + extern "C"
> + #endif
> +   char
> +-  CHECK_FUNCTION_EXISTS();
> ++  CHECK_FUNCTION_EXISTS(void);
> + #ifdef __CLASSIC_C__
> + int main()
> + {
> +-- 
> +1.9.1
> +


