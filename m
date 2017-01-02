Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3656A606CB;
	Mon,  2 Jan 2017 17:43:51 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i5so30992156pgh.2;
	Mon, 02 Jan 2017 09:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=jByXUyuWIfRx0AeoFgte8YuK5RCQiPMsE9kwd9d6M3k=;
	b=c9q4ZnHfi+kOJeM17K98+gzwDQkkeEpUO/IpLF4VgH9qrOM9EtkFGD8H1ODDj7R9Du
	inJMeUiVXAbohVGv6hM8tCVwi6y+vWBgvBK0WkTvDI8gHwSKR0bw+SiOOVHHbpVdc1z4
	wAsDtC+6w3deMVMaW8yTOZpOUSX/mWypBKHn5VgwD9tQJKs39jb32PNyzLODiiuw22fp
	G8VAaeTSVyBufyJbFehkt36guUYPptfBbSrcld8TLViZxKxdog3xE0WOoWPVwgSRY3Hd
	8ZevDSbeE6+YxOoSW/WCyiU+vR3xbE029AfH1rK2WfznZCpbH2oVMk+qK5b0VOzwgg4c
	TJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jByXUyuWIfRx0AeoFgte8YuK5RCQiPMsE9kwd9d6M3k=;
	b=ifEVEkRdHG1na3xwHoaPDiZoZfcISUjP2eexFiBZP3mWhmu5GEAQOOcdoTxa53d3we
	gPnW120BoKzUz29yhb9GuKLgDYh5ac3tMGSkt66azsrP/i3wOvQ4ATA918czOtsR8p96
	msltGjY86IJ3830tfsIA6YzZEhRXlDZZBEfdFNsdZfn9boRr4BDllAajqXZo0ycF42Gf
	3HGu4jtPTXO5M7y7v+D9fhh4EQP96UrZJ23DCWkr/c6b2I+XS4Nn9xH+u9c+QQvyfJHR
	38ku3mxCxMxZA/cm07sMQ6rYxaYGDBy23GEq6mf/K+HxpwFCmKTP/rYteEEWk0UG866z
	ZBXw==
X-Gm-Message-State: AIkVDXJ6U7zvA0PZRBkwUvy9ax/4YcI5sRlg4Njq1FQWrCo7VK3nVQf5KLlEn7InREt8dQ==
X-Received: by 10.84.213.150 with SMTP id g22mr127664718pli.11.1483379032365; 
	Mon, 02 Jan 2017 09:43:52 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	j130sm109727041pgc.2.2017.01.02.09.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 09:43:51 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org, Armin Kuster <akuster@mvista.com>
References: <20160923222224.3285.13563@opal.openembedded.org>
	<20160923222225.E2A2A50174@opal.openembedded.org>
	<20161222152130.GD3544@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bdcb17ec-40d8-972f-0c85-95e4451b7554@gmail.com>
Date: Mon, 2 Jan 2017 09:43:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161222152130.GD3544@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/20: openssl: Security fix CVE-2016-2177
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
X-List-Received-Date: Mon, 02 Jan 2017 17:43:53 -0000
Content-Type: multipart/alternative;
	boundary="------------9234C485E3A4981B113ECF69"

--------------9234C485E3A4981B113ECF69
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/22/2016 07:21 AM, Martin Jansa wrote:
> On Fri, Sep 23, 2016 at 10:22:26PM +0000, git@git.openembedded.org wrote:
>> rpurdie pushed a commit to branch jethro
>> in repository openembedded-core.
> This change and CVE-2016-8610.patch seems to be missing in krogoth branch.

got them now.

