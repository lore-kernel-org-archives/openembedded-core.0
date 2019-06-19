Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B23F7E7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 18:32:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l19so128580pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=O/yaG3lkjPAvJdGzq8ojzoim5cIf6te+RQaDw+fxwQg=;
	b=Nr8hrwCqfVJETD0NAuNazjnNfuVDEtcEQLkfNIlA17jjckevgHF3FNMjX/UKvNft5e
	CTufWgIYv7Sd8hBXH5b31RBZHRFGJBQqygKTaB8r/IezXpihvGNrV9oPLPRV39eF57jT
	dGM3W90WZVlzaY00CfMd8P/X2aTy/XPDi2Z3u62WVjtej/Z5ZCpqZl2YJsUpO1nHHfkj
	zH5kv6HU0xJ3dOJMEZGRPpiTgiHzE7rhijkoICaPe6QeDPY6uT4ymlVmATWMtv0i81G0
	FuNKa7WR5y/YBoEzoDQ5txqDi2lZM5k21mc39zDPXn0TA7iW/s5mHwAlkgMzZtyFxh6a
	7Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=O/yaG3lkjPAvJdGzq8ojzoim5cIf6te+RQaDw+fxwQg=;
	b=UVwWBYkj2UTJgvg2KyZ3uie9XW8Q4WC2HKekPB3tJmlN3IHPQigWqlNGiQJ1D+CWUo
	FJCtZekhV0wVBCoyrRMuiRTXx8DPY8z0g7rUf/H0nsASlnj6Gccbze3mgUbaDU1NmeQW
	7hYC86X/pljL1KLFjDF/5ZqtE1xH5qTM5ooJFQ7OVNFZdtvcnJpwI+nGoKRh1buzYe5/
	YvXbE+uM5D0e8BqHwriz20RVXG8JpRynZQ3k9XH2PH6eihnsHS68O6MuYs44sPGsXbrS
	6CaDNNLkQyqdjDpPP/ngWXtn2/H/D45Af9pq6jwJk256Q9/fvO16s/455OZgHIHCXC63
	gCzQ==
X-Gm-Message-State: APjAAAVhcwfAsFGFp9boXT9CRZKhX747MlDbEyCSXjCvSYhEB7MZYos4
	auUZsQy4TZYtrQh63ISdb9Kht8UfUZw=
X-Google-Smtp-Source: APXvYqyJkhEHafIylODja9NjP9PRluo7BaWgBTkT9Qz14DrJyFhKYwzE7mgCZOWmhcdz9ZB928PElA==
X-Received: by 2002:a62:68c4:: with SMTP id
	d187mr130775778pfc.245.1560969122178; 
	Wed, 19 Jun 2019 11:32:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:64c9:3628:c540:f604?
	([2601:202:4180:c33:64c9:3628:c540:f604])
	by smtp.gmail.com with ESMTPSA id
	201sm26625671pfz.24.2019.06.19.11.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 11:32:01 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190619175429.22836-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <715abcf8-ff17-a012-391c-a25dbf4451d4@gmail.com>
Date: Wed, 19 Jun 2019 11:32:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619175429.22836-1-bunk@stusta.de>
Subject: Re: [PATCH] libxslt: Fix CVE-2019-11068
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
X-List-Received-Date: Wed, 19 Jun 2019 18:32:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/19/19 10:54 AM, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../0001-Fix-security-framework-bypass.patch  | 124 ++++++++++++++++++
>  .../recipes-support/libxslt/libxslt_1.1.33.bb |   4 +-
>  2 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch

Thanks for the CVE fix. Is master affected?

