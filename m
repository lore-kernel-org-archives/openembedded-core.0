Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9932F7FA84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:53:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so2927002wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mzjfRI5iXsDEzoQzIF069CsZ+EZuiT5M6peUqxxNYEM=;
	b=D2eYgrTBazRec9fUcJtBANmNMffVkLAc/sxE5woKStqTNq+9qGaoKp+emle3EWv7bu
	6hByW6IKtekeO5t9tLTrlvWurO91CWAbuQNVEMP7OkgByvXxzqOWelOviNKo6GSt9q6x
	AbTvcK2cuIwEn7jZi/l/RYWnAIl0UygT+n5oldOhPceP1Yb0mUBiubpDX3I06ZikamoB
	e+7zicILDELl2c3jt9sJuFV6qlEz3AkNeKbgStsmfhKOQVB+QT0I2tCAFog5LT3933dt
	UWXJtB1z2FSGPyTQStPh1k9civf5hoSfPvfFdl/BydBNvFWSL6E/klEF+lB8Tfuj+HWv
	m06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=mzjfRI5iXsDEzoQzIF069CsZ+EZuiT5M6peUqxxNYEM=;
	b=c7R5CEYPpUNY2FdNb8Tdz5i8RNg/axvjrJMEotxx7HZzCgjwQyL4J8etroqhDqAk66
	q6PaWT3ba8opjCPJowiPi17SpIH9LhO9IOmts4ytYWAjzBe4I2Vz7q0bd0ATJK0dr17z
	bn6sErmq2SMXkcxHRSeLbemHQS2n+3YxFPO7royquY+hjtfRM1mQOSLcVmoy50zfDsCW
	AqDKMNNdQFD9+eYZFZZ6EPSxAA2Vim1js+QYaomsMAYS1E9L9ZW6cb1bxAH9XYoKR3cV
	7J9J4/kNiqJaKeK/K0RLRUzR9acasWsuCO4oAzP1TGAArfTjLm90Vx2GbelxDQC5ZKVW
	E/pQ==
X-Gm-Message-State: APjAAAUjb9DDFPALmigz6LISjrJFfc7n8UITs7LO2Hz2MwsB0scOV5xq
	UxfgGq8hrm2bBOAU9o7lWAljhjbC53w=
X-Google-Smtp-Source: APXvYqzO97iAxqIhqq+dOAqWbsUs2WSkgX1NcO6TGccLGxtYK/L0OhUhn1KCHqy4ah+zZgkDk0C+uQ==
X-Received: by 2002:adf:e286:: with SMTP id v6mr3785276wri.241.1572018788929; 
	Fri, 25 Oct 2019 08:53:08 -0700 (PDT)
Received: from [172.16.50.42] ([82.3.55.76])
	by smtp.gmail.com with ESMTPSA id u7sm2969096wre.59.2019.10.25.08.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 08:53:08 -0700 (PDT)
To: muislam@microsoft.com, openembedded-core@lists.openembedded.org
References: <20191016211035.2270-1-muislam@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <4dc9cebb-de0e-8d43-83c9-6336ff54c77c@gmail.com>
Date: Fri, 25 Oct 2019 08:52:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016211035.2270-1-muislam@microsoft.com>
Subject: Re: [thud][PATCH] curl: Security fix for CVE-2019-5481
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
X-List-Received-Date: Fri, 25 Oct 2019 15:53:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/16/19 2:10 PM, Muminul Islam wrote:
> CVE: CVE-2019-5481
>
> Upstream-Status: Backport

Warrior needs to be fixed before I can get this in mainline thud.

- Armin
>
> Signed-off-by: Muminul Islam <muislam@microsoft.com>
> ---
>  .../curl/curl/CVE-2019-5481.patch             | 52 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.61.0.bb      |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5481.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2019-5481.patch b/meta/recipes-support/curl/curl/CVE-2019-5481.patch
> new file mode 100644
> index 0000000000..a97a95a268
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2019-5481.patch
> @@ -0,0 +1,52 @@
> +From f6fa4dffb2b973f3c7f2e8c2b6a7dc94c016f455 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 3 Sep 2019 22:59:32 +0200
> +Subject: [PATCH] security:read_data fix bad realloc()
> +Reply-To: muislam@microsoft.com
> +
> +... that could end up a double-free
> +
> +CVE-2019-5481
> +Bug: https://curl.haxx.se/docs/CVE-2019-5481.html
> +
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2019-5481
> +
> +Upstream-Status: Backport
> +
> +Upstream commit: https://github.com/curl/curl/commit/9069838b30fb3b48af0123e39f664cea683254a5
> +---
> + lib/security.c | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/security.c b/lib/security.c
> +index abf242c38..52cce97d0 100644
> +--- a/lib/security.c
> ++++ b/lib/security.c
> +@@ -191,7 +191,6 @@ static CURLcode read_data(struct connectdata *conn,
> +                           struct krb5buffer *buf)
> + {
> +   int len;
> +-  void *tmp = NULL;
> +   CURLcode result;
> + 
> +   result = socket_read(fd, &len, sizeof(len));
> +@@ -201,12 +200,11 @@ static CURLcode read_data(struct connectdata *conn,
> +   if(len) {
> +     /* only realloc if there was a length */
> +     len = ntohl(len);
> +-    tmp = Curl_saferealloc(buf->data, len);
> ++    buf->data = Curl_saferealloc(buf->data, len);
> +   }
> +-  if(tmp == NULL)
> ++  if(!len || !buf->data)
> +     return CURLE_OUT_OF_MEMORY;
> + 
> +-  buf->data = tmp;
> +   result = socket_read(fd, buf->data, len);
> +   if(result)
> +     return result;
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> index 3b54774b9d..29aaff20a1 100644
> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> @@ -14,6 +14,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://CVE-2019-5435.patch \
>             file://CVE-2019-5436.patch \
>             file://CVE-2019-5482.patch \
> +           file://CVE-2019-5481.patch \
>  "
>  
>  SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"


