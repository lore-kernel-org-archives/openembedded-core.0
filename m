Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 21359797A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 23:16:01 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d4-v6so12267981pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QnqTQ0sy6w8q7kOhPwU2ozQZ6ct/iTSSGwDfH1p+ok4=;
	b=I01RtLar25QNPixuEMKr204x6WCZAHmGhmhNgqG5s5yoSxUI+SpfJ8jlOGw3tNnxjD
	amMw4BtAPMCdaE5KEdT8zNd+q1nVvxyApLgQxITQZRKKlV4pfgXhsxAHxNcqskWHACUl
	vbUCgSY9qS5Eml3zmG+vWtZL38Jd/jJG0spEHHKytw9wQctYCItizsCm/wZ8RohnCYiI
	6+lmS7siPfMsFxGCu6N96/YQ26Wt2+D97fAmHabQ4HjAu/XDXBE8t4vTtBZQmornDixe
	g3lKw813hkNvTlvnLoKlGJeClUfgqRmEZEIGyurAnlxSnsXhXRVH6PDeH6bb7701oZ6G
	pYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QnqTQ0sy6w8q7kOhPwU2ozQZ6ct/iTSSGwDfH1p+ok4=;
	b=QjJf4DKizLgDKtNUkxzx4QKHyZLKUUc2qLUBZJlYJa/kRVidwJrQzvCetgA/JI/Tr3
	oLbJOEO5bp49tamIz0xlhbExRgpZqiXBRw01bsSZnG3XKGW5xqzAl2iH5JNTWCZLx45C
	9sXkDqeiB8f8fGVyzhNI83ho2hScWPcvHIL53rhBbFFP5WCvQZqvrYHqGEeRb4Z//aEc
	VBmgOHETL4TnUfqdivPagMl6QlDiO/377R5l5cjMbNPpIsr5qTrCE+7OGJxFtsWaiDpM
	6QTNv4CuI0kfCtt86dvGX/x9K+NHxdMrxdc2neSfxtSCPcF/lQixzVPvaV9N05Whi/2T
	E3pg==
X-Gm-Message-State: ABuFfogVkvbeeHJ4yNpnTl63J1cnD2En2YMDjspQa+LsiK8dJKFzDiAl
	vzRD7msrOkBpFAXUTzH0ZdjjEJ0d
X-Google-Smtp-Source: ACcGV63WjFoIHO+mgpTA3dWH+M6HaU/SJV9xMtTm07zFbWJ5QeS2CO1/RholhkAUI6KJAH/eBwzXuw==
X-Received: by 2002:a17:902:bc8b:: with SMTP id
	bb11-v6mr3229241plb.112.1537917362057; 
	Tue, 25 Sep 2018 16:16:02 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	r17-v6sm4761511pff.50.2018.09.25.16.16.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 16:16:01 -0700 (PDT)
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
References: <20180925171828.8655-1-okaya@kernel.org>
	<20180925171828.8655-2-okaya@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <17737fac-197f-65b9-0e84-e470c811be92@gmail.com>
Date: Tue, 25 Sep 2018 16:16:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180925171828.8655-2-okaya@kernel.org>
Subject: Re: [sumo] [PATCH v1 2/2] libcroco: CVE-2017-7961
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
X-List-Received-Date: Tue, 25 Sep 2018 23:16:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/25/2018 10:18 AM, Sinan Kaya wrote:
> * CVE-2017-7961
> The cr_tknzr_parse_rgb function in cr-tknzr.c in libcroco has an
> "outside the range of representable values of type long" undefined
> behavior issue, which might allow remote attackers to cause a denial
> of service (application crash) or possibly have unspecified other
> impact via a crafted CSS file.
>
> CVE: CVE-2017-7961
> Ref: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7961
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../libcroco/libcroco/CVE-2017-7961.patch     | 45 +++++++++++++++++++
>  .../libcroco/libcroco_0.6.12.bb               |  2 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
>
> diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
> new file mode 100644
> index 0000000000..d407eca6d8
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
> @@ -0,0 +1,45 @@
> +From 5fa3165613b77b516e2b0dc128f73b673bd3ec8b Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Sun, 16 Apr 2017 13:56:09 +0200
> +Subject: [PATCH] tknzr: support only max long rgb values
> +
> +This fixes a possible out of bound when reading rgbs which
> +are longer than the support MAXLONG
> +
> +Upstream-Status: Backport [https://git.gnome.org/browse/libcroco/patch/?id=9ad72875e9f08e4c519ef63d44cdbd94aa9504f7]
Please add;
CVE: CVE-2017-7961
> +Signed-off-by: Sinan Kaya <okaya@kernel.org>
> +---
> + src/cr-tknzr.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/src/cr-tknzr.c b/src/cr-tknzr.c
> +index e3af0ee..76886ec 100644
> +--- a/src/cr-tknzr.c
> ++++ b/src/cr-tknzr.c
> +@@ -1280,6 +1280,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
> +         status = cr_tknzr_parse_num (a_this, &num);
> +         ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
> + 
> ++        if (num->val > G_MAXLONG) {
> ++                status = CR_PARSING_ERROR;
> ++                goto error;
> ++        }
> ++
> +         red = num->val;
> +         cr_num_destroy (num);
> +         num = NULL;
> +@@ -1299,6 +1304,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
> +                 status = cr_tknzr_parse_num (a_this, &num);
> +                 ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
> + 
> ++                if (num->val > G_MAXLONG) {
> ++                        status = CR_PARSING_ERROR;
> ++                        goto error;
> ++                }
> ++
> +                 PEEK_BYTE (a_this, 1, &next_bytes[0]);
> +                 if (next_bytes[0] == '%') {
> +                         SKIP_CHARS (a_this, 1);
> +-- 
> +2.19.0
> +
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
> index d86ddd6464..dd7dad424c 100644
> --- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
> @@ -16,5 +16,7 @@ BINCONFIG = "${bindir}/croco-0.6-config"
>  
>  inherit gnomebase gtk-doc binconfig-disabled
>  
> +SRC_URI += "file://CVE-2017-7961.patch"
> +
>  SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
>  SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"


