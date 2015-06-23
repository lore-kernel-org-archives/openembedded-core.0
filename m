Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0A64373F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 22:41:45 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so16316834pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=OW2ELM+J3l1kdD+f9t6e+iBkyPb22uLU9GdvQPX/7+E=;
	b=dcm1zVL5X61WG0wvlTh6bECR2qzMPLnzp7u7HezRI6RRuey2w5mWE5uEiAe1lgCzrL
	eZd67KJJGkW9Wu+3qZKJPZhx2b1j/DEn0rjJXKH1ThDPvaeB+pPowQDBUBwHwHFbw9KJ
	ABinA7ZDzNSfzsclfkE2wEvkJ3nwX6Rplah83v0wdtehWXHruN6e4uBFzEsaVDSACcSh
	/WQwKqaFQGebJ5G1ZwxW1DnyBmcOlovZGnbgX8YJRxOP4gbnyIrLYyzVxcKg3VwyUhpT
	Yft5d2ie63yFHBe0saVsB2UnGuR7fFsbuQGfEj2eole0BdXXzuqbb+krLV18cU5oQ7CB
	BggA==
X-Received: by 10.68.178.229 with SMTP id db5mr74362141pbc.17.1435099306809;
	Tue, 23 Jun 2015 15:41:46 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id
	qo1sm24340743pbc.89.2015.06.23.15.41.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jun 2015 15:41:45 -0700 (PDT)
Message-ID: <5589E0A7.7070509@gmail.com>
Date: Tue, 23 Jun 2015 15:41:43 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1435037526-20046-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1435037526-20046-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] unzip: fix four CVE defects
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
X-List-Received-Date: Tue, 23 Jun 2015 22:41:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

CVE-2014-9636 is also mentioned in commit

c9ec5427609f084d9cbfb7336777fe1e3d0f3ef1
unzip: Security Advisory -CVE-2014-9636 and CVE-2015-1315

can you clarify why its on both places?

- armin

