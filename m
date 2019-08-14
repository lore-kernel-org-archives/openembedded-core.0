Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E24C7E8B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 14:10:13 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n9so46930108pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dGawKQpSGBonMXx84zWKB5m9JLmbE/BVvC8YBgVf81A=;
	b=AigglV/byfODzHQUdC0fFIC7gMvu1cUB2MMmf8iCY0k275XGrz2p26nPuL3BqT3FK9
	X0rS7NjF6KZzizuhzYLygbV1ojCYm1PoThkLNaHQjmzsxk15tGiXqpbwLzBLnAXmIbnE
	6VV0jxQ0EkeeDq8GNMf+USBykYew5lGBFRD/cRmFkiMC92XHnw9n3uqKLGy/W6o7xqX4
	iHcB0B026QU+IFebmAE9mP7ZZfZC7Qr701A9Z25D4srPU/61jI/FHlnEtuZL4v08QCy6
	/4fHEQx/xyNZx3v1rmej0SoGAselEjqk3yIr5DNGnHYnc2NPmLpboT+uoyRyFSUgT82V
	/uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=dGawKQpSGBonMXx84zWKB5m9JLmbE/BVvC8YBgVf81A=;
	b=Lp6Z3Qf3jRs9L0UuV7uafMXuPIazB9/pEdxYza3vH6NdjrUqkpcNhjm4R4TqJ57dzb
	av2hHmcAFiHvIwi5NNenlMeIvE798Bn1VHJN/H9d4cx9pVMx1PvP3uL+cSZoy6d++E1a
	QyOVV8IBj4MVCNQ0BYodhxK7qJbiANFaFqNhSrEyoWzHcd9XX+MsoCURmVuoPm5Dyci+
	sQ+wSinhGAh2Uig+ngA8rhL4omKnVcmaMLakj0eNoglAKRYLPQg2eHzdG7/ddH6k9laC
	fjmEFObhPKTLbx7VrGqUDqsP+cdrhSbmSYiilnxCjSn0EW5oTEAMN0XgP9dLqz3evYtU
	va9Q==
X-Gm-Message-State: APjAAAXZC8SGfoUe+LQgh9e4n+3QtIPBLfhRsexE8cNFcDnFtrw4VqJt
	mXCeAX/aZcarMytuB+IOeXHx+Gtf
X-Google-Smtp-Source: APXvYqy5e0Qe8ctFOGwdV1SyypabBCv5lp2J1BGQL5fLG+pexgLDWUqtNdyW1TP9WTTzKpZWtuFw/w==
X-Received: by 2002:a65:6406:: with SMTP id a6mr33701504pgv.393.1565791814323; 
	Wed, 14 Aug 2019 07:10:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:bf:ea8b:b284:1e7e?
	([2601:202:4180:c33:bf:ea8b:b284:1e7e])
	by smtp.gmail.com with ESMTPSA id
	185sm13698831pff.54.2019.08.14.07.10.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Aug 2019 07:10:13 -0700 (PDT)
To: Kevin Weng <t-keweng@microsoft.com>,
	openembedded-core@lists.openembedded.org
References: <20190813232542.16955-1-t-keweng@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9bc8c7e4-b6a3-30b7-c173-9f87b7f8d6e7@gmail.com>
Date: Wed, 14 Aug 2019 07:10:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813232542.16955-1-t-keweng@microsoft.com>
Subject: Re: [thud][PATCH v2 1/4] curl: fix CVE-2018-16890 CVE-2019-3822 CVE-2019-3823
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
X-List-Received-Date: Wed, 14 Aug 2019 14:10:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/13/19 4:25 PM, Kevin Weng via Openembedded-core wrote:
> Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
> ---
>  .../curl/curl/CVE-2018-16890.patch            | 50 +++++++++++++++++
>  .../curl/curl/CVE-2019-3822.patch             | 47 ++++++++++++++++
>  .../curl/curl/CVE-2019-3823.patch             | 55 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.61.0.bb      |  3 +
>  4 files changed, 155 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16890.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3822.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3823.patch

I master and Warrior not affected?

