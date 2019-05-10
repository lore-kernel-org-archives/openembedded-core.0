Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD30B7CFEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 22:13:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h17so3650325pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Jz9gYZo1ZKCBr54tI9oI0JQnn1F5Uc8hxLyeu3TVGpU=;
	b=ekeAda9POVyL0rOWPTVILBDzVOSDM6zADjw8VH4fS8oNK5w6dULVcqqofd5sSrDNAb
	ti9JY6qHSIwl0WyC8PoLZl1cvDVf2xeCcNLMUUq9SHgNVMpGHhLcPPd2hw5KXcFjpfH2
	M6lpdzbaWqsYQ85NWK+0ZEKh+4OfmI9mljOEsVwgUAszQvBmShf43UFZkU+clIfRW46Q
	X43JjTz6zEX/uqS8V9H4BAdJ/rQxX1eUws8MStUWks/qqz5I1mNCgZQokv4HS+7QNrnM
	iBICSuIPIPR1zVosPgKMcgchqiyYiPXzIiHun7jHwZ0UOWt2/zItUqIx+jd/wToJM/Lz
	H0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Jz9gYZo1ZKCBr54tI9oI0JQnn1F5Uc8hxLyeu3TVGpU=;
	b=UNoeXrP5Gm5aIOVTtdGVjVj7BZ1Xc8r8Ns2lJaFVpa7iFadypZdnPw/aSzcXgdX4RZ
	fHpx3lDswewxnoz/JJeMMxk9v6HZQRmU9p144x9l+rB+BBwnwNWIIvM7ruevrTCSgWgd
	3ehN/xodumDbnBvrfTVYGZlNx1AyE5XhZu1JbkerFIB797X3Msi3n0q4JlclA/L6LdR6
	lmqrFFCzYLQ8UK3h407TCwi+Fk5I+gJCZofKu76gGLn1Fdl1urUuh1uyeWW+6c/kLYwQ
	MBSnhpdxMpLrZYGfhru9d+HAJFIsbYuRX5iDFoh2U/L0lMNBHVq3jBsvRRB3/PdJ22Fk
	GctA==
X-Gm-Message-State: APjAAAU13lLHW0LQCtqYsxwDaEyrTeJqr/sAGhtnRfQ1GLaJ4k/CDkKc
	v0xCIpMd7FPY1MxfTaXWcUbcZWjI
X-Google-Smtp-Source: APXvYqxPpKC66WkElOjse60yPWbM12jLnPNBIs5RGie2q9VCe1dFJ+hTJmZwDQtTo/QOQIhZsmHLSQ==
X-Received: by 2002:a63:3182:: with SMTP id
	x124mr16252304pgx.364.1557526429630; 
	Fri, 10 May 2019 15:13:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:2909:a937:370d:1a54?
	([2601:202:4180:c33:2909:a937:370d:1a54])
	by smtp.gmail.com with ESMTPSA id
	s21sm13274950pgo.13.2019.05.10.15.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 15:13:49 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
Date: Fri, 10 May 2019 15:13:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510215500.18914-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Fri, 10 May 2019 22:13:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

should we change the default to openssl ?

- armin

On 5/10/19 2:55 PM, Martin Jansa wrote:
> * gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
>   meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'
>
> * disabling gnutls PACKAGECONFIG isn't an option either:
>   meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend
>
> * add an option to replace gnutls with openssl
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> index 09af229d69..e2b4cffb2b 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
>  PACKAGECONFIG ??= "gnutls"
>  
>  PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
>  PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
>  
>  EXTRA_OEMESON = "-Dgnome_proxy=disabled"


