Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 06B82915D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:45:42 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w2so1003763pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=d1FjFOOcoUvLYnymgu17gPv9Sf6bfQ1nwlBdDsOTUzk=;
	b=Mjjat75+0W7djDXq8GXvjTi1mgCzYTG2yARCzN/AVSVoMfIa3A0IyCrJCJ18hqoKkU
	3rIKEMlwAw448aZI15EE40H3OnYXalJhu9JryN0synnXjnGJFZIkRdGCKveRAhXs8JXi
	7rpLL+LKD/6El19M76Z+oMU9hEGiGGUIK1kf+n0E/04KP6FRSW7RYeWdSy0DuNYJfBY7
	d4HLopBxHwBPx/PE8LEBgvss/MhXgD1ZasHtVPEmZiAvl+C+UV2s+EuVa+OjsDkfFmfi
	DDEMZDgRWAELK+UmhwzsVC12lHuyskEgMBKaBpuXPN0l2KqfTPEnRHvoNwp3q6OKyg8/
	qCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d1FjFOOcoUvLYnymgu17gPv9Sf6bfQ1nwlBdDsOTUzk=;
	b=SzgNZ6/bvSQNGMLd2dKgZLXuxA3PFroCtFen7c9A3d5XHNo8iAEtyxIa0n0BmlhP5B
	SVfrUi1e2kpUw1wEMjxfWGSMRFOsS9QiNGXLpGWZhoNqy4OGj+WEcXIV3BF9EmIqYiZ7
	sdIdYXRQG7K7Ri5FEvarKzO3aTezjNSR2M7g2X7oGssV9xoU/bpMmA33Ge4tqNAhIklG
	xzg0YhltdRUAML4kpFbM5ilQApZlcXRk9eQv2hVV+ewaSYudHZFpmSPzW1h3SJG47JmA
	Il9O5fJ+84okM/N+kdtlezGUv9LQdiabI1BokqMcjrCL2lBqpwLSGdwMsoOaxvtIiiLr
	b8fQ==
X-Gm-Message-State: APjAAAXOJtLhQkQEhVpzAA9sb1/Y4LhYSbscnucpoHvUDCqc2ONp92pu
	K2qOeFFUVKmfnvzQi00ZPXFXNoPd
X-Google-Smtp-Source: APXvYqz6WKQa07LvmQnnerxF0nh/8HRX159ciZ3fj1PCd1EzwKip5mE0779TX7haVqYbJ4xCBtkPCQ==
X-Received: by 2002:a62:7c49:: with SMTP id x70mr5749726pfc.200.1579758343849; 
	Wed, 22 Jan 2020 21:45:43 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:682c:76b9:6d8a:bbd2?
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id d24sm859949pfq.75.2020.01.22.21.45.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Jan 2020 21:45:43 -0800 (PST)
To: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
References: <1579745387-74550-1-git-send-email-chee.yang.lee@intel.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0455c3fb-6dd0-ec89-0c33-57bd54aedf61@gmail.com>
Date: Wed, 22 Jan 2020 21:45:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579745387-74550-1-git-send-email-chee.yang.lee@intel.com>
Subject: Re: [PATCH][zeus] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Thu, 23 Jan 2020 05:45:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/22/20 6:09 PM, chee.yang.lee@intel.com wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> see:
> https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>

So Master is not affected? 2.9.10

- armin
> ---
>  .../libxml/libxml2/Fix-CVE-2019-19956.patch        | 40 ++++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.9.bb          |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch b/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
> new file mode 100644
> index 0000000..1c2dff9
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
> @@ -0,0 +1,40 @@
> +From 5a02583c7e683896d84878bd90641d8d9b0d0549 Mon Sep 17 00:00:00 2001
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
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + parser.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/parser.c b/parser.c
> +index 1ce1ccf1..26d9f4e3 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -13894,7 +13894,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc, xmlSAXHandlerPtr sax,
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
> +2.24.1
> +
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
> index c38f883..c44a90b 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>             file://libxml-m4-use-pkgconfig.patch \
>             file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
>             file://fix-execution-of-ptests.patch \
> +           file://Fix-CVE-2019-19956.patch \
>             "
>  
>  SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"


