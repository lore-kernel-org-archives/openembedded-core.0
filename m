Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 051057E069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:28 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u17so7646733pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YMA3suz1Ve1W0ny53RUUrImX8ta+FcEh6nST8KpklGc=;
	b=qcx6VQzIT2rORYIB5RmHmMNBNiAp/TypKp0938h8LAMd5ynfJXFYSdf87/LzlBAded
	MnZD40BS4siKBtJOLikSEtvwN20EiB9PWQgLjJaLEUkJy/QVnoZJPw7B2yKelkldzCQy
	BfAvCA53wUet7bq/SBihZf6zDYtG53ExTGmSqDpTxCQEOqg40MZZijv4zzDfiv5ZUt43
	TZ1Nf7Yio1x8q2HQzaJ3ouKuUgRX/Y1VD+zNrefyBZOKMODUwWOIe5+i73xct9diCvqm
	FsGhZaowGKhR8ywLUPwfuPKsLxKLRDZnHk2OOn+iyHL2heBmRVd9MpAtKGp0OySDxcKV
	1PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=YMA3suz1Ve1W0ny53RUUrImX8ta+FcEh6nST8KpklGc=;
	b=Bkcf/s2pqEXFR6yRp+Cqaqt17qYV0+gBr/sq8+yQd+8/GWgnB/rInvCX6dfL84eUMU
	1XiH2H4lAW6yft9SO8LC3cXkcURw4J7muQAICSuV9eati6wXX9vlnsGzZGiONx963mK0
	KJFnXahAnlRGIGTOsWRmE8PYrDJHLDLuh1QVvBAj6ZDDmSZOHDuz9dbSluPqYx/dMZMp
	lPNau0U9ZeKkzufnC9AgyRI7Vzp0yUNj/JzCo1M/VmP/0OEC+ywD46vB5xUaxjSgLePR
	In3Puth/plhhJPLOPXKupsCrNp2WCgRUH/okD7/THvDTZvN5oNOkFnPRAL1EbDV7XhFu
	bdRw==
X-Gm-Message-State: APjAAAX30QoCz8jcqGZNoX0gk37VjqqxvpLwg5c5SM6so3P775hOetWi
	tXsYrW0az8ptjmcfLPeq/qklyPJrvGU=
X-Google-Smtp-Source: APXvYqwueBDP3FivkGHMvNEXRrEcCJEdX3ZgkFAjpk3aeLmlrrtnesvrDq9aOxVbeqc3pWR43oR6kw==
X-Received: by 2002:a65:620a:: with SMTP id d10mr23278391pgv.42.1558377809799; 
	Mon, 20 May 2019 11:43:29 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	g17sm8137015pfb.56.2019.05.20.11.43.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 11:43:29 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190516114914.12427-1-richard.purdie@linuxfoundation.org>
	<20190516114914.12427-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4744125d-7cce-3325-414b-f05c5fe01a52@gmail.com>
Date: Mon, 20 May 2019 11:43:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190516114914.12427-2-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/2] apr/apr-util: Add ptest dependency on libgcc
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
X-List-Received-Date: Mon, 20 May 2019 18:43:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/16/19 4:49 AM, Richard Purdie wrote:
> Avoid:
> 
> libgcc_s.so.1 must be installed for pthread_cancel to work
> 
> when running the ptest without libgcc.
> 


this is interesting, do we get this error explicitly from running some 
tests ?

I wonder why libgcc is not detected during rdep calculation time.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-support/apr/apr-util_1.6.1.bb | 1 +
>   meta/recipes-support/apr/apr_1.7.0.bb      | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
> index 0c90f8d2527..1f9fea25d87 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.1.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
> @@ -79,6 +79,7 @@ INSANE_SKIP_${PN} += "dev-so"
>   inherit ptest
>   
>   RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-iso8859-1 glibc-gconv-iso8859-2 glibc-gconv-utf-7"
> +RDEPENDS_${PN}-ptest += "libgcc"
>   
>   do_compile_ptest() {
>   	cd ${B}/test
> diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
> index a58651d0774..09a65bfdd68 100644
> --- a/meta/recipes-support/apr/apr_1.7.0.bb
> +++ b/meta/recipes-support/apr/apr_1.7.0.bb
> @@ -53,6 +53,8 @@ do_configure_prepend() {
>   FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
>   RDEPENDS_${PN}-dev += "bash"
>   
> +RDEPENDS_${PN}-ptest += "libgcc"
> +
>   #for some reason, build/libtool.m4 handled by buildconf still be overwritten
>   #when autoconf, so handle it again.
>   do_configure_append() {
> 

