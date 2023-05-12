Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A0FC77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 11:26:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.22504.1683890771216847370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=hZO1kQfS;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1aaf21bb42bso70283925ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683890770; x=1686482770;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTxWAyM377MiI/gctAveuyCOxlDRXnGhBK2stn57X2k=;
        b=hZO1kQfSp+xm6Z2d73hZT5A/ffoHMxT1fbKB2SfEcPDgJPlyhdr/0ZE9FxtcVparPx
         XS3wD4f79Hl9dZNLBn00IJr9sw3xmQ+vq1geiPReZuHUyE1S/A/y1pR8HTeZeDsrhvB9
         H3Wp7bOnQin8IDcJmzsomBhhdhJcgWTycYltA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683890770; x=1686482770;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTxWAyM377MiI/gctAveuyCOxlDRXnGhBK2stn57X2k=;
        b=Ut/JFqDsRBWqYN5/Jj3sqwkHoAX74atAf5/wcOQymCjXhFhgBH7hOvkR01nCX7qmyp
         BkOZOrWb16/oyoAEMmyd8lel1vbK08xTctqGrKcAI+62PY06oeuOX71D16DeEAHDOMSZ
         qusiZVoFuTXwDW3CfTzpUAtNjLII/jtV9VRyUy8dPj/bFqQemEy0udMfqDCo3iXiGVV6
         g8sGSWyP1YyanKxuPd2fqz7YLQ6t0qP5OJP6lcgtrYIPcqXdVfADsptK9Duj35RAbwlx
         apuLJJum+KJ/k6hHtAKu/f0/fWjd2PJWmHv9DCUyyxeHUIatMlkaYuIDHx3UxWd39/hR
         7sxA==
X-Gm-Message-State: AC+VfDxUMgiaDTisOoC/P+BV0ToIRHsRuhhl6VlIrGBnQdJfeNug14Ah
	Z5LmOqSxqgisBTey8YSqK1WRvA==
X-Google-Smtp-Source: ACHHUZ4PtiOHR49jIsZMf056luXn2qmG0rcRkxVJG36eRLyCRbHOswRkj7yV0XdUaayKqxqqy8MkkA==
X-Received: by 2002:a17:902:8c98:b0:1ad:be4d:5dfe with SMTP id t24-20020a1709028c9800b001adbe4d5dfemr6658617plo.27.1683890770331;
        Fri, 12 May 2023 04:26:10 -0700 (PDT)
Received: from [192.168.0.119] ([103.250.136.152])
        by smtp.gmail.com with ESMTPSA id c8-20020a170902b68800b001aaecc15d66sm2057866pls.289.2023.05.12.04.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 04:26:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Mb0F00Xs8MNvSMk0Etim07Fy"
Message-ID: <ba598e31-fa5b-6e20-47de-f0acd9f8f649@mvista.com>
Date: Fri, 12 May 2023 16:56:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [dunfell][PATCH] curl: CVE-2023-27534 SFTP path ~
 resolving discrepancy
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230414105523.81661-1-hprajapati@mvista.com>
 <CAOSpxdZZ9=DEf-ehFjta-qU=NeDGbzh4puJO-H1=QpH+B3X7og@mail.gmail.com>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <CAOSpxdZZ9=DEf-ehFjta-qU=NeDGbzh4puJO-H1=QpH+B3X7og@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 11:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181177

This is a multi-part message in MIME format.
--------------Mb0F00Xs8MNvSMk0Etim07Fy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steve,

I'll look into this issue by enabling the package at my end and send the 
possible solution if any.

Regards,

Hitendra

