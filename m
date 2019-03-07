Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B529A7CEBA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:08:41 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id f186so3814763ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 05:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=2JsRw/vSJH/UpfpC6pDlvPVcJTK3GcBcy3EnXwqMhoo=;
	b=IvL58Eg0IWlRkgqwiYe4X3hulsaD/HnK/m5+p2FP3szBFTQ09K1bjBJUmsRBD7uvI5
	jWHVxNIeLjoR/PJ+XF6yhh+XrmJ1YuaPtq7BNH97YX8q0//vQi9laMNAKQHDY8Pg1elk
	EnhJzWIiqiu6CYO8vZ7Ah7nYfMRl1bNxRgTCprSbT5HuZR5rDhbfWSdLzcNKAQ78jYEK
	fnfqmJxoENaiMvuW6O+fZIpAPjBHWmAba/+0LqMelqQGyQjFYitnSjlQ7mfKm+2ud/J7
	hCXXozoKfTukoHNmU2Adsgp78PM+/ivDPB38WmjsvyDJB/cz1Er15Gl8/pit+M4YfpZR
	cV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2JsRw/vSJH/UpfpC6pDlvPVcJTK3GcBcy3EnXwqMhoo=;
	b=ZZ2UH+JfWUTtcjJPPg0uK/e1UbHPIazZu55xgvd1jm12HOsEyWJYEd4BRbB8dR8PqH
	T6tQ1Rz3Ipfc2XHQxf00Yi5w1XA0Jv0m7+/3y7OjbpkUNmQXo50xk19j0yDquZg8On+G
	eZ9Qh1qQX6NS0P1Qdagj0j+0vpOi1VjtnvQu9WmRrNCZnsWM9PF3R0oHfnE5i73e9lTD
	L3W86ywZ4oXN8vAniSPpwwndxH59EQMeD7Mq3U17Mjt/9g/odCk0KG0o2FKhvZfWQ5fs
	thYvJcKVNRFPXgL9SHuNojQlMZSXQs+6T1Ft937oRxRrAXCT3C1zB/hS/qosJbm1qbQ/
	lu4A==
X-Gm-Message-State: APjAAAVn852C65dHASbdeQ4sPu1acbjhvsmlqWVTEDcwOu0Xf3WIhA0y
	n7DcOSMYpbrtKCzEc9FdV1jYt1fpGcWKDcu9NbE0oX7S
X-Google-Smtp-Source: APXvYqxrZlRmbssgNhwesl+f/eNDKXz3G+3ouMFVsQvVkUxVpFoZ/+FzX0m76/2E9NLxsM4XsgJB+IQgEZCR9HcnVU4=
X-Received: by 2002:a24:2405:: with SMTP id f5mr5585429ita.130.1551964122287; 
	Thu, 07 Mar 2019 05:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20190306225101.10727-1-ross.burton@intel.com>
In-Reply-To: <20190306225101.10727-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 13:08:30 +0000
Message-ID: <CAJTo0Lb5-jyt5U6M2Lzgnd1pY1hqd+TzR=V9iH5AH3zs=YS76w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcre2: fix CVE-2017-7186
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
X-List-Received-Date: Thu, 07 Mar 2019 13:08:41 -0000
Content-Type: text/plain; charset="UTF-8"

Retracting this, I can't tell the difference between 10.32 and 10.23.

Ross

