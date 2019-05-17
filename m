Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1802B7DFCF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:25:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h17so3687536pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=w89VbBhz4FroRhsQyZWzrv8ySD6DhGl8zJI3b4FZ63c=;
	b=nhsLIzNXOis+hJjHWyqO+BojVyuvWOBuwi80Gz5vN5/wfm6HmMWHvcJ4S4blOpKLGQ
	ckRzYwxIRAOsDmFjWv4U4F5hHQ4NbkJYYiCRKkduw+Spp6z2KwtkPcMdrk0tV2dfxWwP
	V/OFUsHsT7XLUKmuJha+GyZ2UASdyh4zmkABRptHFIzsYkAWu6Qx4yWi13AMZnqD4mNf
	/ozK5eyJ5Fp9q4AEaVoA6d6g8oXEcP1wjantQaqpQMz2TLX1v6yUmIzUSbO6HH62ncdn
	VjfNpYcxVWK29QkW7RlYCrbWYiu9x3teVanNDv0bBLdV2ZvfS2czCGETsiIOHQJK8J0B
	+4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=w89VbBhz4FroRhsQyZWzrv8ySD6DhGl8zJI3b4FZ63c=;
	b=ZIuPcMNnloFTIsfYOceA1Jh5otGJ6bbQSErGtjyqyJyewhKHH7GT3cpmoGAgdssgLe
	j1D/MoUKcyVMjrttQladds2ntMqnuPPgnla4i082VRDZVh9x5YTiHd9zWiTBrCh5lw/s
	0gnnxXtAxLHXTqdDPuriIEAEAPmSnr2yVwpCtQl5Bt8I+vFIQVor7Sii+Cifq6OxEPTe
	QG0OgBP3MNC5sXzIYQp5PWRJ89In8LMGXD6McS2xmJ2XmxEJDyUcS27Rqa2rlOmBxuBZ
	dDEoBdiFSviavhKKUH+C6Sp7cxmCfkg7vatQEAPFAf7iHj/itDoS5XcLbfTT3yNNv3Lz
	LmEA==
X-Gm-Message-State: APjAAAWqHclueV0zOO5NWMYc+CT4hQDqDAnURNb87E+NIjL4EG9R71Z/
	M6cwRpQrVcGM4LTy4odAvRegGAjZ
X-Google-Smtp-Source: APXvYqxSQFTE12w6ACJPb+VBZ6fZbawWG+mJxCC8jEKxEMXAElrL4GpeldOvhtvl1nWD8WeO5LVSHw==
X-Received: by 2002:a65:63c8:: with SMTP id n8mr54934678pgv.96.1558117549994; 
	Fri, 17 May 2019 11:25:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:2c77:e1be:f825:40e5?
	([2601:202:4180:c33:2c77:e1be:f825:40e5])
	by smtp.gmail.com with ESMTPSA id
	r185sm15576250pfc.167.2019.05.17.11.25.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:25:49 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-11-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4723f59c-19d4-fafe-fa56-ee0e564d220b@gmail.com>
Date: Fri, 17 May 2019 11:25:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517181151.44001-11-alex.kanavin@gmail.com>
Subject: Re: [PATCH 11/37] go: update 1.12.1->1.12.5
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
X-List-Received-Date: Fri, 17 May 2019 18:25:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/17/19 11:11 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/go/go-1.12.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
> index 0cf0a63ff65..7c4cac1fc25 100644
> --- a/meta/recipes-devtools/go/go-1.12.inc
> +++ b/meta/recipes-devtools/go/go-1.12.inc
any indication on testing?

any reason why 1.11 can't be dropped?

- armin
> @@ -1,7 +1,7 @@
>  require go-common.inc
>  
>  GO_BASEVERSION = "1.12"
> -GO_MINOR = ".1"
> +GO_MINOR = ".5"
>  PV .= "${GO_MINOR}"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>  
> @@ -19,5 +19,5 @@ SRC_URI += "\
>  "
>  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>  
> -SRC_URI[main.md5sum] = "09fe592343465560b4b8431d870b3df3"
> -SRC_URI[main.sha256sum] = "0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a"
> +SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
> +SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"