On 11/05/23 20:15, Steve Sakoman wrote:
> Hi Hitendra,
>
> There's been a bug filed against this patch (build failure when when
> curl is configured with `libssh2` i.e. PACKAGECONFIG_append = "
> libssh2"):
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15114
>
> Could you investigate and advise whether there is an easy fix or
> whether we should revert?
>
> Thanks,
>
> Steve
>
> On Fri, Apr 14, 2023 at 12:55 AM Hitendra Prajapati
> <hprajapati@mvista.com>  wrote:
>> Upstream-Status: Backport fromhttps://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6
>>
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   .../curl/curl/CVE-2023-27534.patch            | 123 ++++++++++++++++++
>>   meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
>>   2 files changed, 124 insertions(+)
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
>> new file mode 100644
>> index 0000000000..aeeffd5fea
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
>> @@ -0,0 +1,123 @@
>> +From 4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg<daniel@haxx.se>
>> +Date: Thu, 9 Mar 2023 16:22:11 +0100
>> +Subject: [PATCH] curl_path: create the new path with dynbuf
>> +
>> +CVE: CVE-2023-27534
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6]
>> +
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
>> + 1 file changed, 35 insertions(+), 36 deletions(-)
>> +
>> +diff --git a/lib/curl_path.c b/lib/curl_path.c
>> +index f429634..e17db4b 100644
>> +--- a/lib/curl_path.c
>> ++++ b/lib/curl_path.c
>> +@@ -30,6 +30,8 @@
>> + #include "escape.h"
>> + #include "memdebug.h"
>> +
>> ++#define MAX_SSHPATH_LEN 100000 /* arbitrary */
>> ++
>> + /* figure out the path to work with in this particular request */
>> + CURLcode Curl_getworkingpath(struct connectdata *conn,
>> +                              char *homedir,  /* when SFTP is used */
>> +@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
>> +                                              real path to work with */
>> + {
>> +   struct Curl_easy *data = conn->data;
>> +-  char *real_path = NULL;
>> +   char *working_path;
>> +   size_t working_path_len;
>> ++  struct dynbuf npath;
>> +   CURLcode result =
>> +     Curl_urldecode(data, data->state.up.path, 0, &working_path,
>> +                    &working_path_len, FALSE);
>> +   if(result)
>> +     return result;
>> +
>> ++  /* new path to switch to in case we need to */
>> ++  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
>> ++
>> +   /* Check for /~/, indicating relative to the user's home directory */
>> +-  if(conn->handler->protocol & CURLPROTO_SCP) {
>> +-    real_path = malloc(working_path_len + 1);
>> +-    if(real_path == NULL) {
>> ++  if((data->conn->handler->protocol & CURLPROTO_SCP) &&
>> ++     (working_path_len > 3) && (!memcmp(working_path, "/~/", 3))) {
>> ++    /* It is referenced to the home directory, so strip the leading '/~/' */
>> ++    if(Curl_dyn_addn(&npath, &working_path[3], working_path_len - 3)) {
>> +       free(working_path);
>> +       return CURLE_OUT_OF_MEMORY;
>> +     }
>> +-    if((working_path_len > 3) && (!memcmp(working_path, "/~/", 3)))
>> +-      /* It is referenced to the home directory, so strip the leading '/~/' */
>> +-      memcpy(real_path, working_path + 3, working_path_len - 2);
>> +-    else
>> +-      memcpy(real_path, working_path, 1 + working_path_len);
>> +   }
>> +-  else if(conn->handler->protocol & CURLPROTO_SFTP) {
>> +-    if((working_path_len > 1) && (working_path[1] == '~')) {
>> +-      size_t homelen = strlen(homedir);
>> +-      real_path = malloc(homelen + working_path_len + 1);
>> +-      if(real_path == NULL) {
>> +-        free(working_path);
>> +-        return CURLE_OUT_OF_MEMORY;
>> +-      }
>> +-      /* It is referenced to the home directory, so strip the
>> +-         leading '/' */
>> +-      memcpy(real_path, homedir, homelen);
>> +-      real_path[homelen] = '/';
>> +-      real_path[homelen + 1] = '\0';
>> +-      if(working_path_len > 3) {
>> +-        memcpy(real_path + homelen + 1, working_path + 3,
>> +-               1 + working_path_len -3);
>> +-      }
>> ++  else if((data->conn->handler->protocol & CURLPROTO_SFTP) &&
>> ++          (working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
>> ++    size_t len;
>> ++    const char *p;
>> ++    int copyfrom = 3;
>> ++    if(Curl_dyn_add(&npath, homedir)) {
>> ++      free(working_path);
>> ++      return CURLE_OUT_OF_MEMORY;
>> +     }
>> +-    else {
>> +-      real_path = malloc(working_path_len + 1);
>> +-      if(real_path == NULL) {
>> +-        free(working_path);
>> +-        return CURLE_OUT_OF_MEMORY;
>> +-      }
>> +-      memcpy(real_path, working_path, 1 + working_path_len);
>> ++    /* Copy a separating '/' if homedir does not end with one */
>> ++    len = Curl_dyn_len(&npath);
>> ++    p = Curl_dyn_ptr(&npath);
>> ++    if(len && (p[len-1] != '/'))
>> ++      copyfrom = 2;
>> ++
>> ++    if(Curl_dyn_addn(&npath,
>> ++                     &working_path[copyfrom], working_path_len - copyfrom)) {
>> ++      free(working_path);
>> ++      return CURLE_OUT_OF_MEMORY;
>> +     }
>> +   }
>> +
>> +-  free(working_path);
>> ++  if(Curl_dyn_len(&npath)) {
>> ++    free(working_path);
>> +
>> +-  /* store the pointer for the caller to receive */
>> +-  *path = real_path;
>> ++    /* store the pointer for the caller to receive */
>> ++    *path = Curl_dyn_ptr(&npath);
>> ++  }
>> ++  else
>> ++    *path = working_path;
>> +
>> +   return CURLE_OK;
>> + }
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
>> index 899daf8eac..fddf15e3ff 100644
>> --- a/meta/recipes-support/curl/curl_7.69.1.bb
>> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
>> @@ -42,6 +42,7 @@ SRC_URI ="https://curl.haxx.se/download/curl-${PV}.tar.bz2 \ 
>> file://CVE-2022-32221.patch \ file://CVE-2022-35260.patch \ 
>> file://CVE-2022-43552.patch \ + file://CVE-2023-27534.patch \ "
>>
>>   SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179997):https://lists.openembedded.org/g/openembedded-core/message/179997
>> Mute This Topic:https://lists.openembedded.org/mt/98259554/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [steve@sakoman.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
--------------Mb0F00Xs8MNvSMk0Etim07Fy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Steve,</p>
    <p>I'll look into this issue by enabling the package at my end and
      send the possible solution if any.</p>
    <p>Regards,</p>
    <p>Hitendra<br>
    </p>
    <div class="moz-cite-prefix">On 11/05/23 20:15, Steve Sakoman wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOSpxdZZ9=DEf-ehFjta-qU=NeDGbzh4puJO-H1=QpH+B3X7og@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Hitendra,

There's been a bug filed against this patch (build failure when when
curl is configured with `libssh2` i.e. PACKAGECONFIG_append = "
libssh2"):

<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15114">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15114</a>

Could you investigate and advise whether there is an easy fix or
whether we should revert?

Thanks,

Steve

On Fri, Apr 14, 2023 at 12:55 AM Hitendra Prajapati
<a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Upstream-Status: Backport from <a class="moz-txt-link-freetext" href="https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6">https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6</a>

Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../curl/curl/CVE-2023-27534.patch            | 123 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
new file mode 100644
index 0000000000..aeeffd5fea
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
@@ -0,0 +1,123 @@
+From 4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <a class="moz-txt-link-rfc2396E" href="mailto:daniel@haxx.se">&lt;daniel@haxx.se&gt;</a>
+Date: Thu, 9 Mar 2023 16:22:11 +0100
+Subject: [PATCH] curl_path: create the new path with dynbuf
+
+CVE: CVE-2023-27534
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6">https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6</a>]
+
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 35 insertions(+), 36 deletions(-)
+
+diff --git a/lib/curl_path.c b/lib/curl_path.c
+index f429634..e17db4b 100644
+--- a/lib/curl_path.c
++++ b/lib/curl_path.c
+@@ -30,6 +30,8 @@
+ #include "escape.h"
+ #include "memdebug.h"
+
++#define MAX_SSHPATH_LEN 100000 /* arbitrary */
++
+ /* figure out the path to work with in this particular request */
+ CURLcode Curl_getworkingpath(struct connectdata *conn,
+                              char *homedir,  /* when SFTP is used */
+@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
+                                              real path to work with */
+ {
+   struct Curl_easy *data = conn-&gt;data;
+-  char *real_path = NULL;
+   char *working_path;
+   size_t working_path_len;
++  struct dynbuf npath;
+   CURLcode result =
+     Curl_urldecode(data, data-&gt;state.up.path, 0, &amp;working_path,
+                    &amp;working_path_len, FALSE);
+   if(result)
+     return result;
+
++  /* new path to switch to in case we need to */
++  Curl_dyn_init(&amp;npath, MAX_SSHPATH_LEN);
++
+   /* Check for /~/, indicating relative to the user's home directory */
+-  if(conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SCP) {
+-    real_path = malloc(working_path_len + 1);
+-    if(real_path == NULL) {
++  if((data-&gt;conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SCP) &amp;&amp;
++     (working_path_len &gt; 3) &amp;&amp; (!memcmp(working_path, "/~/", 3))) {
++    /* It is referenced to the home directory, so strip the leading '/~/' */
++    if(Curl_dyn_addn(&amp;npath, &amp;working_path[3], working_path_len - 3)) {
+       free(working_path);
+       return CURLE_OUT_OF_MEMORY;
+     }
+-    if((working_path_len &gt; 3) &amp;&amp; (!memcmp(working_path, "/~/", 3)))
+-      /* It is referenced to the home directory, so strip the leading '/~/' */
+-      memcpy(real_path, working_path + 3, working_path_len - 2);
+-    else
+-      memcpy(real_path, working_path, 1 + working_path_len);
+   }
+-  else if(conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SFTP) {
+-    if((working_path_len &gt; 1) &amp;&amp; (working_path[1] == '~')) {
+-      size_t homelen = strlen(homedir);
+-      real_path = malloc(homelen + working_path_len + 1);
+-      if(real_path == NULL) {
+-        free(working_path);
+-        return CURLE_OUT_OF_MEMORY;
+-      }
+-      /* It is referenced to the home directory, so strip the
+-         leading '/' */
+-      memcpy(real_path, homedir, homelen);
+-      real_path[homelen] = '/';
+-      real_path[homelen + 1] = '\0';
+-      if(working_path_len &gt; 3) {
+-        memcpy(real_path + homelen + 1, working_path + 3,
+-               1 + working_path_len -3);
+-      }
++  else if((data-&gt;conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SFTP) &amp;&amp;
++          (working_path_len &gt; 2) &amp;&amp; !memcmp(working_path, "/~/", 3)) {
++    size_t len;
++    const char *p;
++    int copyfrom = 3;
++    if(Curl_dyn_add(&amp;npath, homedir)) {
++      free(working_path);
++      return CURLE_OUT_OF_MEMORY;
+     }
+-    else {
+-      real_path = malloc(working_path_len + 1);
+-      if(real_path == NULL) {
+-        free(working_path);
+-        return CURLE_OUT_OF_MEMORY;
+-      }
+-      memcpy(real_path, working_path, 1 + working_path_len);
++    /* Copy a separating '/' if homedir does not end with one */
++    len = Curl_dyn_len(&amp;npath);
++    p = Curl_dyn_ptr(&amp;npath);
++    if(len &amp;&amp; (p[len-1] != '/'))
++      copyfrom = 2;
++
++    if(Curl_dyn_addn(&amp;npath,
++                     &amp;working_path[copyfrom], working_path_len - copyfrom)) {
++      free(working_path);
++      return CURLE_OUT_OF_MEMORY;
+     }
+   }
+
+-  free(working_path);
++  if(Curl_dyn_len(&amp;npath)) {
++    free(working_path);
+
+-  /* store the pointer for the caller to receive */
+-  *path = real_path;
++    /* store the pointer for the caller to receive */
++    *path = Curl_dyn_ptr(&amp;npath);
++  }
++  else
++    *path = working_path;
+
+   return CURLE_OK;
+ }
+--
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 899daf8eac..fddf15e3ff 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -42,6 +42,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://curl.haxx.se/download/curl-${PV}.tar.bz2\file://CVE-2022-32221.patch\file://CVE-2022-35260.patch\file://CVE-2022-43552.patch\+file://CVE-2023-27534.patch\">"https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32221.patch \
            file://CVE-2022-35260.patch \
            file://CVE-2022-43552.patch \
+           file://CVE-2023-27534.patch \
 "</a>

 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
--
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#179997): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/179997">https://lists.openembedded.org/g/openembedded-core/message/179997</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/98259554/3620601">https://lists.openembedded.org/mt/98259554/3620601</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000ff">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
      </font></div>
  </body>
</html>

--------------Mb0F00Xs8MNvSMk0Etim07Fy--