On Wed, 6 Mar 2019 at 22:51, Ross Burton <ross.burton@intel.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../libpcre/libpcre2/CVE-2017-7186.patch           | 83 ++++++++++++++++++++++
>  meta/recipes-support/libpcre/libpcre2_10.32.bb     |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2017-7186.patch
>
> diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2017-7186.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2017-7186.patch
> new file mode 100644
> index 00000000000..7cd7c27c6c0
> --- /dev/null
> +++ b/meta/recipes-support/libpcre/libpcre2/CVE-2017-7186.patch
> @@ -0,0 +1,83 @@
> +libpcre1 in PCRE 8.40 and libpcre2 in PCRE2 10.23 allow remote attackers to
> +cause a denial of service (segmentation violation for read access, and
> +application crash) by triggering an invalid Unicode property lookup.
> +
> +CVE: CVE-2017-7186
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +---
> + src/pcre2_internal.h | 15 ++++++++++++++-
> + src/pcre2_ucd.c      | 14 ++++++++++++++
> + 2 files changed, 28 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/pcre2_internal.h b/src/pcre2_internal.h
> +index 6a8774c..720bbc9 100644
> +--- a/src/pcre2_internal.h
> ++++ b/src/pcre2_internal.h
> +@@ -1774,10 +1774,17 @@ typedef struct {
> + /* UCD access macros */
> +
> + #define UCD_BLOCK_SIZE 128
> +-#define GET_UCD(ch) (PRIV(ucd_records) + \
> ++#define REAL_GET_UCD(ch) (PRIV(ucd_records) + \
> +         PRIV(ucd_stage2)[PRIV(ucd_stage1)[(int)(ch) / UCD_BLOCK_SIZE] * \
> +         UCD_BLOCK_SIZE + (int)(ch) % UCD_BLOCK_SIZE])
> +
> ++#if PCRE2_CODE_UNIT_WIDTH == 32
> ++#define GET_UCD(ch) ((ch > MAX_UTF_CODE_POINT)? \
> ++  PRIV(dummy_ucd_record) : REAL_GET_UCD(ch))
> ++#else
> ++#define GET_UCD(ch) REAL_GET_UCD(ch)
> ++#endif
> ++
> + #define UCD_CHARTYPE(ch)    GET_UCD(ch)->chartype
> + #define UCD_SCRIPT(ch)      GET_UCD(ch)->script
> + #define UCD_CATEGORY(ch)    PRIV(ucp_gentype)[UCD_CHARTYPE(ch)]
> +@@ -1834,6 +1841,9 @@ extern const uint8_t          PRIV(utf8_table4)[];
> + #define _pcre2_default_compile_context PCRE2_SUFFIX(_pcre2_default_compile_context_)
> + #define _pcre2_default_match_context   PCRE2_SUFFIX(_pcre2_default_match_context_)
> + #define _pcre2_default_tables          PCRE2_SUFFIX(_pcre2_default_tables_)
> ++#if PCRE2_CODE_UNIT_WIDTH == 32
> ++#define _pcre2_dummy_ucd_record        PCRE2_SUFFIX(_pcre2_dummy_ucd_record_)
> ++#endif
> + #define _pcre2_hspace_list             PCRE2_SUFFIX(_pcre2_hspace_list_)
> + #define _pcre2_vspace_list             PCRE2_SUFFIX(_pcre2_vspace_list_)
> + #define _pcre2_ucd_caseless_sets       PCRE2_SUFFIX(_pcre2_ucd_caseless_sets_)
> +@@ -1858,6 +1868,9 @@ extern const uint32_t                  PRIV(hspace_list)[];
> + extern const uint32_t                  PRIV(vspace_list)[];
> + extern const uint32_t                  PRIV(ucd_caseless_sets)[];
> + extern const ucd_record                PRIV(ucd_records)[];
> ++#if PCRE2_CODE_UNIT_WIDTH == 32
> ++extern const ucd_record                PRIV(dummy_ucd_record)[];
> ++#endif
> + extern const uint8_t                   PRIV(ucd_stage1)[];
> + extern const uint16_t                  PRIV(ucd_stage2)[];
> + extern const uint32_t                  PRIV(ucp_gbtable)[];
> +diff --git a/src/pcre2_ucd.c b/src/pcre2_ucd.c
> +index 116f537..56aa29d 100644
> +--- a/src/pcre2_ucd.c
> ++++ b/src/pcre2_ucd.c
> +@@ -41,6 +41,20 @@ const uint32_t PRIV(ucd_caseless_sets)[] = {0};
> +
> + const char *PRIV(unicode_version) = "8.0.0";
> +
> ++/* If the 32-bit library is run in non-32-bit mode, character values
> ++greater than 0x10ffff may be encountered. For these we set up a
> ++special record. */
> ++
> ++#if PCRE2_CODE_UNIT_WIDTH == 32
> ++const ucd_record PRIV(dummy_ucd_record)[] = {{
> ++  ucp_Common,    /* script */
> ++  ucp_Cn,        /* type unassigned */
> ++  ucp_gbOther,   /* grapheme break property */
> ++  0,             /* case set */
> ++  0,             /* other case */
> ++  }};
> ++#endif
> ++
> + /* When recompiling tables with a new Unicode version, please check the
> + types in this structure definition from pcre2_internal.h (the actual
> + field names will be different):
> +--
> +2.12.1
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.32.bb b/meta/recipes-support/libpcre/libpcre2_10.32.bb
> index 3a0aa53029f..59953626c74 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.32.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.32.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=cf66d307bf03bae65d413eb7a8e603a0"
>
>  SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
>             file://pcre-cross.patch \
> +           file://CVE-2017-7186.patch \
>  "
>
>  SRC_URI[md5sum] = "8a096287153fb994970df3570e90fcb5"
> --
> 2.11.0
>

