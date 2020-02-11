Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1A76F60C5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 03:07:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so3651653plt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 19:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=3eeU60vR2jrDhID0SFqM5cm7Th7NnKBmuKZ9gFQFJrs=;
	b=oJmpPdGu9M1y8Ysa9J5BoiNOST8sLW2jwPLM+YbjHWo2j8X9JDqPoQJhhmCa7XVe2s
	RvO7+Eizqo232J/uPMpW5EuIQf2Gkf0Vdh/iZHbG69+jVI54kLsE0A+F6BgrkpNZKLH9
	H2JiAq1GgNo7pusgzGT9Y8kk4KdfuXr73x2MXB7ZGgUAmuRmyzWsdUySnAiVva+WyaVe
	mSRDYZ2slOPqahOzESYf8zNZjoHGJ2DoEaJQ8/N3DWBaRHiyH3u43Jk7acp3ReTrJ3HV
	cMhCgZibhnql85yLSWqDrXP6MhYpCLLPkO9eTJFlj0UOGoUveYD9sCGEA1SZoxnSZzRn
	kYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3eeU60vR2jrDhID0SFqM5cm7Th7NnKBmuKZ9gFQFJrs=;
	b=pV62mWkSEKA8y4beNXe+mFpDP4X1AnOx/1WGAFfaox/spqWCvxBsbIkibXJv8l+yUi
	RprV+AxYxnZ7DbNl/IIP+qMFIoF78Xr/EqXN6kpNAjtKKEUXTsNXai0oVfVAzASXVkAi
	yEzEJp3mYT7SF/jPJ2tj2McMR7bC/45GLB5dbKgPXZhcm8xwvOwL3LVd5ONwshQCwvjj
	/Uc81DqZy8pD4aoNMxfFC9dddnyIXW9OmnlxrmNUiUq38bDC/q1V4bM+fq4CM7PWag+d
	NUp0Phm6bY46+nRLU+x9ICIsbaRLT0Eetww51fs/Nr7cvWetuQNZZHiH8ADnfgCQXyIm
	G5ug==
X-Gm-Message-State: APjAAAWvBI+PQiZy62P4LOG2aG1MDqER3GtQ+CNKCufZGqncAqByHBba
	oLubcppaqshoYqY85QEuXQjlYDX4
X-Google-Smtp-Source: APXvYqyGZRRhG6poX4nLj9H2Y2uHD4b+h1OjzXyfaWE/KrVN0GW/kAfmQrGIL0YPg6f+/sJ/WLiGAg==
X-Received: by 2002:a17:90a:ead8:: with SMTP id
	ev24mr1130131pjb.91.1581390454688; 
	Mon, 10 Feb 2020 19:07:34 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:58cf:c2e4:7ede:a168?
	([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
	by smtp.gmail.com with ESMTPSA id
	f13sm1833312pfk.64.2020.02.10.19.07.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 10 Feb 2020 19:07:33 -0800 (PST)
To: Rahul Chauhan <rahulchauhankitps@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1581360561-30532-1-git-send-email-rahulk@mvista.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <603e05c3-b568-a228-7821-5a48593b4c30@gmail.com>
Date: Mon, 10 Feb 2020 19:07:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581360561-30532-1-git-send-email-rahulk@mvista.com>
Subject: Re: [warrior][PATCH] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Tue, 11 Feb 2020 03:07:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/10/20 10:49 AM, Rahul Chauhan wrote:
> Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
> ---
>  .../libxml/libxml2/fix-CVE-2019-19956.patch        | 38 ++++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch

What is the difference from the patch sent on the 6th? is this a version 2?

- armin
>
> diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
> new file mode 100644
> index 0000000..43c3589
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
> @@ -0,0 +1,38 @@
> +From 3cd2b25ddb04740be2880cfd78d60038452228b1 Mon Sep 17 00:00:00 2001
> +From: Zhipeng Xie <xiezhipeng1@huawei.com>
> +Date: Wed, 7 Aug 2019 17:39:17 +0800
> +Subject: [PATCH] Fix memory leak in xmlParseBalancedChunkMemoryRecover
> +
> +When doc is NULL, namespace created in xmlTreeEnsureXMLDecl
> +is bind to newDoc->oldNs, in this case, set newDoc->oldNs to
> +NULL and free newDoc will cause a memory leak.
> +
> +Found with libFuzzer.
> +
> +Closes #82.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549]
> +CVE: CVE-2019-19956
> +
> +Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
> +---
> + parser.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/parser.c b/parser.c
> +index b7ecd65..491f5c9 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -13899,7 +13899,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc, xmlSAXHandlerPtr sax,
> +     xmlFreeParserCtxt(ctxt);
> +     newDoc->intSubset = NULL;
> +     newDoc->extSubset = NULL;
> +-    newDoc->oldNs = NULL;
> ++    if(doc != NULL)
> ++	newDoc->oldNs = NULL;
> +     xmlFreeDoc(newDoc);
> + 
> +     return(ret);
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> index 62643bc..67c2d4f 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> @@ -23,6 +23,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>             file://fix-CVE-2017-8872.patch \
>             file://fix-CVE-2018-14404.patch \
>             file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
> +           file://fix-CVE-2019-19956.patch \
>             "
>  
>  SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"


