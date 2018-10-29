Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E57EB78E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:46:55 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p7-v6so4010572plk.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=B/NPYakncaeLcSlQ37L+T0fLGNd7iFTkFGJ2QNfrhKU=;
	b=jdNpWBaUmqg04C3jB/d/nYHaJCTEgkuKN/hjy9uowpAX0HpTsYoxtTKBTEl9/cAk0N
	49WyKPHmMpxQWspJg3VES3Hl/B1oC2ieDBF4An6hqieTNbryjDwPZhZxgdWQA93kPTk6
	TWnmFBAYhm2VUH/glC+jVNEs3IWmYdVhsUkGbeehbMVeoVGag/VD6mIgs/BwGPrqqiHm
	F2yi69diPGQ1HCY3Xo0Fwt2GMSJwPAAkiUhoOMiSaYldb6fiwzN/XsrqIMOP2BtsdCyy
	O1Ua/+uIbitI3fZ03JvspVSLtDYA38GRjKnNZrLcbrignGj8FiZ0mDWeXdUeiuWcezh8
	JWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=B/NPYakncaeLcSlQ37L+T0fLGNd7iFTkFGJ2QNfrhKU=;
	b=iom+DnjjMOoiZ0pPBIhNMIaRi+sq6Py3HuRo0FEjtjzgDDBJp76B4XskxFdD2JA6Rm
	qXN1ZqDy8+wyHk6r11Pufyx+57Y9Lb1QmRvTiGpFuHiMhLcJlEKJR3TqwnZaxLKHXSWP
	QbafgzfQFIjpmVkXXBX/nabHKuFZHLHzrl2+x89v0Fb/XQ57WTsyie39YmT/fuvc46Gs
	X2X8EvWKXI7aGPx7tpZt4TUAt+DX0ZMpMdmz59vmWgRE/fhFHByZyiQKjMfsjHwCmRtQ
	hsSuhL1tuiHrZ5hdS7cRQqOg0jRF0MvCPc9kL6kawtZLbEJjcbBHtM3EABEKeGriVj9N
	C56w==
X-Gm-Message-State: AGRZ1gLGyJpYvdxCld7r6Q+nA3n5f254bCHubf/qwMRNQEXpz2HUrUYy
	3OIvTOkenT7fPOvhGdry7lw=
X-Google-Smtp-Source: AJdET5c0YGNxzP10ASE7BbyIRIqV0s/77fdkv29kF03n3XFT6KgrFcUbxNhfaUvM0+8obpMnGI/xgg==
X-Received: by 2002:a17:902:5ac9:: with SMTP id
	g9-v6mr15086439plm.311.1540828016869; 
	Mon, 29 Oct 2018 08:46:56 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:3405:5320:ca09:da28?
	([2601:202:4180:c33:3405:5320:ca09:da28])
	by smtp.gmail.com with ESMTPSA id
	v83-v6sm39819772pfa.103.2018.10.29.08.46.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 08:46:56 -0700 (PDT)
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <20181029151310.18527-1-gtertych@cisco.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
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
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
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
Message-ID: <62100e44-8bad-1eb4-1702-58ec0e9b94d8@gmail.com>
Date: Mon, 29 Oct 2018 15:46:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029151310.18527-1-gtertych@cisco.com>
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH] curl: extend CVE_PRODUCT
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
X-List-Received-Date: Mon, 29 Oct 2018 15:46:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10/29/18 3:13 PM, grygorii tertychnyi via Openembedded-core wrote:
> There are both "curl" and "libcurl" CPEs in NVD.
> All "curl" CVEs are now missed in the reports.
>
> Hence, switch "CVE_PRODUCT" to a space separated list.
> It is useful for recipes generating several packages,
> that have different product names in NVD.
>
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
>  meta/classes/cve-check.bbclass           | 3 ++-
>  meta/recipes-support/curl/curl_7.61.0.bb | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 12ad3e5c5c..743bc08a4f 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -190,7 +190,8 @@ def check_cves(d, patched_cves):
>          # Write the faux CSV file to be used with cve-check-tool
>          fd, faux = tempfile.mkstemp(prefix="cve-faux-")
>          with os.fdopen(fd, "w") as f:
> -            f.write("%s,%s,%s," % (bpn, pv, cves))
> +            for pn in bpn.split():
> +                f.write("%s,%s,%s,\n" % (pn, pv, cves))
>          cmd.append(faux)


Please split this patch into two parts.  the appear to be independent.


- armin

>  
>          output = subprocess.check_output(cmd).decode("utf-8")
> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> index 9b6406bbd0..53cfc4a518 100644
> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
>  SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
>  
> -CVE_PRODUCT = "libcurl"
> +CVE_PRODUCT = "curl libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
>  
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"

