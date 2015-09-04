Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 18F4677040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 23:48:00 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so35339975pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 16:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=MeGqy8h8vosbYcDo9uz7q0pebjcSXRd/wbidRw/OWVM=;
	b=0sVLawXA36FuhIdaLu9tm3TrQlZz6ypNvqncGezmqqmS4RX0IiwkBenD7sG1yRF6Jq
	zLZwkFraLWTb2zxDITslXVab+4n80F+aie06Ows+ye4ivgR+d3i7D8eACE+4ryDuBiUJ
	lgNl7uo3MOsjVau00g22h3IiB7Mvx2p36ZzUhIHAsHXgGsMMLLV5iZ6uE3OOnQhU+RbP
	oPxCTD9UH8Hfn1nyeEuqz935JECT2OR/pAQxxtcCC9VHSDwBWOuziy+kWy2dSaq9GPPd
	ahLp4PviFvDXxaF7w2HWQ/aY3asS9Tx4puF4+hZxUVNAxRqSSm0RpAS/ftcL8tZriX4v
	VPaA==
X-Received: by 10.69.2.69 with SMTP id bm5mr13660545pbd.41.1441410480864;
	Fri, 04 Sep 2015 16:48:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:ccfc:abc4:daa5:b1aa?
	([2601:202:4000:1239:ccfc:abc4:daa5:b1aa])
	by smtp.googlemail.com with ESMTPSA id
	fl6sm3778722pab.12.2015.09.04.16.47.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 16:47:59 -0700 (PDT)
Message-ID: <55EA2DAE.40606@gmail.com>
Date: Fri, 04 Sep 2015 16:47:58 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1441363860-25700-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1441363860-25700-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][dizzy] icu: CVE-2014-8146-CVE-2014-8147
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
X-List-Received-Date: Fri, 04 Sep 2015 23:48:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

queuing up,

thanks,
Armin

On 09/04/2015 03:51 AM, Sona Sarmadi wrote:
> CVE-2014-8146 icu: heap overflow via incorrect isolateCount
> CVE-2014-8147 icu: integer truncation in the resolveImplicitLevels function
> 
> References:
> [1] https://github.com/pedrib/PoC/raw/master/generic/i-c-u-fail.7z
> [2] https://www.kb.cert.org/vuls/id/602540
> [3] http://bugs.icu-project.org/trac/changeset/37080
> [4] http://bugs.icu-project.org/trac/changeset/37162
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  .../icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch  | 49 ++++++++++++++++++++++
>  meta/recipes-support/icu/icu_53.1.bb               |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch
> 
> diff --git a/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch b/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch
> new file mode 100644
> index 0000000..2460357
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch
> @@ -0,0 +1,49 @@
> +icu: CVE-2014-8146-CVE-2014-8147
> +
> +CVE-2014-8146 icu: heap overflow via incorrect isolateCount
> +CVE-2014-8147 icu: integer truncation in the resolveImplicitLevels function
> +
> +References:
> +[1] https://github.com/pedrib/PoC/raw/master/generic/i-c-u-fail.7z
> +[2] https://www.kb.cert.org/vuls/id/602540
> +[3] http://bugs.icu-project.org/trac/changeset/37080
> +[4] http://bugs.icu-project.org/trac/changeset/37162
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> +diff -ruN a/common/ubidi.c b/common/ubidi.c
> +--- a/common/ubidi.c	2014-10-03 18:11:20.000000000 +0200
> ++++ b/common/ubidi.c	2015-08-28 08:22:39.455906194 +0200
> +@@ -2138,7 +2138,7 @@
> +     /* The isolates[] entries contain enough information to
> +        resume the bidi algorithm in the same state as it was
> +        when it was interrupted by an isolate sequence. */
> +-    if(dirProps[start]==PDI) {
> ++    if(dirProps[start]==PDI  && pBiDi->isolateCount >= 0) {
> +         levState.startON=pBiDi->isolates[pBiDi->isolateCount].startON;
> +         start1=pBiDi->isolates[pBiDi->isolateCount].start1;
> +         stateImp=pBiDi->isolates[pBiDi->isolateCount].stateImp;
> +diff -ruN a/common/ubidiimp.h b/common/ubidiimp.h
> +--- a/common/ubidiimp.h	2014-10-03 18:11:16.000000000 +0200
> ++++ b/common/ubidiimp.h	2015-08-28 08:28:24.069163845 +0200
> +@@ -1,7 +1,7 @@
> + /*
> + ******************************************************************************
> + *
> +-*   Copyright (C) 1999-2014, International Business Machines
> ++*   Copyright (C) 1999-2015, International Business Machines
> + *   Corporation and others.  All Rights Reserved.
> + *
> + ******************************************************************************
> +@@ -184,8 +184,8 @@
> + typedef struct Isolate {
> +     int32_t startON;
> +     int32_t start1;
> ++    int32_t state;
> +     int16_t stateImp;
> +-    int16_t state;
> + } Isolate;
> +
> + typedef struct Run {
> diff --git a/meta/recipes-support/icu/icu_53.1.bb b/meta/recipes-support/icu/icu_53.1.bb
> index d93af68..2906e8f 100644
> --- a/meta/recipes-support/icu/icu_53.1.bb
> +++ b/meta/recipes-support/icu/icu_53.1.bb
> @@ -11,6 +11,7 @@ ICU_PV = "${@icu_download_version(d)}"
>  BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
>  SRC_URI = "${BASE_SRC_URI} \
>             file://icu-pkgdata-large-cmd.patch \
> +           file://icu-CVE-2014-8146-CVE-2014-8147.patch \
>            "
>  
>  SRC_URI_append_class-target = "\
> 