- armin
>
> diff --git a/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
> new file mode 100644
> index 0000000000..89b647ddbf
> --- /dev/null
> +++ b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
> @@ -0,0 +1,124 @@
> +From e03553605b45c88f0b4b2980adfbbb8f6fca2fd6 Mon Sep 17 00:00:00 2001
> +From: Nick Wellnhofer <wellnhofer@aevum.de>
> +Date: Sun, 24 Mar 2019 09:51:39 +0100
> +Subject: Fix security framework bypass
> +
> +xsltCheckRead and xsltCheckWrite return -1 in case of error but callers
> +don't check for this condition and allow access. With a specially
> +crafted URL, xsltCheckRead could be tricked into returning an error
> +because of a supposedly invalid URL that would still be loaded
> +succesfully later on.
> +
> +Fixes #12.
> +
> +Thanks to Felix Wilhelm for the report.
> +
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +Upstream-Status: Backport
> +CVE: CVE-2019-11068
> +---
> + libxslt/documents.c | 18 ++++++++++--------
> + libxslt/imports.c   |  9 +++++----
> + libxslt/transform.c |  9 +++++----
> + libxslt/xslt.c      |  9 +++++----
> + 4 files changed, 25 insertions(+), 20 deletions(-)
> +
> +diff --git a/libxslt/documents.c b/libxslt/documents.c
> +index 3f3a7312..4aad11bb 100644
> +--- a/libxslt/documents.c
> ++++ b/libxslt/documents.c
> +@@ -296,10 +296,11 @@ xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI) {
> + 	int res;
> + 
> + 	res = xsltCheckRead(ctxt->sec, ctxt, URI);
> +-	if (res == 0) {
> +-	    xsltTransformError(ctxt, NULL, NULL,
> +-		 "xsltLoadDocument: read rights for %s denied\n",
> +-			     URI);
> ++	if (res <= 0) {
> ++            if (res == 0)
> ++                xsltTransformError(ctxt, NULL, NULL,
> ++                     "xsltLoadDocument: read rights for %s denied\n",
> ++                                 URI);
> + 	    return(NULL);
> + 	}
> +     }
> +@@ -372,10 +373,11 @@ xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI) {
> + 	int res;
> + 
> + 	res = xsltCheckRead(sec, NULL, URI);
> +-	if (res == 0) {
> +-	    xsltTransformError(NULL, NULL, NULL,
> +-		 "xsltLoadStyleDocument: read rights for %s denied\n",
> +-			     URI);
> ++	if (res <= 0) {
> ++            if (res == 0)
> ++                xsltTransformError(NULL, NULL, NULL,
> ++                     "xsltLoadStyleDocument: read rights for %s denied\n",
> ++                                 URI);
> + 	    return(NULL);
> + 	}
> +     }
> +diff --git a/libxslt/imports.c b/libxslt/imports.c
> +index 874870cc..3783b247 100644
> +--- a/libxslt/imports.c
> ++++ b/libxslt/imports.c
> +@@ -130,10 +130,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
> + 	int secres;
> + 
> + 	secres = xsltCheckRead(sec, NULL, URI);
> +-	if (secres == 0) {
> +-	    xsltTransformError(NULL, NULL, NULL,
> +-		 "xsl:import: read rights for %s denied\n",
> +-			     URI);
> ++	if (secres <= 0) {
> ++            if (secres == 0)
> ++                xsltTransformError(NULL, NULL, NULL,
> ++                     "xsl:import: read rights for %s denied\n",
> ++                                 URI);
> + 	    goto error;
> + 	}
> +     }
> +diff --git a/libxslt/transform.c b/libxslt/transform.c
> +index 13793914..0636dbd0 100644
> +--- a/libxslt/transform.c
> ++++ b/libxslt/transform.c
> +@@ -3493,10 +3493,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
> +      */
> +     if (ctxt->sec != NULL) {
> + 	ret = xsltCheckWrite(ctxt->sec, ctxt, filename);
> +-	if (ret == 0) {
> +-	    xsltTransformError(ctxt, NULL, inst,
> +-		 "xsltDocumentElem: write rights for %s denied\n",
> +-			     filename);
> ++	if (ret <= 0) {
> ++            if (ret == 0)
> ++                xsltTransformError(ctxt, NULL, inst,
> ++                     "xsltDocumentElem: write rights for %s denied\n",
> ++                                 filename);
> + 	    xmlFree(URL);
> + 	    xmlFree(filename);
> + 	    return;
> +diff --git a/libxslt/xslt.c b/libxslt/xslt.c
> +index 780a5ad7..a234eb79 100644
> +--- a/libxslt/xslt.c
> ++++ b/libxslt/xslt.c
> +@@ -6763,10 +6763,11 @@ xsltParseStylesheetFile(const xmlChar* filename) {
> + 	int res;
> + 
> + 	res = xsltCheckRead(sec, NULL, filename);
> +-	if (res == 0) {
> +-	    xsltTransformError(NULL, NULL, NULL,
> +-		 "xsltParseStylesheetFile: read rights for %s denied\n",
> +-			     filename);
> ++	if (res <= 0) {
> ++            if (res == 0)
> ++                xsltTransformError(NULL, NULL, NULL,
> ++                     "xsltParseStylesheetFile: read rights for %s denied\n",
> ++                                 filename);
> + 	    return(NULL);
> + 	}
> +     }
> +-- 
> +2.20.1
> +
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
> index 462eccf52f..6320a821dc 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
> @@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
>  SECTION = "libs"
>  DEPENDS = "libxml2"
>  
> -SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz"
> +SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
> +           file://0001-Fix-security-framework-bypass.patch \
> +"
>  
>  SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
>  SRC_URI[sha256sum] = "8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8"


