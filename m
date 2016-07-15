Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D076606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:34:19 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id dx3so6229231pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=nQ4nhqd7M5XCZdch1bPIlNDIEBqCwN+upKz31YzUM7Q=;
	b=zQsgKJMKlmfvdzcsuRwjacYlqYLrfTcrKpCmS68Cd+W7ZJkfJqwSh987cTq0+L9oF1
	h89GgPjFSM6n3ibKQhbWZpeYgf1r5adJpmPqdQstasRj8BdHvIuxn8+cDNeA3nXbCUbJ
	SaNvlfEv2BWBfUeeqz0Ca17P621fHDaDZ7dRBDV1zGc8LQLGkpspjvasKs0tUNxvpSLi
	EihdXk76KUUtwILm8p3EKXkZ0eTlJV4LNWP48ZO/LrD7eq6Q6T8rS1qbu5/hA5tD7wlD
	Y+XtcyAUqEAvJsuzSg9sRbpTbPj86auA6pmKdG7IeEBqiKnZEDXM+hJ4encEPUgXFue9
	0PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=nQ4nhqd7M5XCZdch1bPIlNDIEBqCwN+upKz31YzUM7Q=;
	b=SOat5bCQmsFyfP49F87k/YEGT/pblI8//CUsXOH/nWCrvnOle+Giisdzbj+FHiCHmV
	N66EXDr3G9Xeplm5xtf7AfFpGBYPI8Gn4YTIc73WgnE1ijyGQG4gAoV+jweUlmHkTDNv
	Dw06PWYYZw8h0lnUgB/vJe/6pfdcOi7qXW7M9dGi7O3USuipY60STefvo6MgpZCy6Tbf
	q/+MsvNViRUCBF63sJuIEGUdcqOYQ4sLOOTyYVPoPH5mBXfw5HcueJH1etGcgWMw6ys7
	vZC2kG0uxPXR6dQRHzCg44bqK8aw/TqEgSJg06lSdRBxBcY5K2R01yXyydgWUpNV538A
	1pdw==
X-Gm-Message-State: ALyK8tLJMSlroL6raw/OJG6FNe+f7Fj1CsnkgCID+/s0pB5CoAByGHycOsKy4LZHWaTZxQ==
X-Received: by 10.66.155.129 with SMTP id vw1mr31689061pab.148.1468593260296; 
	Fri, 15 Jul 2016 07:34:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	i187sm2928819pfc.62.2016.07.15.07.34.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 07:34:18 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20160715100325.29006-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5788F469.6080303@gmail.com>
Date: Fri, 15 Jul 2016 07:34:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160715100325.29006-1-raj.khem@gmail.com>
Subject: Re: [PATCH] nss: Fix build on mips/clang
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
X-List-Received-Date: Fri, 15 Jul 2016 14:34:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Does this affect Krogoth?
- armin

On 07/15/2016 03:03 AM, Khem Raj wrote:
> This issue is also reported here
> https://trac.macports.org/ticket/51709
> Patch is also from same ticket
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-support/nss/nss/pqg.c-ULL_addend.patch | 23 ++++++++++++++++++++++
>  meta/recipes-support/nss/nss_3.24.bb               |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
> 
> diff --git a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
> new file mode 100644
> index 0000000..9caaaeb
> --- /dev/null
> +++ b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
> @@ -0,0 +1,23 @@
> +nss does not build on mips with clang because wrong types are used?
> +
> +pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
> +     if (addend < MP_DIGIT_MAX) {
> +       ~~~~~~ ^ ~~~~~~~~~~~~
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: nss-3.24/nss/lib/freebl/pqg.c
> +===================================================================
> +--- nss-3.24.orig/nss/lib/freebl/pqg.c
> ++++ nss-3.24/nss/lib/freebl/pqg.c
> +@@ -322,8 +322,8 @@ generate_h_candidate(SECItem *hit, mp_in
> + 
> + static SECStatus
> + addToSeed(const SECItem * seed,
> +-          unsigned long   addend,
> +-          int             seedlen, /* g in 186-1 */
> ++          unsigned long long  addend,
> ++          int                 seedlen, /* g in 186-1 */
> +           SECItem * seedout)
> + {
> +     mp_int s, sum, modulus, tmp;
> diff --git a/meta/recipes-support/nss/nss_3.24.bb b/meta/recipes-support/nss/nss_3.24.bb
> index caed7fa..c7c9fab 100644
> --- a/meta/recipes-support/nss/nss_3.24.bb
> +++ b/meta/recipes-support/nss/nss_3.24.bb
> @@ -21,6 +21,7 @@ SRC_URI = "\
>      file://nss-fix-incorrect-shebang-of-perl.patch \
>      file://nss-fix-nsinstall-build.patch \
>      file://disable-Wvarargs-with-clang.patch \
> +    file://pqg.c-ULL_addend.patch \
>      file://nss.pc.in \
>      file://signlibs.sh \
>  "
> 

