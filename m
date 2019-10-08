Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 742FD78F72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 17:49:41 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y35so10684509pgl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=P+bAgN0SeTDxr0GO3xSMqOyGMj3zFw0uitlrb7ZQsqk=;
	b=myfyUGjvA2isHhFMYZYkC/Pj8xi0GTBdm7+wn78C7KTYWbcHmYDOsX0ArrcG/WGZcg
	BzQab95srPJ176yx7tab8su61FNoD8SzU8LCftxHm/ATMa+IXFoWlLBlvOWKy0ezWrJF
	Sbf3QyB5k7QY3RdDlEf/X5ooCybiGisX03zqJ/ru9M3mHlccSSHsCRFJzF7Yj7C0xNQw
	NVjLaqJsj+RWj5eZ2TswZooEAFp7TMDRrk5bCKQ4+AQxUwA4UtyJeBqBoUKe2trW8AvC
	7TunP17cXG53255HmFUAKSRbjMI4d7eH0AjGnrAF5VLiTkkrL05cMPkbNfgHWsiSXUAs
	Fq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=P+bAgN0SeTDxr0GO3xSMqOyGMj3zFw0uitlrb7ZQsqk=;
	b=MUcUX9PZtD/8FNpNZGFTRaGU6IoqmsNYSB9MVVE77VKslidc6Y5kKK0jbz+ciZ2zNV
	/Dkd8hyh2ugysBMbESK7i2g1vUer+PzNP3ghQKLlvwOPDtD1ROr6+//xHfXXP0zvMmME
	FD54ChTL/YIm2cNDQUzcQ0eVKOxSOIwHCuo7eVO4gj1G7pI1BDTDRq5l6g/SiCycRW5g
	itPlrk6mKSmHi5e37Ue/RilbNB2zY5+qgiuvoOw0PrPYiriI9Y+v99fBxlmRJ2QWfmD4
	gyxWIrERIXOkVYmhQRaatGAVRpgs1/+wCqGfXqCeoXMsdawnsJnpSSeDn+JEbhxXou8d
	BUvg==
X-Gm-Message-State: APjAAAVpGAAKUg+/eZ6AMC+O6N19mTdhUaqa3IcySkqEKsHc5jXWhXb1
	tw7QjSvhcvIX7jfhFJ1DXj8ieJAUqv4=
X-Google-Smtp-Source: APXvYqwJevnSMwuoIdW1deExNi1xdw/oad0WeNFJ3AJenXzDk4cFiXKBHEd4GITal82nrwKoHtBieg==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
	q63mr7210960pja.106.1570556982111; 
	Tue, 08 Oct 2019 10:49:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:8d14:b7f9:8b16:849f?
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	dw19sm2453756pjb.27.2019.10.08.10.49.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2019 10:49:41 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>,
	openembedded-core@lists.openembedded.org
