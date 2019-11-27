Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7907FC21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 20:26:08 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bb5so10354058plb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qDZhhTyW1N+yRgDNy8rEP06rA/qm/vvvZu/9FfUo5xA=;
	b=DxwJs5MO4yb7bG0dCsOa7k+yzTyeG4liTKW3cCNbzT2Icim5rltP7p1qTcYNbdAMGn
	LfJZS5/O1IPEFO5g/acBlUUqTrOgqvrpCBPdAkERoaNo782qqkNg4NlJbjuM1tn3XSGk
	P98JKk41rf/hY61wRGNHaT9Kye9rErk1QkfBQTfS49p2tizklogSfh+1LTK5iJCy1SqR
	FeGYBHwudsnaVztxwldxU64PVo+XO6iTLrn5KaR1cxXAaERjM0iBj76UovdDTN8Wh5+r
	WmeGBJaFw8CHAoSN4gSr87cX89nUIv7+sSE4UfJrFC0HThsEYehOKUgfKu3UFvsv6Pcj
	LUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qDZhhTyW1N+yRgDNy8rEP06rA/qm/vvvZu/9FfUo5xA=;
	b=dbHQRdwZ/rLWmIe/PEBU4JciSFWS2xzNPRoFbUzpZfqxdcQHqplTyEvpFcddVug6zZ
	URMSS/1Q/qr1xdRJ/UFHrRUDZMs5oXc6D7hHqplRKCxn4b4aGe1mIQMKQn4R/tVtc2v4
	JpJ8mjTDEDeeoB+Lueek2vXEw9GAicljoHgjG15s5CFGzYuo8hrjoLfU/ot3L1ldHoh5
	jVe+mWirfqWTaJ3eOPXi2QW/shS29xMolgScDTNFk5UObfcWKwTg02o+FuIFePcQDf9A
	LtOGDPEH5Y3C/C+LvkauXr35LicHfl+aafPYB0ChVZNj9Kqwd0ZhaijfOgG8FHOkbyfZ
	hofA==
X-Gm-Message-State: APjAAAURgS3MFSlKWEhYFtv9r2WGweczZG6ru/somUbDfeVrj7hiVdDR
	aSP99Gt85Boje6GSN1vNI+uUoRvR
X-Google-Smtp-Source: APXvYqypM/l61ji6QZ4OTBf7hciFcojf1f4yt4miR3iD+qR2RiSnmmN6VOSXFJ1Qf9CJy5GsUuwOcg==
X-Received: by 2002:a17:902:d708:: with SMTP id
	w8mr1655237ply.280.1574886369212; 
	Wed, 27 Nov 2019 12:26:09 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:88c1:6db9:7b72:a2e8?
	([2601:202:4180:a5c0:88c1:6db9:7b72:a2e8])
	by smtp.gmail.com with ESMTPSA id
	q10sm6518344pfh.103.2019.11.27.12.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2019 12:26:08 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20191127141521.8739-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <928ed81f-3411-c3dc-338b-be2c29206f04@gmail.com>
Date: Wed, 27 Nov 2019 12:26:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127141521.8739-1-ross.burton@intel.com>
Subject: Re: [PATCH] insane: fix GitHub /archive/ test
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
X-List-Received-Date: Wed, 27 Nov 2019 20:26:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/27/19 6:15 AM, Ross Burton wrote:
> This test was failing to split the URL list to individual URLs, so if
> SRC_URI is something like this then the test incorrectly triggers:
>
> SRC_URI = "git://github.com/foo http://example.com/archive/foo"
>
> Fix this by splitting the SRC_URI list and iterating through the URIs
> one at time.
>
> [ YOCTO #13660 ]
Test-by: Armin Kuster <akuster808@gmail.com>


>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/insane.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index f856cf6a2b6..0564f9c2a41 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -893,9 +893,9 @@ def package_qa_check_src_uri(pn, d, messages):
>      if "${PN}" in d.getVar("SRC_URI", False):
>          package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
>  
> -    pn = d.getVar("SRC_URI")
> -    if re.search(r"github\.com/.+/.+/archive/.+", pn):
> -        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
> +    for url in d.getVar("SRC_URI").split():
> +        if re.search(r"github\.com/.+/.+/archive/.+", url):
> +            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
>  
>  
>  # The PACKAGE FUNC to scan each package