- armin
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16890.patch b/meta/recipes-support/curl/curl/CVE-2018-16890.patch
> new file mode 100644
> index 0000000000..3776f362bc
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2018-16890.patch
> @@ -0,0 +1,50 @@
> +From 53d3c2f92b4a7561b1006494badf8cf2ef9110c0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 2 Jan 2019 20:33:08 +0100
> +Subject: [PATCH 1/3] NTLM: fix size check condition for type2 received data
> +
> +Bug: https://curl.haxx.se/docs/CVE-2018-16890.html
> +Reported-by: Wenxiang Qian
> +CVE-2018-16890
> +
> +Upstream-Status: Backport
> +[https://github.com/curl/curl/commit
> +/b780b30d1377adb10bbe774835f49e9b237fb9bb]
> +
> +CVE: CVE-2018-16890
> +
> +Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
> +---
> + lib/vauth/ntlm.c | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c
> +index cdb8d8f0d..0212756ab 100644
> +--- a/lib/vauth/ntlm.c
> ++++ b/lib/vauth/ntlm.c
> +@@ -5,7 +5,7 @@
> +  *                            | (__| |_| |  _ <| |___
> +  *                             \___|\___/|_| \_\_____|
> +  *
> +- * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
> +  *
> +  * This software is licensed as described in the file COPYING, which
> +  * you should have received as part of this distribution. The terms
> +@@ -182,10 +182,11 @@ static CURLcode ntlm_decode_type2_target(struct Curl_easy *data,
> +     target_info_len = Curl_read16_le(&buffer[40]);
> +     target_info_offset = Curl_read32_le(&buffer[44]);
> +     if(target_info_len > 0) {
> +-      if(((target_info_offset + target_info_len) > size) ||
> ++      if((target_info_offset >= size) ||
> ++         ((target_info_offset + target_info_len) > size) ||
> +          (target_info_offset < 48)) {
> +         infof(data, "NTLM handshake failure (bad type-2 message). "
> +-                    "Target Info Offset Len is set incorrect by the peer\n");
> ++              "Target Info Offset Len is set incorrect by the peer\n");
> +         return CURLE_BAD_CONTENT_ENCODING;
> +       }
> + 
> +-- 
> +2.22.0
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2019-3822.patch b/meta/recipes-support/curl/curl/CVE-2019-3822.patch
> new file mode 100644
> index 0000000000..4f612ddd5e
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2019-3822.patch
> @@ -0,0 +1,47 @@
> +From 761b51f66c7b1cd2cd6c71b807bfdb6a27c49b30 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 3 Jan 2019 12:59:28 +0100
> +Subject: [PATCH 2/3] ntlm: fix *_type3_message size check to avoid buffer
> + overflow
> +
> +Bug: https://curl.haxx.se/docs/CVE-2019-3822.html
> +Reported-by: Wenxiang Qian
> +CVE-2019-3822
> +
> +Upstream-Status: Backport
> +[https://github.com/curl/curl/commit
> +/50c9484278c63b958655a717844f0721263939cc]
> +
> +CVE: CVE-2019-3822
> +
> +Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
> +---
> + lib/vauth/ntlm.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c
> +index 0212756ab..3be0403d9 100644
> +--- a/lib/vauth/ntlm.c
> ++++ b/lib/vauth/ntlm.c
> +@@ -777,11 +777,14 @@ CURLcode Curl_auth_create_ntlm_type3_message(struct Curl_easy *data,
> +   });
> + 
> + #ifdef USE_NTRESPONSES
> +-  if(size < (NTLM_BUFSIZE - ntresplen)) {
> +-    DEBUGASSERT(size == (size_t)ntrespoff);
> +-    memcpy(&ntlmbuf[size], ptr_ntresp, ntresplen);
> +-    size += ntresplen;
> ++  /* ntresplen + size should not be risking an integer overflow here */
> ++  if(ntresplen + size > sizeof(ntlmbuf)) {
> ++    failf(data, "incoming NTLM message too big");
> ++    return CURLE_OUT_OF_MEMORY;
> +   }
> ++  DEBUGASSERT(size == (size_t)ntrespoff);
> ++  memcpy(&ntlmbuf[size], ptr_ntresp, ntresplen);
> ++  size += ntresplen;
> + 
> +   DEBUG_OUT({
> +     fprintf(stderr, "\n   ntresp=");
> +-- 
> +2.22.0
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2019-3823.patch b/meta/recipes-support/curl/curl/CVE-2019-3823.patch
> new file mode 100644
> index 0000000000..194e6e6430
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2019-3823.patch
> @@ -0,0 +1,55 @@
> +From 40f6c913f63cdbfa81daa7ac7f1c7415bb99edeb Mon Sep 17 00:00:00 2001
> +From: Daniel Gustafsson <daniel@yesql.se>
> +Date: Sat, 19 Jan 2019 00:42:47 +0100
> +Subject: [PATCH 3/3] smtp: avoid risk of buffer overflow in strtol
> +
> +If the incoming len 5, but the buffer does not have a termination
> +after 5 bytes, the strtol() call may keep reading through the line
> +buffer until is exceeds its boundary. Fix by ensuring that we are
> +using a bounded read with a temporary buffer on the stack.
> +
> +Bug: https://curl.haxx.se/docs/CVE-2019-3823.html
> +Reported-by: Brian Carpenter (Geeknik Labs)
> +CVE-2019-3823
> +
> +Upstream-Status: Backport
> +[https://github.com/curl/curl/commit
> +/39df4073e5413fcdbb5a38da0c1ce6f1c0ceb484]
> +
> +CVE: CVE-2019-3823
> +
> +Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
> +---
> + lib/smtp.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/smtp.c b/lib/smtp.c
> +index ecf10a41a..1b9f92d30 100644
> +--- a/lib/smtp.c
> ++++ b/lib/smtp.c
> +@@ -5,7 +5,7 @@
> +  *                            | (__| |_| |  _ <| |___
> +  *                             \___|\___/|_| \_\_____|
> +  *
> +- * Copyright (C) 1998 - 2018, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
> +  *
> +  * This software is licensed as described in the file COPYING, which
> +  * you should have received as part of this distribution. The terms
> +@@ -207,8 +207,12 @@ static bool smtp_endofresp(struct connectdata *conn, char *line, size_t len,
> +      Section 4. Examples of RFC-4954 but some e-mail servers ignore this and
> +      only send the response code instead as per Section 4.2. */
> +   if(line[3] == ' ' || len == 5) {
> ++    char tmpline[6];
> ++
> +     result = TRUE;
> +-    *resp = curlx_sltosi(strtol(line, NULL, 10));
> ++    memset(tmpline, '\0', sizeof(tmpline));
> ++    memcpy(tmpline, line, (len == 5 ? 5 : 3));
> ++    *resp = curlx_sltosi(strtol(tmpline, NULL, 10));
> + 
> +     /* Make sure real server never sends internal value */
> +     if(*resp == 1)
> +-- 
> +2.22.0
> +
> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> index 1027f75e9e..c1e4342df5 100644
> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> @@ -13,6 +13,9 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://CVE-2018-16842.patch \
>             file://CVE-2019-5435.patch \
>             file://CVE-2019-5436.patch \
> +           file://CVE-2018-16890.patch \
> +           file://CVE-2019-3822.patch \
> +           file://CVE-2019-3823.patch \
>  "
>  
>  SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"