References: <20191008155015.15651-1-alistair.francis@wdc.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a3d0c2a3-a15f-5980-a5d0-c7b7a78895a1@gmail.com>
Date: Tue, 8 Oct 2019 10:49:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008155015.15651-1-alistair.francis@wdc.com>
Subject: Re: [PATCH RESEND] gdb: Bump from 8.3 to 8.3.1
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
X-List-Received-Date: Tue, 08 Oct 2019 17:49:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/8/19 8:50 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../gdb/{gdb-8.3.inc => gdb-8.3.1.inc}        |  5 +-
>  ...ian_8.3.bb => gdb-cross-canadian_8.3.1.bb} |  0
>  .../{gdb-cross_8.3.bb => gdb-cross_8.3.1.bb}  |  0
>  .../gdb/gdb/CVE-2017-9778.patch               | 98 -------------------
>  .../gdb/{gdb_8.3.bb => gdb_8.3.1.bb}          |  0
>  5 files changed, 2 insertions(+), 101 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-8.3.inc => gdb-8.3.1.inc} (85%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.3.bb => gdb-cross-canadian_8.3.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_8.3.bb => gdb-cross_8.3.1.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
>  rename meta/recipes-devtools/gdb/{gdb_8.3.bb => gdb_8.3.1.bb} (100%)

is this a bug fix only update?

- armin
>
> diff --git a/meta/recipes-devtools/gdb/gdb-8.3.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
> similarity index 85%
> rename from meta/recipes-devtools/gdb/gdb-8.3.inc
> rename to meta/recipes-devtools/gdb/gdb-8.3.1.inc
> index 070c17d4a1..39f1c48cc7 100644
> --- a/meta/recipes-devtools/gdb/gdb-8.3.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
> @@ -16,7 +16,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0009-Change-order-of-CFLAGS.patch \
>             file://0010-resolve-restrict-keyword-conflict.patch \
>             file://0011-Fix-invalid-sigprocmask-call.patch \
> -           file://CVE-2017-9778.patch \
>             "
> -SRC_URI[md5sum] = "bbd95b2f9b34621ad7a19a3965476314"
> -SRC_URI[sha256sum] = "802f7ee309dcc547d65a68d61ebd6526762d26c3051f52caebe2189ac1ffd72e"
> +SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
> +SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.3.bb b/meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_8.3.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
> deleted file mode 100644
> index f142ed00d7..0000000000
> --- a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -From 6ad3791f095cfc1b0294f62c4b3a524ba735595e Mon Sep 17 00:00:00 2001
> -From: Sandra Loosemore <sandra@codesourcery.com>
> -Date: Thu, 25 Apr 2019 07:27:02 -0700
> -Subject: [PATCH] Detect invalid length field in debug frame FDE header.
> -
> -GDB was failing to catch cases where a corrupt ELF or core file
> -contained an invalid length value in a Dwarf debug frame FDE header.
> -It was checking for buffer overflow but not cases where the length was
> -negative or caused pointer wrap-around.
> -
> -In addition to the additional validity check, this patch cleans up the
> -multiple signed/unsigned conversions on the length field so that an
> -unsigned representation is used consistently throughout.
> -
> -This patch fixes CVE-2017-9778 and PR gdb/21600.
> -
> -2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
> -	    Kang Li <kanglictf@gmail.com>
> -
> -	PR gdb/21600
> -
> -	* dwarf2-frame.c (read_initial_length): Be consistent about using
> -	unsigned representation of length.
> -	(decode_frame_entry_1): Likewise.  Check for wraparound of
> -	end pointer as well as buffer overflow.
> -
> -Upstream-Status: Backport
> -CVE: CVE-2017-9778
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - gdb/ChangeLog      | 10 ++++++++++
> - gdb/dwarf2-frame.c | 14 +++++++-------
> - 2 files changed, 17 insertions(+), 7 deletions(-)
> -
> -diff --git a/gdb/ChangeLog b/gdb/ChangeLog
> -index 1c125de..d028d2b 100644
> ---- a/gdb/ChangeLog
> -+++ b/gdb/ChangeLog
> -@@ -1,3 +1,13 @@
> -+2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
> -+	Kang Li <kanglictf@gmail.com>
> -+
> -+	PR gdb/21600
> -+
> -+	* dwarf2-frame.c (read_initial_length): Be consistent about using
> -+	unsigned representation of length.
> -+	(decode_frame_entry_1): Likewise.  Check for wraparound of
> -+	end pointer as well as buffer overflow.
> -+
> - 2019-05-11  Joel Brobecker  <brobecker@adacore.com>
> - 
> - 	* version.in: Set GDB version number to 8.3.
> -diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
> -index 178ac44..dc5d3b3 100644
> ---- a/gdb/dwarf2-frame.c
> -+++ b/gdb/dwarf2-frame.c
> -@@ -1488,7 +1488,7 @@ static ULONGEST
> - read_initial_length (bfd *abfd, const gdb_byte *buf,
> - 		     unsigned int *bytes_read_ptr)
> - {
> --  LONGEST result;
> -+  ULONGEST result;
> - 
> -   result = bfd_get_32 (abfd, buf);
> -   if (result == 0xffffffff)
> -@@ -1789,7 +1789,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
> - {
> -   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
> -   const gdb_byte *buf, *end;
> --  LONGEST length;
> -+  ULONGEST length;
> -   unsigned int bytes_read;
> -   int dwarf64_p;
> -   ULONGEST cie_id;
> -@@ -1800,15 +1800,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
> -   buf = start;
> -   length = read_initial_length (unit->abfd, buf, &bytes_read);
> -   buf += bytes_read;
> --  end = buf + length;
> --
> --  /* Are we still within the section?  */
> --  if (end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
> --    return NULL;
> -+  end = buf + (size_t) length;
> - 
> -   if (length == 0)
> -     return end;
> - 
> -+  /* Are we still within the section?  */
> -+  if (end <= buf || end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
> -+    return NULL;
> -+
> -   /* Distinguish between 32 and 64-bit encoded frame info.  */
> -   dwarf64_p = (bytes_read == 12);
> - 
> --- 
> -2.20.1
> -
> diff --git a/meta/recipes-devtools/gdb/gdb_8.3.bb b/meta/recipes-devtools/gdb/gdb_8.3.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_8.3.bb
> rename to meta/recipes-devtools/gdb/gdb_8.3.1.bb


