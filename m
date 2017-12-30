Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 732A860777
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Dec 2017 04:29:52 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j124so22795196pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Dec 2017 20:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=9GLSgvTj7aHAeDmPwiB6JumbnTxtL1aWfHDxup0gzNU=;
	b=jZ34h2VBO3bZHXTzEaqvSXT92MwXo8h18/VQcyCsAuSPqikdXTR7or7O8ZWMujmMTW
	dhk/n0A8pD65oFalgHKr0drchjdO2fCLVYYo/0mDr2/sA4KnnxlET+ywLXXuyys7tkvC
	h14r0ZwVJgfpjx+ALgFchtyRZY+0nkoTdgOUk139pLhC9jgVXRWmEEPoP59mmGP4SMf8
	q92RAvbmFTE21uQRihES/vbFTjlD6vp9YPX+Fy4Zwdfy2SeTawlJdTWohQ4/eSRd+qjJ
	H5Z6lZVy7IJSez7JSpjYA2w9NYFGSDhTBuq3SBMTYtg2GU0gLbR6fwo5jxse05eDympS
	2RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9GLSgvTj7aHAeDmPwiB6JumbnTxtL1aWfHDxup0gzNU=;
	b=jSgriKjnOTW3+OfoQrAp09K+27fwcgpfflPujqrSLNqIj/cdNJFQDCQ0a/Eg6qRAJf
	GQGBlrZqpbQgzyqWB2WbpLClO0tWTzNCr2cx46eVbW4qRsO49+k07ATLlttWOdLFwrZI
	gwdxWMb2oo3EzkhzDVzJiPVBGn5Oltocm4Cd/hjsZSBauEOOE5a7R54kJBre0zPjYn1X
	2CXd9S9vlSC3d0cbTNPP02fL4JOYjvOLZAyRRkReSsW3lLvNwzZz9E56WYzcuKG4D0tp
	Gi2Lm57EgObtLvXkxh8uIIbquspHm9tsWdZ+au01lpts4jlx3qlDgrgYE2vb/EDHGqzv
	P7zg==
X-Gm-Message-State: AKGB3mKUaReA3ld1j4hEtPPUxO1UsA8drQ1Fy4MTe0h/RcO7jpPmp1uU
	VhTFUiMp72ohHpu4vu6qFllGSA==
X-Google-Smtp-Source: ACJfBov0Of3Sbx4LFUKoifCPmgNoR9BS9Nyz6+adNxA9PB+RfcFNQoedFFxdKPhI+eOWYHNhdUdkrg==
X-Received: by 10.101.87.143 with SMTP id b15mr21883848pgr.227.1514608193274; 
	Fri, 29 Dec 2017 20:29:53 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:48c6:76be:ab56:bed9?
	([2601:202:4000:1184:48c6:76be:ab56:bed9])
	by smtp.gmail.com with ESMTPSA id
	c185sm74357802pfb.48.2017.12.29.20.29.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 20:29:52 -0800 (PST)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1514438375-4227-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <19404760-e3b8-aaf5-3ff8-4d22398cb4e4@gmail.com>
Date: Fri, 29 Dec 2017 20:29:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1514438375-4227-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [rocko] [PATCH] glibc:CVE-2017-17426
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
X-List-Received-Date: Sat, 30 Dec 2017 04:29:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/27/2017 09:19 PM, Huang Qiyu wrote:
> Fix the CVE-2017-17426.

Is this fix in master?

- armin
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  ...-overflow-in-malloc-when-tcache-is-enable.patch | 49 ++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch b/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch
> new file mode 100644
> index 0000000..fb52be5
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch
> @@ -0,0 +1,49 @@
> +From 34697694e8a93b325b18f25f7dcded55d6baeaf6 Mon Sep 17 00:00:00 2001
> +From: Arjun Shankar <arjun@redhat.com>
> +Date: Thu, 30 Nov 2017 13:31:45 +0100
> +Subject: [PATCH] Fix integer overflow in malloc when tcache is enabled [BZ
> + #22375]
> +
> +When the per-thread cache is enabled, __libc_malloc uses request2size (which
> +does not perform an overflow check) to calculate the chunk size from the
> +requested allocation size. This leads to an integer overflow causing malloc
> +to incorrectly return the last successfully allocated block when called with
> +a very large size argument (close to SIZE_MAX).
> +
> +This commit uses checked_request2size instead, removing the overflow.
> +---
> + ChangeLog       | 6 ++++++
> + malloc/malloc.c | 3 ++-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index b55ed22..888f9fb 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,9 @@
> ++2017-11-30  Arjun Shankar  <arjun@redhat.com>
> ++
> ++	[BZ #22375]
> ++	* malloc/malloc.c (__libc_malloc): Use checked_request2size
> ++	instead of request2size.
> ++
> + 2017-08-02  Siddhesh Poyarekar  <siddhesh@sourceware.org>
> + 
> + 	* sysdeps/sparc/sparc32/sparcv9/fpu/multiarch/s_llrint.S
> +diff --git a/malloc/malloc.c b/malloc/malloc.c
> +index 79f0e9e..0c9e074 100644
> +--- a/malloc/malloc.c
> ++++ b/malloc/malloc.c
> +@@ -3050,7 +3050,8 @@ __libc_malloc (size_t bytes)
> +     return (*hook)(bytes, RETURN_ADDRESS (0));
> + #if USE_TCACHE
> +   /* int_free also calls request2size, be careful to not pad twice.  */
> +-  size_t tbytes = request2size (bytes);
> ++  size_t tbytes;
> ++  checked_request2size (bytes, tbytes);
> +   size_t tc_idx = csize2tidx (tbytes);
> + 
> +   MAYBE_INIT_TCACHE ();
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
> index 135ec4f..d314316 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
>             file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
>             file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
> +           file://0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch\
>  "
>  
>  NATIVESDKFIXES ?= ""