On 06/22/2015 10:32 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Port four patches from unzip_6.0-8+deb7u2.debian.tar.gz to fix:
>       cve-2014-8139
>       cve-2014-8140
>       cve-2014-8141
>       cve-2014-9636
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../unzip/09-cve-2014-8139-crc-overflow.patch      |  52 ++++++++
>   .../unzip/10-cve-2014-8140-test-compr-eb.patch     |  33 +++++
>   .../unzip/11-cve-2014-8141-getzip64data.patch      | 144 +++++++++++++++++++++
>   .../unzip/12-cve-2014-9636-test-compr-eb.patch     |  45 +++++++
>   meta/recipes-extended/unzip/unzip_6.0.bb           |   4 +
>   5 files changed, 278 insertions(+)
>   create mode 100644 meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
>   create mode 100644 meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
>   create mode 100644 meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
>   create mode 100644 meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
>
> diff --git a/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch b/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
> new file mode 100644
> index 0000000..e137f0d
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
> @@ -0,0 +1,52 @@
> +From: sms
> +Subject: Fix CVE-2014-8139: CRC32 verification heap-based overflow
> +Bug-Debian: http://bugs.debian.org/773722
> +
> +The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
> +--- a/extract.c
> ++++ b/extract.c
> +@@ -298,6 +298,8 @@
> + #ifndef SFX
> +    static ZCONST char Far InconsistEFlength[] = "bad extra-field entry:\n \
> +      EF block length (%u bytes) exceeds remaining EF data (%u bytes)\n";
> ++   static ZCONST char Far TooSmallEBlength[] = "bad extra-field entry:\n \
> ++     EF block length (%u bytes) invalid (< %d)\n";
> +    static ZCONST char Far InvalidComprDataEAs[] =
> +      " invalid compressed data for EAs\n";
> + #  if (defined(WIN32) && defined(NTSD_EAS))
> +@@ -2023,7 +2025,8 @@
> +         ebID = makeword(ef);
> +         ebLen = (unsigned)makeword(ef+EB_LEN);
> +
> +-        if (ebLen > (ef_len - EB_HEADSIZE)) {
> ++        if (ebLen > (ef_len - EB_HEADSIZE))
> ++        {
> +            /* Discovered some extra field inconsistency! */
> +             if (uO.qflag)
> +                 Info(slide, 1, ((char *)slide, "%-22s ",
> +@@ -2158,11 +2161,19 @@
> +                 }
> +                 break;
> +             case EF_PKVMS:
> +-                if (makelong(ef+EB_HEADSIZE) !=
> ++                if (ebLen < 4)
> ++                {
> ++                    Info(slide, 1,
> ++                     ((char *)slide, LoadFarString(TooSmallEBlength),
> ++                     ebLen, 4));
> ++                }
> ++                else if (makelong(ef+EB_HEADSIZE) !=
> +                     crc32(CRCVAL_INITIAL, ef+(EB_HEADSIZE+4),
> +                           (extent)(ebLen-4)))
> ++                {
> +                     Info(slide, 1, ((char *)slide,
> +                       LoadFarString(BadCRC_EAs)));
> ++                }
> +                 break;
> +             case EF_PKW32:
> +             case EF_PKUNIX:
> diff --git a/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
> new file mode 100644
> index 0000000..edc7d51
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
> @@ -0,0 +1,33 @@
> +From: sms
> +Subject: Fix CVE-2014-8140: out-of-bounds write issue in test_compr_eb()
> +Bug-Debian: http://bugs.debian.org/773722
> +
> +The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
> +--- a/extract.c
> ++++ b/extract.c
> +@@ -2232,10 +2232,17 @@
> +     if (compr_offset < 4)                /* field is not compressed: */
> +         return PK_OK;                    /* do nothing and signal OK */
> +
> ++    /* Return no/bad-data error status if any problem is found:
> ++     *    1. eb_size is too small to hold the uncompressed size
> ++     *       (eb_ucsize).  (Else extract eb_ucsize.)
> ++     *    2. eb_ucsize is zero (invalid).  2014-12-04 SMS.
> ++     *    3. eb_ucsize is positive, but eb_size is too small to hold
> ++     *       the compressed data header.
> ++     */
> +     if ((eb_size < (EB_UCSIZE_P + 4)) ||
> +-        ((eb_ucsize = makelong(eb+(EB_HEADSIZE+EB_UCSIZE_P))) > 0L &&
> +-         eb_size <= (compr_offset + EB_CMPRHEADLEN)))
> +-        return IZ_EF_TRUNC;               /* no compressed data! */
> ++     ((eb_ucsize = makelong( eb+ (EB_HEADSIZE+ EB_UCSIZE_P))) == 0L) ||
> ++     ((eb_ucsize > 0L) && (eb_size <= (compr_offset + EB_CMPRHEADLEN))))
> ++        return IZ_EF_TRUNC;             /* no/bad compressed data! */
> +
> +     if (
> + #ifdef INT_16BIT
> diff --git a/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch b/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
> new file mode 100644
> index 0000000..d0c1db3
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
> @@ -0,0 +1,144 @@
> +From: sms
> +Subject: Fix CVE-2014-8141: out-of-bounds read issues in getZip64Data()
> +Bug-Debian: http://bugs.debian.org/773722
> +
> +The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
> +
> +--- a/fileio.c
> ++++ b/fileio.c
> +@@ -176,6 +176,8 @@
> + #endif
> + static ZCONST char Far ExtraFieldTooLong[] =
> +   "warning:  extra field too long (%d).  Ignoring...\n";
> ++static ZCONST char Far ExtraFieldCorrupt[] =
> ++  "warning:  extra field (type: 0x%04x) corrupt.  Continuing...\n";
> +
> + #ifdef WINDLL
> +    static ZCONST char Far DiskFullQuery[] =
> +@@ -2295,7 +2297,12 @@
> +             if (readbuf(__G__ (char *)G.extra_field, length) == 0)
> +                 return PK_EOF;
> +             /* Looks like here is where extra fields are read */
> +-            getZip64Data(__G__ G.extra_field, length);
> ++            if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
> ++            {
> ++                Info(slide, 0x401, ((char *)slide,
> ++                 LoadFarString( ExtraFieldCorrupt), EF_PKSZ64));
> ++                error = PK_WARN;
> ++            }
> + #ifdef UNICODE_SUPPORT
> +             G.unipath_filename = NULL;
> +             if (G.UzO.U_flag < 2) {
> +--- a/process.c
> ++++ b/process.c
> +@@ -1,5 +1,5 @@
> + /*
> +-  Copyright (c) 1990-2009 Info-ZIP.  All rights reserved.
> ++  Copyright (c) 1990-2014 Info-ZIP.  All rights reserved.
> +
> +   See the accompanying file LICENSE, version 2009-Jan-02 or later
> +   (the contents of which are also included in unzip.h) for terms of use.
> +@@ -1901,48 +1901,82 @@
> +     and a 4-byte version of disk start number.
> +     Sets both local header and central header fields.  Not terribly clever,
> +     but it means that this procedure is only called in one place.
> ++
> ++    2014-12-05 SMS.
> ++    Added checks to ensure that enough data are available before calling
> ++    makeint64() or makelong().  Replaced various sizeof() values with
> ++    simple ("4" or "8") constants.  (The Zip64 structures do not depend
> ++    on our variable sizes.)  Error handling is crude, but we should now
> ++    stay within the buffer.
> +   ---------------------------------------------------------------------------*/
> +
> ++#define Z64FLGS 0xffff
> ++#define Z64FLGL 0xffffffff
> ++
> +     if (ef_len == 0 || ef_buf == NULL)
> +         return PK_COOL;
> +
> +     Trace((stderr,"\ngetZip64Data: scanning extra field of length %u\n",
> +       ef_len));
> +
> +-    while (ef_len >= EB_HEADSIZE) {
> ++    while (ef_len >= EB_HEADSIZE)
> ++    {
> +         eb_id = makeword(EB_ID + ef_buf);
> +         eb_len = makeword(EB_LEN + ef_buf);
> +
> +-        if (eb_len > (ef_len - EB_HEADSIZE)) {
> +-            /* discovered some extra field inconsistency! */
> ++        if (eb_len > (ef_len - EB_HEADSIZE))
> ++        {
> ++            /* Extra block length exceeds remaining extra field length. */
> +             Trace((stderr,
> +               "getZip64Data: block length %u > rest ef_size %u\n", eb_len,
> +               ef_len - EB_HEADSIZE));
> +             break;
> +         }
> +-        if (eb_id == EF_PKSZ64) {
> +-
> ++        if (eb_id == EF_PKSZ64)
> ++        {
> +           int offset = EB_HEADSIZE;
> +
> +-          if (G.crec.ucsize == 0xffffffff || G.lrec.ucsize == 0xffffffff){
> +-            G.lrec.ucsize = G.crec.ucsize = makeint64(offset + ef_buf);
> +-            offset += sizeof(G.crec.ucsize);
> ++          if ((G.crec.ucsize == Z64FLGL) || (G.lrec.ucsize == Z64FLGL))
> ++          {
> ++            if (offset+ 8 > ef_len)
> ++              return PK_ERR;
> ++
> ++            G.crec.ucsize = G.lrec.ucsize = makeint64(offset + ef_buf);
> ++            offset += 8;
> +           }
> +-          if (G.crec.csize == 0xffffffff || G.lrec.csize == 0xffffffff){
> +-            G.csize = G.lrec.csize = G.crec.csize = makeint64(offset + ef_buf);
> +-            offset += sizeof(G.crec.csize);
> ++
> ++          if ((G.crec.csize == Z64FLGL) || (G.lrec.csize == Z64FLGL))
> ++          {
> ++            if (offset+ 8 > ef_len)
> ++              return PK_ERR;
> ++
> ++            G.csize = G.crec.csize = G.lrec.csize = makeint64(offset + ef_buf);
> ++            offset += 8;
> +           }
> +-          if (G.crec.relative_offset_local_header == 0xffffffff){
> ++
> ++          if (G.crec.relative_offset_local_header == Z64FLGL)
> ++          {
> ++            if (offset+ 8 > ef_len)
> ++              return PK_ERR;
> ++
> +             G.crec.relative_offset_local_header = makeint64(offset + ef_buf);
> +-            offset += sizeof(G.crec.relative_offset_local_header);
> ++            offset += 8;
> +           }
> +-          if (G.crec.disk_number_start == 0xffff){
> ++
> ++          if (G.crec.disk_number_start == Z64FLGS)
> ++          {
> ++            if (offset+ 4 > ef_len)
> ++              return PK_ERR;
> ++
> +             G.crec.disk_number_start = (zuvl_t)makelong(offset + ef_buf);
> +-            offset += sizeof(G.crec.disk_number_start);
> ++            offset += 4;
> +           }
> ++#if 0
> ++          break;                /* Expect only one EF_PKSZ64 block. */
> ++#endif /* 0 */
> +         }
> +
> +-        /* Skip this extra field block */
> ++        /* Skip this extra field block. */
> +         ef_buf += (eb_len + EB_HEADSIZE);
> +         ef_len -= (eb_len + EB_HEADSIZE);
> +     }
> diff --git a/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
> new file mode 100644
> index 0000000..b64dd99
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
> @@ -0,0 +1,45 @@
> +From: mancha <mancha1 AT zoho DOT com>
> +Date: Mon, 3 Nov 2014
> +Subject: Info-ZIP UnZip buffer overflow
> +Bug-Debian: http://bugs.debian.org/776589
> +
> +By carefully crafting a corrupt ZIP archive with "extra fields" that
> +purport to have compressed blocks larger than the corresponding
> +uncompressed blocks in STORED no-compression mode, an attacker can
> +trigger a heap overflow that can result in application crash or
> +possibly have other unspecified impact.
> +
> +This patch ensures that when extra fields use STORED mode, the
> +"compressed" and uncompressed block sizes match.
> +
> +The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
> +--- a/extract.c
> ++++ b/extract.c
> +@@ -2229,6 +2229,7 @@ static int test_compr_eb(__G__ eb, eb_size, compr_offset, test_uc_ebdata)
> +     uch *eb_ucptr;
> +     int r;
> +     ush method;
> ++    ush eb_compr_method;
> +
> +     if (compr_offset < 4)                /* field is not compressed: */
> +         return PK_OK;                    /* do nothing and signal OK */
> +@@ -2244,6 +2245,14 @@
> +      ((eb_ucsize > 0L) && (eb_size <= (compr_offset + EB_CMPRHEADLEN))))
> +         return IZ_EF_TRUNC;             /* no/bad compressed data! */
> +
> ++    /* 2014-11-03 Michal Zalewski, SMS.
> ++     * For STORE method, compressed and uncompressed sizes must agree.
> ++     * http://www.info-zip.org/phpBB3/viewtopic.php?f=7&t=450
> ++     */
> ++    eb_compr_method = makeword( eb + (EB_HEADSIZE + compr_offset));
> ++    if ((eb_compr_method == STORED) && (eb_size - compr_offset != eb_ucsize))
> ++        return PK_ERR;
> ++
> +     if (
> + #ifdef INT_16BIT
> +         (((ulg)(extent)eb_ucsize) != eb_ucsize) ||
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
> index 5060d35..b022f21 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -11,6 +11,10 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
>   	file://define-ldflags.patch \
>   	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
>   	file://unzip-6.0_overflow3.diff \
> +	file://09-cve-2014-8139-crc-overflow.patch \
> +	file://10-cve-2014-8140-test-compr-eb.patch \
> +	file://11-cve-2014-8141-getzip64data.patch \
> +	file://12-cve-2014-9636-test-compr-eb.patch \
>   "
>
>   SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
>