>
> OE @ ~/openembedded-core $ git diff origin/jethro  origin/krogoth -- meta/recipes-connectivity/openssl/openssl_1.0.2h.bb | grep CVE
> -            file://CVE-2016-2177.patch \
> -            file://CVE-2016-2178.patch \
> +           file://CVE-2016-2178.patch \
> +            file://CVE-2016-2179.patch \
>               file://CVE-2016-2180.patch \
>               file://CVE-2016-2181_p1.patch \
>               file://CVE-2016-2181_p2.patch \
>               file://CVE-2016-6303.patch \
>               file://CVE-2016-6304.patch \
>               file://CVE-2016-6306.patch \
> -            file://CVE-2016-2179.patch \
> -            file://CVE-2016-8610.patch \
>
> Is there some pending pull request for krogoth? There is also that tzdata version lower in krogoth than jethro I've reported a while ago:
Yes there was a pull request but it did not contain that change. got 
this too now.

Armin
>
> OE @ ~/openembedded-core $ git diff origin/jethro  origin/krogoth -- meta/recipes-extended/tzdata/
> diff --git a/meta/recipes-extended/tzdata/tzdata_2016i.bb b/meta/recipes-extended/tzdata/tzdata_2016g.bb
> similarity index 94%
> rename from meta/recipes-extended/tzdata/tzdata_2016i.bb
> rename to meta/recipes-extended/tzdata/tzdata_2016g.bb
>
>> commit 5781eb9a6e6bf8984b090a488d2a326bf9fafcf8
>> Author: Armin Kuster <akuster@mvista.com>
>> AuthorDate: Sat Jul 16 16:04:11 2016 -0700
>>
>>      openssl: Security fix CVE-2016-2177
>>      
>>      Affects openssl <= 1.0.2h
>>      CVSS v2 Base Score: 7.5 HIGH
>>      
>>      Signed-off-by: Armin Kuster <akuster@mvista.com>
>>      Signed-off-by: Ross Burton <ross.burton@intel.com>
>>      (cherry picked from commit 2848c7d3e454cbc84cba9183f23ccdf3e9200ec9)
>>      Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../openssl/openssl/CVE-2016-2177.patch            | 286 +++++++++++++++++++++
>>   .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
>>   2 files changed, 287 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
>> new file mode 100644
>> index 0000000..df36d5f
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
>> @@ -0,0 +1,286 @@
>> +From a004e72b95835136d3f1ea90517f706c24c03da7 Mon Sep 17 00:00:00 2001
>> +From: Matt Caswell <matt@openssl.org>
>> +Date: Thu, 5 May 2016 11:10:26 +0100
>> +Subject: [PATCH] Avoid some undefined pointer arithmetic
>> +
>> +A common idiom in the codebase is:
>> +
>> +if (p + len > limit)
>> +{
>> +    return; /* Too long */
>> +}
>> +
>> +Where "p" points to some malloc'd data of SIZE bytes and
>> +limit == p + SIZE
>> +
>> +"len" here could be from some externally supplied data (e.g. from a TLS
>> +message).
>> +
>> +The rules of C pointer arithmetic are such that "p + len" is only well
>> +defined where len <= SIZE. Therefore the above idiom is actually
>> +undefined behaviour.
>> +
>> +For example this could cause problems if some malloc implementation
>> +provides an address for "p" such that "p + len" actually overflows for
>> +values of len that are too big and therefore p + len < limit!
>> +
>> +Issue reported by Guido Vranken.
>> +
>> +CVE-2016-2177
>> +
>> +Reviewed-by: Rich Salz <rsalz@openssl.org>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2016-2177
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +
>> +---
>> + ssl/s3_srvr.c  | 14 +++++++-------
>> + ssl/ssl_sess.c |  2 +-
>> + ssl/t1_lib.c   | 56 ++++++++++++++++++++++++++++++--------------------------
>> + 3 files changed, 38 insertions(+), 34 deletions(-)
>> +
>> +diff --git a/ssl/s3_srvr.c b/ssl/s3_srvr.c
>> +index ab28702..ab7f690 100644
>> +--- a/ssl/s3_srvr.c
>> ++++ b/ssl/s3_srvr.c
>> +@@ -980,7 +980,7 @@ int ssl3_get_client_hello(SSL *s)
>> +
>> +         session_length = *(p + SSL3_RANDOM_SIZE);
>> +
>> +-        if (p + SSL3_RANDOM_SIZE + session_length + 1 >= d + n) {
>> ++        if (SSL3_RANDOM_SIZE + session_length + 1 >= (d + n) - p) {
>> +             al = SSL_AD_DECODE_ERROR;
>> +             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
>> +             goto f_err;
>> +@@ -998,7 +998,7 @@ int ssl3_get_client_hello(SSL *s)
>> +     /* get the session-id */
>> +     j = *(p++);
>> +
>> +-    if (p + j > d + n) {
>> ++    if ((d + n) - p < j) {
>> +         al = SSL_AD_DECODE_ERROR;
>> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
>> +         goto f_err;
>> +@@ -1054,14 +1054,14 @@ int ssl3_get_client_hello(SSL *s)
>> +
>> +     if (SSL_IS_DTLS(s)) {
>> +         /* cookie stuff */
>> +-        if (p + 1 > d + n) {
>> ++        if ((d + n) - p < 1) {
>> +             al = SSL_AD_DECODE_ERROR;
>> +             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
>> +             goto f_err;
>> +         }
>> +         cookie_len = *(p++);
>> +
>> +-        if (p + cookie_len > d + n) {
>> ++        if ((d + n ) - p < cookie_len) {
>> +             al = SSL_AD_DECODE_ERROR;
>> +             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
>> +             goto f_err;
>> +@@ -1131,7 +1131,7 @@ int ssl3_get_client_hello(SSL *s)
>> +         }
>> +     }
>> +
>> +-    if (p + 2 > d + n) {
>> ++    if ((d + n ) - p < 2) {
>> +         al = SSL_AD_DECODE_ERROR;
>> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
>> +         goto f_err;
>> +@@ -1145,7 +1145,7 @@ int ssl3_get_client_hello(SSL *s)
>> +     }
>> +
>> +     /* i bytes of cipher data + 1 byte for compression length later */
>> +-    if ((p + i + 1) > (d + n)) {
>> ++    if ((d + n) - p < i + 1) {
>> +         /* not enough data */
>> +         al = SSL_AD_DECODE_ERROR;
>> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
>> +@@ -1211,7 +1211,7 @@ int ssl3_get_client_hello(SSL *s)
>> +
>> +     /* compression */
>> +     i = *(p++);
>> +-    if ((p + i) > (d + n)) {
>> ++    if ((d + n) - p < i) {
>> +         /* not enough data */
>> +         al = SSL_AD_DECODE_ERROR;
>> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
>> +diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
>> +index b182998..54ee783 100644
>> +--- a/ssl/ssl_sess.c
>> ++++ b/ssl/ssl_sess.c
>> +@@ -573,7 +573,7 @@ int ssl_get_prev_session(SSL *s, unsigned char *session_id, int len,
>> +     int r;
>> + #endif
>> +
>> +-    if (session_id + len > limit) {
>> ++    if (limit - session_id < len) {
>> +         fatal = 1;
>> +         goto err;
>> +     }
>> +diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
>> +index fb64607..cdac011 100644
>> +--- a/ssl/t1_lib.c
>> ++++ b/ssl/t1_lib.c
>> +@@ -1867,11 +1867,11 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
>> +         0x02, 0x03,             /* SHA-1/ECDSA */
>> +     };
>> +
>> +-    if (data >= (limit - 2))
>> ++    if (limit - data <= 2)
>> +         return;
>> +     data += 2;
>> +
>> +-    if (data > (limit - 4))
>> ++    if (limit - data < 4)
>> +         return;
>> +     n2s(data, type);
>> +     n2s(data, size);
>> +@@ -1879,7 +1879,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
>> +     if (type != TLSEXT_TYPE_server_name)
>> +         return;
>> +
>> +-    if (data + size > limit)
>> ++    if (limit - data < size)
>> +         return;
>> +     data += size;
>> +
>> +@@ -1887,7 +1887,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
>> +         const size_t len1 = sizeof(kSafariExtensionsBlock);
>> +         const size_t len2 = sizeof(kSafariTLS12ExtensionsBlock);
>> +
>> +-        if (data + len1 + len2 != limit)
>> ++        if (limit - data != (int)(len1 + len2))
>> +             return;
>> +         if (memcmp(data, kSafariExtensionsBlock, len1) != 0)
>> +             return;
>> +@@ -1896,7 +1896,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
>> +     } else {
>> +         const size_t len = sizeof(kSafariExtensionsBlock);
>> +
>> +-        if (data + len != limit)
>> ++        if (limit - data != (int)(len))
>> +             return;
>> +         if (memcmp(data, kSafariExtensionsBlock, len) != 0)
>> +             return;
>> +@@ -2053,19 +2053,19 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
>> +     if (data == limit)
>> +         goto ri_check;
>> +
>> +-    if (data > (limit - 2))
>> ++    if (limit - data < 2)
>> +         goto err;
>> +
>> +     n2s(data, len);
>> +
>> +-    if (data + len != limit)
>> ++    if (limit - data != len)
>> +         goto err;
>> +
>> +-    while (data <= (limit - 4)) {
>> ++    while (limit - data >= 4) {
>> +         n2s(data, type);
>> +         n2s(data, size);
>> +
>> +-        if (data + size > (limit))
>> ++        if (limit - data < size)
>> +             goto err;
>> + # if 0
>> +         fprintf(stderr, "Received extension type %d size %d\n", type, size);
>> +@@ -2472,18 +2472,18 @@ static int ssl_scan_clienthello_custom_tlsext(SSL *s,
>> +     if (s->hit || s->cert->srv_ext.meths_count == 0)
>> +         return 1;
>> +
>> +-    if (data >= limit - 2)
>> ++    if (limit - data <= 2)
>> +         return 1;
>> +     n2s(data, len);
>> +
>> +-    if (data > limit - len)
>> ++    if (limit - data < len)
>> +         return 1;
>> +
>> +-    while (data <= limit - 4) {
>> ++    while (limit - data >= 4) {
>> +         n2s(data, type);
>> +         n2s(data, size);
>> +
>> +-        if (data + size > limit)
>> ++        if (limit - data < size)
>> +             return 1;
>> +         if (custom_ext_parse(s, 1 /* server */ , type, data, size, al) <= 0)
>> +             return 0;
>> +@@ -2569,20 +2569,20 @@ static int ssl_scan_serverhello_tlsext(SSL *s, unsigned char **p,
>> +                              SSL_TLSEXT_HB_DONT_SEND_REQUESTS);
>> + # endif
>> +
>> +-    if (data >= (d + n - 2))
>> ++    if ((d + n) - data <= 2)
>> +         goto ri_check;
>> +
>> +     n2s(data, length);
>> +-    if (data + length != d + n) {
>> ++    if ((d + n) - data != length) {
>> +         *al = SSL_AD_DECODE_ERROR;
>> +         return 0;
>> +     }
>> +
>> +-    while (data <= (d + n - 4)) {
>> ++    while ((d + n) - data >= 4) {
>> +         n2s(data, type);
>> +         n2s(data, size);
>> +
>> +-        if (data + size > (d + n))
>> ++        if ((d + n) - data < size)
>> +             goto ri_check;
>> +
>> +         if (s->tlsext_debug_cb)
>> +@@ -3307,29 +3307,33 @@ int tls1_process_ticket(SSL *s, unsigned char *session_id, int len,
>> +     /* Skip past DTLS cookie */
>> +     if (SSL_IS_DTLS(s)) {
>> +         i = *(p++);
>> +-        p += i;
>> +-        if (p >= limit)
>> ++
>> ++        if (limit - p <= i)
>> +             return -1;
>> ++
>> ++        p += i;
>> +     }
>> +     /* Skip past cipher list */
>> +     n2s(p, i);
>> +-    p += i;
>> +-    if (p >= limit)
>> ++    if (limit - p <= i)
>> +         return -1;
>> ++    p += i;
>> ++
>> +     /* Skip past compression algorithm list */
>> +     i = *(p++);
>> +-    p += i;
>> +-    if (p > limit)
>> ++    if (limit - p < i)
>> +         return -1;
>> ++    p += i;
>> ++
>> +     /* Now at start of extensions */
>> +-    if ((p + 2) >= limit)
>> ++    if (limit - p <= 2)
>> +         return 0;
>> +     n2s(p, i);
>> +-    while ((p + 4) <= limit) {
>> ++    while (limit - p >= 4) {
>> +         unsigned short type, size;
>> +         n2s(p, type);
>> +         n2s(p, size);
>> +-        if (p + size > limit)
>> ++        if (limit - p < size)
>> +             return 0;
>> +         if (type == TLSEXT_TYPE_session_ticket) {
>> +             int r;
>> +--
>> +2.3.5
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>> index ea40275..4135a31 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
>> @@ -38,6 +38,7 @@ SRC_URI += "file://configure-targets.patch \
>>               file://openssl-1.0.2a-x32-asm.patch \
>>               file://ptest_makefile_deps.patch  \
>>               file://parallel.patch \
>> +            file://CVE-2016-2177.patch \
>>              "
>>   
>>   SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
>>
>> -- 
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> -- 
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>


--------------9234C485E3A4981B113ECF69
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12/22/2016 07:21 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20161222152130.GD3544@jama" type="cite">
      <pre wrap="">On Fri, Sep 23, 2016 at 10:22:26PM +0000, <a class="moz-txt-link-abbreviated" href="mailto:git@git.openembedded.org">git@git.openembedded.org</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">rpurdie pushed a commit to branch jethro
in repository openembedded-core.
</pre>
      </blockquote>
      <pre wrap="">
This change and CVE-2016-8610.patch seems to be missing in krogoth branch.</pre>
    </blockquote>
    <br>
    got them now.<br>
    <br>
    <blockquote cite="mid:20161222152130.GD3544@jama" type="cite">
      <pre wrap="">

OE @ ~/openembedded-core $ git diff origin/jethro  origin/krogoth -- meta/recipes-connectivity/openssl/openssl_1.0.2h.bb | grep CVE
-            <a class="moz-txt-link-freetext" href="file://CVE-2016-2177.patch">file://CVE-2016-2177.patch</a> \
-            <a class="moz-txt-link-freetext" href="file://CVE-2016-2178.patch">file://CVE-2016-2178.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2016-2178.patch">file://CVE-2016-2178.patch</a> \
+            <a class="moz-txt-link-freetext" href="file://CVE-2016-2179.patch">file://CVE-2016-2179.patch</a> \
             <a class="moz-txt-link-freetext" href="file://CVE-2016-2180.patch">file://CVE-2016-2180.patch</a> \
             <a class="moz-txt-link-freetext" href="file://CVE-2016-2181_p1.patch">file://CVE-2016-2181_p1.patch</a> \
             <a class="moz-txt-link-freetext" href="file://CVE-2016-2181_p2.patch">file://CVE-2016-2181_p2.patch</a> \
             <a class="moz-txt-link-freetext" href="file://CVE-2016-6303.patch">file://CVE-2016-6303.patch</a> \
             <a class="moz-txt-link-freetext" href="file://CVE-2016-6304.patch">file://CVE-2016-6304.patch</a> \
             <a class="moz-txt-link-freetext" href="file://CVE-2016-6306.patch">file://CVE-2016-6306.patch</a> \
-            <a class="moz-txt-link-freetext" href="file://CVE-2016-2179.patch">file://CVE-2016-2179.patch</a> \
-            <a class="moz-txt-link-freetext" href="file://CVE-2016-8610.patch">file://CVE-2016-8610.patch</a> \

Is there some pending pull request for krogoth? There is also that tzdata version lower in krogoth than jethro I've reported a while ago:</pre>
    </blockquote>
    Yes there was a pull request but it did not contain that change. got
    this too now.<br>
    <br>
    Armin<br>
    <blockquote cite="mid:20161222152130.GD3544@jama" type="cite">
      <pre wrap="">

OE @ ~/openembedded-core $ git diff origin/jethro  origin/krogoth -- meta/recipes-extended/tzdata/
diff --git a/meta/recipes-extended/tzdata/tzdata_2016i.bb b/meta/recipes-extended/tzdata/tzdata_2016g.bb
similarity index 94%
rename from meta/recipes-extended/tzdata/tzdata_2016i.bb
rename to meta/recipes-extended/tzdata/tzdata_2016g.bb

</pre>
      <blockquote type="cite">
        <pre wrap="">commit 5781eb9a6e6bf8984b090a488d2a326bf9fafcf8
Author: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
AuthorDate: Sat Jul 16 16:04:11 2016 -0700

    openssl: Security fix CVE-2016-2177
    
    Affects openssl &lt;= 1.0.2h
    CVSS v2 Base Score: 7.5 HIGH
    
    Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
    Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
    (cherry picked from commit 2848c7d3e454cbc84cba9183f23ccdf3e9200ec9)
    Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 .../openssl/openssl/CVE-2016-2177.patch            | 286 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
 2 files changed, 287 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
new file mode 100644
index 0000000..df36d5f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
@@ -0,0 +1,286 @@
+From a004e72b95835136d3f1ea90517f706c24c03da7 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <a class="moz-txt-link-rfc2396E" href="mailto:matt@openssl.org">&lt;matt@openssl.org&gt;</a>
+Date: Thu, 5 May 2016 11:10:26 +0100
+Subject: [PATCH] Avoid some undefined pointer arithmetic
+
+A common idiom in the codebase is:
+
+if (p + len &gt; limit)
+{
+    return; /* Too long */
+}
+
+Where "p" points to some malloc'd data of SIZE bytes and
+limit == p + SIZE
+
+"len" here could be from some externally supplied data (e.g. from a TLS
+message).
+
+The rules of C pointer arithmetic are such that "p + len" is only well
+defined where len &lt;= SIZE. Therefore the above idiom is actually
+undefined behaviour.
+
+For example this could cause problems if some malloc implementation
+provides an address for "p" such that "p + len" actually overflows for
+values of len that are too big and therefore p + len &lt; limit!
+
+Issue reported by Guido Vranken.
+
+CVE-2016-2177
+
+Reviewed-by: Rich Salz <a class="moz-txt-link-rfc2396E" href="mailto:rsalz@openssl.org">&lt;rsalz@openssl.org&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2016-2177
+
+Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
+
+
+---
+ ssl/s3_srvr.c  | 14 +++++++-------
+ ssl/ssl_sess.c |  2 +-
+ ssl/t1_lib.c   | 56 ++++++++++++++++++++++++++++++--------------------------
+ 3 files changed, 38 insertions(+), 34 deletions(-)
+
+diff --git a/ssl/s3_srvr.c b/ssl/s3_srvr.c
+index ab28702..ab7f690 100644
+--- a/ssl/s3_srvr.c
++++ b/ssl/s3_srvr.c
+@@ -980,7 +980,7 @@ int ssl3_get_client_hello(SSL *s)
+ 
+         session_length = *(p + SSL3_RANDOM_SIZE);
+ 
+-        if (p + SSL3_RANDOM_SIZE + session_length + 1 &gt;= d + n) {
++        if (SSL3_RANDOM_SIZE + session_length + 1 &gt;= (d + n) - p) {
+             al = SSL_AD_DECODE_ERROR;
+             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+@@ -998,7 +998,7 @@ int ssl3_get_client_hello(SSL *s)
+     /* get the session-id */
+     j = *(p++);
+ 
+-    if (p + j &gt; d + n) {
++    if ((d + n) - p &lt; j) {
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+         goto f_err;
+@@ -1054,14 +1054,14 @@ int ssl3_get_client_hello(SSL *s)
+ 
+     if (SSL_IS_DTLS(s)) {
+         /* cookie stuff */
+-        if (p + 1 &gt; d + n) {
++        if ((d + n) - p &lt; 1) {
+             al = SSL_AD_DECODE_ERROR;
+             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+         }
+         cookie_len = *(p++);
+ 
+-        if (p + cookie_len &gt; d + n) {
++        if ((d + n ) - p &lt; cookie_len) {
+             al = SSL_AD_DECODE_ERROR;
+             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+             goto f_err;
+@@ -1131,7 +1131,7 @@ int ssl3_get_client_hello(SSL *s)
+         }
+     }
+ 
+-    if (p + 2 &gt; d + n) {
++    if ((d + n ) - p &lt; 2) {
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
+         goto f_err;
+@@ -1145,7 +1145,7 @@ int ssl3_get_client_hello(SSL *s)
+     }
+ 
+     /* i bytes of cipher data + 1 byte for compression length later */
+-    if ((p + i + 1) &gt; (d + n)) {
++    if ((d + n) - p &lt; i + 1) {
+         /* not enough data */
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
+@@ -1211,7 +1211,7 @@ int ssl3_get_client_hello(SSL *s)
+ 
+     /* compression */
+     i = *(p++);
+-    if ((p + i) &gt; (d + n)) {
++    if ((d + n) - p &lt; i) {
+         /* not enough data */
+         al = SSL_AD_DECODE_ERROR;
+         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
+diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
+index b182998..54ee783 100644
+--- a/ssl/ssl_sess.c
++++ b/ssl/ssl_sess.c
+@@ -573,7 +573,7 @@ int ssl_get_prev_session(SSL *s, unsigned char *session_id, int len,
+     int r;
+ #endif
+ 
+-    if (session_id + len &gt; limit) {
++    if (limit - session_id &lt; len) {
+         fatal = 1;
+         goto err;
+     }
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index fb64607..cdac011 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -1867,11 +1867,11 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+         0x02, 0x03,             /* SHA-1/ECDSA */
+     };
+ 
+-    if (data &gt;= (limit - 2))
++    if (limit - data &lt;= 2)
+         return;
+     data += 2;
+ 
+-    if (data &gt; (limit - 4))
++    if (limit - data &lt; 4)
+         return;
+     n2s(data, type);
+     n2s(data, size);
+@@ -1879,7 +1879,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+     if (type != TLSEXT_TYPE_server_name)
+         return;
+ 
+-    if (data + size &gt; limit)
++    if (limit - data &lt; size)
+         return;
+     data += size;
+ 
+@@ -1887,7 +1887,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+         const size_t len1 = sizeof(kSafariExtensionsBlock);
+         const size_t len2 = sizeof(kSafariTLS12ExtensionsBlock);
+ 
+-        if (data + len1 + len2 != limit)
++        if (limit - data != (int)(len1 + len2))
+             return;
+         if (memcmp(data, kSafariExtensionsBlock, len1) != 0)
+             return;
+@@ -1896,7 +1896,7 @@ static void ssl_check_for_safari(SSL *s, const unsigned char *data,
+     } else {
+         const size_t len = sizeof(kSafariExtensionsBlock);
+ 
+-        if (data + len != limit)
++        if (limit - data != (int)(len))
+             return;
+         if (memcmp(data, kSafariExtensionsBlock, len) != 0)
+             return;
+@@ -2053,19 +2053,19 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
+     if (data == limit)
+         goto ri_check;
+ 
+-    if (data &gt; (limit - 2))
++    if (limit - data &lt; 2)
+         goto err;
+ 
+     n2s(data, len);
+ 
+-    if (data + len != limit)
++    if (limit - data != len)
+         goto err;
+ 
+-    while (data &lt;= (limit - 4)) {
++    while (limit - data &gt;= 4) {
+         n2s(data, type);
+         n2s(data, size);
+ 
+-        if (data + size &gt; (limit))
++        if (limit - data &lt; size)
+             goto err;
+ # if 0
+         fprintf(stderr, "Received extension type %d size %d\n", type, size);
+@@ -2472,18 +2472,18 @@ static int ssl_scan_clienthello_custom_tlsext(SSL *s,
+     if (s-&gt;hit || s-&gt;cert-&gt;srv_ext.meths_count == 0)
+         return 1;
+ 
+-    if (data &gt;= limit - 2)
++    if (limit - data &lt;= 2)
+         return 1;
+     n2s(data, len);
+ 
+-    if (data &gt; limit - len)
++    if (limit - data &lt; len)
+         return 1;
+ 
+-    while (data &lt;= limit - 4) {
++    while (limit - data &gt;= 4) {
+         n2s(data, type);
+         n2s(data, size);
+ 
+-        if (data + size &gt; limit)
++        if (limit - data &lt; size)
+             return 1;
+         if (custom_ext_parse(s, 1 /* server */ , type, data, size, al) &lt;= 0)
+             return 0;
+@@ -2569,20 +2569,20 @@ static int ssl_scan_serverhello_tlsext(SSL *s, unsigned char **p,
+                              SSL_TLSEXT_HB_DONT_SEND_REQUESTS);
+ # endif
+ 
+-    if (data &gt;= (d + n - 2))
++    if ((d + n) - data &lt;= 2)
+         goto ri_check;
+ 
+     n2s(data, length);
+-    if (data + length != d + n) {
++    if ((d + n) - data != length) {
+         *al = SSL_AD_DECODE_ERROR;
+         return 0;
+     }
+ 
+-    while (data &lt;= (d + n - 4)) {
++    while ((d + n) - data &gt;= 4) {
+         n2s(data, type);
+         n2s(data, size);
+ 
+-        if (data + size &gt; (d + n))
++        if ((d + n) - data &lt; size)
+             goto ri_check;
+ 
+         if (s-&gt;tlsext_debug_cb)
+@@ -3307,29 +3307,33 @@ int tls1_process_ticket(SSL *s, unsigned char *session_id, int len,
+     /* Skip past DTLS cookie */
+     if (SSL_IS_DTLS(s)) {
+         i = *(p++);
+-        p += i;
+-        if (p &gt;= limit)
++
++        if (limit - p &lt;= i)
+             return -1;
++
++        p += i;
+     }
+     /* Skip past cipher list */
+     n2s(p, i);
+-    p += i;
+-    if (p &gt;= limit)
++    if (limit - p &lt;= i)
+         return -1;
++    p += i;
++
+     /* Skip past compression algorithm list */
+     i = *(p++);
+-    p += i;
+-    if (p &gt; limit)
++    if (limit - p &lt; i)
+         return -1;
++    p += i;
++
+     /* Now at start of extensions */
+-    if ((p + 2) &gt;= limit)
++    if (limit - p &lt;= 2)
+         return 0;
+     n2s(p, i);
+-    while ((p + 4) &lt;= limit) {
++    while (limit - p &gt;= 4) {
+         unsigned short type, size;
+         n2s(p, type);
+         n2s(p, size);
+-        if (p + size &gt; limit)
++        if (limit - p &lt; size)
+             return 0;
+         if (type == TLSEXT_TYPE_session_ticket) {
+             int r;
+-- 
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index ea40275..4135a31 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -38,6 +38,7 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://configure-targets.patch\file://openssl-1.0.2a-x32-asm.patch\file://ptest_makefile_deps.patch\file://parallel.patch\+file://CVE-2016-2177.patch\">"file://configure-targets.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
             file://parallel.patch \
+            file://CVE-2016-2177.patch \
            "</a>
 
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"

-- 
To stop receiving notification emails like this one, please contact
the administrator of this repository.
-- 
_______________________________________________
Openembedded-commits mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-commits@lists.openembedded.org">Openembedded-commits@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-commits">http://lists.openembedded.org/mailman/listinfo/openembedded-commits</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------9234C485E3A4981B113ECF69--
